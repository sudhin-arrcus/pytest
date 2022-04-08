##################################################################################
#   Version 9.10
#   
#   File: clientUtils.tcl
#
#   Copyright ©  IXIA
#   All Rights Reserved.
#
#    Revision Log:
#    Date           Author                 Comments
#    -----------    -------------------    --------------------------------------------
#    10/25/2000     ds                      initial release
#
# Description:  This file contains utilities for the client side of the Tcl proxy
#
##################################################################################

if {[isUNIX]} {
    package req ssh
}

########################################################################################
# Procedure:    clientOpen
#
# Description:  Open a connection to the ixTclServer.
#                
# Input:        server:        host name of server
#               port:        port id of service
#
# Output:       socket handle
#
########################################################################################
proc clientOpen {host port} \
{
    if [catch {socket $host $port} socketId] {
        set socketId {}
    }

    return $socketId
}


########################################################################################
# Procedure:    clientOpenSSH
#
# Description:  Open a connection to the ixTclServer.
#                
# Input:        server:        host name of server
#               port:        port id of service
#
# Output:       serverIP
#
########################################################################################
proc clientOpenSSH {host port} \
{
    variable privateKey
    if {[expr $::tcl_version < 8.5]} {
        set ixtcl_path [package ifneeded IxTclHal [package present IxTclHal]]

        set absolutePath [file dirname [file normalize [string range $ixtcl_path [expr [string first " " $ixtcl_path]+1] end]]]
    } else {
        # Get the private key location
        set absolutePath "[file dirname [dict get [info frame [info frame]] file]]/.."
    }
    set privateKey "$absolutePath/id_rsa"
    set privateKeySFTP "$absolutePath/id_rsa_sftp"

    tclServer::setTclServerType 0
    set result {}
    if [catch {
        set username $::tcl_platform(user)
        set defaultFolder "/tmp/$username/.ssh"
        set homeFolder $defaultFolder
        if {[info exists ::env(HOME)]} {
            set homeFolder "$::env(HOME)/.ssh"
        }
        
        set userPrivateKey "$homeFolder/ixpit_$username\_id_rsa"
        set userPrivateKeySFTP "$homeFolder/ixpit_$username\_id_rsa_sftp"
        if [catch {
            setupPrivateKey $homeFolder $privateKey $userPrivateKey
            setupPrivateKey $homeFolder $privateKeySFTP $userPrivateKeySFTP
            } ] {
                set userPrivateKey "$defaultFolder/ixpit_$username\_id_rsa"
                set userPrivateKeySFTP "$defaultFolder/ixpit_$username\_id_rsa_sftp"
                setupPrivateKey $defaultFolder $privateKey $userPrivateKey
                setupPrivateKey $defaultFolder $privateKeySFTP $userPrivateKeySFTP
            }

        # With VM chassis is common to redeploy a chassis with the same IP, because of this we have to ignore the host fingerprint
        ::ssh::connect -o ServerAliveInterval=300 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $port -i $userPrivateKey -T ixtcl@$host
        set ixosVersion {}

        if {[info exists ::env(__IXOS_VERSION)]} {
            set ixosVersion $::env(__IXOS_VERSION)
            puts "version $ixosVersion"
        } else {
            if [catch {clientSend $host "exec /opt/ixia/appinfo/reg.py --get-reg {hkey_local_machine\\software\\ixia communications\\ixserver\\settings\\lastrunixosversion}"} r] {
                errorMsg $r
                set result {}
            } else {
                set fullIxosVersion $r
                if {$fullIxosVersion == "None"} {set ixosVersion {}} else {
                set ixosVersion [lindex [split [lindex [split $fullIxosVersion {"("}] 1] {")"}] 0]
                }
            }
        }
        if {$ixosVersion == {}} {
            errorMsg "Error: No IxOS version found on the tcl server!"
            set result {}
        } else {
            if [catch {clientSend $host "source {/opt/ixia/ixos/$ixosVersion/IxiaWish.tcl}"} r] {
                errorMsg $r
                set result {}
            } else {
                puts $r
                set result $host
            }
        }
    } errmsg] {
        errorMsg "Error: $errmsg"
        set result {}
        return $result
    }
    if {$result == {}} {
        clientClose $host
    }

    return $result
}

