##Procedure Header
# Name:
#    ixiangpf::emulation_pce_control
#
# Description:
#    This procedure performs control actions like start, stop or restart on PCE and PCC Group and does some right click actions on different type of LSPs.
#    The following operations are done:
#    1. Start
#    2. Stop
#    3. Restart
#    4. Restart Down
#    5. Abort
#
# Synopsis:
#    ixiangpf::emulation_pce_control
#        -mode                 CHOICES restart
#                              CHOICES start
#                              CHOICES restart_down
#                              CHOICES stop
#                              CHOICES abort
#                              CHOICES take_control
#                              CHOICES return_delegation
#                              CHOICES send_pc_update
#        [-handle              ANY]
#x       [-pc_update_indexlist ALPHA]
#
# Arguments:
#    -mode
#        What is being done to the protocol.Valid choices are:
#        restart- Restart the protocol.
#        start- Start the protocol.
#        stop- Stop the protocol.
#        restart_down- Restart the down sessions.
#        abort- Abort the protocol.
#        take_control- Take Control of PCE-Initiated LSPs.
#        return_delegation- Return Delegation of PCE-Initiated or PCE-Replied LSPs.
#        send_pc_update- SendPcUpdate for Learned Info Trigger Parameters.
#    -handle
#        This option represents the handle the user *must* pass to the
#        "emulation_pce_control" procedure. This option specifies
#        on which PCEP session to control.
#x   -pc_update_indexlist
#x       Index list for Send PCUpdate action.
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
#    For mode choices restart, start, restart_down, stop and abort, PCE/PCC Group handle needs to be provided.
#    For take_control and return_delegation, node handle of corresponding LSP type needs to be provided.
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_pce_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_pce_control', $args);
	# ixiahlt::utrackerLog ('emulation_pce_control', $args);

	return ixiangpf::runExecuteCommand('emulation_pce_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
