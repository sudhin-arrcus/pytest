##Procedure Header
# Name:
#    ixiangpf::emulation_netconf_server_control
#
# Description:
#    This procedure performs control actions like start, stop or restart on Netconf Server and does some right click actions.
#    The following operations are done:
#    1. Start
#    2. Stop
#    3. Restart
#    4. Restart Down
#    5. Abort
#
# Synopsis:
#    ixiangpf::emulation_netconf_server_control
#        -mode             CHOICES restart
#                          CHOICES start
#                          CHOICES restart_down
#                          CHOICES stop
#                          CHOICES abort
#                          CHOICES get_decrypted_capture
#                          CHOICES stop_rpc_reply_store_outstanding_requests
#                          CHOICES stop_rpc_reply_drop_outstanding_requests
#                          CHOICES resume_rpc_reply
#                          CHOICES send_rpc_reply_with_wrong_message_id
#                          CHOICES send_rpc_reply_with_wrong_character_count
#        [-handle          ANY]
#x       [-tcp_port_number ANY]
#
# Arguments:
#    -mode
#        What is being done to the protocol.Valid choices are:
#        restart- Restart the protocol.
#        start- Start the protocol.
#        stop- Stop the protocol.
#        restart_down- Restart the down sessions.
#        abort- Abort the protocol.
#    -handle
#        This option represents the handle the user *must* pass to the
#        "emulation_netconf_server_control" procedure. This option specifies
#        on which Netconf session to control.
#x   -tcp_port_number
#x       The TCP Port number of the server connection for which the capture file is to be fetched. Enter 0 for the first server connection.
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
#    For mode choices restart, start, restart_down, stop and abort Netconf Server handle needs to be provided.
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_netconf_server_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_netconf_server_control', $args);
	# ixiahlt::utrackerLog ('emulation_netconf_server_control', $args);

	return ixiangpf::runExecuteCommand('emulation_netconf_server_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
