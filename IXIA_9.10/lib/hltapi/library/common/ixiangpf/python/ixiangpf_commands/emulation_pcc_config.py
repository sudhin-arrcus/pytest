# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_pcc_config(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_pcc_config
		
		 Description:
		    This procedure will add PCC(s) to a particular Ixia Interface.
		    The user can then configure, PCC by using the procedure
		     PCC Requested SR LSPs ,  Pre-Established SR LSPs  and  Expected PCE Initiated SR LSPs for Traffic .
		
		 Synopsis:
		    emulation_pcc_config
		        -mode                                            CHOICES create
		                                                         CHOICES delete
		                                                         CHOICES modify
		                                                         CHOICES enable
		                                                         CHOICES disable
		        [-port_handle                                    REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		        [-handle                                         ANY]
		x       [-lsp_update_capability                          ANY]
		x       [-sr_pce_capability                              ANY]
		x       [-maximum_sid_depth                              ANY]
		x       [-pcc_ppag_t_l_v_type                            ANY]
		x       [-pce_ipv4_address                               ANY]
		x       [-pce_ipv4_address_step                          ANY]
		x       [-max_lsp_per_pc_req                             ANY]
		x       [-max_lsps_per_pc_rpt                            ANY]
		x       [-keepalive_interval                             ANY]
		x       [-dead_interval                                  ANY]
		x       [-state_timeout_interval                         ANY]
		x       [-reconnect_interval                             ANY]
		x       [-max_reconnect_interval                         ANY]
		x       [-return_instantiation_error                     ANY]
		x       [-error_value                                    ANY]
		x       [-authentication                                 CHOICES null md5]
		x       [-m_d5_key                                       ANY]
		x       [-requested_lsps_per_pcc                         NUMERIC]
		x       [-pre_established_sr_lsps_per_pcc                NUMERIC]
		x       [-active_pre_established_lsps                    NUMERIC]
		x       [-expected_initiated_lsps_for_traffic            NUMERIC]
		x       [-number_of_backup_p_c_es                        NUMERIC]
		x       [-rate_control                                   ANY]
		x       [-burst_interval                                 ANY]
		x       [-max_requested_lsp_per_interval                 ANY]
		x       [-max_sync_lsp_per_interval                      ANY]
		x       [-pcc_active                                     ANY]
		x       [-pcc_name                                       ALPHA]
		x       [-expected_symbolic_path_name                    ANY]
		x       [-expected_source_ipv4_address                   ANY]
		x       [-expected_source_ipv4_address_step              ANY]
		x       [-expected_source_ipv6_address                   ANY]
		x       [-expected_source_ipv6_address_step              ANY]
		x       [-expected_max_expected_segment_count            NUMERIC]
		x       [-expected_insert_ipv6_explicit_null             CHOICES 0 1]
		x       [-expected_initiated_lsp_list_active             ANY]
		x       [-include_rp                                     ANY]
		x       [-include_end_points                             ANY]
		x       [-pcc_requested_include_lspa                     ANY]
		x       [-pcc_requested_include_bandwidth                ANY]
		x       [-pcc_requested_include_metric                   ANY]
		x       [-include_iro                                    ANY]
		x       [-include_xro                                    ANY]
		x       [-p_flag_rp                                      ANY]
		x       [-override_request_id                            CHOICES 0 1]
		x       [-request_id                                     ANY]
		x       [-loose                                          ANY]
		x       [-bi_directional                                 ANY]
		x       [-re_optimization                                ANY]
		x       [-priority                                       ANY]
		x       [-pflag_endpoints                                ANY]
		x       [-override_source_address                        ANY]
		x       [-ip_version                                     CHOICES ipv4 ipv6]
		x       [-source_end_point_i_pv4                         ANY]
		x       [-source_end_point_i_pv4_step                    ANY]
		x       [-destination_ipv4_address                       ANY]
		x       [-destination_ipv4_address_step                  ANY]
		x       [-source_end_point_i_pv6                         ANY]
		x       [-source_end_point_i_pv6_step                    ANY]
		x       [-destination_ipv6_address                       ANY]
		x       [-destination_ipv6_address_step                  ANY]
		x       [-pcc_requested_initial_delegation               ANY]
		x       [-p_flag_lsp                                     ANY]
		x       [-pcc_requested_override_plsp_id                 CHOICES 0 1]
		x       [-pcc_requested_plsp_id                          ANY]
		x       [-pcc_requested_include_symbolic_path_name_tlv   ANY]
		x       [-pcc_requested_symbolic_path_name               ANY]
		x       [-pcc_requested_redelegation_timeout_interval    ANY]
		x       [-p_flag_lspa                                    ANY]
		x       [-pcc_requested_setup_priority                   ANY]
		x       [-pcc_requested_holding_priority                 ANY]
		x       [-pcc_requested_local_protection                 ANY]
		x       [-pcc_requested_include_any                      ANY]
		x       [-pcc_requested_include_all                      ANY]
		x       [-pcc_requested_exclude_any                      ANY]
		x       [-p_flag_bandwidth                               ANY]
		x       [-pcc_requested_bandwidth                        ANY]
		x       [-max_number_of_metrics                          NUMERIC]
		x       [-p_flag_iro                                     ANY]
		x       [-max_no_of_iro_sub_objects                      NUMERIC]
		x       [-pcc_requested_p_flag_xro                       ANY]
		x       [-fail_bit                                       ANY]
		x       [-max_no_of_xro_sub_objects                      NUMERIC]
		x       [-active_data_traffic_end_points                 ANY]
		x       [-source_ipv4_address                            ANY]
		x       [-source_ipv4_address_step                       ANY]
		x       [-source_ipv6_address                            ANY]
		x       [-source_ipv6_address_step                       ANY]
		x       [-max_expected_segment_count                     NUMERIC]
		x       [-pcc_requested_insert_ipv6_explicit_null        CHOICES 0 1]
		x       [-pcc_requested_active                           ANY]
		x       [-iro_active                                     ANY]
		x       [-iro_sub_object_type                            CHOICES ipv4prefix
		x                                                        CHOICES ipv6prefix
		x                                                        CHOICES unnumberedinterfaceid
		x                                                        CHOICES asnumber]
		x       [-iro_prefix_length                              ANY]
		x       [-ipv4_address                                   ANY]
		x       [-ipv4_address_step                              ANY]
		x       [-ipv6_address                                   ANY]
		x       [-ipv6_address_step                              ANY]
		x       [-router_id                                      ANY]
		x       [-router_id_step                                 ANY]
		x       [-interface_id                                   ANY]
		x       [-iro_as_number                                  ANY]
		x       [-xro_active                                     ANY]
		x       [-p_flag_xro                                     ANY]
		x       [-exclude_bit                                    ANY]
		x       [-xro_attribute                                  CHOICES interface node srlg]
		x       [-xro_sub_object_type                            CHOICES ipv4prefix
		x                                                        CHOICES ipv6prefix
		x                                                        CHOICES unnumberedinterfaceid
		x                                                        CHOICES asnumber
		x                                                        CHOICES srlg]
		x       [-xro_prefix_length                              ANY]
		x       [-xro_ipv4_address                               ANY]
		x       [-xro_ipv4_address_step                          ANY]
		x       [-xro_ipv6_address                               ANY]
		x       [-xro_ipv6_address_step                          ANY]
		x       [-xro_router_id                                  ANY]
		x       [-xro_router_id_step                             ANY]
		x       [-xro_interface_id                               ANY]
		x       [-xro_as_number                                  ANY]
		x       [-srlg_id                                        ANY]
		x       [-pce_id32                                       ANY]
		x       [-pce_id128                                      ANY]
		x       [-pcc_requested_metric_active                    ANY]
		x       [-p_flag_metric                                  ANY]
		x       [-metric_type                                    CHOICES igp tg hopcount msd]
		x       [-metric_value                                   ANY]
		x       [-enable_cflag                                   ANY]
		x       [-enable_bflag                                   ANY]
		x       [-include_srp                                    ANY]
		x       [-include_lsp                                    ANY]
		x       [-include_ero                                    ANY]
		x       [-include_metric                                 ANY]
		x       [-include_bandwidth                              ANY]
		x       [-include_lspa                                   ANY]
		x       [-initial_delegation                             ANY]
		x       [-override_plsp_id                               CHOICES 0 1]
		x       [-plsp_id                                        ANY]
		x       [-include_symbolic_path_name_tlv                 ANY]
		x       [-symbolic_path_name                             ANY]
		x       [-pre_established_destination_ipv4_address       ANY]
		x       [-pre_established_destination_ipv4_address_step  ANY]
		x       [-redelegation_timeout_interval                  ANY]
		x       [-pre_established_include_t_e_path_binding_t_l_v ANY]
		x       [-pre_established_binding_type                   CHOICES mplslabel20bit mplslabel32bit]
		x       [-pre_established_mpls_label                     ANY]
		x       [-pre_established_tc                             ANY]
		x       [-pre_established_bos                            ANY]
		x       [-pre_established_ttl                            ANY]
		x       [-number_of_ero_sub_objects                      NUMERIC]
		x       [-number_of_metric_sub_object                    NUMERIC]
		x       [-bandwidth                                      ANY]
		x       [-setup_priority                                 ANY]
		x       [-holding_priority                               ANY]
		x       [-local_protection                               ANY]
		x       [-include_any                                    ANY]
		x       [-include_all                                    ANY]
		x       [-exclude_any                                    ANY]
		x       [-include_ppag                                   ANY]
		x       [-association_id                                 ANY]
		x       [-protection_lsp_bit                             ANY]
		x       [-standby_lsp_bit                                ANY]
		x       [-pre_established_active_data_traffic_endpoint   ANY]
		x       [-src_end_point_ipv4                             ANY]
		x       [-src_end_point_ipv4_step                        ANY]
		x       [-src_end_point_ipv6                             ANY]
		x       [-src_end_point_ipv6_step                        ANY]
		x       [-insert_ipv6_explicit_null                      CHOICES 0 1]
		x       [-pre_established_active                         ANY]
		x       [-ero_active                                     ANY]
		x       [-loose_hop                                      ANY]
		x       [-sub_object_type                                CHOICES null
		x                                                        CHOICES ipv4prefix
		x                                                        CHOICES ipv6prefix
		x                                                        CHOICES asnumber]
		x       [-prefix_length                                  ANY]
		x       [-ipv4_prefix                                    ANY]
		x       [-ipv4_prefix_step                               ANY]
		x       [-ipv6_prefix                                    ANY]
		x       [-ipv6_prefix_step                               ANY]
		x       [-as_number                                      ANY]
		x       [-sid_type                                       CHOICES null
		x                                                        CHOICES sid
		x                                                        CHOICES mplslabel20bit
		x                                                        CHOICES mplslabel32bit]
		x       [-sid                                            ANY]
		x       [-mpls_label                                     ANY]
		x       [-tc                                             ANY]
		x       [-bos                                            ANY]
		x       [-ttl                                            ANY]
		x       [-nai_type                                       CHOICES notapplicable
		x                                                        CHOICES ipv4nodeid
		x                                                        CHOICES ipv6nodeid
		x                                                        CHOICES ipv4adjacency
		x                                                        CHOICES ipv6adjacency
		x                                                        CHOICES unnumberedadjacencywithipv4nodeids]
		x       [-f_bit                                          ANY]
		x       [-ipv4_node_id                                   ANY]
		x       [-ipv4_node_id_step                              ANY]
		x       [-ipv6_node_id                                   ANY]
		x       [-ipv6_node_id_step                              ANY]
		x       [-local_ipv4_address                             ANY]
		x       [-local_ipv4_address_step                        ANY]
		x       [-remote_ipv4_address                            ANY]
		x       [-remote_ipv4_address_step                       ANY]
		x       [-local_ipv6_address                             ANY]
		x       [-local_ipv6_address_step                        ANY]
		x       [-remote_ipv6_address                            ANY]
		x       [-remote_ipv6_address_step                       ANY]
		x       [-local_node_id                                  ANY]
		x       [-local_node_id_step                             ANY]
		x       [-local_interface_id                             ANY]
		x       [-remote_node_id                                 ANY]
		x       [-remote_node_id_step                            ANY]
		x       [-remote_interface_id                            ANY]
		x       [-metric_active                                  ANY]
		x       [-pre_established_metric_type                    CHOICES igp tg hopcount msd]
		x       [-pre_established_metric_value                   ANY]
		x       [-b_flag                                         ANY]
		x       [-backup_pce_ipv4_address                        ANY]
		x       [-backup_pce_active                              ANY]
		
		 Arguments:
		    -mode
		        This option defines whether to Create/Modify/Delete/Enable/Disable PCC and different types of LSPs under PCC.
		    -port_handle
		        Port handle.
		    -handle
		        Specifies the parent node/object handle on which the pcep configuration should be configured.
		        In case of create/modify -mode, -handle generally denotes the parent node/object handle .
		        In case of modes   modify/delete/disable/enable -handle denotes the object node handle on which the action needs to be performed.
		x   -lsp_update_capability
		x       If Stateful PCE Capability is enabled then this control should be activated to set the update capability in the Stateful PCE Capability TLV.
		x   -sr_pce_capability
		x       The SR PCE Capability TLV is an optional TLV associated with the OPEN Object to exchange SR capability of PCEP speakers.
		x   -maximum_sid_depth
		x       Maximum SID Depth field (MSD) specifies the maximum number of SIDs that a PCC is capable of imposing on a packet. Editable only if SR PCE Capability is enabled.
		x   -pcc_ppag_t_l_v_type
		x       PPAG TLV Type specifies PCC's capability of interpreting this type of PPAG TLV
		x   -pce_ipv4_address
		x       IPv4 address of the PCE. This column is greyed out in case of PCCv6.
		x   -pce_ipv4_address_step
		x       Step argument for IPv4 address of the PCE.
		x   -max_lsp_per_pc_req
		x       Max LSPs Per PCReq
		x   -max_lsps_per_pc_rpt
		x       Controls the maximum LSP information that can be present in a Path report message when the session is stateful session.
		x   -keepalive_interval
		x       Frequency/Time Interval of sending PCEP messages to keep the session active.
		x   -dead_interval
		x       This is the time interval, after the expiration of which, a PCEP peer declares the session down if no PCEP message has been received.
		x   -state_timeout_interval
		x       This is the time interval, after the expiration of which, LSP is cleaned up by PCC.
		x   -reconnect_interval
		x       This is the time interval, after the expiration of which, retry to establish the broken session by PCC happen.
		x   -max_reconnect_interval
		x       This is the maximum time interval, by which recoonect timer will be increased upto.
		x   -return_instantiation_error
		x       If enabled, then PCC will reply PCErr upon receiving PCInitiate message.
		x   -error_value
		x       To configure the type of error. Editable only if Return Instantiation Error is enabled.
		x   -authentication
		x       The type of cryptographic authentication to be used on this link interface
		x   -m_d5_key
		x       A value to be used as the "secret" MD5 Key.
		x   -requested_lsps_per_pcc
		x       Requested LSPs per PCC
		x   -pre_established_sr_lsps_per_pcc
		x       Pre-Established SR LSPs per PCC
		x   -active_pre_established_lsps
		x       Active Pre Established LSps
		x   -expected_initiated_lsps_for_traffic
		x       Based on the value in this control the number of Expected Initiated LSPs for Traffic can be configured. This is used for traffic only.
		x   -number_of_backup_p_c_es
		x       Number of Backup PCEs
		x   -rate_control
		x       The rate control is an optional feature associated with PCE initiated LSP.
		x   -burst_interval
		x       Interval in milisecond in which desired rate of messages needs to be maintained.
		x   -max_requested_lsp_per_interval
		x       Maximum number of LSP computation request messages can be sent per interval.
		x   -max_sync_lsp_per_interval
		x       Maximum number of LSP sync can be sent per interval.
		x   -pcc_active
		x       Activate/Deactivate Configuration
		x   -pcc_name
		x       Name of NGPF element, guaranteed to be unique in Scenario
		x   -expected_symbolic_path_name
		x       This is used for generating the traffic for those LSPs from PCE for which the Symbolic Path Name is configured and matches the value.
		x   -expected_source_ipv4_address
		x       This is used to set the Source IPv4 address in the IP header of the generated traffic.
		x   -expected_source_ipv4_address_step
		x       Step argument for Source IPv4 address in the IP header of the generated traffic.
		x   -expected_source_ipv6_address
		x       This is used to set the Source IPv6 address in the IP header of the generated traffic.
		x   -expected_source_ipv6_address_step
		x       Step argument for Source IPv6 address in the IP header of the generated traffic.
		x   -expected_max_expected_segment_count
		x       This control is used to set the maximum Segment count/ MPLS labels that would be present in the generted traffic.
		x   -expected_insert_ipv6_explicit_null
		x       Insert IPv6 Explicit Null MPLS header if the traffic type is of type IPv6
		x   -expected_initiated_lsp_list_active
		x       Activate/Deactivate configuration for Expected PCE Initiated SR LSPs for Traffic
		x   -include_rp
		x       Include RP
		x   -include_end_points
		x       Include End Points
		x   -pcc_requested_include_lspa
		x       Include LSPA
		x   -pcc_requested_include_bandwidth
		x       Include Bandwidth
		x   -pcc_requested_include_metric
		x       Include Metric
		x   -include_iro
		x       Include IRO
		x   -include_xro
		x       Include XRO
		x   -p_flag_rp
		x       RP "P" Flag
		x   -override_request_id
		x       Override Request ID
		x   -request_id
		x       Request ID
		x   -loose
		x       Loose
		x   -bi_directional
		x       Bi-directional
		x   -re_optimization
		x       Re-optimization
		x   -priority
		x       Priority
		x   -pflag_endpoints
		x       End Points "P" Flag
		x   -override_source_address
		x       Override Source Address
		x   -ip_version
		x       IP Version
		x   -source_end_point_i_pv4
		x       Source IPv4 Address
		x   -source_end_point_i_pv4_step
		x       Step argument for Source IPv4 Address
		x   -destination_ipv4_address
		x       Destination IPv4 Address
		x   -destination_ipv4_address_step
		x       Step argument for Destination IPv4 Address
		x   -source_end_point_i_pv6
		x       Source IPv6 Address
		x   -source_end_point_i_pv6_step
		x       Step argument for Source IPv6 Address
		x   -destination_ipv6_address
		x       Destination IPv6 Address
		x   -destination_ipv6_address_step
		x       Step argument for Destination IPv6 Address
		x   -pcc_requested_initial_delegation
		x       Initial Delegation
		x   -p_flag_lsp
		x       LSP "P" Flag
		x   -pcc_requested_override_plsp_id
		x       Override PLSP-ID
		x   -pcc_requested_plsp_id
		x       An identifier for the LSP. A PCC creates a unique PLSP-ID for each LSP that is constant for the lifetime of a PCEP session. The PCC will advertise the same PLSP-ID on all PCEP sessions it maintains at a given time.
		x   -pcc_requested_include_symbolic_path_name_tlv
		x       Include Symbolic Path Name TLV
		x   -pcc_requested_symbolic_path_name
		x       Symbolic Path Name
		x   -pcc_requested_redelegation_timeout_interval
		x       The period of time a PCC waits for, when a PCEP session is terminated, before revoking LSP delegation
		x       to a PCE and attempting to redelegate LSPs associated with the terminated PCEP session to PCE.
		x   -p_flag_lspa
		x       LSPA "P" Flag
		x   -pcc_requested_setup_priority
		x       Setup Priority
		x   -pcc_requested_holding_priority
		x       Holding Priority
		x   -pcc_requested_local_protection
		x       Local Protection
		x   -pcc_requested_include_any
		x       Include Any
		x   -pcc_requested_include_all
		x       Include All
		x   -pcc_requested_exclude_any
		x       Exclude Any
		x   -p_flag_bandwidth
		x       Bandwidth "P" Flag
		x   -pcc_requested_bandwidth
		x       Bandwidth (bits/sec)
		x   -max_number_of_metrics
		x       Max Number of Metrics
		x   -p_flag_iro
		x       IRO "P" Flag
		x   -max_no_of_iro_sub_objects
		x       Max Number of IRO Sub Objects
		x   -pcc_requested_p_flag_xro
		x       XRO "P" Flag
		x   -fail_bit
		x       Fail Bit
		x   -max_no_of_xro_sub_objects
		x       Max Number of IRO Sub Objects
		x   -active_data_traffic_end_points
		x       Specifies whether that specific Data Traffic Endpoint will generate data traffic
		x   -source_ipv4_address
		x       Source IPv4 Address
		x   -source_ipv4_address_step
		x       Step argument of Source IPv4 Address
		x   -source_ipv6_address
		x       Source IPv6 Address
		x   -source_ipv6_address_step
		x       Step argument of Source IPv6 Address
		x   -max_expected_segment_count
		x       This control is used to set the maximum Segment count/ MPLS labels that would be present in the generted traffic.
		x   -pcc_requested_insert_ipv6_explicit_null
		x       Insert IPv6 Explicit Null MPLS header if the traffic type is of type IPv6
		x   -pcc_requested_active
		x       Activate/Deactivate PCC Requested SR LSPs
		x   -iro_active
		x       Activate/Deactivate IRO
		x   -iro_sub_object_type
		x       Sub Object Type
		x   -iro_prefix_length
		x       Prefix Length
		x   -ipv4_address
		x       IPv4 Address
		x   -ipv4_address_step
		x       Step argument of IPv4 Address
		x   -ipv6_address
		x       IPv6 Address
		x   -ipv6_address_step
		x       Step argument of IPv6 Address
		x   -router_id
		x       Router ID
		x   -router_id_step
		x       Step argument of Router ID
		x   -interface_id
		x       Interface ID
		x   -iro_as_number
		x       AS Number
		x   -xro_active
		x       Controls whether the XRO sub-object will be sent in the PCRequest message.
		x   -p_flag_xro
		x       XRO "P" Flag
		x   -exclude_bit
		x       Indicates whether the exclusion is mandatory or desired.
		x   -xro_attribute
		x       Indicates how the exclusion subobject is to be indicated.
		x   -xro_sub_object_type
		x       Using the Sub Object Type control user can configure which sub object needs to be included from the following options: IPv4 Prefix, IPv6 Prefix, Unnumbered Interface ID, AS Number and SRLG.
		x   -xro_prefix_length
		x       Prefix Length
		x   -xro_ipv4_address
		x       IPv4 Address
		x   -xro_ipv4_address_step
		x       Step argument of IPv4 Address
		x   -xro_ipv6_address
		x       IPv6 Address
		x   -xro_ipv6_address_step
		x       Step argument of IPv6 Address
		x   -xro_router_id
		x       Router ID
		x   -xro_router_id_step
		x       Step argument of Router ID
		x   -xro_interface_id
		x       Interface ID
		x   -xro_as_number
		x       AS Number
		x   -srlg_id
		x       SRLG ID
		x   -pce_id32
		x       32 bit PKS ID
		x   -pce_id128
		x       128 bit PKS ID
		x   -pcc_requested_metric_active
		x       Activate/Deactivate Metric
		x   -p_flag_metric
		x       Metric "P" Flag
		x   -metric_type
		x       Metric Type
		x   -metric_value
		x       Metric Value
		x   -enable_cflag
		x       C Flag
		x   -enable_bflag
		x       B Flag
		x   -include_srp
		x       Indicates whether SRP object will be included in a PCInitiate message. All other attributes in sub-tab-SRP would be editable only if this checkbox is enabled.
		x   -include_lsp
		x       Indicates whether LSP will be included in a PCInitiate message. All other attributes in sub-tab-LSP would be editable only if this checkbox is enabled.
		x   -include_ero
		x       Specifies whether ERO is active or inactive. All subsequent attributes of the sub-tab-ERO would be editable only if this is enabled.
		x   -include_metric
		x       Indicates whether the PCInitiate message will have the metric list that is configured. All subsequent attributes of the sub-tab-Metric would be editable only if this is enabled.
		x   -include_bandwidth
		x       Indicates whether Bandwidth will be included in a PCInitiate message. All other attributes in sub-tab-Bandwidth would be editable only if this checkbox is enabled.
		x   -include_lspa
		x       Indicates whether LSPA will be included in a PCInitiate message. All other attributes in sub-tab-LSPA would be editable only if this checkbox is enabled.
		x   -initial_delegation
		x       Initial Delegation
		x   -override_plsp_id
		x       Indicates if PLSP-ID will be set by the state machine or user. If disabled user wont have the control and state machine will set it.
		x   -plsp_id
		x       An identifier for the LSP. A PCC creates a unique PLSP-ID for each LSP that is constant for the lifetime of a PCEP session. The PCC will advertise the same PLSP-ID on all PCEP sessions it maintains at a given time.
		x   -include_symbolic_path_name_tlv
		x       Indicates if Symbolic-Path-Name TLV is to be included in PCInitiate message.
		x   -symbolic_path_name
		x       Each LSP (path) must have a symbolic name that is unique in the PCC. It must remain constant throughout a path's lifetime, which may span across multiple consecutive PCEP sessions and/or PCC restarts.
		x   -pre_established_destination_ipv4_address
		x       Destination IPv4 Address
		x   -pre_established_destination_ipv4_address_step
		x   -redelegation_timeout_interval
		x       The period of time a PCC waits for, when a PCEP session is terminated, before revoking LSP delegation
		x       to a PCE and attempting to redelegate LSPs associated with the terminated PCEP session to PCE.
		x   -pre_established_include_t_e_path_binding_t_l_v
		x       Indicates if TE-PATH-BINDING TLV is to be included in PCInitiate message.
		x   -pre_established_binding_type
		x       Indicates the type of binding included in the TLV. Types are as follows:
		x       20bit MPLS Label
		x       32bit MPLS Label.
		x       Default value is 20bit MPLS Label.
		x   -pre_established_mpls_label
		x       This control will be editable if the Binding Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
		x   -pre_established_tc
		x       This field is used to carry traffic class information. This control will be editable only if Binding Type is MPLS Label 32bit.
		x   -pre_established_bos
		x       This bit is set to True for the last entry in the label stack i.e., for the bottom of the stack, and False for all other label stack entries.
		x       This control will be editable only if Binding Type is MPLS Label 32bit.
		x   -pre_established_ttl
		x       This field is used to encode a time-to-live value. This control will be editable only if Binding Type is MPLS Label 32bit.
		x   -number_of_ero_sub_objects
		x       Value that indicates the number of ERO Sub Objects to be configured.
		x   -number_of_metric_sub_object
		x       Value that indicates the number of Metric Objects to be configured.
		x   -bandwidth
		x       Bandwidth (bits/sec)
		x   -setup_priority
		x       The priority of the LSP with respect to taking resources.The value 0 is the highest priority.The Setup Priority is used in deciding whether this session can preempt another session.
		x   -holding_priority
		x       The priority of the LSP with respect to holding resources. The value 0 is the highest priority.Holding Priority is used in deciding whether this session can be preempted by another session.
		x   -local_protection
		x       When set, this means that the path must include links protected with Fast Reroute
		x   -include_any
		x       This is a type of Resource Affinity Procedure that is used to validate a link. This control accepts a link if the link carries any of the attributes in the set.
		x   -include_all
		x       This is a type of Resource Affinity Procedure that is used to validate a link. This control excludes a link from consideration if the link carries any of the attributes in the set.
		x   -exclude_any
		x       This is a type of Resource Affinity Procedure that is used to validate a link. This control accepts a link only if the link carries all of the attributes in the set.
		x   -include_ppag
		x       Indicates whether Association will be included in a Sync PCReport message. All other attributes in sub-tab-PPAG would be editable only if this checkbox is enabled.
		x   -association_id
		x       The Association ID of this LSP.
		x   -protection_lsp_bit
		x       Indicates whether Protection LSP Bit is On.
		x   -standby_lsp_bit
		x       Indicates whether Standby LSP Bit is On.
		x   -pre_established_active_data_traffic_endpoint
		x       Specifies whether that specific Data Traffic Endpoint will generate data traffic
		x   -src_end_point_ipv4
		x       Source IPv4 address
		x   -src_end_point_ipv4_step
		x       Step argument of Source IPv4 address
		x   -src_end_point_ipv6
		x       Source IPv6 address
		x   -src_end_point_ipv6_step
		x       Step argument of Source IPv4 address
		x   -insert_ipv6_explicit_null
		x       Insert IPv6 Explicit Null MPLS header if the traffic type is of type IPv6
		x   -pre_established_active
		x       Activate/Deactivate Pre-Established SR LSPs
		x   -ero_active
		x       Controls whether the ERO sub-object will be sent in the PCInitiate message.
		x   -loose_hop
		x       Indicates if user wants to represent a loose-hop sub object in the LSP
		x   -sub_object_type
		x       Using the Sub Object Type control user can configure which sub object needs to be included from the following options: Not Applicable, IPv4 Prefix, IPv6 Prefix, AS Number.
		x   -prefix_length
		x       Prefix Length
		x   -ipv4_prefix
		x       IPv4 Prefix is specified as an IPv4 address.
		x   -ipv4_prefix_step
		x       Step Argument of IPv4 Prefix.
		x   -ipv6_prefix
		x       IPv6 Prefix is specified as an IPv6 address.
		x   -ipv6_prefix_step
		x       Step Argument of IPv6 Prefix.
		x   -as_number
		x       AS Number
		x   -sid_type
		x       Using the Segment Identifier Type control user can configure whether to include SID or not and if included what is its type. Types are as follows: Null, SID, 20bit MPLS Label, 32bit MPLS Label.
		x       If it is Null then S bit is set in the packet. Default value is 20bit MPLS Label.
		x   -sid
		x       SIDis the Segment Identifier
		x   -mpls_label
		x       This control will be editable if the SID Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
		x   -tc
		x       This field is used to carry traffic class information. This control will be editable only if SID Type is MPLS Label 32bit.
		x   -bos
		x       This bit is set to true for the last entry in the label stack i.e., for the bottom of the stack, and false for all other label stack entries.
		x       This control will be editable only if SID Type is MPLS Label 32bit.
		x   -ttl
		x       This field is used to encode a time-to-live value. This control will be editable only if SID Type is MPLS Label 32bit.
		x   -nai_type
		x       NAI (Node or Adjacency Identifier) contains the NAI associated with the SID. Depending on the value of SID Type, the NAI can have different formats such as:
		x       Not Applicable, IPv4 Node ID, IPv6 Node ID, IPv4 Adjacency, IPv6 Adjacency, Unnumbered Adjacency with IPv4 NodeIDs
		x   -f_bit
		x       A Flag which is used to carry additional information pertaining to SID. When this bit is set, the NAI value in the subobject body is null.
		x   -ipv4_node_id
		x       IPv4 Node ID is specified as an IPv4 address. This control can be configured if NAI Type is set to IPv4 Node ID and F bit is disabled.
		x   -ipv4_node_id_step
		x       Step argument of IPv4 Node ID
		x   -ipv6_node_id
		x       IPv6 Node ID is specified as an IPv6 address. This control can be configured if NAI Type is set to IPv6 Node ID and F bit is disabled.
		x   -ipv6_node_id_step
		x       Step argument of IPv6 Node ID
		x   -local_ipv4_address
		x       This Control can be configured if NAI Type is set to IPv4 Adjacency and F bit is disabled.
		x   -local_ipv4_address_step
		x       Step argument of Local IPv4 Address
		x   -remote_ipv4_address
		x       This Control can be configured if NAI Type is set to IPv4 Adjacency and F bit is disabled.
		x   -remote_ipv4_address_step
		x       Step argument of Remote IPv4 Address
		x   -local_ipv6_address
		x       This Control can be configured if NAI Type is set to IPv6 Adjacency and F bit is disabled.
		x   -local_ipv6_address_step
		x       Step argument of Local IPv6 Address
		x   -remote_ipv6_address
		x       This Control can be configured if NAI Type is set to IPv6 Adjacency and F bit is disabled.
		x   -remote_ipv6_address_step
		x       Step argument of Remote IPv6 Address
		x   -local_node_id
		x       This is the Local Node ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
		x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
		x   -local_node_id_step
		x       Step argument of Local Node ID
		x   -local_interface_id
		x       This is the Local Interface ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
		x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
		x   -remote_node_id
		x       This is the Remote Node ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
		x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
		x   -remote_node_id_step
		x       Step argument of Remote Node ID
		x   -remote_interface_id
		x       This is the Remote Interface ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
		x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
		x   -metric_active
		x       Specifies whether the corresponding metric object is active or not.
		x   -pre_established_metric_type
		x       This is a drop down which has 4 choices:IGP/ TE/ Hop count/ MSD.
		x   -pre_established_metric_value
		x       User can specify the metric value corresponding to the metric type selected.
		x   -b_flag
		x       B (bound) flag MUST be set in the METRIC object, which specifies that the SID depth for the computed path MUST NOT exceed the metric-value.
		x   -backup_pce_ipv4_address
		x       IPv4 address of the backup PCE. This column is greyed out in case of PCCv6.
		x   -backup_pce_active
		x       Activate/Deactivate Configuration
		
		 Return Values:
		    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
		x   key:ipv4_loopback_handle                value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
		    A list containing the ipv4 protocol stack handles that were added by the command (if any).
		x   key:ipv4_handle                         value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
		    $::SUCCESS | $::FAILURE
		    key:status                              value:$::SUCCESS | $::FAILURE
		    When status is $::FAILURE, log shows the detailed information of failure.
		    key:log                                 value:When status is $::FAILURE, log shows the detailed information of failure.
		    Handle of PCC configured
		    key:pcc_handle                          value:Handle of PCC configured
		    Handle of Expected PCE Initiated SR LSPs configured
		    key:expected_initiated_lsp_list_handle  value:Handle of Expected PCE Initiated SR LSPs configured
		    Handle of PCC Requested SR LSPs configured
		    key:requested_lsps_handle               value:Handle of PCC Requested SR LSPs configured
		    Handle of Pre-Established SR LSPs configured
		    key:pre_established_sr_lsps_handle      value:Handle of Pre-Established SR LSPs configured
		    Handle of Backup PCEs configured
		    key:pcep_backup_pces_handle             value:Handle of Backup PCEs configured
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		
		 See Also:
		
		'''
		hlpy_args = locals().copy()
		hlpy_args.update(kwargs)
		del hlpy_args['self']
		del hlpy_args['kwargs']

		not_implemented_params = []
		mandatory_params = []
		file_params = []

		try:
			return self.__execute_command(
				'emulation_pcc_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
