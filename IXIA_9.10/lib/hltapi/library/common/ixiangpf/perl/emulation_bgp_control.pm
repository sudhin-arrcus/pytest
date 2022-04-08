##Procedure Header
# Name:
#    ixiangpf::emulation_bgp_control
#
# Description:
#    This procedure starts, stops and restarts a BGP protocol for the specified port.
#
# Synopsis:
#    ixiangpf::emulation_bgp_control
#        -mode                   CHOICES restart
#                                CHOICES abort
#                                CHOICES restart_down
#                                CHOICES start
#                                CHOICES stop
#                                CHOICES statistic
#                                CHOICES break_tcp_session
#                                CHOICES resume_tcp_session
#                                CHOICES resume_keep_alive
#                                CHOICES stop_keep_alive
#                                CHOICES advertise_aliasing
#                                CHOICES withdraw_aliasing
#                                CHOICES flush_remote_cmac_forwarding_table
#                                CHOICES readvertise_cmac
#                                CHOICES readvertise_routes
#                                CHOICES age_out_routes
#                                CHOICES switch_to_spmsi
#        [-handle                ANY]
#x       [-notification_code     NUMERIC
#x                               DEFAULT 0]
#x       [-notification_sub_code NUMERIC
#x                               DEFAULT 0]
#n       [-port_handle           ANY]
#x       [-age_out_percent       NUMERIC]
#
# Arguments:
#    -mode
#        What is being done to the protocol..
#    -handle
#        The BGP session handle.
#x   -notification_code
#x       The notification code for break_tcp_session and resume_tcp_session.
#x   -notification_sub_code
#x       The notification sub code for break_tcp_session and resume_tcp_session.
#n   -port_handle
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -age_out_percent
#x       The percentage of addresses that will be aged out. This argument is ignored when mode is not age_out_routes and *must* be specified in such circumstances.
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
#    Coded versus functional specification.
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_bgp_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_bgp_control', $args);
	# ixiahlt::utrackerLog ('emulation_bgp_control', $args);

	return ixiangpf::runExecuteCommand('emulation_bgp_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
