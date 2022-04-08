#############################################################################################
#
#   protocolScriptgen.tcl  - main protocol scriptgen file
#
#   Copyright � 1997 - 2004 by IXIA.
#   All Rights Reserved.
#
#	Revision Log:
#	05-12-2004	EM	Genesis
#
#
#############################################################################################


set currDir [file dirname [info script]]

foreach fileItem1 [glob -nocomplain [file join $currDir/Protocols/*]] {
    if {![file isdirectory $fileItem1]} {
		source  $fileItem1
	} 
}

package provide scriptgen-protocols 9.10.2007.46

