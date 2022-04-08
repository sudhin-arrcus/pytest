
Dependencies:
1. API-Dependencies installer provided by ixia. Please download it from IXIA website and install it
   This installer will install ActiveState Tcl, ActiveState Perl with a private hotfix and Python


Instructions for testing:

1. Extract the compressed tar file on a client system under /opt

NOTE: If you do not extract under /opt and you use other destination, please update EXTRACT_PATH value of the next scripts after you extract: (default EXTRACT_PATH is set with /opt)
  For ixnetwork, under ixia/ixnetwork/<VERSION>/bin, ixnettcl,ixnetwish,ixnetperl,ixnetpython
  For hlapi, under  ixia/hlapi/<VERSION>/bin, ixnettcl,hlapiwish,hlapiperl,hlapipython
  For ixos, under  ixia/ixos-api/<VERSION>/bin, ixtcl,ixwish

2. Start the TCL shell or wish console on the client system and execute the following commands: 
	- lappend auto_path <directory where the compressed tar file was extracted to>
	- package req IxTclNetwork # should return a version number
	- ixNet connect <IxNetwork TCL Server address> # should return ::ixNet::OK

