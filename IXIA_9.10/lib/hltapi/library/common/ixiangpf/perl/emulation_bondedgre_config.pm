##Procedure Header
# Name:
#    ixiangpf::emulation_bondedgre_config
#
# Description:
#    This procedure will configure BondedGRE with a provision to add config related parameters on a given interface.
#
# Synopsis:
#    ixiangpf::emulation_bondedgre_config
#x       [-port_handle             REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#x       [-reset                   FLAG]
#        [-handle                  ANY]
#x       [-return_detailed_handles CHOICES 0 1
#x                                 DEFAULT 0]
#        [-mode                    CHOICES create
#                                  CHOICES modify
#                                  CHOICES delete
#                                  CHOICES getAttribute
#                                  DEFAULT create]
#x       [-attributeName           CHOICES bSessionInfo
#x                                 CHOICES homeGatewayInfo
#x                                 CHOICES errorCode
#x                                 CHOICES dhcpIp]
#        [-count                   RANGE 1-8000
#                                  DEFAULT 1]
#x       [-id_name                 ANY]
#x       [-dsl_sync_rate           ANY]
#x       [-bypass_traffic          ANY]
#x       [-ipv6_prefix             ANY]
#x       [-ipv6_prefix_len         ANY]
#x       [-active                  ANY]
#x       [-create_full_stack       CHOICES 0 1
#x                                 DEFAULT 0]
#x       [-haap_router             CHOICES 0 1]
#x       [-router_mac              MAC]
#x       [-key                     CHOICES 0 1]
#x       [-wait_for_lte            CHOICES 0 1]
#x       [-tunnel_type             CHOICES dsl lte]
#
# Arguments:
#x   -port_handle
#x       Ixia interface upon which to act.
#x   -reset
#x       If this option is selected, this will clear any BondedGRE device.
#    -handle
#        BondedGRE device handle for using the modes delete, modify, enable, and disable.
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#    -mode
#        Action to take on the port specified the handle argument.
#x   -attributeName
#x       Attribute name for fetching value.
#    -count
#        Defines the number of BondedGRE devices to be configured on the -port_handle.
#x   -id_name
#x       This is a 40-byte string value(Allowed upto 80 bytes). It is used as the identification of the HG in the operator's network.
#x   -dsl_sync_rate
#x       DSL Synchronization Rate is used to notify the HAAP about the downstream bandwidth of the DSL link.
#x   -bypass_traffic
#x       Bypass Traffic Rate is used to inform the HG of how frequently the bypass bandwidth should be checked.
#x   -ipv6_prefix
#x       IPv6 Prefix Assigned to Host.
#x   -ipv6_prefix_len
#x       IPv6 Prefix length.
#x   -active
#x       Activate/Deactivate Configuration
#x   -create_full_stack
#x       flag to create full stack. this flag is introduced mainly for Scripgen Issue.
#x   -haap_router
#x       If enabled, MAC address will be same for all control messages from all tunnels.
#x   -router_mac
#x       MAC address of the emulated HAAP Router.
#x   -key
#x       If enabled then key will be included in the GRE header for control messages.
#x   -wait_for_lte
#x       If enabled then DSL will wait for LTE to start, otherwise DSL can start anytime.
#x   -tunnel_type
#x       Determines the Tunnel type to be used
#
# Return Values:
#    A list containing the bondedgre device protocol stack handles that were added by the command (if any).
#x   key:bondedgre_device_handle  value:A list containing the bondedgre device protocol stack handles that were added by the command (if any).
#    A list containing the dhcpv4 device protocol stack handles that were added by the command (if any).
#x   key:dhcpv4_device_handle     value:A list containing the dhcpv4 device protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:interface_handle         value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS or $::FAILURE
#    key:status                   value:$::SUCCESS or $::FAILURE
#    If failure, will contain more information
#    key:log                      value:If failure, will contain more information
#    BondedGRE device Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:handle                   value:BondedGRE device Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) Coded versus functional specification.
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle, interface_handle
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_bondedgre_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_bondedgre_config', $args);
	# ixiahlt::utrackerLog ('emulation_bondedgre_config', $args);

	return ixiangpf::runExecuteCommand('emulation_bondedgre_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