########################################################################################
# Procedure:    clientClose
#
# Description:  Close connection from the client side.
#                
# Input:        serverId:    client-side socket or server IP
#
# Output:        0 if successful
#                1 if error while attempting to close socket
#
########################################################################################
proc clientClose {serverId} \
{
    set retCode 0
    if {[tclServer::isWindowsTclServer]} {
        if [catch {close $serverId}] {
            set retCode 1
        }
    } else {
        if [catch {::ssh::disconnect $serverId}] {
            set retCode 1
        }
    }
    return $retCode
}


########################################################################################
# Procedure:    clientSend
#
# Description:  Send a command from the client side.
#                
# Input:        serverId:    client-side socket or serverIP
#                args:        TCL command to evaluate
#
# Returns:        Success:    TCL Return result
#               Failure:    {}
#
# Remarks:  TCL procs can embed i/o.
#
########################################################################################
proc clientSend {serverId args} \
{
    set retCode   1
    set retResult 0

    #
    # send data over the socket
    #
    set buf [lindex $args 0]

    #   
    #   Return buffer is formatted as follows:
    #
    #   0 to final lf/cr -> Tcl Standard Output
    #   final character  -> Tcl Return Code (TCL_OK, TCL_ERROR)
    #
    if [tclServer::isWindowsTclServer] {
        if [catch { puts $serverId $buf ; 
                    flush $serverId ; 
                    #
                    # read the reply
                    #  the reply may have the format 
                    #       sOutput/r/nsTclResult/r/n    -- i/o output followed by TCL result
                    #                                                 /r/n -delimited
                    #       sTclresult/r/nsTclResultCode -- simple TCL result
                    #       null                         -- no TCL result available
                    
                    vwait tclServer::buffer
                    set retBuffer $tclServer::buffer
                    
                    set indexOfLastCrlf [string last "\r\n" $retBuffer]
                    if {$indexOfLastCrlf != -1 } {
                        set lenBuffer [string length $retBuffer]
                        set indexOfPenultimateCrlf [string last "\r\n" [string range $retBuffer 0 [expr $indexOfLastCrlf -1]]]
                        if {$indexOfPenultimateCrlf != -1 } {
                            set retResult [string range $retBuffer [expr $indexOfPenultimateCrlf + 2] $lenBuffer]
                        } else {
                            set length    [string length $retBuffer]
                            set retCode   [string index $retBuffer [incr length -1]]
                            set retResult [string range $retBuffer 0 [incr length -1]]
                        }
                    } else {
                        set length    [string length $retBuffer]
                        set retCode   [string index $retBuffer [incr length -1]]
                        set retResult [string range $retBuffer 0 [incr length -1]]
                    }
                } 
        ] {
            errorMsg $::errorInfo
            tclServer::disconnectTclServer
            set retResult 1
        }
    } else {
        # Escape the special characters (per https://stackoverflow.com/questions/5302120/general-string-quoting-for-tcl)
        set current_command [string map {\\ \\\\ \" \\" \$ \\$ \[ \\[ \] \\]} $buf]
        set logCommand ""
        if {[tclServer::getTclServerLogLevel]} {
            set logCommand "tclServer::tclServerLog \$cmd;"
        }
        set initial_script {\
eval {
    set cmd "%s";
    %s
    set retCode [catch {eval "$cmd"} result];
    puts $retCode;
    puts $result;
    puts ";DONE 0";
}}

		set sourced_script_data {\
eval {
	set cmd "%s";
	set sourcedFile "%s";
	if { [string length $sourcedFile] > 0 } {
		set initialCommand $cmd;
		set sourcedContent [readContentFromFile $sourcedFile];
		set cmd  "$sourcedContent";
		%s
		set cmd $initialCommand;
	}
	set retCode [catch {eval "$cmd"} result];
    puts $retCode;
    puts $result;
    puts ";DONE 0";
}}
		set MAX_BUFFER_SIZE 4096
		set DEBUG_VERBOSITY 0
		
		set scriptLength [expr {[string length $initial_script] + [string length $current_command] + [string length $logCommand]}]
		if {$DEBUG_VERBOSITY > 0} {
			puts "Script length:$scriptLength"
		}
		
		set remoteFileNameForDelete ""
		if {$scriptLength < $MAX_BUFFER_SIZE} {
			set script [format $initial_script $current_command $logCommand]
		} else {
			set uniqueFileName [getUniqueFileName]
			set uniqueFilePath [getUniqueTempFilePath $uniqueFileName]
			
			if {[writeContentToFile $uniqueFilePath $current_command] == 0} {
				if {[doFileTransfer put $uniqueFilePath $uniqueFileName] == 0} {
					set remoteFilePath [getSftpFolder]$uniqueFileName
					set newCommand "source \\\"$remoteFilePath\\\""
					set script [format $sourced_script_data $newCommand $remoteFilePath $logCommand]
					set remoteFileNameForDelete $uniqueFileName
				} else {
					set errorInfo "Unable to transfer: $uniqueFilePath to server"
					error $errorInfo $errorInfo
				}
			} else {
				set errorInfo "Unable to write to $uniqueFilePath following content: $script"
				error $errorInfo $errorInfo
			}
		}
        
        ::ssh::push $serverId $script
        ::ssh::send $serverId;

		if {$DEBUG_VERBOSITY > 0} {
			puts "Sending:\n$script"
		}
        # the result will be a list: {retCode, retOutput}
        set res [list]
        while {[::ssh::pop_line $serverId line] >= 0} {
			if {$DEBUG_VERBOSITY > 0} {
				puts "Received: $line"
			}
            if {[string first "% " $line] == 0} {
               continue
            }

            if {[regexp {^;DONE\s+(\d+)} $line match code]} {
                break;
            }
            if {$line != {}} {
                lappend res $line
            }
        }

        set len [llength $res]
        set retResult ""
        if {$len == 0} {
            set retCode 0
            set retResult ""
        }
        if {$len == 1} {
            set retCode [lindex $res 0]
            set retResult ""
        }
        if {$len == 2} {
            set retCode [lindex $res 0]
            set retResult [lindex $res 1]
        }
        if {$len > 2} {
            set retCode [lindex $res 0]
            for {set i 1} {$i < $len} {incr i} {
                set retResult [concat $retResult [lindex $res $i] "\n"]
            }
        }
		
		if { [string length $remoteFileNameForDelete] > 0 } {
			set retCodeLocal [fileTransferClient::deleteFile [tclServer::getTclServerName] 4500 $remoteFileNameForDelete]
			
			if {$DEBUG_VERBOSITY > 0} {
				set result ""
				if {$retCodeLocal > 0} {
					set result "failure"
				} else {
					set result "success"
				}
				puts "Deleted remote file:$remoteFileNameForDelete with $result"
			}
		}
	# remove temporary generated file(batch file) after being used
	if {[info exists uniqueFilePath]} {
		file delete -force $uniqueFilePath
	}
    }
    #
    # Force an error if the command returned TCL_ERROR.
    #   Can't use the constant TCL_ERROR here since it is not defined at
    #   this point in execution.
    #
    if {$retCode == 1} {
        set retCommand [list error $retResult $retResult]
    } else {
        set retCommand [list return $retResult]
    }

    eval $retCommand
}

