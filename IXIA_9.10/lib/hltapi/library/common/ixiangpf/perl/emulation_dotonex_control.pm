##Procedure Header
# Name:
#    ixiangpf::emulation_dotonex_control
#
# Description:
#    This procedure will we be used to execute all actions for 802.1x protocol.
#
# Synopsis:
#    ixiangpf::emulation_dotonex_control
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle      ANY]
#x       [-index       NUMERIC
#x                     DEFAULT 1]
#        [-values      RANGE 1-10000]
#        -mode         CHOICES stop start restart abort
#
# Arguments:
#    -port_handle
#        A list of ports on which to control the 802.1x protocol. If this option
#        is not present, the port in the handle option will be applied.
#    -handle
#        802.1x device handle.It is returned by emulation_dotonex_config call.
#x   -index
#x       index on which the action defined by the –mode parameter will be applied
#    -values
#        The values for action to trigger on Ixia interface.
#    -mode
#        This option defines the action to be taken.Note: Valid options are:
#        stop
#        start
#        restart
#
# Return Values:
#    $::SUCCESS or $::FAILURE
#    key:status  value:$::SUCCESS or $::FAILURE
#    If failure, will contain more information
#    key:log     value:If failure, will contain more information
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) Coded versus functional specification.
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_dotonex_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_dotonex_control', $args);
	# ixiahlt::utrackerLog ('emulation_dotonex_control', $args);

	return ixiangpf::runExecuteCommand('emulation_dotonex_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
