##Procedure Header
# Name:
#    ::ixiangpf::emulation_pcc_control
#
# Description:
#    This procedure performs control actions like start, stop or restart on PCC and does some right click actions on different type of LSPs.
#    The following operations are done:
#    1. Start
#    2. Stop
#    3. Restart
#    4. Restart Down
#    5. Abort
#
# Synopsis:
#    ::ixiangpf::emulation_pcc_control
#        -mode    CHOICES restart
#                 CHOICES start
#                 CHOICES restart_down
#                 CHOICES stop
#                 CHOICES abort
#                 CHOICES delegate
#                 CHOICES revoke_delegation
#        [-handle ANY]
#
# Arguments:
#    -mode
#        What is being done to the protocol.Valid choices are:
#        restart- Restart the protocol.
#        start- Start the protocol.
#        stop- Stop the protocol.
#        restart_down- Restart the down sessions.
#        abort- Abort the protocol.
#        delegate- Delegate PCC-Requested or Pre-Established SR LSPs.
#        revoke_delegation- Revoke Delegation of PCC-Requested or Pre-Established SR LSPs.
#    -handle
#        This option represents the handle the user must pass to the "emulation_pcc_control" procedure. This option specifies on which PCEP session to control.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status  value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log     value:If status is failure, detailed information provided.
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    For mode choices restart, start, restart_down, stop and abort, PCC handle needs to be provided.
#    For modes delegate and revoke_delegation, node handle of corresponding LSP type needs to be provided.
#
# See Also:
#

proc ::ixiangpf::emulation_pcc_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_pcc_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
