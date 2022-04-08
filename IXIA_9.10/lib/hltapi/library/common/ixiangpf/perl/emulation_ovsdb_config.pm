##Procedure Header
# Name:
#    ixiangpf::emulation_ovsdb_config
#
# Description:
#    This procedure will add OVSDB Controller(s) to a particular Ixia Interface.
#
# Synopsis:
#    ixiangpf::emulation_ovsdb_config
#x       [-port_handle                          REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#x       [-reset                                FLAG]
#        [-handle                               ANY]
#x       [-return_detailed_handles              CHOICES 0 1
#x                                              DEFAULT 0]
#        [-mode                                 CHOICES create
#                                               CHOICES modify
#                                               CHOICES delete
#                                               CHOICES getAttribute
#                                               DEFAULT create]
#x       [-attributeName                        CHOICES role
#x                                              CHOICES errorCode
#x                                              CHOICES errorTimeStamp
#x                                              CHOICES errorDesc
#x                                              CHOICES errorPhysicalSwitchName
#x                                              CHOICES errorLogicalSwitchName
#x                                              CHOICES serverAddDeleteStatus
#x                                              CHOICES latestDumpDbFileNames
#x                                              CHOICES latestErrorFileNames
#x                                              CHOICES serverAddDeleteConnectionError
#x                                              CHOICES bindingStatus
#x                                              CHOICES progressStatus
#x                                              CHOICES errorStatus]
#x       [-name                                 ALPHA]
#        [-count                                RANGE 1-8000
#                                               DEFAULT 1]
#x       [-connection_type                      CHOICES tcp tls]
#x       [-controller_tcp_port                  RANGE 1-66535
#x                                              DEFAULT 6640]
#x       [-directory_name                       ANY]
#x       [-file_private_key                     ANY]
#x       [-file_certificate                     ANY]
#x       [-verify_peer_certificate              CHOICES 0 1
#x                                              DEFAULT 0]
#x       [-file_ca_certificate                  ANY]
#x       [-verify_hw_gateway_certificate        CHOICES 0 1
#x                                              DEFAULT 0]
#x       [-file_hw_gateway_certificate          ANY]
#x       [-time_out                             NUMERIC]
#x       [-dumpdb_directory_name                ANY]
#x       [-enable_ovsdb_server_ip               CHOICES 0 1
#x                                              DEFAULT 0]
#x       [-enable_logging                       CHOICES 0 1
#x                                              DEFAULT 0]
#x       [-ovsdb_server_ip                      IPV4
#x                                              DEFAULT 0.0.0.0]
#x       [-clear_dump_db_files                  CHOICES 0 1
#x                                              DEFAULT 1]
#x       [-error_log_directory_name             ANY]
#x       [-server_connection_ip                 IPV4
#x                                              DEFAULT 0.0.0.0]
#x       [-bindings_count                       NUMERIC]
#x       [-attach_at_start                      CHOICES 0 1
#x                                              DEFAULT 1]
#x       [-logical_switch_name                  ANY]
#x       [-vni                                  ANY]
#x       [-physical_switch_name                 ANY]
#x       [-physical_port_name                   ANY]
#x       [-sessions_per_vxlan                   RANGE 1-1600
#x                                              DEFAULT 1]
#x       [-pseudo_connected_to                  ANY]
#x       [-pseudo_connected_to_vxlan_replicator ANY]
#x       [-pseudo_connected_to_bfd              ANY]
#x       [-vxlan                                ANY]
#x       [-vxlan_replicator                     ANY]
#x       [-cluster_vlan_id                      RANGE 0-4096]
#x       [-create_full_stack                    CHOICES 0 1
#x                                              DEFAULT 0]
#x       [-table_names                          CHOICES all
#x                                              CHOICES global
#x                                              CHOICES manager
#x                                              CHOICES physical_switch
#x                                              CHOICES physical_port
#x                                              CHOICES physical_locator
#x                                              CHOICES physical_locator_set
#x                                              CHOICES tunnel
#x                                              CHOICES logical_switch
#x                                              CHOICES ucast_mac_local
#x                                              CHOICES ucast_mac_remote
#x                                              CHOICES mcast_mac_local
#x                                              CHOICES mcast_mac_remote]
#
# Arguments:
#x   -port_handle
#x       Ixia interface upon which to act.
#x   -reset
#x       If this option is selected, this will clear any Ovsdb Controller.
#    -handle
#        Ovsdb Controller handle for using the modes delete, modify, enable, and disable.
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#    -mode
#        Action to take on the port specified the handle argument.
#x   -attributeName
#x       attribute name for fetching value.
#x   -name
#x       Name of NGPF element, guaranteed to be unique in Scenario
#    -count
#        Defines the number of ovsdb controller to configure on the -port_handle.
#x   -connection_type
#x       Connection should use TCP or TLS
#x   -controller_tcp_port
#x       Specify the TCP port for the Controller
#x   -directory_name
#x       Location of Directory in Client where the Certificate and Key Files are available
#x   -file_private_key
#x       Private Key File
#x   -file_certificate
#x       Certificate File
#x   -verify_peer_certificate
#x       Verify Peer Certificate
#x   -file_ca_certificate
#x       CA Certificate File
#x   -verify_hw_gateway_certificate
#x       Verify HW Gateway Certificate
#x   -file_hw_gateway_certificate
#x       HW Gateway Certificate File
#x   -time_out
#x       Transact request Time Out in seconds. For scale scenarios increase this Timeout value.
#x   -dumpdb_directory_name
#x       Location of Directory in Client where the DumpDb Files are available
#x   -enable_ovsdb_server_ip
#x   -enable_logging
#x       If true, Port debug logs will be recorded.
#x   -ovsdb_server_ip
#x       The IP address of the DUT or Ovs Server.
#x   -clear_dump_db_files
#x   -error_log_directory_name
#x       Location of Directory in Client where the ErrorLog Files are available
#x   -server_connection_ip
#x       The IP address of the DUT or Ovs Server which needs to be Added/Deleted.
#x   -bindings_count
#x       Bindings Count
#x   -attach_at_start
#x       Attach at Start
#x   -logical_switch_name
#x       Logical_Switch Name
#x   -vni
#x       VNI
#x   -physical_switch_name
#x       Physical_Switch name
#x   -physical_port_name
#x       Physical_Port name
#x   -sessions_per_vxlan
#x       Indicates the multiplier per VXLAN entity for behind VM clients emulated.
#x   -pseudo_connected_to
#x       GUI-only connection
#x   -pseudo_connected_to_vxlan_replicator
#x       GUI-only connection
#x   -pseudo_connected_to_bfd
#x       GUI-only connection
#x   -vxlan
#x   -vxlan_replicator
#x   -cluster_vlan_id
#x       Cluster Data VLAN ID
#x   -create_full_stack
#x       flag to create full stack. this flag is introduced mainly for Scripgen Issue.
#x   -table_names
#
# Return Values:
#    A list containing the ovsdb controller protocol stack handles that were added by the command (if any).
#x   key:ovsdb_controller_handle  value:A list containing the ovsdb controller protocol stack handles that were added by the command (if any).
#    $::SUCCESS or $::FAILURE
#    key:status                   value:$::SUCCESS or $::FAILURE
#    If failure, will contain more information
#    key:log                      value:If failure, will contain more information
#    Ovsdb Controller Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:handle                   value:Ovsdb Controller Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    Cluster Data Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:clusterdata_handle       value:Cluster Data Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) Coded versus functional specification.
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle, clusterdata_handle
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_ovsdb_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_ovsdb_config', $args);
	# ixiahlt::utrackerLog ('emulation_ovsdb_config', $args);

	return ixiangpf::runExecuteCommand('emulation_ovsdb_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
