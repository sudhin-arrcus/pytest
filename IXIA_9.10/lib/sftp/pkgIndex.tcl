# Tcl package index file, version 1.1
# This file is *not* generated by the "pkg_mkIndex" command.
# This file is generated by an installation procedure.
# It is sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.
	
package ifneeded sftp 1.0 [list source [file join $dir sftp.tcl]]