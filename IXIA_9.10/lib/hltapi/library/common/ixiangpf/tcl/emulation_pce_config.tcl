##Procedure Header
# Name:
#    ::ixiangpf::emulation_pce_config
#
# Description:
#    This procedure will add PCE and PCC Groups to a particular Ixia Interface.
#    The user can then configure, PCC Groups by using the procedure
#    “PCRequest Match Criteria”, “PCReply LSP Parameters” and “PCE Initiated LSP Parameters”.
#
# Synopsis:
#    ::ixiangpf::emulation_pce_config
#        -mode                                         CHOICES create
#                                                      CHOICES delete
#                                                      CHOICES modify
#                                                      CHOICES enable
#                                                      CHOICES disable
#        [-port_handle                                 REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                                      ANY]
#x       [-pce_active                                  ANY]
#x       [-pce_name                                    ALPHA]
#x       [-pce_action_mode                             CHOICES none
#x                                                     CHOICES reset
#x                                                     CHOICES rsvpPcInitiate
#x                                                     CHOICES rsvpPcrep
#x                                                     CHOICES rsvpPcupd
#x                                                     CHOICES srPcrep]
#x       [-pc_reply_lsps_per_pcc                       NUMERIC]
#x       [-pcc_ipv4_address                            ANY]
#x       [-pcc_ipv4_address_step                       ANY]
#x       [-max_lsps_per_pc_initiate                    ANY]
#x       [-keepalive_interval                          ANY]
#x       [-dead_interval                               ANY]
#x       [-pce_initiated_lsps_per_pcc                  NUMERIC]
#x       [-stateful_pce_capability                     ANY]
#x       [-lsp_update_capability                       ANY]
#x       [-sr_pce_capability                           ANY]
#x       [-pce_ppag_t_l_v_type                         ANY]
#x       [-authentication                              CHOICES null md5]
#x       [-m_d5_key                                    ANY]
#x       [-rate_control                                ANY]
#x       [-burst_interval                              ANY]
#x       [-max_initiated_lsp_per_interval              ANY]
#x       [-pcc_group_active                            ANY]
#x       [-pcc_group_name                              ALPHA]
#x       [-multiplier                                  NUMERIC]
#x       [-path_setup_type                             CHOICES sr rsvpte]
#x       [-include_end_points                          ANY]
#x       [-include_srp                                 ANY]
#x       [-pce_initiate_include_lsp                    ANY]
#x       [-include_ero                                 ANY]
#x       [-pce_initiate_include_metric                 ANY]
#x       [-pce_initiate_include_bandwidth              ANY]
#x       [-pce_initiate_include_lspa                   ANY]
#x       [-pce_initiate_ip_version                     CHOICES ipv4 ipv6]
#x       [-src_end_point_ipv4                          ANY]
#x       [-src_end_point_ipv4_step                     ANY]
#x       [-dest_end_point_ipv4                         ANY]
#x       [-dest_end_point_ipv4_step                    ANY]
#x       [-src_end_point_ipv6                          ANY]
#x       [-src_end_point_ipv6_step                     ANY]
#x       [-dest_end_point_ipv6                         ANY]
#x       [-dest_end_point_ipv6_step                    ANY]
#x       [-override_srp_id_number                      CHOICES 0 1]
#x       [-srp_id_number                               ANY]
#x       [-override_plsp_id                            CHOICES 0 1]
#x       [-pce_initiate_plsp_id                        ANY]
#x       [-pce_initiate_include_symbolic_path_name_tlv ANY]
#x       [-pce_initiate_symbolic_path_name             ANY]
#x       [-pce_initiate_include_t_e_path_binding_t_l_v ANY]
#x       [-pce_initiate_send_empty_t_l_v               ANY]
#x       [-pce_initiate_binding_type                   CHOICES mplslabel20bit mplslabel32bit]
#x       [-pce_initiate_mpls_label                     ANY]
#x       [-pce_initiate_tc                             ANY]
#x       [-pce_initiate_bos                            ANY]
#x       [-pce_initiate_ttl                            ANY]
#x       [-pce_initiate_number_of_ero_sub_objects      NUMERIC]
#x       [-pce_initiate_number_of_metric_sub_object    NUMERIC]
#x       [-pce_initiate_bandwidth                      ANY]
#x       [-pce_initiate_setup_priority                 ANY]
#x       [-pce_initiate_holding_priority               ANY]
#x       [-pce_initiate_local_protection               ANY]
#x       [-pce_initiate_include_any                    ANY]
#x       [-pce_initiate_include_all                    ANY]
#x       [-pce_initiate_exclude_any                    ANY]
#x       [-include_association                         ANY]
#x       [-association_id                              ANY]
#x       [-protection_lsp                              ANY]
#x       [-standby_mode                                ANY]
#x       [-pce_initiate_enable_xro                     ANY]
#x       [-pce_initiate_fail_bit                       ANY]
#x       [-pce_initiate_number_of_Xro_sub_objects      NUMERIC]
#x       [-pce_initiate_lsp_parameters_active          ANY]
#x       [-pce_initiate_xro_active                     ANY]
#x       [-pce_initiate_exclude_bit                    ANY]
#x       [-pce_initiate_xro_attribute                  CHOICES interface node srlg]
#x       [-pce_initiate_xro_sub_object_type            CHOICES ipv4prefix
#x                                                     CHOICES ipv6prefix
#x                                                     CHOICES unnumberedinterfaceid
#x                                                     CHOICES asnumber
#x                                                     CHOICES srlg]
#x       [-pce_initiate_xro_prefix_length              ANY]
#x       [-pce_initiate_xro_ipv4_address               ANY]
#x       [-pce_initiate_xro_ipv4_address_step          ANY]
#x       [-pce_initiate_xro_ipv6_address               ANY]
#x       [-pce_initiate_xro_ipv6_address_step          ANY]
#x       [-pce_initiate_xro_router_id                  ANY]
#x       [-pce_initiate_xro_router_id_step             ANY]
#x       [-pce_initiate_xro_interface_id               ANY]
#x       [-pce_initiate_xro_as_number                  ANY]
#x       [-pce_initiate_srlg_id                        ANY]
#x       [-pce_initiate_pce_id32                       ANY]
#x       [-pce_initiate_pce_id128                      ANY]
#x       [-pcep_ero_sub_objects_list_active            ANY]
#x       [-loose_hop                                   ANY]
#x       [-sub_object_type                             CHOICES null
#x                                                     CHOICES ipv4prefix
#x                                                     CHOICES ipv6prefix
#x                                                     CHOICES asnumber]
#x       [-prefix_length                               ANY]
#x       [-ipv4_prefix                                 ANY]
#x       [-ipv4_prefix_step                            ANY]
#x       [-ipv6_prefix                                 ANY]
#x       [-ipv6_prefix_step                            ANY]
#x       [-as_number                                   ANY]
#x       [-sid_type                                    CHOICES null
#x                                                     CHOICES sid
#x                                                     CHOICES mplslabel20bit
#x                                                     CHOICES mplslabel32bit]
#x       [-sid                                         ANY]
#x       [-mpls_label                                  ANY]
#x       [-tc                                          ANY]
#x       [-bos                                         ANY]
#x       [-ttl                                         ANY]
#x       [-nai_type                                    CHOICES notapplicable
#x                                                     CHOICES ipv4nodeid
#x                                                     CHOICES ipv6nodeid
#x                                                     CHOICES ipv4adjacency
#x                                                     CHOICES ipv6adjacency
#x                                                     CHOICES unnumberedadjacencywithipv4nodeids]
#x       [-f_bit                                       ANY]
#x       [-ipv4_node_id                                ANY]
#x       [-ipv4_node_id_step                           ANY]
#x       [-ipv6_node_id                                ANY]
#x       [-ipv6_node_id_step                           ANY]
#x       [-local_ipv4_address                          ANY]
#x       [-local_ipv4_address_step                     ANY]
#x       [-remote_ipv4_address                         ANY]
#x       [-remote_ipv4_address_step                    ANY]
#x       [-local_ipv6_address                          ANY]
#x       [-local_ipv6_address_step                     ANY]
#x       [-remote_ipv6_address                         ANY]
#x       [-remote_ipv6_address_step                    ANY]
#x       [-local_node_id                               ANY]
#x       [-local_node_id_step                          ANY]
#x       [-local_interface_id                          ANY]
#x       [-remote_node_id                              ANY]
#x       [-remote_node_id_step                         ANY]
#x       [-remote_interface_id                         ANY]
#x       [-pcep_metric_sub_objects_list_active         ANY]
#x       [-metric_type                                 CHOICES igp tg hopcount msd]
#x       [-metric_value                                ANY]
#x       [-b_flag                                      ANY]
#x       [-response_options                            CHOICES crep crepwithnopath]
#x       [-response_path_type                          CHOICES sr rsvpte]
#x       [-include_rp                                  ANY]
#x       [-pc_reply_include_lsp                        ANY]
#x       [-enable_ero                                  ANY]
#x       [-pc_reply_include_metric                     ANY]
#x       [-pc_reply_include_bandwidth                  ANY]
#x       [-pc_reply_include_lspa                       ANY]
#x       [-enable_xro                                  ANY]
#x       [-process_type                                CHOICES configure reflect]
#x       [-reflect_r_p                                 ANY]
#x       [-request_id                                  ANY]
#x       [-enable_loose                                ANY]
#x       [-bi_directional                              ANY]
#x       [-priority_value                              ANY]
#x       [-pc_reply_number_of_ero_sub_objects          NUMERIC]
#x       [-pc_reply_number_of_metric_sub_object        NUMERIC]
#x       [-pc_reply_bandwidth                          ANY]
#x       [-reflect_l_s_p                               ANY]
#x       [-pc_reply_plsp_id                            ANY]
#x       [-pc_reply_include_symbolic_path_name_tlv     ANY]
#x       [-pc_reply_symbolic_path_name                 ANY]
#x       [-pc_reply_include_t_e_path_binding_t_l_v     ANY]
#x       [-pc_reply_send_empty_t_l_v                   ANY]
#x       [-pc_reply_binding_type                       CHOICES mplslabel20bit mplslabel32bit]
#x       [-pc_reply_mpls_label                         ANY]
#x       [-pc_reply_tc                                 ANY]
#x       [-pc_reply_bos                                ANY]
#x       [-pc_reply_ttl                                ANY]
#x       [-pc_reply_setup_priority                     ANY]
#x       [-pc_reply_holding_priority                   ANY]
#x       [-pc_reply_local_protection                   ANY]
#x       [-pc_reply_include_any                        ANY]
#x       [-pc_reply_include_all                        ANY]
#x       [-pc_reply_exclude_any                        ANY]
#x       [-nature_of_issue                             ANY]
#x       [-enable_c_flag                               ANY]
#x       [-reflected_object_no_path                    CHOICES elect_reflected_object
#x                                                     CHOICES metric
#x                                                     CHOICES bandwidth
#x                                                     CHOICES iro
#x                                                     CHOICES lspa
#x                                                     CHOICES xro]
#x       [-fail_bit                                    ANY]
#x       [-number_of_Xro_sub_objects                   NUMERIC]
#x       [-pc_reply_active                             ANY]
#x       [-xro_active                                  ANY]
#x       [-exclude_bit                                 ANY]
#x       [-xro_attribute                               CHOICES interface node srlg]
#x       [-xro_sub_object_type                         CHOICES ipv4prefix
#x                                                     CHOICES ipv6prefix
#x                                                     CHOICES unnumberedinterfaceid
#x                                                     CHOICES asnumber
#x                                                     CHOICES srlg]
#x       [-xro_prefix_length                           ANY]
#x       [-xro_ipv4_address                            ANY]
#x       [-xro_ipv4_address_step                       ANY]
#x       [-xro_ipv6_address                            ANY]
#x       [-xro_ipv6_address_step                       ANY]
#x       [-xro_router_id                               ANY]
#x       [-xro_router_id_step                          ANY]
#x       [-xro_interface_id                            ANY]
#x       [-xro_as_number                               ANY]
#x       [-srlg_id                                     ANY]
#x       [-pce_id32                                    ANY]
#x       [-pce_id128                                   ANY]
#x       [-pc_request_ip_version                       CHOICES ipv4 ipv6]
#x       [-src_ipv4_address                            ANY]
#x       [-src_ipv4_address_step                       ANY]
#x       [-dest_ipv4_address                           ANY]
#x       [-dest_ipv4_address_step                      ANY]
#x       [-src_ipv6_address                            ANY]
#x       [-src_ipv6_address_step                       ANY]
#x       [-dest_ipv6_address                           ANY]
#x       [-dest_ipv6_address_step                      ANY]
#x       [-pc_request_active                           ANY]
#x       [-learned_info_update_item                    NUMERIC]
#x       [-trigger_number_of_ero_sub_objects           NUMERIC]
#x       [-trigger_number_of_metric_sub_objects        NUMERIC]
#x       [-pce_triggers_choice_list                    CHOICES sendupdate]
#x       [-trigger_include_srp                         ANY]
#x       [-trigger_configure_lsp                       CHOICES dontinclude reflect modify]
#x       [-trigger_configure_ero                       CHOICES dontinclude reflect modify]
#x       [-trigger_configure_lspa                      CHOICES dontinclude reflect modify]
#x       [-trigger_configure_bandwidth                 CHOICES dontinclude reflect modify]
#x       [-trigger_configure_metric                    CHOICES dontinclude reflect modify]
#x       [-trigger_override_srp_id                     ANY]
#x       [-trigger_srp_id                              ANY]
#x       [-trigger_include_symbolic_path_name          ANY]
#x       [-trigger_include_t_e_path_binding_t_l_v      ANY]
#x       [-trigger_send_empty_t_l_v                    ANY]
#x       [-trigger_binding_type                        CHOICES mplslabel20bit mplslabel32bit]
#x       [-trigger_mpls_label                          ANY]
#x       [-trigger_tc                                  ANY]
#x       [-trigger_bos                                 ANY]
#x       [-trigger_ttl                                 ANY]
#x       [-trigger_bandwidth                           ANY]
#x       [-trigger_setup_priority                      ANY]
#x       [-trigger_holding_priority                    ANY]
#x       [-trigger_local_protection                    ANY]
#x       [-trigger_include_any                         ANY]
#x       [-trigger_include_all                         ANY]
#x       [-trigger_exclude_any                         ANY]
#x       [-trigger_rsvp_active_this_ero                ANY]
#x       [-trigger_rsvp_loose_hop                      ANY]
#x       [-trigger_rsvp_sub_object_type                CHOICES null
#x                                                     CHOICES ipv4prefix
#x                                                     CHOICES ipv6prefix
#x                                                     CHOICES asnumber]
#x       [-trigger_rsvp_prefix_length                  ANY]
#x       [-trigger_rsvp_ipv4_prefix                    ANY]
#x       [-trigger_rsvp_ipv4_prefix_step               ANY]
#x       [-trigger_rsvp_ipv6_prefix                    ANY]
#x       [-trigger_rsvp_ipv6_prefix_step               ANY]
#x       [-trigger_rsvp_as_number                      ANY]
#x       [-trigger_rsvp_metric_type                    CHOICES igp tg hopcount]
#x       [-trigger_rsvp_active_this_metric             ANY]
#x       [-trigger_rsvp_metric_value                   ANY]
#x       [-trigger_rsvp_b_flag                         ANY]
#x       [-trigger_sr_active_this_ero                  ANY]
#x       [-trigger_sr_loose_hop                        ANY]
#x       [-trigger_sr_sid_type                         CHOICES null
#x                                                     CHOICES sid
#x                                                     CHOICES mplslabel20bit
#x                                                     CHOICES mplslabel32bit]
#x       [-trigger_sr_sid                              ANY]
#x       [-trigger_sr_mpls_label                       ANY]
#x       [-trigger_sr_mpls_label32                     ANY]
#x       [-trigger_sr_tc                               ANY]
#x       [-trigger_sr_bos                              ANY]
#x       [-trigger_sr_ttl                              ANY]
#x       [-trigger_sr_nai_type                         CHOICES notapplicable
#x                                                     CHOICES ipv4nodeid
#x                                                     CHOICES ipv6nodeid
#x                                                     CHOICES ipv4adjacency
#x                                                     CHOICES ipv6adjacency
#x                                                     CHOICES unnumberedadjacencywithipv4nodeids]
#x       [-trigger_sr_f_bit                            ANY]
#x       [-trigger_sr_ipv4_node_id                     ANY]
#x       [-trigger_sr_ipv4_node_id_step                ANY]
#x       [-trigger_sr_ipv6_node_id                     ANY]
#x       [-trigger_sr_ipv6_node_id_step                ANY]
#x       [-trigger_sr_local_ipv4_address               ANY]
#x       [-trigger_sr_local_ipv4_address_step          ANY]
#x       [-trigger_sr_remote_ipv4_address              ANY]
#x       [-trigger_sr_remote_ipv4_address_step         ANY]
#x       [-trigger_sr_local_ipv6_address               ANY]
#x       [-trigger_sr_local_ipv6_address_step          ANY]
#x       [-trigger_sr_remote_ipv6_address              ANY]
#x       [-trigger_sr_remote_ipv6_address_step         ANY]
#x       [-trigger_sr_local_node_id                    ANY]
#x       [-trigger_sr_local_node_id_step               ANY]
#x       [-trigger_sr_local_interface_id               ANY]
#x       [-trigger_sr_remote_node_id                   ANY]
#x       [-trigger_sr_remote_node_id_step              ANY]
#x       [-trigger_sr_remote_interface_id              ANY]
#x       [-trigger_sr_metric_type                      CHOICES igp tg hopcount msd]
#x       [-trigger_sr_active_this_metric               ANY]
#x       [-trigger_sr_metric_value                     ANY]
#x       [-trigger_sr_b_flag                           ANY]
#
# Arguments:
#    -mode
#        This option defines whether to Create/Modify/Delete/Enable/Disable PCE, PCC Group and different types of LSPs under PCE.
#    -port_handle
#        Port handle.
#    -handle
#        Specifies the parent node/object handle on which the pcep configuration should be configured.
#        In case of create/modify -mode, -handle generally denotes the parent node/object handle .
#        In case of modes – modify/delete/disable/enable -handle denotes the object node handle on which the action needs to be performed.
#x   -pce_active
#x       Activate/Deactivate PCE Configuration.
#x   -pce_name
#x       Name of NGPF element, guaranteed to be unique in Scenario.
#x   -pce_action_mode
#x       PCE Mode of Action.
#x   -pc_reply_lsps_per_pcc
#x       Controls the maximum number of PCE LSPs that can be send as PATH Response.
#x   -pcc_ipv4_address
#x       IPv4 address of the PCC. This column is greyed out in case of PCEv6.
#x   -pcc_ipv4_address_step
#x       Step Argument of PCC IPv4 address.
#x   -max_lsps_per_pc_initiate
#x       Controls the maximum number of LSPs that can be present in a PCInitiate message.
#x   -keepalive_interval
#x       Frequency/Time Interval of sending PCEP messages to keep the session active.
#x   -dead_interval
#x       This is the time interval, after the expiration of which, a PCEP peer declares the session down if no PCEP message has been received.
#x   -pce_initiated_lsps_per_pcc
#x       Controls the maximum number of PCE LSPs that can be Initiated per PCC.
#x   -stateful_pce_capability
#x       If enabled, the server will work like a Stateful PCE else like a stateless PCE.
#x   -lsp_update_capability
#x       If the Stateful PCE Capability is enabled then this control should be activated to set the update capability in the Stateful PCE Capability TLV.
#x   -sr_pce_capability
#x       The SR PCE Capability TLV is an optional TLV associated with the OPEN Object to exchange SR capability of PCEP speakers.
#x   -pce_ppag_t_l_v_type
#x       PPAG TLV Type specifies PCE's capability of interpreting this type of PPAG TLV
#x   -authentication
#x       The type of cryptographic authentication to be used on this link interface.
#x   -m_d5_key
#x       A value to be used as the "secret" MD5 Key.
#x   -rate_control
#x       The rate control is an optional feature associated with PCE initiated LSP.
#x   -burst_interval
#x       Interval in milisecond in which desired rate of messages needs to be maintained.
#x   -max_initiated_lsp_per_interval
#x       Maximum number of messages can be sent per interval.
#x   -pcc_group_active
#x       Activate/Deactivate PCE sessions.
#x   -pcc_group_name
#x       Name of NGPF element, guaranteed to be unique in Scenario.
#x   -multiplier
#x       Number of layer instances per parent instance (multiplier).
#x   -path_setup_type
#x       Indicates which type of LSP will be requested in the PCInitiated Request.
#x   -include_end_points
#x       Indicates whether END-POINTS object will be included in a PCInitiate message. All other attributes in sub-tab-End Points would be editable only if this checkbox is enabled.
#x   -include_srp
#x       Indicates whether SRP object will be included in a PCInitiate message. All other attributes in sub-tab-SRP would be editable only if this checkbox is enabled.
#x   -pce_initiate_include_lsp
#x       Indicates whether LSP will be included in a PCInitiate message. All other attributes in sub-tab-LSP would be editable only if this checkbox is enabled.
#x   -include_ero
#x       Specifies whether ERO is active or inactive. All subsequent attributes of the sub-tab-ERO would be editable only if this is enabled.
#x   -pce_initiate_include_metric
#x       Indicates whether the PCInitiate message will have the metric list that is configured. All subsequent attributes of the sub-tab-Metric would be editable only if this is enabled.
#x   -pce_initiate_include_bandwidth
#x       Indicates whether Bandwidth will be included in a PCInitiate message. All other attributes in sub-tab-Bandwidth would be editable only if this checkbox is enabled.
#x   -pce_initiate_include_lspa
#x       Indicates whether LSPA will be included in a PCInitiate message. All other attributes in sub-tab-LSPA would be editable only if this checkbox is enabled.
#x   -pce_initiate_ip_version
#x       Drop down to select the IP Version with 2 choices : IPv4 / IPv6.
#x   -src_end_point_ipv4
#x       Source IPv4 address of the path for which a path computation is Initiated. Will be greyed out if IP Version is set to IPv6.
#x   -src_end_point_ipv4_step
#x       Step Argument of Source IPv4 address.
#x   -dest_end_point_ipv4
#x       Dest IPv4 address of the path for which a path computation is Initiated. Will be greyed out if IP Version is IPv6.
#x   -dest_end_point_ipv4_step
#x       Step Argument of Destination IPv4 address.
#x   -src_end_point_ipv6
#x       Source IPv6 address of the path for which a path computation is Initiated. Will be greyed out if IP version is set to IPv4.
#x   -src_end_point_ipv6_step
#x       Step Argument of Source IPv6 address.
#x   -dest_end_point_ipv6
#x       Dest IPv6 address of the path for which a path computation is Initiated. Will be greyed out if IP Version is IPv4.
#x   -dest_end_point_ipv6_step
#x       Step Argument of Destination IPv6 address.
#x   -override_srp_id_number
#x       Indicates whether SRP ID Number is overridable.
#x   -srp_id_number
#x       The SRP object is used to correlate between initiation requests sent by the PCE and the error reports and state reports sent by the PCC. This number is unique per PCEP session and is incremented per initiation.
#x   -override_plsp_id
#x       Indicates if PLSP-ID will be set by the state machine or user. If disabled user wont have the control and state machine will set it.
#x   -pce_initiate_plsp_id
#x       An identifier for the LSP. A PCC creates a unique PLSP-ID for each LSP that is constant for the lifetime of a PCEP session. The PCC will advertise the same PLSP-ID on all PCEP sessions it maintains at a given time.
#x   -pce_initiate_include_symbolic_path_name_tlv
#x       Indicates if Symbolic-Path-Name TLV is to be included in PCInitiate message.
#x   -pce_initiate_symbolic_path_name
#x       Each LSP (path) must have a symbolic name that is unique in the PCC. It must remain constant throughout a path's lifetime, which may span across multiple consecutive PCEP sessions and/or PCC restarts.
#x   -pce_initiate_include_t_e_path_binding_t_l_v
#x       Indicates if TE-PATH-BINDING TLV is to be included in PCInitiate message.
#x   -pce_initiate_send_empty_t_l_v
#x       If enabled all fields after Binding Type will be grayed out.
#x   -pce_initiate_binding_type
#x       Indicates the type of binding included in the TLV. Types are as follows:
#x       20bit MPLS Label
#x       32bit MPLS Label.
#x       Default value is 20bit MPLS Label.
#x   -pce_initiate_mpls_label
#x       This control will be editable if the Binding Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
#x   -pce_initiate_tc
#x       This field is used to carry traffic class information. This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -pce_initiate_bos
#x       This bit is set to True for the last entry in the label stack i.e., for the bottom of the stack, and False for all other label stack entries.
#x       This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -pce_initiate_ttl
#x       This field is used to encode a time-to-live value. This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -pce_initiate_number_of_ero_sub_objects
#x       Value that indicates the number of ERO Sub Objects to be configured.
#x   -pce_initiate_number_of_metric_sub_object
#x       Value that indicates the number of Metric Objects to be configured.
#x   -pce_initiate_bandwidth
#x       Bandwidth (bits/sec)
#x   -pce_initiate_setup_priority
#x       The priority of the LSP with respect to taking resources.The value 0 is the highest priority.The Setup Priority is used in deciding whether this session can preempt another session.
#x   -pce_initiate_holding_priority
#x       The priority of the LSP with respect to holding resources. The value 0 is the highest priority.Holding Priority is used in deciding whether this session can be preempted by another session.
#x   -pce_initiate_local_protection
#x       When set, this means that the path must include links protected with Fast Reroute
#x   -pce_initiate_include_any
#x       This is a type of Resource Affinity Procedure that is used to validate a link. This control accepts a link if the link carries any of the attributes in the set.
#x   -pce_initiate_include_all
#x       This is a type of Resource Affinity Procedure that is used to validate a link. This control excludes a link from consideration if the link carries any of the attributes in the set.
#x   -pce_initiate_exclude_any
#x       This is a type of Resource Affinity Procedure that is used to validate a link. This control accepts a link only if the link carries all of the attributes in the set.
#x   -include_association
#x       Indicates whether PPAG will be included in a PCInitiate message. All other attributes in sub-tab-PPAG would be editable only if this checkbox is enabled.
#x   -association_id
#x       The Association ID of this LSP.
#x   -protection_lsp
#x       Indicates whether Protection LSP Bit is On.
#x   -standby_mode
#x       Indicates whether Standby LSP Bit is On.
#x   -pce_initiate_enable_xro
#x       Include XRO
#x   -pce_initiate_fail_bit
#x       Fail Bit
#x   -pce_initiate_number_of_Xro_sub_objects
#x       Number of XRO Sub Objects
#x   -pce_initiate_lsp_parameters_active
#x       Activate/Deactivate PCE Initiated LSP Parameters.
#x   -pce_initiate_xro_active
#x       Activate/Deactivate XRO
#x   -pce_initiate_exclude_bit
#x       Indicates whether the exclusion is mandatory or desired.
#x   -pce_initiate_xro_attribute
#x       Indicates how the exclusion subobject is to be indicated.
#x   -pce_initiate_xro_sub_object_type
#x       Using the Sub Object Type control user can configure which sub object needs to be included from the following options: IPv4 Prefix, IPv6 Prefix, Unnumbered Interface ID, AS Number, SRLG.
#x   -pce_initiate_xro_prefix_length
#x       Prefix Length
#x   -pce_initiate_xro_ipv4_address
#x       IPv4 Address
#x   -pce_initiate_xro_ipv4_address_step
#x       Step argument of IPv4 Address
#x   -pce_initiate_xro_ipv6_address
#x       IPv6 Address
#x   -pce_initiate_xro_ipv6_address_step
#x       Step argument of IPv6 Address
#x   -pce_initiate_xro_router_id
#x       Router ID
#x   -pce_initiate_xro_router_id_step
#x       Step argument of Router ID
#x   -pce_initiate_xro_interface_id
#x       Interface ID
#x   -pce_initiate_xro_as_number
#x       AS Number
#x   -pce_initiate_srlg_id
#x       SRLG ID
#x   -pce_initiate_pce_id32
#x       32 bit PKS ID
#x   -pce_initiate_pce_id128
#x       128 bit PKS ID
#x   -pcep_ero_sub_objects_list_active
#x       Controls whether the ERO sub-object will be sent in the PCInitiate message.
#x   -loose_hop
#x       Indicates if user wants to represent a loose-hop sub object in the LSP
#x   -sub_object_type
#x       Using the Sub Object Type control user can configure which sub object needs to be included from the following options: Not Applicable, IPv4 Prefix, IPv6 Prefix, AS Number.
#x   -prefix_length
#x       Prefix Length
#x   -ipv4_prefix
#x       IPv4 Prefix is specified as an IPv4 address.
#x   -ipv4_prefix_step
#x       Step argument of IPv4 Prefix.
#x   -ipv6_prefix
#x       IPv6 Prefix is specified as an IPv6 address.
#x   -ipv6_prefix_step
#x       Step argument of IPv6 Prefix.
#x   -as_number
#x       AS Number
#x   -sid_type
#x       Using the Segment Identifier Type control user can configure whether to include SID or not and if included what is its type. Types are as follows: Null, SID, 20bit MPLS Label, 32bit MPLS Label.
#x       If it is Null then S bit is set in the packet. Default value is 20bit MPLS Label.
#x   -sid
#x       SIDis the Segment Identifier
#x   -mpls_label
#x       This control will be editable if the SID Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
#x   -tc
#x       This field is used to carry traffic class information. This control will be editable only if SID Type is MPLS Label 32bit.
#x   -bos
#x       This bit is set to true for the last entry in the label stack i.e., for the bottom of the stack, and false for all other label stack entries.
#x       This control will be editable only if SID Type is MPLS Label 32bit.
#x   -ttl
#x       This field is used to encode a time-to-live value. This control will be editable only if SID Type is MPLS Label 32bit.
#x   -nai_type
#x       NAI (Node or Adjacency Identifier) contains the NAI associated with the SID. Depending on the value of SID Type, the NAI can have different formats such as; Not Applicable, IPv4 Node ID, IPv6 Node ID, IPv4 Adjacency, IPv6 Adjacency, Unnumbered Adjacency with IPv4 NodeIDs
#x   -f_bit
#x       A Flag which is used to carry additional information pertaining to SID. When this bit is set, the NAI value in the subobject body is null.
#x   -ipv4_node_id
#x       IPv4 Node ID is specified as an IPv4 address. This control can be configured if NAI Type is set to IPv4 Node ID and F bit is disabled.
#x   -ipv4_node_id_step
#x       Step argument of IPv4 Node ID.
#x   -ipv6_node_id
#x       IPv6 Node ID is specified as an IPv6 address. This control can be configured if NAI Type is set to IPv6 Node ID and F bit is disabled.
#x   -ipv6_node_id_step
#x       Step argument of IPv6 Node ID.
#x   -local_ipv4_address
#x       This Control can be configured if NAI Type is set to IPv4 Adjacency and F bit is disabled.
#x   -local_ipv4_address_step
#x       Step argument of Local IPv4 Address.
#x   -remote_ipv4_address
#x       This Control can be configured if NAI Type is set to IPv4 Adjacency and F bit is disabled.
#x   -remote_ipv4_address_step
#x       Step argument of Remote IPv4 Address.
#x   -local_ipv6_address
#x       This Control can be configured if NAI Type is set to IPv6 Adjacency and F bit is disabled.
#x   -local_ipv6_address_step
#x       Step argument of Local IPv6 Address.
#x   -remote_ipv6_address
#x       This Control can be configured if NAI Type is set to IPv6 Adjacency and F bit is disabled.
#x   -remote_ipv6_address_step
#x       Step argument of Remote IPv6 Address.
#x   -local_node_id
#x       This is the Local Node ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -local_node_id_step
#x       Step argument of Local Node ID.
#x   -local_interface_id
#x       This is the Local Interface ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -remote_node_id
#x       This is the Remote Node ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -remote_node_id_step
#x       Step argument of Remote Node ID.
#x   -remote_interface_id
#x       This is the Remote Interface ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -pcep_metric_sub_objects_list_active
#x       Specifies whether the corresponding metric object is active or not.
#x   -metric_type
#x       This is a drop down which has 4 choices:IGP/ TE/ Hop count/ MSD.
#x   -metric_value
#x       User can specify the metric value corresponding to the metric type selected.
#x   -b_flag
#x       B (bound) flag MUST be set in the METRIC object, which specifies that the SID depth for the computed path MUST NOT exceed the metric-value.
#x   -response_options
#x       Reply Options
#x   -response_path_type
#x       Indicates which type of LSP will be responsed in the Path Request Response.
#x   -include_rp
#x       Include RP
#x   -pc_reply_include_lsp
#x       Include LSP
#x   -enable_ero
#x       Include ERO
#x   -pc_reply_include_metric
#x       Include Metric
#x   -pc_reply_include_bandwidth
#x       Include Bandwidth
#x   -pc_reply_include_lspa
#x       Include LSPA
#x   -enable_xro
#x       Include XRO
#x   -process_type
#x       Indicates how the XRO is responded in the Path Request Response.
#x   -reflect_r_p
#x       Reflect RP
#x   -request_id
#x       Request ID
#x   -enable_loose
#x       Loose
#x   -bi_directional
#x       Bi-directional
#x   -priority_value
#x       Priority
#x   -pc_reply_number_of_ero_sub_objects
#x       Number of ERO Sub Objects
#x   -pc_reply_number_of_metric_sub_object
#x       Number of Metric
#x   -pc_reply_bandwidth
#x       Bandwidth (bits/sec)
#x   -reflect_l_s_p
#x       Reflect LSP
#x   -pc_reply_plsp_id
#x       An identifier for the LSP. A PCC creates a unique PLSP-ID for each LSP that is constant for the lifetime of a PCEP session. The PCC will advertise the same PLSP-ID on all PCEP sessions it maintains at a given time.
#x   -pc_reply_include_symbolic_path_name_tlv
#x       Indicates if Symbolic-Path-Name TLV is to be included in PCInitiate message.
#x   -pc_reply_symbolic_path_name
#x       Each LSP (path) must have a symbolic name that is unique in the PCC. It must remain constant throughout a path's lifetime, which may span across multiple consecutive PCEP sessions and/or PCC restarts.
#x   -pc_reply_include_t_e_path_binding_t_l_v
#x       Indicates if TE-PATH-BINDING TLV is to be included in PCInitiate message.
#x   -pc_reply_send_empty_t_l_v
#x       If enabled all fields after Binding Type will be grayed out.
#x   -pc_reply_binding_type
#x       Indicates the type of binding included in the TLV. Types are as follows:
#x       20bit MPLS Label
#x       32bit MPLS Label.
#x       Default value is 20bit MPLS Label.
#x   -pc_reply_mpls_label
#x       This control will be editable if the Binding Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
#x   -pc_reply_tc
#x       This field is used to carry traffic class information. This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -pc_reply_bos
#x       This bit is set to True for the last entry in the label stack i.e., for the bottom of the stack, and False for all other label stack entries.
#x       This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -pc_reply_ttl
#x       This field is used to encode a time-to-live value. This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -pc_reply_setup_priority
#x       Setup Priority
#x   -pc_reply_holding_priority
#x       Holding Priority
#x   -pc_reply_local_protection
#x       Local Protection
#x   -pc_reply_include_any
#x       Include Any
#x   -pc_reply_include_all
#x       Include All
#x   -pc_reply_exclude_any
#x       Exclude Any
#x   -nature_of_issue
#x       Nature Of Issue
#x   -enable_c_flag
#x       C Flag
#x   -reflected_object_no_path
#x       Reflected Object
#x   -fail_bit
#x       Fail Bit
#x   -number_of_Xro_sub_objects
#x       Number of XRO Sub Objects
#x   -pc_reply_active
#x       Activate/Deactivate PCReply LSP Parameters
#x   -xro_active
#x       Activate/Deactivate XRO
#x   -exclude_bit
#x       Indicates whether the exclusion is mandatory or desired.
#x   -xro_attribute
#x       Indicates how the exclusion subobject is to be indicated.
#x   -xro_sub_object_type
#x       Using the Sub Object Type control user can configure which sub object needs to be included from the following options: IPv4 Prefix, IPv6 Prefix, Unnumbered Interface ID, AS Number, SRLG.
#x   -xro_prefix_length
#x       Prefix Length
#x   -xro_ipv4_address
#x       IPv4 Address
#x   -xro_ipv4_address_step
#x       Step argument of IPv4 Address
#x   -xro_ipv6_address
#x       IPv6 Address
#x   -xro_ipv6_address_step
#x       Step argument of IPv6 Address
#x   -xro_router_id
#x       Router ID
#x   -xro_router_id_step
#x       Step argument of Router ID
#x   -xro_interface_id
#x       Interface ID
#x   -xro_as_number
#x       AS Number
#x   -srlg_id
#x       SRLG ID
#x   -pce_id32
#x       32 bit PKS ID
#x   -pce_id128
#x       128 bit PKS ID
#x   -pc_request_ip_version
#x       IP Version
#x   -src_ipv4_address
#x       Source IPv4 Address
#x   -src_ipv4_address_step
#x       Step argument of Source IPv4 Address
#x   -dest_ipv4_address
#x       Destination IPv4 Address
#x   -dest_ipv4_address_step
#x       Step argument of Destination IPv4 Address
#x   -src_ipv6_address
#x       Source IPv6 Address
#x   -src_ipv6_address_step
#x       Step argument of Source IPv6 Address
#x   -dest_ipv6_address
#x       Destination IPv6 Address
#x   -dest_ipv6_address_step
#x       Step argument of Destination IPv6 Address
#x   -pc_request_active
#x       Activate/Deactivate PCRequest Match Criteria
#x   -learned_info_update_item
#x       Number that indicates which learnedInfoUpdate item needs to be configured.
#x   -trigger_number_of_ero_sub_objects
#x       Value that indicates the number of ERO Sub Objects to be configured.
#x   -trigger_number_of_metric_sub_objects
#x       Value that indicates the number of Metric Objects to be configured.
#x   -pce_triggers_choice_list
#x       Based on options selected, IxNetwork sends information to PCPU and refreshes the statistical data in the corresponding tab of Learned Information
#x   -trigger_include_srp
#x       Indicates whether SRP object will be included in a PCInitiate message. All other attributes in sub-tab-SRP would be editable only if this checkbox is enabled.
#x   -trigger_configure_lsp
#x       Configure LSP
#x   -trigger_configure_ero
#x       Configure ERO
#x   -trigger_configure_lspa
#x       Configure LSPA
#x   -trigger_configure_bandwidth
#x       Configure Bandwidth
#x   -trigger_configure_metric
#x       Configure Metric
#x   -trigger_override_srp_id
#x       Indicates whether SRP object will be included in a PCUpdate trigger parameters. All other attributes in sub-tab-SRP would be editable only if this checkbox is enabled.
#x   -trigger_srp_id
#x       The SRP object is used to correlate between initiation requests sent by the PCE and the error reports and state reports sent by the PCC. This number is unique per PCEP session and is incremented per initiation.
#x   -trigger_include_symbolic_path_name
#x       Indicates if Symbolic-Path-Name TLV is to be included in PCUpate trigger message.
#x   -trigger_include_t_e_path_binding_t_l_v
#x       Indicates if TE-PATH-BINDING TLV is to be included in PCUpate trigger message.
#x   -trigger_send_empty_t_l_v
#x       If enabled all fields after Binding Type will be grayed out.
#x   -trigger_binding_type
#x       Indicates the type of binding included in the TLV. Types are as follows:
#x       20bit MPLS Label
#x       32bit MPLS Label.
#x       Default value is 20bit MPLS Label.
#x   -trigger_mpls_label
#x       This control will be editable if the Binding Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
#x   -trigger_tc
#x       This field is used to carry traffic class information. This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -trigger_bos
#x       This bit is set to True for the last entry in the label stack i.e., for the bottom of the stack, and False for all other label stack entries.
#x       This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -trigger_ttl
#x       This field is used to encode a time-to-live value. This control will be editable only if Binding Type is MPLS Label 32bit.
#x   -trigger_bandwidth
#x       Bandwidth (bps)
#x   -trigger_setup_priority
#x       Setup Priority
#x   -trigger_holding_priority
#x       Holding Priority
#x   -trigger_local_protection
#x       Local Protection
#x   -trigger_include_any
#x       Include Any
#x   -trigger_include_all
#x       Include All
#x   -trigger_exclude_any
#x       Exclude Any
#x   -trigger_rsvp_active_this_ero
#x       Controls whether the ERO sub-object will be sent in the PCInitiate message.
#x   -trigger_rsvp_loose_hop
#x       Indicates if user wants to represent a loose-hop sub object in the LSP
#x   -trigger_rsvp_sub_object_type
#x       Using the Sub Object Type control user can configure which sub object needs to be included from the following options:
#x       Not Applicable
#x       IPv4 Prefix
#x       IPv6 Prefix
#x       AS Number.
#x   -trigger_rsvp_prefix_length
#x       Prefix Length
#x   -trigger_rsvp_ipv4_prefix
#x       IPv4 Prefix is specified as an IPv4 address.
#x   -trigger_rsvp_ipv4_prefix_step
#x       Step argument for IPv4 Prefix Address
#x   -trigger_rsvp_ipv6_prefix
#x       IPv6 Prefix is specified as an IPv6 address.
#x   -trigger_rsvp_ipv6_prefix_step
#x       Step argument for IPv6 Prefix Address
#x   -trigger_rsvp_as_number
#x       AS Number
#x   -trigger_rsvp_metric_type
#x       This is a drop down which has 4 choices:IGP/ TE/ Hop count/ MSD.
#x   -trigger_rsvp_active_this_metric
#x       Specifies whether the corresponding metric object is active or not.
#x   -trigger_rsvp_metric_value
#x       User can specify the metric value corresponding to the metric type selected.
#x   -trigger_rsvp_b_flag
#x       B (bound) flag MUST be set in the METRIC object, which specifies that the SID depth for the computed path MUST NOT exceed the metric-value.
#x   -trigger_sr_active_this_ero
#x       Controls whether the ERO sub-object will be sent in the PCInitiate message.
#x   -trigger_sr_loose_hop
#x       Indicates if user wants to represent a loose-hop sub object in the LSP
#x   -trigger_sr_sid_type
#x       Using the Segment Identifier Type control user can configure whether to include SID or not and if included what is its type. Types are as follows:
#x       Null
#x       SID
#x       20bit MPLS Label
#x       32bit MPLS Label.
#x       If it is Null then S bit is set in the packet. Default value is 20bit MPLS Label.
#x   -trigger_sr_sid
#x       SIDis the Segment Identifier
#x   -trigger_sr_mpls_label
#x       This control will be editable if the SID Type is set to either 20bit or 32bit MPLS-Label. This field will take the 20bit value of the MPLS-Label
#x   -trigger_sr_mpls_label32
#x       MPLS Label 32 Bit
#x   -trigger_sr_tc
#x       This field is used to carry traffic class information. This control will be editable only if SID Type is MPLS Label 32bit.
#x   -trigger_sr_bos
#x       This bit is set to true for the last entry in the label stack i.e., for the bottom of the stack, and false for all other label stack entries.
#x       This control will be editable only if SID Type is MPLS Label 32bit.
#x   -trigger_sr_ttl
#x       This field is used to encode a time-to-live value. This control will be editable only if SID Type is MPLS Label 32bit.
#x   -trigger_sr_nai_type
#x       NAI (Node or Adjacency Identifier) contains the NAI associated with the SID. Depending on the value of SID Type, the NAI can have different formats such as,
#x       Not Applicable
#x       IPv4 Node ID
#x       IPv6 Node ID
#x       IPv4 Adjacency
#x       IPv6 Adjacency
#x       Unnumbered Adjacency with IPv4 NodeIDs
#x   -trigger_sr_f_bit
#x       A Flag which is used to carry additional information pertaining to SID. When this bit is set, the NAI value in the subobject body is null.
#x   -trigger_sr_ipv4_node_id
#x       IPv4 Node ID is specified as an IPv4 address. This control can be configured if NAI Type is set to IPv4 Node ID and F bit is disabled.
#x   -trigger_sr_ipv4_node_id_step
#x       Step Argument of IPv4 Node ID.
#x   -trigger_sr_ipv6_node_id
#x       IPv6 Node ID is specified as an IPv6 address. This control can be configured if NAI Type is set to IPv6 Node ID and F bit is disabled.
#x   -trigger_sr_ipv6_node_id_step
#x       Step Argument of IPv6 Node ID.
#x   -trigger_sr_local_ipv4_address
#x       This Control can be configured if NAI Type is set to IPv4 Adjacency and F bit is disabled.
#x   -trigger_sr_local_ipv4_address_step
#x       Step Argument of Local Ipv4 Address.
#x   -trigger_sr_remote_ipv4_address
#x       This Control can be configured if NAI Type is set to IPv4 Adjacency and F bit is disabled.
#x   -trigger_sr_remote_ipv4_address_step
#x       Step Argument of Remote Ipv4 Address.
#x   -trigger_sr_local_ipv6_address
#x       This Control can be configured if NAI Type is set to IPv6 Adjacency and F bit is disabled.
#x   -trigger_sr_local_ipv6_address_step
#x       Step Argument of Local Ipv6 Address.
#x   -trigger_sr_remote_ipv6_address
#x       This Control can be configured if NAI Type is set to IPv6 Adjacency and F bit is disabled.
#x   -trigger_sr_remote_ipv6_address_step
#x       Step Argument of Remote Ipv6 Address.
#x   -trigger_sr_local_node_id
#x       This is the Local Node ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -trigger_sr_local_node_id_step
#x       Step Argument of Local Node Id.
#x   -trigger_sr_local_interface_id
#x       This is the Local Interface ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -trigger_sr_remote_node_id
#x       This is the Remote Node ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -trigger_sr_remote_node_id_step
#x       Step Argument of Remote Node Id.
#x   -trigger_sr_remote_interface_id
#x       This is the Remote Interface ID of the Unnumbered Adjacency with IPv4 NodeIDs which is specified as a pair of Node ID / Interface ID tuples.
#x       This Control can be configured if NAI Type is set to Unnumbered Adjacency with IPv4 NodeIDs and F bit is disabled.
#x   -trigger_sr_metric_type
#x       This is a drop down which has 4 choices:IGP/ TE/ Hop count/ MSD.
#x   -trigger_sr_active_this_metric
#x       Specifies whether the corresponding metric object is active or not.
#x   -trigger_sr_metric_value
#x       User can specify the metric value corresponding to the metric type selected.
#x   -trigger_sr_b_flag
#x       B (bound) flag MUST be set in the METRIC object, which specifies that the SID depth for the computed path MUST NOT exceed the metric-value.
#
# Return Values:
#    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#x   key:ipv4_loopback_handle                             value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle                                      value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    $::SUCCESS | $::FAILURE
#    key:status                                           value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, log shows the detailed information of failure.
#    key:log                                              value:When status is $::FAILURE, log shows the detailed information of failure.
#    Handle of PCE configured
#    key:pce_handle                                       value:Handle of PCE configured
#    Handle of PccGroup configured
#    key:pcc_group_handle                                 value:Handle of PccGroup configured
#    Handle of PCE Initiated LSP Parameters configured
#    key:pce_initiate_lsp_parameters_handle               value:Handle of PCE Initiated LSP Parameters configured
#    Handle of PCReply LSP Parameters configured
#    key:pc_reply_lsp_parameters_handle                   value:Handle of PCReply LSP Parameters configured
#    Handle of PCRequest Match Criteria configured
#    key:pc_request_match_criteria_handle                 value:Handle of PCRequest Match Criteria configured
#    Handle of Detailed SR Learned Info Update configured
#    key:pce_detailed_sr_sync_lsp_update_params_handle    value:Handle of Detailed SR Learned Info Update configured
#    Handle of Basic SR Learned Info Update configured
#    key:pce_basic_sr_sync_lsp_update_params_handle       value:Handle of Basic SR Learned Info Update configured
#    Handle of Detailed RSVP Learned Info Update configured
#    key:pce_detailed_rsvp_sync_lsp_update_params_handle  value:Handle of Detailed RSVP Learned Info Update configured
#    Handle of Basic RSVP Learned Info Update configured
#    key:pce_basic_rsvp_sync_lsp_update_params_handle     value:Handle of Basic RSVP Learned Info Update configured
#    Handle of Learned Info Update
#    key:learned_info_update_handle                       value:Handle of Learned Info Update
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

proc ::ixiangpf::emulation_pce_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{-reflected_object_no_path}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_pce_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
