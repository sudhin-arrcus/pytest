##Procedure Header
# Name:
#    ::ixiangpf::emulation_esmc_control
#
# Description:
#    This procedure will handle all the right click action(s) that can be carried out on ESMC protocol stack.
#
# Synopsis:
#    ::ixiangpf::emulation_esmc_control
#        -mode    CHOICES start stop restartDown abort
#        [-handle ANY]
#
# Arguments:
#    -mode
#        Operation that is been executed on the protocol. Valid choices are:
#        start- Start the protocol.
#        stop- Stop the protocol.
#        restart_down - Restarts the down sessions.
#        abort- Aborts the protocol.
#    -handle
#        ESMC handle where the ESMC control action is applied.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status  value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log     value:If status is failure, detailed information provided.
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

proc ::ixiangpf::emulation_esmc_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_esmc_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