########################################################################################
# Procedure:    remoteDefine
#
# Description:     Create a proc to proxy over a ixTclHal command.
#                
# Input:        commandList
#
# Output:        0 if successful
#                1 if error
#
########################################################################################
proc remoteDefine { commandList } \
{
    foreach procName $commandList {
        set procNameOld ${procName}Old
        if { [info commands $procName] != "" } {
            if { [info commands $procNameOld] == "" } {
                rename $procName $procNameOld
            }
        }
        eval [format   "proc %s {args} \
                        {\
                            global ixTclSvrHandle; \
                            if {!\[tclServer::isTclServerConnected\]} { \
                                if \[catch { eval \"%s \$args\" } result \] {error \$result \$result }; \
                                return \$result }; \
                            if \[catch { eval \"clientSend \$ixTclSvrHandle {%s \$args}\" } result\] {error \$result \$result}; \
                            if  {\$result != \"\"} {if \[catch { eval \"clientSend \$ixTclSvrHandle {set ixErrorInfo}\" } ::ixErrorInfo] {error \$::ixErrorInfo \$::ixErrorInfo}}; \
                            return \$result \
                        }" \
        $procName $procNameOld $procName]
    }
    return 0
}

########################################################################################
# Procedure:    getConstantsValue
#
# Description:     Get the list of constants from ixTclServer.
#                
# Input:        serverSocket
#
# Output:        0 if successful
#                1 if error
#
########################################################################################
proc getConstantsValue {serverSocket} \
{
    set retCode 0

    set constList  [clientSend $serverSocket {array get ixConstants}]
    if {[llength $constList] > 0} {
        foreach {constName constVal} $constList {
            global $constName
            # The catch prevents the error message from flowing back on windows
            catch {set $constName $constVal}
        }
    } else {
        set retCode 1
    }

    return $retCode
}


