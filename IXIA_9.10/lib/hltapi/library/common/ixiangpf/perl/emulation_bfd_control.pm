##Procedure Header
# Name:
#    ixiangpf::emulation_bfd_control
#
# Description:
#    This procedure starts/stops a BFD configuration.
#
# Synopsis:
#    ixiangpf::emulation_bfd_control
#        -mode             CHOICES start
#                          CHOICES stop
#                          CHOICES restart
#                          CHOICES abort
#                          CHOICES resume_pdu
#                          CHOICES stop_pdu
#                          CHOICES demand_mode_disable
#                          CHOICES demand_mode_enable
#                          CHOICES initiate_poll
#                          CHOICES set_admin_down
#                          CHOICES set_admin_up
#                          CHOICES set_diagnostic_state
#n       [-port_handle     ANY]
#        [-handle          ANY]
#x       [-protocol_name   CHOICES isis
#x                         CHOICES bfd
#x                         CHOICES ospf
#x                         CHOICES ospfv3
#x                         CHOICES pim
#x                         CHOICES bgp
#x                         CHOICES ldp
#x                         CHOICES rsvp
#x                         DEFAULT bfd]
#x       [-diagnostic_code CHOICES administratively_down
#x                         CHOICES concatenated_path_down
#x                         CHOICES control_detection_time_expired
#x                         CHOICES echo_function_failed
#x                         CHOICES forwarding_plane_reset
#x                         CHOICES neighbour_signaled_session_down
#x                         CHOICES path_down
#x                         CHOICES reserved
#x                         CHOICES reverse_concatenated_path_down
#x                         DEFAULT control_detection_time_expired]
#
# Arguments:
#    -mode
#        The action to take on the handle provided: start/stop the protocol.
#n   -port_handle
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -handle
#        The router handle or router interface handle or session handle where
#        BFD emulation will be started/stopped. This action will be applied to
#        the port where -handle was created.
#        One of the two parameters is required: handle.
#x   -protocol_name
#x       This is session used by protocol
#x   -diagnostic_code
#x       This is the diagnostic code
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status  value:$::SUCCESS | $::FAILURE
#    On status of failure, gives detailed information.
#    key:log     value:On status of failure, gives detailed information.
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

sub emulation_bfd_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_bfd_control', $args);
	# ixiahlt::utrackerLog ('emulation_bfd_control', $args);

	return ixiangpf::runExecuteCommand('emulation_bfd_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
