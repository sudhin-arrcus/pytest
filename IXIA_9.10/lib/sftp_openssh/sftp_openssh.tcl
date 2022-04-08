##################################################################################
#   Version 9.10
#   
#   File: sftp_openssh.tcl
#   Copyright ©  IXIA
#   All Rights Reserved.
#
#   Description:  This file contains utilities for FileTransfer over openssh infrastructure
#
#   Revision Log:
#   Date        Author              Comments
#   ----------- ------------------- --------------------------------------------
#   01/14/2019  cmarinescu                  initial release
#
##################################################################################
package provide sftp_openssh 1.0

namespace eval sftp_openssh {} \
{
    variable uniqueIndex 0
    variable enableDebug 0
    variable enableStacktrace 0
    variable retryCount 0
}


proc callstack {} {
    set stack [list "Stacktrace:"]

    for {set i 1} {$i < [info level]} {incr i} {
        set level [info level -$i]
        set frame [info frame -$i]

        if {[dict exists $frame proc]} {
            set pname [dict get $frame proc]
            set pargs [lrange $level 1 end]
            lappend stack " - $pname"
            foreach arg $pargs {
                lappend stack "   * $arg"
            }
        } else {
            lappend stack " - **unknown stack item**: $level $frame"
        }
    }

    return [join $stack "\n"]
}

########################################################################################
# Procedure:    logSftpError
#
# Description:  Write a message to the sftp log window
#               
# Input:        textEntry
#
########################################################################################
proc sftp_openssh::logSftpError {textEntry} \
{
    variable enableStacktrace
    if { $enableStacktrace == 1} {
        puts [callstack]
    }
    puts "error | $textEntry"
}



# this just create the specific environmnent on the target machine and tests the connection
# if all is well a "socket" containing all relevant connection info is returned
proc sftp_openssh::Open { hostname port identity_file folder } \
{
    variable enableDebug
    # detect existence of sftp on the client machine.
    # note: to make this more efficient we could also check this from the error message returned from the
    # lftp command itself, but this seems more reliable
    set r [catch {exec which sftp >/dev/null} msg]
    if {$r != 0} {
        logSftpError "sftp required to run this command. Please install sftp on your client machine!"
        return -1
    }
    
    # used a dict with structure members being the keys(see sftp package)
    # so now, just initialize the sftp "socket"
    dict set sock identity_file "$identity_file"
    dict set sock folder "$folder"
    dict set sock hostname "$hostname"
    dict set sock port $port


    # try to connect to remote sftp, to check if remote has sftp enabled/running
    set r [ catch { [ execCommand $sock "bye" ] } msg ]

    # if status is not success and we have an error we'll just abort
    # the reason for this second condition in the if is that we can have success with 
    # the process writing something to stderr. In this case the return code caught by tcl is not 0, so we
    # need the additional checking of the error code
    if {$r == 0 && $::errorCode != "NONE"} {
        if { $enableDebug == 1} {
            puts "Errorcode: $::errorCode, msg:$msg, result: $r"
        }
        logSftpError $msg
        return -1
    }

    return $sock
}

proc sftp_openssh::Close { sock } \
{
    unset sock
}

# execute a generic sftp file transfer command
proc sftp_openssh::execCommand { sock cmd } \
{
    variable enableDebug
    variable retryCount
    set identity_file [ dict get $sock identity_file ]
    set folder [ dict get $sock folder ]
    set port [ dict get $sock port ]
    set hostname [ dict get $sock hostname ]


    set uniqueFileName [getUniqueFileName]
    set batchFile [getUniqueTempFilePath $uniqueFileName]
            
    if { !([writeContentToFile $batchFile $cmd] == 0) } {
        logSftpError "Unable to write to $batchFile following content: $cmd"
        file delete -force $batchFile
        return 0
    }
   
    # command for IPv6 vs IPv4
	if {[string match *:* $hostname]} {
		set user "ftp@\[$hostname\]"
	} else {
		set user "ftp@$hostname"
	}
    set MAX_RETRY_COUNT 3
    set r 0

    while {$retryCount < $MAX_RETRY_COUNT} {
        if { $enableDebug == 1} {
            puts "Retry count is $retryCount"
        }
        set r [ catch { exec sftp -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" -o "LogLevel=ERROR" -i "$identity_file" -b "$batchFile" $user } msg ]
            
        if {$r != 0 && $::errorCode != "NONE"} {
            if { $enableDebug == 1} {
                puts "execCommand - result:$r, errorCode:$::errorCode"
            }
            logSftpError $msg
            set retryCount [expr {$retryCount + 1}]
            after 1000
        } else {
            set retryCount 0
            break;
        }
    }
    # remove temporary generated file(batch file) after being used
    file delete -force $batchFile

    if {$r != 0 && $::errorCode != "NONE"} {
        if { $enableDebug == 1} {
            puts "execCommand - result:$r, errorCode:$::errorCode"
        }
        logSftpError $msg
        return 0
    }
    
    return 1
}

proc getFileContent { src dst cmd } \
{
    set template ""
    set remoteSftpFolder "/ixia/tclftp/"
   
    if {$cmd eq "get"} {
        set dirpath [file dirname $dst]
        set filename [file tail $dst]
        set template \
"lcd $dirpath\n\
cd $remoteSftpFolder\n\
$cmd $filename\n\
bye"
    }
    if {$cmd eq "put"} {
        set dirpath [file dirname $src]
        set filename [file tail $src]
        set template \
"cd $remoteSftpFolder\n\
lcd $dirpath\n\
$cmd $filename\n\
bye"
    }
    if {$cmd eq "rm"} {
        set template \
"cd $remoteSftpFolder\n\
$cmd $src\n\
bye"
    }
    
    return $template
}

proc sftp_openssh::Put { sock src dst } \
{
    variable enableDebug
    set cmd [ getFileContent $src $dst "put"]

    if { $enableDebug == 1} {
        puts "PUT cmd:$cmd"   
    }
    
    return [ execCommand $sock $cmd ]
}


proc sftp_openssh::Get { sock src dst } \
{
    variable enableDebug
    set cmd [ getFileContent $src $dst "get"]
    if { $enableDebug == 1} {
        puts "GET cmd:$cmd"    
    }
    
    return [ execCommand $sock $cmd ]
}

proc sftp_openssh::Delete { sock f } \
{
    variable enableDebug
    set cmd [ getFileContent $f "" "rm"]
    if { $enableDebug == 1} {
        puts "DELETE cmd:$cmd"
    }
    return [ execCommand $sock $cmd ]
}



########################################################################################
# Procedure:    getTempFolder
#
# Description:     Retrieves the temporary folder specific to a platform
#
########################################################################################
proc sftp_openssh::getTempFolder {} \
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
#                  time and process id of the current process
#
########################################################################################
proc sftp_openssh::getUniqueFileName {} \
{
    variable uniqueIndex
    incr uniqueIndex
    set appName "batchFile"
    set username $::tcl_platform(user)
    set systemTime [clock seconds]
    set timeStamp [clock format $systemTime -format %d%m%Y_%H_%M_%S]
    set tempFileName [format %s_%s_%s_%s.%s $appName $username $timeStamp [pid] $uniqueIndex ".batch"]
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
proc sftp_openssh::getUniqueTempFilePath {fileName} \
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
#                             written.
#               content     - Content to be saved in provided file
#                            
########################################################################################
proc sftp_openssh::writeContentToFile {filePath content} \
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
#                  case file can't be opened.
#
# Input:        filePath    - Absolute path to the file that needs to be read.
#                            
########################################################################################
proc sftp_openssh::readContentFromFile {filePath} \
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