########################################################################################
# Procedure:    ixMasterSet
#
# Description:     No clue what this is here for, but I'm leaving it for backwards compatibility
#
# Input:
#
########################################################################################
proc ixMasterSet {name element op} \
{
    upvar ${name}($element) master
    tclServer::connectToTclServer $master errMsg
}

########################################################################################
# Procedure:    redefineCommand
#
# Description:     Redefine the specified command to make its methods import and export work 
#               for UNIX client.
#
# Input:        command - name of the command to be redefined.
#
########################################################################################
proc redefineCommand {command} \
{
    set commandOld ${command}Oldish

    if { [info command $command] != "" } {
        if { [info command $commandOld] == "" } {
            rename $command $commandOld
        }
    }
    if {[tclServer::isWindowsTclServer]} {
        eval [format "proc %s {args} \
              { \
                  set cmdLine %s ; \
                  set path \[file dirname \[lindex \$args 1\]\] ;\
                  set fileName \[file tail \[lindex \$args 1\]\] ;\

                  if { \$path == \".\" } { \
                    append cmdLine \" \$args\"; set path \$fileName } else { \
                    append cmdLine \" \[lindex \$args 0\] \$fileName \[lindex \$args 2\] \[lindex \$args 3\] \[lindex \$args 4\] \" }\

                  switch \[lindex \$args 0\] { \
                      import { \
                          doFileTransfer \"put\" \[lindex \$args 1\] \$fileName ; \
                          eval \$cmdLine; \
                      } \
                      export { \
                          set retCode \[eval \$cmdLine\]; \
                          if \{\$retCode == 0\} \{ \
                              doFileTransfer \"get\" \$fileName \[lindex \$args 1\]; \
                              fileTransferClient::deleteFile \[tclServer::getTclServerName\] 4500 \$fileName \

                          \} else \{ \
                              return \$retCode; \
                           \} \
                      } \
                      default { \
                          eval \$cmdLine; \
                      } \
                   } \
               }" \
        $command $commandOld]
    } else {
        eval [format "proc %s {args} \
            { \
                set cmdLine %s ; \
                set path \[file dirname \[lindex \$args 1\]\] ;\
                set fileName \[file tail \[lindex \$args 1\]\] ;\ 
                switch \[lindex \$args 0\] { \
                    import { \
                        doFileTransfer \"put\" \[lindex \$args 1\] \$fileName ; \
                        append cmdLine \" \[lindex \$args 0\] \[getSftpFolder\]\$fileName \[lindex \$args 2\] \[lindex \$args 3\] \[lindex \$args 4\] \";\
                        set retCode \[eval \$cmdLine\]; \
                        fileTransferClient::deleteFile \[tclServer::getTclServerName\] 4500 \$fileName; \
                        return \$retCode; \
                    } \
                    export { \
                        append cmdLine \" \[lindex \$args 0\] \[getSftpFolder\]\$fileName \[lindex \$args 2\] \[lindex \$args 3\] \[lindex \$args 4\] \";\
                        set retCode \[eval \$cmdLine\]; \
                        if \{\$retCode == 0\} \{ \
                            doFileTransfer \"get\" \$fileName \[lindex \$args 1\]; \
                            fileTransferClient::deleteFile \[tclServer::getTclServerName\] 4500 \$fileName \                       
                              
                        \} else \{ \
                            return \$retCode; \
                        \} \
                    } \
                    default { \
                        append cmdLine \" \$args\";\
                        eval \$cmdLine; \
                    } \
                } \
            }" \
        $command $commandOld]
    }
}

########################################################################################
# Procedure:    doFileTransfer
#
# Description:     Transfer files between client and chassis.
#
# Input:        action    - Has to be either put or get.
#                            
# Unix doesn't need the full path of the file, that is why it is based on the direction 
# if it is put or get, we have to pass in two filenames, one for source the other for
# destination  
#               filename1  - Name of the file to be transfered.
#               filename2  - Name of the file to be transfered. 
#
########################################################################################
proc doFileTransfer {action filename1 filename2 {port 4500}} \
{
    set retCode 1

    if [tclServer::isTclServerConnected] {
        set retCode [fileTransferClient::${action}File [tclServer::getTclServerName] $port "$filename1" "$filename2"]
    }

    return $retCode
}


proc getSftpFolder {} \
{
    variable fullSftpFolder "/ftp/virtual/ixia/tclftp/"
    return $fullSftpFolder
}


proc setupPrivateKey {folder privateKey userPrivateKey} \
{
    if {[file exists $userPrivateKey] != 1} {
        exec "mkdir" "-p" "$folder/"
        file copy $privateKey $userPrivateKey
    }
    exec "chmod" "700" "$folder"
    exec "chmod" "600" "$userPrivateKey"
}

########################################################################################
# Procedure:    getTempFolder
#
# Description:     Retrieves the temporary folder specific to a platform
#
########################################################################################
proc getTempFolder {} \
{
	set tmpdir [pwd]
	if {[file exists "/tmp"]} {set tmpdir "/tmp"}
	catch {set tmpdir $::env(TRASH_FOLDER)} ;# very old Macintosh. Mac OS X doesn't have this.
	catch {set tmpdir $::env(TMP)}
	catch {set tmpdir $::env(TEMP)}
    return $tmpdir
}

########################################################################################
# Procedure:    getUniqueFileName
#
# Description:     Generates a unique file name based on criterias like current system 
# 				   time and process id of the current process
#
########################################################################################
proc getUniqueFileName {} \
{
	set appName "scriptHelper"
	set systemTime [clock seconds]
	set timeStamp [clock format $systemTime -format %d%m%Y_%H_%M_%S]
	set tempFileName [format %s_%s_%s.tcl $appName $timeStamp [pid] ".tcl"]
	return $tempFileName
}

########################################################################################
# Procedure:    getUniqueTempFilePath
#
# Description:     Generates a full path for a filename in a temporary folder
#
# Input:        fileName    - File name which is appended to the temporary directory
#                            
#
########################################################################################
proc getUniqueTempFilePath {fileName} \
{
	set tmpdir [getTempFolder]
	set tempFile [file join $tmpdir $fileName]
    return $tempFile
}

########################################################################################
# Procedure:    writeContentToFile
#
# Description:     Writes the content to a file and returns 0 in case of success and 1
# in case of failure 
#
# Input:        filePath    - Absolute path to the file in which the content will be 
#							  written.
#				content		- Content to be saved in provided file
#                            
########################################################################################
proc writeContentToFile {filePath content} \
{
	set access [list RDWR CREAT EXCL TRUNC]
	set perm 0666
	if {[catch {open $filePath $access $perm} fid ]} {
		# something went wrong 
		puts "Error in opening for write $filePath:$fid"
		return 1
	}
	puts $fid $content
	close $fid
	return 0
}

########################################################################################
# Procedure:    readContentFromFile
#
# Description:     Reads the content of a file and returns content or empty string in 
# 				   case file can't be opened.
#
# Input:        filePath    - Absolute path to the file that needs to be read.
#                            
########################################################################################
proc readContentFromFile {filePath} \
{
	set fileContent ""
	if {[catch {open $filePath r} fid ]} {
		# something went wrong 
		puts "Error in opening for read $filePath:$fid"
		return $fileContent
	}
	set fileContent [read $fid]
	close $fid
	return $fileContent
}
