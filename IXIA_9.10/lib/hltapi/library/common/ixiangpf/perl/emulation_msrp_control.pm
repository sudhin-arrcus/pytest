##Procedure Header
# Name:
#    ixiangpf::emulation_msrp_control
#
# Description:
#    Control Operation on the MSRP Talker and Listener
#    The following operations are done:
#    1. Start
#    2. Stop
#    3. Restart
#    4. Restart Down
#    6. Abort
#
# Synopsis:
#    ixiangpf::emulation_msrp_control
#        -mode    CHOICES restart
#                 CHOICES start
#                 CHOICES restart_down
#                 CHOICES stop
#                 CHOICES abort
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
#    -handle
#        MSRP Talker or msrp listener handle where the msrp control action is applied.
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

sub emulation_msrp_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_msrp_control', $args);
	# ixiahlt::utrackerLog ('emulation_msrp_control', $args);

	return ixiangpf::runExecuteCommand('emulation_msrp_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
