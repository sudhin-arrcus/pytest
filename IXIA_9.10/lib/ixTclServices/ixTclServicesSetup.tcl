#############################################################################################
#   Version 9.10
#   
#   File: ixTclServicesSetup.tcl
#
#   Copyright ©  IXIA
#   All Rights Reserved.
#
#############################################################################################
package req IxTclHal
package provide IxTclServices 9.10

lappend auto_path [file dirname [info script]]

set ixServicesCmds { serviceManager dispatchService captureService genericService }

# NOTE: Need to redefine cleanUp here for IxTclServices,
# so that it can do package forget IxTclServices
if {[info proc cleanUp] != ""} {
    if {[info proc cleanUpOld] == ""} {
        rename cleanUp cleanUpOld
    }
} else {
    catch {source [file join $::env(IXTCLHAL_LIBRARY) Generic utils.tcl]}
    if {[info proc cleanUpOld] == ""} {
        rename cleanUp cleanUpOld
    }
}

    

proc cleanUp {} \
{
    cleanUpOld
    package forget IxTclServices
    return
}

# TCL 8.4 doesn't support the frame command which we are using to get the absolute path of this script
# IxOS is at the moment at TCL 8.5 so native TCL clients will not hit this problem. We see the issue in
# HL regressions because of the python 2.4 which uses tcl 8.4
set infoFrameNotSupported [expr $::tcl_version < 8.5]

# Denotes support for IxTCLHAL package under Windows
set nativeTCLWin    [isWindows]
set nativeTCLUnix   [isNativeTCLUnix]
set createTCLCommands   $nativeTCLWin

if {
    ($nativeTCLWin == 1 && ![tclServer::isTclServerConnected]) ||
    ($nativeTCLUnix == 1 && ![info exists ::env(FORCE_NATIVE_TCL_CONSOLE)]) ||
    ($nativeTCLUnix == 1 && [info exists ::env(FORCE_NATIVE_TCL_CONSOLE)] && [info exists ::env(NOP_CONNECT_TO_TCL_SERVER)])
   } {
    catch {
        set serviceManagerPtr [TCLServiceManager serviceManager]
        if {$serviceManagerPtr == ""} {
            puts "Error instantiating TCLServiceManager object!"
            return 1
        }

        if {[TCLDispatchService dispatchService $serviceManagerPtr] == ""} {
            puts "Error instantiating TCLDispatchService object!"
            return 1
        }

        if {[TCLCaptureService captureService $serviceManagerPtr] == ""} {
            puts "Error instantiating TCLCaptureService object!"
            return 1
        }

        if {[TCLGenericService genericService $serviceManagerPtr] == ""} {
            puts "Error instantiating TCLGenericService object!"
            return 1
        }
    }
} else {
    if {[tclServer::isTclServerConnected]} {
        # intercept ixTclServices commands, send to remote side for execution:
        remoteDefine $ixServicesCmds
        # Make sure the remote end knows what to do with those commands:
        if [catch {clientSend $ixTclSvrHandle "package req IxTclServices"} result] {
            puts "Error installing IxTclServices on remote end: "
            puts $result
            return 1
        }
    }
}

eval lappend ::halCommands $ixServicesCmds






