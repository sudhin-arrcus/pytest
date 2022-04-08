##################################################################################
#   Version 9.10
#
#   File: sftp.tcl
#   Copyright ©  IXIA
#   All Rights Reserved.
#
#	Description:  This file contains utilities FileTransfer
#
#	Revision Log:
#	Date		Author				Comments
#	-----------	-------------------	--------------------------------------------
#   04/12/2017  mnegriu          		initial release
#
##################################################################################
package provide sftp 1.0

namespace eval sftp {} \
{
}

########################################################################################
# Procedure:	logSftpError
#
# Description: 	Write a message to the sftp log window
#
# Input:		textEntry
#
########################################################################################
proc logSftpError {textEntry} \
{
    puts "error | $textEntry"
}



# this just create the specific environmnent on the target machine and tests the connection
# if all is well a "socket" containing all relevant connection info is returned
proc sftp::Open { hostname port user pass folder } \
{
    # detect existence of lftp on the client machine.
    # note: to make this more efficient we could also check this from the error message returned from the
    # lftp command itself, but this seems more reliable
    set r [catch {exec which lftp >/dev/null} msg]
    if {$r != 0} {
        logSftpError "lftp required to run this command. Please install lftp on your client machine!"
        return -1
    }

    # connect, try to cd to folder, if unsuccesful, create it.
    set r [ catch { exec lftp -e "set sftp:auto-confirm yes; cd $folder || mkdir -p $folder; bye" -u $user,$pass sftp://$hostname -p $port } msg ]

    # if ssl host key verification failed, remove the hosts from
    # known hosts repository and try to do sftp with lftp again
    if {[string first "Host key verification failed" $msg] != -1} {
        set r [ catch { exec ssh-keygen -R $hostname } msg ]

        if {$r != 0 && $::errorCode != "NONE"} {
           logSftpError "File transfer failed. Host key verification failed for $hostname.
\tProbably an existing invalid key already exists in ~/.ssh/known_hosts for this host.
\tTried to remove it with ssh-keygen -R $hostname but failed with \"$msg\"
\tPlease check your ~/.ssh/known_hosts and try to remove the key manually. Otherwise, please try to fix your ssh access to $hostname"
           return -1
        }

        set r [ catch { exec lftp -e "set sftp:auto-confirm yes; cd $folder || mkdir -p $folder; bye" -u $user,$pass sftp://$hostname -p $port } msg ]
    }

    # if status is not success and we have an error we'll just abort
    # the reason for this second condition in the if is that we can have success with
    # the process writing something to stderr. In this case the return code caught by tcl is not 0, so we
    # need the additional checking of the error code
    if {$r != 0 && $::errorCode != "NONE"} {
        logSftpError $msg
        return -1
    }

    # couldn't find another way of creating a data structure in tcl, so I used a dict with structure members being the keys
    # so now, just initialize the sftp "socket"
    dict set sock user "$user"
    dict set sock pass "$pass"
    dict set sock folder "$folder"
    dict set sock hostname "$hostname"
    dict set sock port $port


    return $sock
}

proc sftp::Close { sock } \
{
    unset sock
}

# execute a generic sftp file transfer command
proc execSftpCommand { sock cmd } \
{
    set user [ dict get $sock user ]
    set pass [ dict get $sock pass ]
    set folder [ dict get $sock folder ]
    set port [ dict get $sock port ]
    set hostname [ dict get $sock hostname ]

    set r [ catch { exec lftp -e "set xfer:clobber true; set sftp:auto-confirm yes; cd $folder; $cmd; bye" -u $user,$pass sftp://$hostname -p $port } msg ]

    if {$r != 0 && $::errorCode != "NONE"} {
        logSftpError $msg
        return 0
    }

    return 1
}

proc sftp::Put { sock src dst } \
{
   return [ execSftpCommand $sock "put $src -o $dst" ]
}

proc sftp::Get { sock src dst } \
{
    return [ execSftpCommand $sock "get $src -o $dst" ]
}

proc sftp::Delete { sock f } \
{
    return [ execSftpCommand $sock "rm $f" ]
}


