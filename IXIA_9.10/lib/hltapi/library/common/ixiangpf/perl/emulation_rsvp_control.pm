##Procedure Header
# Name:
#    ixiangpf::emulation_rsvp_control
#
# Description:
#    Control Operation on the RSVP
#    The following operations are done:
#    1. Start
#    2. Stop
#    3. Restart
#    4. Restart Down
#    6. Abort
#
# Synopsis:
#    ixiangpf::emulation_rsvp_control
#        -mode    CHOICES restart
#                 CHOICES start
#                 CHOICES restart_down
#                 CHOICES stop
#                 CHOICES abort
#                 CHOICES restart_neighbor
#                 CHOICES start_hello
#                 CHOICES stop_hello
#                 CHOICES start_s_refresh
#                 CHOICES stop_s_refresh
#        [-handle ANY]
#
# Arguments:
#    -mode
#        What is being done to the protocol.Valid choices are:
#        restart - Restart the protocol.
#        start- Start the protocol.
#        stop- Stop the protocol.
#        restart_down- Restart the down sessions.
#        abort- Abort the protocol.
#        restart_neighbor - Restart the Neighbor.
#    -handle
#        RSVP TE handle where the rsvp control action is applied.
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
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_rsvp_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_rsvp_control', $args);
	# ixiahlt::utrackerLog ('emulation_rsvp_control', $args);

	return ixiangpf::runExecuteCommand('emulation_rsvp_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
