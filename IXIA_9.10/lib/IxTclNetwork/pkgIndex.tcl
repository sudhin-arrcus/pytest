#############################################################################################
#
# pkgIndex.tcl
#
# Copyright (C) 1997-2018 by IXIA.
# All Rights Reserved.
#
#
#############################################################################################

set env(IXTCLNETWORK_9.10.2007.7) [file dirname [info script]]

package ifneeded IxTclNetwork 9.10.2007.7 {
    package provide IxTclNetwork 9.10.2007.7
    namespace eval ::ixTclNet {}
    namespace eval ::ixTclPrivate {}
    namespace eval ::IxNet {}

    foreach fileItem1 [glob -nocomplain $env(IXTCLNETWORK_9.10.2007.7)/Generic/*.tcl] {
        if {![file isdirectory $fileItem1]} {
            source  $fileItem1
        }
    }

    if {[info command bgerror]==""} {
        # Avoid TK popups from background errors.
        proc bgerror {args} {
            puts "$args"
        }
    }

    source [file join $env(IXTCLNETWORK_9.10.2007.7) IxTclNetwork.tcl]
  
}

