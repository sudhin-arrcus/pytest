##Procedure Header
# Name:
#    ixiangpf::emulation_netconf_server_info
#
# Description:
#    This procedure retrieves information about the Netconf Server sessions.
#    This procedure is also used to fetch stats, learned information and configured properties of Netconf Server, depending on the given mode and handle.
#
# Synopsis:
#    ixiangpf::emulation_netconf_server_info
#x       -mode         CHOICES per_port_stats
#x                     CHOICES per_session_stats
#x                     CHOICES per_device_group_stats
#x                     CHOICES per_connection_stats
#x                     CHOICES clear_stats
#        -handle       ANY
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#
# Arguments:
#x   -mode
#x       For fetching per_port_stats provide any Netconf Server handle, for per_session_stats and per_device_group_stats provide a Netconf Server handle which is on the corresponding port.
#    -handle
#        The Netconf Server handle to act upon.
#    -port_handle
#        Port handle.
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

sub emulation_netconf_server_info {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_netconf_server_info', $args);
	# ixiahlt::utrackerLog ('emulation_netconf_server_info', $args);

	return ixiangpf::runExecuteCommand('emulation_netconf_server_info', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
