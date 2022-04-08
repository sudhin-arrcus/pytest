##Procedure Header
# Name:
#    ::ixiangpf::emulation_netconf_client_control
#
# Description:
#    This procedure performs control actions like start, stop or restart on Netconf Client and does some right click actions.
#    The following operations are done:
#    1. Start
#    2. Stop
#    3. Restart
#    4. Restart Down
#    5. Abort
#    6. Get Decrypted Capture
#    7. Execute Command Get
#    8. Execute Command
#
# Synopsis:
#    ::ixiangpf::emulation_netconf_client_control
#        -mode    CHOICES restart
#                 CHOICES start
#                 CHOICES restart_down
#                 CHOICES stop
#                 CHOICES abort
#                 CHOICES get_decrypted_capture
#                 CHOICES execute_command_get
#                 CHOICES execute_command
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
#        get_decrypted_capture- This will fetch and open the decrypted capture for selected sessions.
#        execute_command_get- Sends the configured command for the selected rows to the DUT if the selected client's Netconf session is up with the DUT. This action is performed in Netconf Client.
#        execute_command- Sends the configured command for the selected rows to the DUT if the selected client's Netconf session is up with the DUT. This action is performed in Netconf Client's Command Snippets.
#    -handle
#        This option represents the handle the user *must* pass to the
#        "emulation_netconf_client_control" procedure. This option specifies
#        on which Netconf session to control.
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
#    For mode choices restart, start, restart_down, stop, abort, get_decrypted_capture and execute_command_get Netconf Client handle needs to be provided.
#    For mode execute_command, node handle of Command Snippets needs to be provided.
#
# See Also:
#

proc ::ixiangpf::emulation_netconf_client_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_netconf_client_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
