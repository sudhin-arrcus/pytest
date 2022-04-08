##Procedure Header
# Name:
#    ::ixiangpf::emulation_esmc_info
#
# Description:
#    This procedure will fetch Statistics and Learned Information for ESMC protocol.
#
# Synopsis:
#    ::ixiangpf::emulation_esmc_info
#        -mode         CHOICES stats clear_stats
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        -handle       ANY
#
# Arguments:
#    -mode
#        Operation that is been executed on the protocol. Valid options are:
#        stats
#        clear_stats
#    -port_handle
#        The port from which to extract ISISdata.
#        One of the two parameters is required: port_handle/handle.
#    -handle
#        The ESMC session handle to act upon.
#
# Return Values:
#
# Examples:
#    See files starting with ESMC in the Samples subdirectory.
#    See the CFM example in Appendix A, "Example APIs," for one specific example usage.
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    Coded versus functional specification.
#
# See Also:
#

proc ::ixiangpf::emulation_esmc_info { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_esmc_info" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
