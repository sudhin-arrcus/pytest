#############################################################################################
#
# pkgIndex.tcl  
#
# Copyright © 1997-2004 by IXIA.
# All Rights Reserved.
#
#   Revision Log:
#   05-06-2004  EM  Genesis
#
#############################################################################################

if {$::tcl_platform(platform) != "unix"} {
    # if this package is already loaded, then don't load it again
    if {[lsearch [package names] IxTclNetworkProtocol] != -1} {
        return
    }
} else {
    lappend ::auto_path $dir
}

package ifneeded IxTclNetworkProtocol 9.10.2007.46 [list source [file join $dir IxTclNetworkProtocol.tcl]]
