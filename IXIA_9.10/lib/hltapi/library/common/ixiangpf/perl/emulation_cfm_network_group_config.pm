##Procedure Header
# Name:
#    ixiangpf::emulation_cfm_network_group_config
#
# Description:
#    This procedure will configure simulated MPs for CFM/Y.1731 protocol.
#
# Synopsis:
#    ixiangpf::emulation_cfm_network_group_config
#        -handle                              ANY
#        -mode                                CHOICES create modify delete
#        [-type                               CHOICES grid
#                                             CHOICES mesh
#                                             CHOICES custom
#                                             CHOICES ring
#                                             CHOICES hub-and-spoke
#                                             CHOICES tree
#                                             CHOICES ipv4-prefix
#                                             CHOICES ipv6-prefix
#                                             CHOICES fat-tree
#                                             CHOICES linear]
#x       [-protocol_name                      ALPHA]
#x       [-connected_to_handle                ANY]
#x       [-return_detailed_handles            CHOICES 0 1
#x                                            DEFAULT 0]
#x       [-enable_device_test                 CHOICES 0 1]
#x       [-hub_spoke_include_emulated_device  CHOICES 0 1]
#x       [-hub_spoke_number_of_first_level    NUMERIC]
#x       [-hub_spoke_number_of_second_level   NUMERIC]
#x       [-hub_spoke_enable_level_2           CHOICES 0 1]
#x       [-hub_spoke_link_multiplier          NUMERIC]
#x       [-tree_number_of_nodes               NUMERIC]
#x       [-tree_include_emulated_device       CHOICES 0 1]
#x       [-tree_use_tree_depth                CHOICES 0 1]
#x       [-tree_depth                         NUMERIC]
#x       [-tree_max_children_per_node         NUMERIC]
#x       [-tree_link_multiplier               NUMERIC]
#x       [-linear_include_emulated_device     CHOICES 0 1]
#x       [-linear_nodes                       NUMERIC]
#x       [-linear_link_multiplier             NUMERIC]
#x       [-sim_topo_active                    CHOICES 0 1]
#x       [-from_Mac                           MAC]
#x       [-to_Mac                             MAC]
#x       [-system_MAC                         MAC]
#x       [-active                             CHOICES 0 1]
#x       [-links_active                       CHOICES 0 1]
#x       [-mp_type                            CHOICES mip mep]
#x       [-mep_id                             NUMERIC]
#x       [-md_mg_level                        NUMERIC]
#x       [-rd_i                               CHOICES rdtypeauto rdtypeon rdtypeoff]
#x       [-md_name_format                     CHOICES mdnameformatnomaintenancedomainname
#x                                            CHOICES mdnameformatdomainnamebasedstr
#x                                            CHOICES mdnameformatmacplustwooctetint
#x                                            CHOICES mdnameformatcharacterstr]
#x       [-md_name                            ALPHA]
#x       [-cci_interval                       CHOICES cciinterval333msec
#x                                            CHOICES cciinterval10msec
#x                                            CHOICES cciinterval100msec
#x                                            CHOICES cciinterval1sec
#x                                            CHOICES cciinterval10sec
#x                                            CHOICES cciinterval1min
#x                                            CHOICES cciinterval10min]
#x       [-short_ma_name_format               CHOICES shortmanameformatprimaryvid
#x                                            CHOICES shortmanameformatcharstr
#x                                            CHOICES shortmanameformattwooctetint
#x                                            CHOICES shortmanameformatrfc2685vpnid]
#x       [-short_ma_name                      ALPHA]
#x       [-meg_id_format                      CHOICES megidformattypeiccbasedformat
#x                                            CHOICES megidformattypeprimaryvid
#x                                            CHOICES megidformattypecharstr
#x                                            CHOICES megidformattypetwooctetint
#x                                            CHOICES megidformattyperfc2685vpnid]
#x       [-meg_id                             ALPHA]
#x       [-dm_method                          CHOICES dmsupporttypetwoway
#x                                            CHOICES dmsupporttypeoneway]
#x       [-ais_mode                           CHOICES aismodeauto
#x                                            CHOICES aismodestart
#x                                            CHOICES aismodestop]
#x       [-ais_interval                       CHOICES aisinterval1sec
#x                                            CHOICES aisinterval1min]
#x       [-ais_enable_unicast_mac             CHOICES 0 1]
#x       [-ais_unicast_mac                    MAC]
#x       [-enable_ais_rx                      CHOICES 0 1]
#x       [-lck_mode                           CHOICES lckmodeauto
#x                                            CHOICES lckmodestart
#x                                            CHOICES lckmodestop]
#x       [-lck_interval                       CHOICES lckinterval1sec
#x                                            CHOICES lckinterval1min]
#x       [-lck_support_ais_generation         CHOICES 0 1]
#x       [-lck_enable_unicast_mac             CHOICES 0 1]
#x       [-lck_unicast_mac                    MAC]
#x       [-enable_lck_rx                      CHOICES 0 1]
#x       [-tst_mode                           CHOICES tstmodeauto
#x                                            CHOICES tstmodestart
#x                                            CHOICES tstmodestop]
#x       [-tst_interval                       NUMERIC]
#x       [-tst_test_type                      CHOICES tsttesttypeinservice
#x                                            CHOICES tsttesttypeoutofservice]
#x       [-tst_enable_unicast_mac             CHOICES 0 1]
#x       [-tst_unicast_mac                    MAC]
#x       [-tst_sequence_number                NUMERIC]
#x       [-tst_overwrite_seq_number           CHOICES 0 1]
#x       [-tst_pattern_type                   CHOICES knullsignalwocrc32
#x                                            CHOICES nullsignalwcrc32
#x                                            CHOICES prbswocrc32
#x                                            CHOICES prbswcrc32]
#x       [-tst_initial_pattern_value          HEX]
#x       [-enable_tst_rx                      CHOICES 0 1]
#x       [-tst_packet_length                  NUMERIC]
#x       [-tst_increment_packet_length        CHOICES 0 1]
#x       [-tst_increment_packet_length_step   NUMERIC]
#x       [-enable_lm_counter_update           CHOICES 0 1]
#x       [-lm_method_type                     CHOICES lmmethodtypedualended
#x                                            CHOICES lmmethodtypesingleended]
#x       [-ccm_lmm_txfcf                      NUMERIC]
#x       [-ccm_lmm_txFcf_step_per100mSec      NUMERIC]
#x       [-ccm_rx_fcb                         NUMERIC]
#x       [-ccm_rx_fcb_step_per100mSec         NUMERIC]
#x       [-lmr_tx_fcb                         NUMERIC]
#x       [-lmr_tx_fcb_step_per100mSec         NUMERIC]
#x       [-lmr_rx_fcf                         NUMERIC]
#x       [-lmr_rx_fcf_step_per100mSec         NUMERIC]
#x       [-inter_remote_mep_tx_increment_step NUMERIC]
#x       [-inter_remote_mep_rx_increment_step NUMERIC]
#x       [-enable_vlan                        CHOICES 0 1]
#x       [-vlan_Stacking                      CHOICES vlanstackingtypesinglevlan
#x                                            CHOICES vlanstackingtypestackedvlan]
#x       [-vlan_id                            NUMERIC]
#x       [-vlan_priority                      NUMERIC]
#x       [-vlan_Tpid                          CHOICES vlantpid8100
#x                                            CHOICES vlantpid9100
#x                                            CHOICES vlantpid9200
#x                                            CHOICES vlantpid88a8]
#x       [-sVlan_id                           NUMERIC]
#x       [-sVlan_priority                     NUMERIC]
#x       [-sVlan_Tpid                         CHOICES vlantpid8100
#x                                            CHOICES vlantpid9100
#x                                            CHOICES vlantpid9200
#x                                            CHOICES vlantpid88a8]
#x       [-cVlan_id                           NUMERIC]
#x       [-cVlan_priority                     NUMERIC]
#x       [-cVlan_Tpid                         CHOICES vlantpid8100
#x                                            CHOICES vlantpid9100
#x                                            CHOICES vlantpid9200
#x                                            CHOICES vlantpid88a8]
#x       [-overrride_vlan_priority            CHOICES 0 1]
#x       [-ccm_priority                       NUMERIC]
#x       [-ltm_priority                       NUMERIC]
#x       [-lbm_priority                       NUMERIC]
#x       [-dm_priority                        NUMERIC]
#x       [-ais_priority                       NUMERIC]
#x       [-lck_priority                       NUMERIC]
#x       [-tst_priority                       NUMERIC]
#x       [-lmm_priority                       NUMERIC]
#x       [-lmr_priority                       NUMERIC]
#x       [-enable_auto_lt                     CHOICES 0 1]
#x       [-auto_lt_timer_in_sec               NUMERIC]
#x       [-auto_lt_iteration                  NUMERIC]
#x       [-auto_lt_timeout_in_sec             NUMERIC]
#x       [-auto_lt_ttl                        NUMERIC]
#x       [-lt_all_remote_meps                 CHOICES 0 1]
#x       [-lt_destination_mac_address         MAC]
#x       [-enable_auto_lb                     CHOICES 0 1]
#x       [-auto_lb_timer_in_sec               NUMERIC]
#x       [-auto_lb_iteration                  NUMERIC]
#x       [-auto_lb_timeout_in_sec             NUMERIC]
#x       [-lb_all_remote_meps                 CHOICES 0 1]
#x       [-lb_destination_mac_address         MAC]
#x       [-enable_auto_dm                     CHOICES 0 1]
#x       [-auto_dm_timer_in_sec               NUMERIC]
#x       [-auto_dm_iteration                  NUMERIC]
#x       [-auto_dm_timeout_in_sec             NUMERIC]
#x       [-dm_all_remote_meps                 CHOICES 0 1]
#x       [-dm_destination_mac_address         MAC]
#x       [-enable_auto_lm                     CHOICES 0 1]
#x       [-auto_lm_timer_in_sec               NUMERIC]
#x       [-auto_lm_iteration                  NUMERIC]
#x       [-auto_lm_timeout_in_sec             NUMERIC]
#x       [-lm_all_remote_meps                 CHOICES 0 1]
#x       [-lm_destination_mac_address         MAC]
#x       [-enable_sender_id_tlv               CHOICES 0 1]
#x       [-chassis_id_sub_type                CHOICES chassisidsubtypechassiscomponent
#x                                            CHOICES chassisidsubtypeinterfacealias
#x                                            CHOICES chassisidsubtypeportcomponent
#x                                            CHOICES chassisidsubtypemacaddress
#x                                            CHOICES chassisidsubtypenetworkaddress
#x                                            CHOICES chassisidsubtypeinterfacename
#x                                            CHOICES chassisidsubtypelocallyassigned]
#x       [-chassis_id_length                  NUMERIC]
#x       [-chassis_id                         HEX]
#x       [-management_address_domain_length   NUMERIC]
#x       [-management_address_domain          HEX]
#x       [-management_address_length          NUMERIC]
#x       [-management_address                 HEX]
#x       [-enable_interface_status_tlv        CHOICES 0 1]
#x       [-enable_port_status_tlv             CHOICES 0 1]
#x       [-enable_data_tlv                    CHOICES 0 1]
#x       [-data_tlv_length                    NUMERIC]
#x       [-data_tlv_value                     HEX]
#x       [-enable_organization_specific_tlv   CHOICES 0 1]
#x       [-organization_specific_tlv_length   NUMERIC]
#x       [-organization_data_tlv_value        HEX]
#x       [-number_of_custom_tlvs              NUMERIC]
#x       [-tlv_type                           ANY]
#x       [-tlv_length                         ANY]
#x       [-value                              ANY]
#x       [-include_tlv_in_ccm                 CHOICES 0 1]
#x       [-include_tlv_in_ltm                 CHOICES 0 1]
#x       [-include_tlv_in_ltr                 CHOICES 0 1]
#x       [-include_tlv_in_lbm                 CHOICES 0 1]
#x       [-include_tlv_in_lbr                 CHOICES 0 1]
#x       [-include_tlv_in_lmm                 CHOICES 0 1]
#x       [-include_tlv_in_lmr                 CHOICES 0 1]
#
# Arguments:
#    -handle
#        For create and modify -mode, handle should be its parent Ethernet node handle.
#        For delete -mode, -handle should be its own handle i.e CFM Bridge node handle.
#        Simulated Router Bridge
#        For create and modifiy -mode, hnadle should be its parent Bridge node handle.
#        For delete -mode, -handle should be its own handle i.e MP node handle.
#    -mode
#        This option defines the action to be taken on the CFM Bridge.
#    -type
#        The type of topology route to create.
#x   -protocol_name
#x   -connected_to_handle
#x       Scenario element this connector is connecting to
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#x   -enable_device_test
#x       enables/disables device.
#x   -hub_spoke_include_emulated_device
#x   -hub_spoke_number_of_first_level
#x   -hub_spoke_number_of_second_level
#x   -hub_spoke_enable_level_2
#x   -hub_spoke_link_multiplier
#x   -tree_number_of_nodes
#x   -tree_include_emulated_device
#x   -tree_use_tree_depth
#x   -tree_depth
#x   -tree_max_children_per_node
#x   -tree_link_multiplier
#x   -linear_include_emulated_device
#x   -linear_nodes
#x       number of nodes
#x   -linear_link_multiplier
#x       number of links between two nodes
#x   -sim_topo_active
#x       Active Simulated Topology Config
#x   -from_Mac
#x   -to_Mac
#x   -system_MAC
#x   -active
#x   -links_active
#x   -mp_type
#x   -mep_id
#x   -md_mg_level
#x   -rd_i
#x   -md_name_format
#x   -md_name
#x   -cci_interval
#x   -short_ma_name_format
#x   -short_ma_name
#x       Short MA Name
#x   -meg_id_format
#x   -meg_id
#x       MEG ID
#x   -dm_method
#x   -ais_mode
#x   -ais_interval
#x   -ais_enable_unicast_mac
#x   -ais_unicast_mac
#x   -enable_ais_rx
#x   -lck_mode
#x   -lck_interval
#x   -lck_support_ais_generation
#x   -lck_enable_unicast_mac
#x   -lck_unicast_mac
#x   -enable_lck_rx
#x   -tst_mode
#x   -tst_interval
#x   -tst_test_type
#x   -tst_enable_unicast_mac
#x   -tst_unicast_mac
#x   -tst_sequence_number
#x   -tst_overwrite_seq_number
#x   -tst_pattern_type
#x   -tst_initial_pattern_value
#x   -enable_tst_rx
#x   -tst_packet_length
#x   -tst_increment_packet_length
#x   -tst_increment_packet_length_step
#x   -enable_lm_counter_update
#x   -lm_method_type
#x   -ccm_lmm_txfcf
#x   -ccm_lmm_txFcf_step_per100mSec
#x   -ccm_rx_fcb
#x   -ccm_rx_fcb_step_per100mSec
#x   -lmr_tx_fcb
#x   -lmr_tx_fcb_step_per100mSec
#x   -lmr_rx_fcf
#x   -lmr_rx_fcf_step_per100mSec
#x   -inter_remote_mep_tx_increment_step
#x   -inter_remote_mep_rx_increment_step
#x   -enable_vlan
#x   -vlan_Stacking
#x   -vlan_id
#x   -vlan_priority
#x   -vlan_Tpid
#x   -sVlan_id
#x   -sVlan_priority
#x   -sVlan_Tpid
#x   -cVlan_id
#x   -cVlan_priority
#x   -cVlan_Tpid
#x   -overrride_vlan_priority
#x   -ccm_priority
#x   -ltm_priority
#x   -lbm_priority
#x   -dm_priority
#x   -ais_priority
#x   -lck_priority
#x   -tst_priority
#x   -lmm_priority
#x   -lmr_priority
#x   -enable_auto_lt
#x   -auto_lt_timer_in_sec
#x   -auto_lt_iteration
#x   -auto_lt_timeout_in_sec
#x   -auto_lt_ttl
#x   -lt_all_remote_meps
#x   -lt_destination_mac_address
#x   -enable_auto_lb
#x   -auto_lb_timer_in_sec
#x   -auto_lb_iteration
#x   -auto_lb_timeout_in_sec
#x   -lb_all_remote_meps
#x   -lb_destination_mac_address
#x   -enable_auto_dm
#x   -auto_dm_timer_in_sec
#x   -auto_dm_iteration
#x   -auto_dm_timeout_in_sec
#x   -dm_all_remote_meps
#x   -dm_destination_mac_address
#x   -enable_auto_lm
#x   -auto_lm_timer_in_sec
#x   -auto_lm_iteration
#x   -auto_lm_timeout_in_sec
#x   -lm_all_remote_meps
#x   -lm_destination_mac_address
#x   -enable_sender_id_tlv
#x   -chassis_id_sub_type
#x   -chassis_id_length
#x   -chassis_id
#x   -management_address_domain_length
#x   -management_address_domain
#x   -management_address_length
#x   -management_address
#x   -enable_interface_status_tlv
#x   -enable_port_status_tlv
#x   -enable_data_tlv
#x   -data_tlv_length
#x   -data_tlv_value
#x   -enable_organization_specific_tlv
#x   -organization_specific_tlv_length
#x   -organization_data_tlv_value
#x   -number_of_custom_tlvs
#x       Number Of TLVs
#x   -tlv_type
#x       Type
#x   -tlv_length
#x       Length
#x   -value
#x       Value
#x   -include_tlv_in_ccm
#x   -include_tlv_in_ltm
#x   -include_tlv_in_ltr
#x   -include_tlv_in_lbm
#x   -include_tlv_in_lbr
#x   -include_tlv_in_lmm
#x   -include_tlv_in_lmr
#
# Return Values:
#    A list containing the network group protocol stack handles that were added by the command (if any).
#x   key:network_group_handle            value:A list containing the network group protocol stack handles that were added by the command (if any).
#    A list containing the simulated topology protocol stack handles that were added by the command (if any).
#x   key:simulated_topology_handle       value:A list containing the simulated topology protocol stack handles that were added by the command (if any).
#    A list containing the simulated interface protocol stack handles that were added by the command (if any).
#x   key:simulated_interface_handle      value:A list containing the simulated interface protocol stack handles that were added by the command (if any).
#    A list containing the simulated rbridge protocol stack handles that were added by the command (if any).
#x   key:simulated_rbridge_handle        value:A list containing the simulated rbridge protocol stack handles that were added by the command (if any).
#    A list containing the cfm simulated mp protocol stack handles that were added by the command (if any).
#x   key:cfm_simulated_mp                value:A list containing the cfm simulated mp protocol stack handles that were added by the command (if any).
#    A list containing the pseudo node custom tlv protocol stack handles that were added by the command (if any).
#x   key:pseudo_node_custom_tlv_handle   value:A list containing the pseudo node custom tlv protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:simulated_topology_handles      value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:simulated_interface_handles     value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:simulated_rbridge_handles       value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:pseudo_node_custom_tlv_handles  value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    Coded versus functional specification.
#    1) You can configure multiple CFM on each Ixia interface.
#    2) You can configure multiple Y1731.
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  simulated_topology_handles, simulated_interface_handles, simulated_rbridge_handles, pseudo_node_custom_tlv_handles
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_cfm_network_group_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_cfm_network_group_config', $args);
	# ixiahlt::utrackerLog ('emulation_cfm_network_group_config', $args);

	return ixiangpf::runExecuteCommand('emulation_cfm_network_group_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
