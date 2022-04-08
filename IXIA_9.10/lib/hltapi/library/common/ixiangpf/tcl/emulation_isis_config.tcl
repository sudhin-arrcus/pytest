##Procedure Header
# Name:
#    ::ixiangpf::emulation_isis_config
#
# Description:
#    This procedure is used to create, modify and delete ISIS routers on an Ixia interface. The user can create a single or multiple ISIS routers. These routers can be either L1, L2, or L1L2.
#
# Synopsis:
#    ::ixiangpf::emulation_isis_config
#        -mode                                    CHOICES create
#                                                 CHOICES modify
#                                                 CHOICES delete
#                                                 CHOICES disable
#                                                 CHOICES enable
#        -handle                                  ANY
#x       [-send_p2p_hellos_to_unicast_mac         CHOICES 0 1]
#x       [-rate_control_interval                  NUMERIC]
#x       [-no_of_lsps_or_mgroup_pdus_per_interval NUMERIC]
#x       [-start_rate_scale_mode                  CHOICES port device_group
#x                                                DEFAULT port]
#x       [-start_rate_enabled                     CHOICES 0 1]
#x       [-start_rate_interval                    NUMERIC]
#x       [-start_rate                             ANY]
#x       [-stop_rate_scale_mode                   CHOICES port device_group
#x                                                DEFAULT port]
#x       [-stop_rate_enabled                      CHOICES 0 1]
#x       [-stop_rate_interval                     NUMERIC]
#x       [-stop_rate                              ANY]
#x       [-sr_draft_extension                     CHOICES extension3
#x                                                CHOICES extension10
#x                                                CHOICES rfc8667]
#x       [-srms_preference_sub_tlv_type           NUMERIC]
#x       [-srlb_sub_tlv_type                      NUMERIC]
#x       [-fa_app_spec_link_attr_sub_tlv_type     NUMERIC]
#x       [-fa_fad_sub_tlv_type                    NUMERIC]
#x       [-fa_eag_sub_tlv_type                    NUMERIC]
#x       [-fa_fai_any_sub_tlv_type                NUMERIC]
#x       [-fa_fai_all_sub_tlv_type                NUMERIC]
#x       [-fa_fadf_sub_tlv_type                   NUMERIC]
#x       [-if_active                              CHOICES 0 1]
#        [-discard_lsp                            CHOICES 0 1]
#        [-system_id                              HEX8WITHSPACES]
#x       [-system_id_step                         HEX8WITHSPACES
#x                                                DEFAULT 00:00:00:00:00:01]
#        [-te_enable                              CHOICES 0 1]
#        [-te_router_id                           IP]
#x       [-te_router_id_step                      IP
#x                                                DEFAULT 0.0.0.1]
#x       [-enable_ipv6_te                         CHOICES 0 1]
#x       [-ipv6_te_router_id                      IPV6]
#x       [-enable_host_name                       CHOICES 0 1]
#x       [-host_name                              REGEXP ^[0-9,a-f,A-F]+$]
#        [-wide_metrics                           CHOICES 0 1
#                                                 DEFAULT 0]
#x       [-protocol_name                          ALPHA]
#x       [-active                                 CHOICES 0 1]
#        [-intf_metric                            RANGE 0-16777215]
#x       [-enable_configured_hold_time            CHOICES 0 1]
#x       [-configured_hold_time                   NUMERIC]
#x       [-ipv6_mt_metric                         NUMERIC]
#x       [-intf_type                              CHOICES broadcast ptop]
#x       [-enable3_way_handshake                  CHOICES 0 1]
#x       [-extended_local_circuit_id              NUMERIC]
#n       [-level_type                             ANY]
#x       [-routing_level                          CHOICES L1 L2 L1L2]
#        [-l1_router_priority                     RANGE 0-127]
#        [-l2_router_priority                     RANGE 0-255]
#        [-hello_interval                         RANGE 1-65535]
#x       [-hello_interval_level1                  RANGE 1-65535]
#x       [-level1_dead_interval                   NUMERIC]
#x       [-hello_interval_level2                  RANGE 1-65535]
#x       [-level2_dead_interval                   NUMERIC]
#x       [-bfd_registration                       CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-suppress_hello                         CHOICES 0 1]
#x       [-enable_mt_ipv6                         CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-hello_padding                          CHOICES 0 1]
#x       [-max_area_addresses                     NUMERIC]
#        [-area_id                                ANY
#                                                 DEFAULT 49 00 01]
#x       [-area_id_step                           ANY
#x                                                DEFAULT 00 00 00]
#        [-graceful_restart                       CHOICES 0 1]
#        [-graceful_restart_mode                  CHOICES normal
#                                                 CHOICES restarting
#                                                 CHOICES starting
#                                                 CHOICES helper]
#x       [-graceful_restart_version               CHOICES draft3 draft4]
#        [-graceful_restart_restart_time          ANY]
#        [-attach_bit                             CHOICES 0 1]
#        [-partition_repair                       CHOICES 0 1]
#        [-overloaded                             CHOICES 0 1]
#n       [-override_existence_check               ANY]
#n       [-override_tracking                      ANY]
#        [-lsp_refresh_interval                   RANGE 1-65535]
#        [-lsp_life_time                          RANGE 0-65535]
#x       [-psnp_interval                          NUMERIC]
#x       [-csnp_interval                          NUMERIC]
#        [-max_packet_size                        RANGE 576-32832]
#x       [-pdu_min_tx_interval                    NUMERIC]
#x       [-auto_adjust_mtu                        CHOICES 0 1]
#x       [-auto_adjust_area                       CHOICES 0 1]
#x       [-auto_adjust_supported_protocols        CHOICES 0 1]
#x       [-ignore_receive_md5                     CHOICES 0 1]
#        [-area_authentication_mode               CHOICES null text md5]
#        [-area_password                          ALPHA]
#        [-domain_authentication_mode             CHOICES null text md5]
#        [-domain_password                        ALPHA]
#x       [-auth_type                              CHOICES none password md5]
#        [-circuit_tranmit_password_md5_key       ANY]
#x       [-pdu_per_burst                          NUMERIC]
#x       [-pdu_burst_gap                          ANY]
#x       [-enable_sr                              CHOICES 0 1
#x                                                DEFAULT 0]
#        [-router_id                              IPV4
#                                                 DEFAULT 1.1.1.1]
#x       [-node_prefix                            IPV4
#x                                                DEFAULT 1.1.1.1]
#x       [-mask                                   RANGE 1-32
#x                                                DEFAULT 32]
#x       [-d_bit                                  CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-s_bit                                  CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-redistribution                         CHOICES up down
#x                                                DEFAULT up]
#x       [-r_flag                                 CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-n_flag                                 CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-p_flag                                 CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-e_flag                                 CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-v_flag                                 CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-l_flag                                 CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-ipv4_flag                              CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-ipv6_flag                              CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-configure_sid_index_label              CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-sid_index_label                        NUMERIC
#x                                                DEFAULT 0]
#x       [-algorithm                              RANGE 0-255
#x                                                DEFAULT 0]
#x       [-srgb_range_count                       RANGE 1-5
#x                                                DEFAULT 1]
#x       [-start_sid_label                        RANGE 1-1048575
#x                                                DEFAULT 16000]
#x       [-sid_count                              RANGE 1-1048575
#x                                                DEFAULT 8000]
#x       [-interface_enable_adj_sid               CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_adj_sid                      RANGE 1-1048575
#x                                                DEFAULT 9001]
#x       [-interface_override_f_flag              CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_f_flag                       CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_b_flag                       CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_v_flag                       CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-interface_l_flag                       CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_s_flag                       CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_p_flag                       CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-interface_weight                       RANGE 0-255
#x                                                DEFAULT 0]
#x       [-sr_tunnel_active                       CHOICES 0 1]
#x       [-number_of_sr_tunnels                   RANGE 0-1000
#x                                                DEFAULT 0]
#x       [-sr_tunnel_description                  REGEXP ^[0-9,a-f,A-F]+$]
#x       [-using_head_end_node_prefix             CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-source_ipv4                            IPV4
#x                                                DEFAULT 100.0.0.1]
#x       [-source_ipv6                            IPV6
#x                                                DEFAULT 1000::1]
#x       [-number_of_segments                     RANGE 1-20
#x                                                DEFAULT 1]
#x       [-enable_segment                         CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-segment_type                           CHOICES node link
#x                                                DEFAULT node]
#x       [-node_system_id                         HEX8WITHSPACES]
#x       [-neighbour_node_system_id               HEX8WITHSPACES]
#x       [-ipv6_srh_flag_emulated_router          CHOICES 0 1]
#x       [-interface_enable_app_spec_srlg         RANGE 0-10
#x                                                CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-no_of_app_spec_srlg                    RANGE 0-10
#x                                                DEFAULT 0]
#x       [-app_spec_srlg_l_flag                   CHOICES 0 1]
#x       [-app_spec_srlg_std_app_type             ALPHA]
#x       [-app_spec_srlg_usr_def_app_bm_len       RANGE 1-127
#x                                                DEFAULT 1]
#x       [-app_spec_srlg_usr_def_ap_bm            HEX]
#x       [-app_spec_srlg_ipv4_interface_Addr      CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-app_spec_srlg_ipv4_neighbor_Addr       CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-app_spec_srlg_ipv6_interface_Addr      CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-app_spec_srlg_ipv6_neighbor_Addr       CHOICES 0 1
#x                                                DEFAULT 1]
#x       [-interface_enable_srlg                  CHOICES 0 1
#x                                                DEFAULT 0]
#x       [-srlg_value                             NUMERIC]
#x       [-srlg_count                             RANGE 1-5
#x                                                DEFAULT 1]
#x       [-flex_algo_count                        RANGE 0-128
#x                                                DEFAULT 0]
#x       [-flex_algo                              RANGE 0-255
#x                                                DEFAULT 128]
#x       [-fa_metric_type                         NUMERIC]
#x       [-fa_calc_type                           RANGE 0-127
#x                                                DEFAULT 0]
#x       [-fa_priority                            RANGE 0-255
#x                                                DEFAULT 0]
#x       [-fa_enable_exclude_ag                   CHOICES 0 1]
#x       [-fa_exclude_ag_ext_ag_len               RANGE 1-10
#x                                                DEFAULT 1]
#x       [-fa_exclude_ag_ext_ag                   HEX]
#x       [-fa_enable_include_any_ag               CHOICES 0 1]
#x       [-fa_include_any_ag_ext_ag_len           RANGE 1-10
#x                                                DEFAULT 1]
#x       [-fa_include_any_ag_ext_ag               HEX]
#x       [-fa_enable_include_all_ag               CHOICES 0 1]
#x       [-fa_include_all_ag_ext_ag_len           RANGE 1-10
#x                                                DEFAULT 1]
#x       [-fa_include_all_ag_ext_ag               HEX]
#x       [-fa_enable_fadf_tlv                     CHOICES 0 1]
#x       [-fa_fadf_len                            RANGE 1-4
#x                                                DEFAULT 1]
#x       [-fa_fadf_m_flag                         CHOICES 0 1]
#x       [-fa_fsdf_rsrvd                          HEX]
#x       [-fa_dont_adv_in_sr_algo                 CHOICES 0 1]
#x       [-fa_adv_twice_excl_ag                   CHOICES 0 1]
#x       [-fa_adv_twice_incl_any_ag               CHOICES 0 1]
#x       [-fa_adv_twice_incl_all_ag               CHOICES 0 1]
#x       [-s_r_algorithm_count                    RANGE 1-5
#x                                                DEFAULT 1]
#x       [-isis_sr_algorithm                      NUMERIC]
#x       [-advertise_srlb                         CHOICES 0 1]
#x       [-srlb_flags                             HEX]
#x       [-srlb_descriptor_count                  RANGE 1-5
#x                                                DEFAULT 1]
#x       [-srlbDescriptor_startSidLabel           RANGE 1-1048575
#x                                                DEFAULT 16000]
#x       [-srlbDescriptor_sidCount                RANGE 1-1048575
#x                                                DEFAULT 8000]
#x       [-enable_link_protection                 CHOICES 0 1]
#x       [-extra_traffic                          CHOICES 0 1]
#x       [-unprotected                            CHOICES 0 1]
#x       [-shared                                 CHOICES 0 1]
#x       [-dedicated_one_to_one                   CHOICES 0 1]
#x       [-dedicated_one_plus_one                 CHOICES 0 1]
#x       [-enhanced                               CHOICES 0 1]
#x       [-reserved0x40                           CHOICES 0 1]
#x       [-reserved0x80                           CHOICES 0 1]
#x       [-no_of_te_profiles                      RANGE 0-10]
#x       [-traffic_engineering_name               ALPHA]
#        [-te_admin_group                         HEX]
#        [-te_metric                              NUMERIC]
#        [-te_max_bw                              REGEXP ^[0-9]+]
#        [-te_max_resv_bw                         REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority0                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority1                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority2                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority3                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority4                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority5                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority6                 REGEXP ^[0-9]+$]
#        [-te_unresv_bw_priority7                 REGEXP ^[0-9]+$]
#x       [-te_adv_ext_admin_group                 CHOICES 0 1]
#        [-te_ext_admin_group_len                 NUMERIC]
#x       [-te_ext_admin_group                     HEX]
#x       [-te_adv_uni_dir_link_delay              CHOICES 0 1]
#x       [-te_uni_dir_link_delay_a_bit            CHOICES 0 1]
#        [-te_uni_dir_link_delay                  NUMERIC]
#x       [-te_adv_min_max_unidir_link_delay       CHOICES 0 1]
#x       [-te_min_max_unidir_link_delay_a_bit     CHOICES 0 1]
#        [-te_uni_dir_min_link_delay              NUMERIC]
#        [-te_uni_dir_max_link_delay              NUMERIC]
#x       [-te_adv_unidir_delay_variation          CHOICES 0 1]
#        [-te_uni_dir_link_delay_variation        NUMERIC]
#x       [-te_adv_unidir_link_loss                CHOICES 0 1]
#x       [-te_unidir_link_loss_a_bit              CHOICES 0 1]
#        [-te_uni_dir_link_loss                   NUMERIC]
#x       [-te_adv_unidir_residual_bw              CHOICES 0 1]
#        [-te_uni_dir_residual_bw                 NUMERIC]
#x       [-te_adv_unidir_available_bw             CHOICES 0 1]
#        [-te_uni_dir_available_bw                NUMERIC]
#x       [-te_adv_unidir_utilized_bw              CHOICES 0 1]
#        [-te_uni_dir_utilized_bw                 NUMERIC]
#x       [-te_mt_applicability_for_ipv6           CHOICES usesamete specifymtid
#x                                                DEFAULT usesamete]
#        [-te_mt_id                               NUMERIC]
#x       [-te_adv_app_spec_traffic                CHOICES 0 1]
#x       [-te_app_spec_std_app_type               ALPHA]
#x       [-te_app_spec_l_flag                     CHOICES 0 1]
#x       [-te_app_spec_usr_def_app_bm_len         RANGE 1-127
#x                                                DEFAULT 1]
#x       [-te_app_spec_usr_def_ap_bm              HEX]
#n       [-port_handle                            ANY]
#n       [-atm_encapsulation                      ANY]
#        [-count                                  ANY
#                                                 DEFAULT 1]
#n       [-dce_capability_router_id               ANY]
#n       [-dce_bcast_root_priority                ANY]
#n       [-dce_num_mcast_dst_trees                ANY]
#n       [-dce_device_id                          ANY]
#n       [-dce_device_pri                         ANY]
#n       [-dce_ftag_enable                        ANY]
#n       [-dce_ftag                               ANY]
#        [-gateway_ip_addr                        IPV4
#                                                 DEFAULT 0.0.0.0]
#        [-gateway_ip_addr_step                   IPV4
#                                                 DEFAULT 0.0.1.0]
#        [-gateway_ipv6_addr                      IPV6
#                                                 DEFAULT 0::0]
#        [-gateway_ipv6_addr_step                 IPV6
#                                                 DEFAULT 0:0:0:1::0]
#n       [-hello_password                         ANY]
#n       [-interface_handle                       ANY]
#        [-intf_ip_addr                           IPV4
#                                                 DEFAULT 178.0.0.1]
#x       [-intf_ip_prefix_length                  RANGE 1-32
#x                                                DEFAULT 24]
#        [-intf_ip_addr_step                      IPV4
#                                                 DEFAULT 0.0.1.0]
#        [-intf_ipv6_addr                         IPV6
#                                                 DEFAULT 4000::1]
#        [-intf_ipv6_prefix_length                RANGE 1-128
#                                                 DEFAULT 64]
#        [-intf_ipv6_addr_step                    IPV6
#                                                 DEFAULT 0:0:0:1::0]
#n       [-ip_version                             ANY]
#n       [-loopback_bfd_registration              ANY]
#n       [-loopback_ip_addr                       ANY]
#n       [-loopback_ip_addr_step                  ANY]
#n       [-loopback_ip_prefix_length              ANY]
#n       [-loopback_ip_addr_count                 ANY]
#n       [-loopback_metric                        ANY]
#n       [-loopback_type                          ANY]
#n       [-loopback_routing_level                 ANY]
#n       [-loopback_l1_router_priority            ANY]
#n       [-loopback_l2_router_priority            ANY]
#n       [-loopback_te_metric                     ANY]
#n       [-loopback_te_admin_group                ANY]
#n       [-loopback_te_max_bw                     ANY]
#n       [-loopback_te_max_resv_bw                ANY]
#n       [-loopback_te_unresv_bw_priority0        ANY]
#n       [-loopback_te_unresv_bw_priority1        ANY]
#n       [-loopback_te_unresv_bw_priority2        ANY]
#n       [-loopback_te_unresv_bw_priority3        ANY]
#n       [-loopback_te_unresv_bw_priority4        ANY]
#n       [-loopback_te_unresv_bw_priority5        ANY]
#n       [-loopback_te_unresv_bw_priority6        ANY]
#n       [-loopback_te_unresv_bw_priority7        ANY]
#n       [-loopback_hello_password                ANY]
#        [-mac_address_init                       MAC]
#x       [-mac_address_step                       MAC
#x                                                DEFAULT 0000.0000.0001]
#n       [-no_write                               ANY]
#x       [-reset                                  FLAG]
#n       [-type                                   ANY]
#x       [-vlan                                   CHOICES 0 1]
#        [-vlan_id                                RANGE 0-4095]
#        [-vlan_id_mode                           CHOICES fixed increment
#                                                 DEFAULT increment]
#        [-vlan_id_step                           RANGE 0-4096
#                                                 DEFAULT 1]
#        [-vlan_user_priority                     RANGE 0-7
#                                                 DEFAULT 0]
#n       [-vpi                                    ANY]
#n       [-vci                                    ANY]
#n       [-vpi_step                               ANY]
#n       [-vci_step                               ANY]
#n       [-router_id_step                         ANY]
#n       [-vlan_cfi                               ANY]
#x       [-return_detailed_handles                CHOICES 0 1
#x                                                DEFAULT 0]
#n       [-multi_topology                         ANY]
#
# Arguments:
#    -mode
#    -handle
#        ISIS session handle for using the modes delete, modify, enable and disable.
#        When -handle is provided with the /globals value the arguments that configure global protocol
#        setting accept both multivalue handles and simple values.
#        When -handle is provided with a a protocol stack handle or a protocol session handle, the arguments
#        that configure global settings will only accept simple values. In this situation, these arguments will
#        configure only the settings of the parent device group or the ports associated with the parent topology.
#x   -send_p2p_hellos_to_unicast_mac
#x       Send P2P Hellos To Unicast MAC
#x   -rate_control_interval
#x       Rate Control Interval (ms)
#x   -no_of_lsps_or_mgroup_pdus_per_interval
#x       LSPs/MGROUP-PDUs per Interval
#x   -start_rate_scale_mode
#x       Indicates whether the control is specified per port or per device group
#x   -start_rate_enabled
#x       Enabled
#x   -start_rate_interval
#x       Time interval used to calculate the rate for triggering an action (rate = count/interval)
#x   -start_rate
#x       Number of times an action is triggered per time interval
#x   -stop_rate_scale_mode
#x       Indicates whether the control is specified per port or per device group
#x   -stop_rate_enabled
#x       Enabled
#x   -stop_rate_interval
#x       Time interval used to calculate the rate for triggering an action (rate = count/interval)
#x   -stop_rate
#x       Number of times an action is triggered per time interval
#x   -sr_draft_extension
#x       This specifies the segment routing draft extension
#x   -srms_preference_sub_tlv_type
#x       This specifies the type of SRMS Preference sub tlv, suggested value is 23.
#x   -srlb_sub_tlv_type
#x       This specifies the type of Segment Routing Local Block sub tlv, suggested value is 22.
#x   -fa_app_spec_link_attr_sub_tlv_type
#x       App Specific Link Attr Sub-TLV Type
#x   -fa_fad_sub_tlv_type
#x       FAD Sub-TLV Type
#x   -fa_eag_sub_tlv_type
#x       FAEAG Sub-TLV Type
#x   -fa_fai_any_sub_tlv_type
#x       FAIAnyAG Sub-TLV Type
#x   -fa_fai_all_sub_tlv_type
#x       FAIAllAG Sub-TLV Type
#x   -fa_fadf_sub_tlv_type
#x       FADF Sub-TLV Type
#x   -if_active
#x       Flag.
#    -discard_lsp
#        If 1, discards all LSPs coming from the neighbor which helps
#        scalability.
#    -system_id
#        A system ID is typically 6-octet long.
#x   -system_id_step
#x       If -count > 1, this value is used to increment the system_id.
#    -te_enable
#        If true (1), enable traffic engineering extension. If this field is
#        set to true (1) then wide_metrics field gets set to true (1)
#        irrespective of the ip_version value. This behavior is for
#        IxTclProtocol and IxTclNetwork
#    -te_router_id
#        The ID of the TE router, usually the lowest IP address on the router.
#x   -te_router_id_step
#x       The increment used for -te_router_id option.
#x   -enable_ipv6_te
#x       This enables the Traffic Engineering Profiles Isis IPv6
#x   -ipv6_te_router_id
#x       The ID of the IPv6 TE router, usually the lowest IP address on the router.
#x   -enable_host_name
#x   -host_name
#x       Host Name
#    -wide_metrics
#        If true (1), enable wide style metrics. If te_enable is true then
#        wide_metrics also gets set to true (1) irrespective of the
#        ip_version value and cannot be modified to false. This is the
#        behavior in IxTclProtocol and IxTclNetwork.
#        (DEFAULT 0)
#x   -protocol_name
#x       Protocol name
#x   -active
#x       Flag.
#    -intf_metric
#        The cost metric associated with the route.Valid range is 0-16777215.
#x   -enable_configured_hold_time
#x       Enable Configured Hold Time
#x   -configured_hold_time
#x       Configured Hold Time
#x   -ipv6_mt_metric
#x       IPv6 MT Metric
#x   -intf_type
#x       Indicates the type of network attached to the interface: broadcast or
#x       ptop.
#x   -enable3_way_handshake
#x       Enable 3-way Handshake
#x   -extended_local_circuit_id
#x       Extended Local Circuit Id
#n   -level_type
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -routing_level
#x       Selects the supported routing level.
#    -l1_router_priority
#        The session routers priority number for L1 DR role.
#    -l2_router_priority
#        The session routers priority number for L2 DR role.
#    -hello_interval
#        The frequency of transmitting L1/L2 Hello PDUs.
#x   -hello_interval_level1
#x       The frequency of transmitting L1 Hello PDUs.
#x   -level1_dead_interval
#x       Level 1 Dead Interval (sec)
#x   -hello_interval_level2
#x       The frequency of transmitting L2 Hello PDUs.
#x   -level2_dead_interval
#x       Level 2 Dead Interval (sec)
#x   -bfd_registration
#x       Enable or disable BFD registration.
#x   -suppress_hello
#x       Hello suppression
#x   -enable_mt_ipv6
#x       If true (1), it enables multi-topology (MT) support. If ip_version
#x       is set to 4_6, this field (if not provided by user) gets enabled
#x       (set to true (1)) by default.
#x       (DEFAULT 0)
#x   -hello_padding
#x       Enable Hello Padding
#x   -max_area_addresses
#x       Maximum Area Addresses
#    -area_id
#        The area address to be used for the ISIS router. A valid value for this parameter
#        is represented by a list of octets written in hexadecimal.
#        Example: "3F 22 11", "23", "44 55 FA"
#x   -area_id_step
#x       The step value used for incrementing the -area_id option.A valid value for this parameter
#x       is represented by a list of octets written in hexadecimal.
#x       Example: "3F 22 11", "23", "44 55 FA"
#    -graceful_restart
#        If true (1), enable Graceful Restart (NSF) feature on the session
#        router.
#    -graceful_restart_mode
#x   -graceful_restart_version
#x       Specify which draft to use: draft3 draft4.
#    -graceful_restart_restart_time
#        Theamount of time that the router will wait for restart completion.
#    -attach_bit
#        For L2 only.If 1, indicates that the AttachedFlag is set.
#        This indicates that this ISIS router can use L2 routing to reach
#        other areas.
#    -partition_repair
#        If 1, enables the optional partition repair option specified in
#        ISO/IEC 10589 and RFC 1195 for Level 1 areas.
#    -overloaded
#        If 1, the LSP database overload bit is set, indicating that the LSP
#        database on this router does not have enough memory to store a
#        received LSP.
#n   -override_existence_check
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -override_tracking
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -lsp_refresh_interval
#        The rate at which LSPs are resent.Unit is in seconds.
#    -lsp_life_time
#        The maximum age in seconds for retaining a learned LSP.
#x   -psnp_interval
#x       PSNP Interval (ms)
#x   -csnp_interval
#x       CSNP Interval (ms)
#    -max_packet_size
#        The maximum IS-IS packet size that will be transmitted.Hello packets
#        are also padded to the size.Valid range is 576-32832.
#x   -pdu_min_tx_interval
#x       LSP/MGROUP-PDU Min Transmission Interval (ms)
#x   -auto_adjust_mtu
#x       Auto Adjust MTU
#x   -auto_adjust_area
#x       Auto Adjust Area
#x   -auto_adjust_supported_protocols
#x       Auto Adjust Supported Protocols
#x   -ignore_receive_md5
#x       Ignore Receive MD5
#    -area_authentication_mode
#        Specifies the area authentication mode.Choices are null, text and
#        md5.
#    -area_password
#        The password used in simple text authentication mode.This is used by
#        L1 routing.
#    -domain_authentication_mode
#        Specifies the domain authentication mode.Choices are null, text and
#        md5.
#    -domain_password
#        The password used in simple text authentication mode.This is used by
#        L2 routing.
#x   -auth_type
#x       Authentication Type
#    -circuit_tranmit_password_md5_key
#        area/domain password.
#x   -pdu_per_burst
#x       Max LSPs/MGROUP-PDUs Per Burst
#x   -pdu_burst_gap
#x       Inter LSPs/MGROUP-PDUs Burst Gap (ms)
#x   -enable_sr
#x       Enables SR to run on top of ISIS
#    -router_id
#        Router capability identifier
#x   -node_prefix
#x       Used to uniquely identify the ISIS-L3 SR router
#x   -mask
#x       Mask for the node prefix
#x   -d_bit
#x       When the ISIS router capability TLV is leaked from level-2 to level-1, the D bit must be set, otherwise this bit must be clear
#x   -s_bit
#x       If the S bit is set 1, the ISIS router capability TLV must be flooded across the entire routing domain, otherwise the TLV must not be leaked between levels
#x   -redistribution
#x       It can have any of the two choices- UP or DOWN
#x   -r_flag
#x       Readvertisement flag
#x   -n_flag
#x       Node SID flag
#x   -p_flag
#x       PHP (penultimate hop popping) flag
#x   -e_flag
#x       If the E-flag is set then any upstream neighbor of the Prefix- SID originator MUST replace the PrefixSID with a Prefix-SID having an Explicit-NULL value
#x   -v_flag
#x       Value flag
#x   -l_flag
#x       L flag of ISIS-L3 router
#x   -ipv4_flag
#x       If set, then the router is capable of outgoing IPv4 encapsulation on all interfaces
#x   -ipv6_flag
#x       If set, then the router is capable of outgoing IPv6 encapsulation on all interfaces
#x   -configure_sid_index_label
#x       If enabled, then the nodal SID will not be taken from the SRGB range, rather it will be the value of SID index label
#x   -sid_index_label
#x       This is the value which will be used to set the nodal SID of the ISIS-L3 SR enabled router if configure sid index label option has been enabled
#x   -algorithm
#x       This specifies the algorithm e.g. SPF
#x   -srgb_range_count
#x       How many ranges the user wants to create in the SRGB range. Max is 5
#x   -start_sid_label
#x       Start SID in one SRGB range.
#x   -sid_count
#x       Total count of SIDs in that SRGB range
#x   -interface_enable_adj_sid
#x       Enables adjacent SID for SR enabled ISIS-L3 interface
#x   -interface_adj_sid
#x       Adjacent SID for SR enabled ISIS-L3 interface
#x   -interface_override_f_flag
#x       Override F flag option for SR enabled ISIS-L3 interface
#x   -interface_f_flag
#x       F flag for SR enabled ISIS-L3 interface
#x   -interface_b_flag
#x       B flag for SR enabled ISIS-L3 interface
#x   -interface_v_flag
#x       Value flag for SR enabled ISIS-L3 interface
#x   -interface_l_flag
#x       L flag for SR enabled ISIS-L3 interface
#x   -interface_s_flag
#x       S flag for SR enabled ISIS-L3 interface
#x   -interface_p_flag
#x       P flag for SR enabled ISIS-L3 interface
#x   -interface_weight
#x       Weight value of the adjacent link for SR enabled ISIS-L3 interface
#x   -sr_tunnel_active
#x       Active/Inactive SR Tunnel
#x   -number_of_sr_tunnels
#x       Number of ISIS SR Tunnels
#x   -sr_tunnel_description
#x       ISIS SR Tunnel Description
#x   -using_head_end_node_prefix
#x       ISIS SR Tunnel Using head end Node prefix
#x   -source_ipv4
#x       ISIS SR Tunnel Source IPv4
#x   -source_ipv6
#x       ISIS SR Tunnel Source IPv4
#x   -number_of_segments
#x       ISIS SR Tunnel - Number of Segments
#x   -enable_segment
#x       ISIS SR Tunnel - Enable each segment
#x   -segment_type
#x       ISIS SR Tunnel Segment type
#x   -node_system_id
#x       ISIS SR Tunnel Node System ID
#x   -neighbour_node_system_id
#x       1
#x       ISIS SR Tunnel Neighbour Node System ID
#x   -ipv6_srh_flag_emulated_router
#x       Router will advertise and process IPv6 SR related TLVs
#x   -interface_enable_app_spec_srlg
#x       Enables Application Specific SRLG on the ISIS link between two mentioned interfaces
#x   -no_of_app_spec_srlg
#x       Number of Application Specific SRLG.
#x   -app_spec_srlg_l_flag
#x       If set to False, all link attributes will be advertised as sub-sub-tlv of sub tlv "Application Specific Link Attributes sub-TLV (Type 16) of TLV 22,23,141,222 and 223
#x       If true, then all link attributes will be advertised as sub-TLV of TLV 22,23,141,222 and 223.
#x   -app_spec_srlg_std_app_type
#x       Standard Application Type for Application Specific SRLG
#x   -app_spec_srlg_usr_def_app_bm_len
#x       User Defined Application BM Length for Application Specific SRLG
#x   -app_spec_srlg_usr_def_ap_bm
#x       User Defined Application BM
#x   -app_spec_srlg_ipv4_interface_Addr
#x       IPv4 Interface Address
#x   -app_spec_srlg_ipv4_neighbor_Addr
#x       IPv4 Neighbor Address
#x   -app_spec_srlg_ipv6_interface_Addr
#x       IPv6 Interface Address
#x   -app_spec_srlg_ipv6_neighbor_Addr
#x       IPv6 Neighbor Address
#x   -interface_enable_srlg
#x       Enables SRLG on the ISIS link between two mentioned interfaces
#x   -srlg_value
#x       This is the SRLG Value for the link between two mentioned interfaces.
#x   -srlg_count
#x       This field value shows how many SRLG Value columns would be there in the GUI.
#x   -flex_algo_count
#x       Flex Algorithm Count
#x   -flex_algo
#x       Flex Algorithm
#x   -fa_metric_type
#x       Metric Type: 0-IGP Metric, 1:Min. Unidirectional link Delay, 2:TE Default Metric
#x   -fa_calc_type
#x       Metric Type: 0-IGP Metric, 1:Min. Unidirectional link Delay, 2:TE Default Metric
#x   -fa_priority
#x       Priority
#x   -fa_enable_exclude_ag
#x       If this is enabled, Flexible Algorithm Exclude Admin Group Sub-Sub TLV will be advertised with FAD sub-TLV.
#x   -fa_exclude_ag_ext_ag_len
#x       Exculde AG- Ext Ag length
#x   -fa_exclude_ag_ext_ag
#x       Exculde AG- Ext Admin Group
#x   -fa_enable_include_any_ag
#x       If this is enabled, Flexible Algorithm Include-Any Admin Group Sub-Sub TLV will be advertised with FAD sub-TLV
#x   -fa_include_any_ag_ext_ag_len
#x       Include Any AG- Ext Ag length
#x   -fa_include_any_ag_ext_ag
#x       Include AG- Ext Admin Group
#x   -fa_enable_include_all_ag
#x       If this is enabled, Flexible Algorithm Include-All Admin Group Sub-Sub TLV will be advertised with FAD sub-TLV
#x   -fa_include_all_ag_ext_ag_len
#x       Include All AG- Ext Ag length
#x   -fa_include_all_ag_ext_ag
#x       Include AG- Ext Admin Group
#x   -fa_enable_fadf_tlv
#x       If enabled then following attributes will get enabled and ISIS Flexible Algorithm Definition Flags Sub-TLV or
#x       FADF sub-sub-TLV will be advertised with FAD Sub-TLV
#x   -fa_fadf_len
#x       FADF Length
#x   -fa_fadf_m_flag
#x       M-Flag
#x   -fa_fsdf_rsrvd
#x       Reserved
#x   -fa_dont_adv_in_sr_algo
#x       Don't Adv. in SR Algorithm
#x   -fa_adv_twice_excl_ag
#x       Advertise Twice Exclude AG
#x   -fa_adv_twice_incl_any_ag
#x       Advertise Twice Include-Any AG
#x   -fa_adv_twice_incl_all_ag
#x       Advertise Twice Include-All AG
#x   -s_r_algorithm_count
#x       SR Algorithm Count
#x   -isis_sr_algorithm
#x       SR Algorithm
#x   -advertise_srlb
#x       Enables advertisement of Segment Routing Local Block (SRLB)
#x   -srlb_flags
#x       This specifies the value of the SRLB flags field
#x   -srlb_descriptor_count
#x       Count of the SRLB descriptor entries
#x   -srlbDescriptor_startSidLabel
#x       Start SID/Label
#x   -srlbDescriptor_sidCount
#x       SID Count
#x   -enable_link_protection
#x       This enables the link protection on the ISIS link between two mentioned interfaces.
#x   -extra_traffic
#x       This is a Protection Scheme with value 0x01. It means that the link is protecting another link or links.The LSPs on a link of this type will be lost if any of the links it is protecting fail.
#x   -unprotected
#x       This is a Protection Scheme with value 0x02. It means that there is no other link protecting this link.The LSPs on a link of this type will be lost if the link fails.
#x   -shared
#x       This is a Protection Scheme with value 0x04. It means that there are one or more disjoint links of type Extra Traffic that are protecting this link.These Extra Traffic links are shared between one or more links of type Shared.
#x   -dedicated_one_to_one
#x       This is a Protection Scheme with value 0x08. It means that there is one dedicated disjoint link of type Extra Traffic that is protecting this link.
#x   -dedicated_one_plus_one
#x       This is a Protection Scheme with value 0x10. It means that a dedicated disjoint link is protecting this link.However, the protecting link is not advertised in the link state database and is therefore not available for the routing of LSPs.
#x   -enhanced
#x       This is a Protection Scheme with value 0x20. It means that a protection scheme that is more reliable than Dedicated 1+1, e.g., 4 fiber BLSR/MS-SPRING, is being used to protect this link.
#x   -reserved0x40
#x       This is a Protection Scheme with value 0x40.
#x   -reserved0x80
#x       This is a Protection Scheme with value 0x80.
#x   -no_of_te_profiles
#x       Number of ISIS Traffic Engineering Profiles
#x   -traffic_engineering_name
#x       Name of Isis Traffic Engineering Profile
#    -te_admin_group
#        Administrator Group
#    -te_metric
#        TE Metric Level
#    -te_max_bw
#        The maximum bandwidth to be advertised.
#    -te_max_resv_bw
#        The maximum reservable bandwidth to be advertised.
#    -te_unresv_bw_priority0
#        The unreserved bandwidth for priority 0 to be advertised.
#    -te_unresv_bw_priority1
#        The unreserved bandwidth for priority 1 to be advertised.
#    -te_unresv_bw_priority2
#        The unreserved bandwidth for priority 2 to be advertised.
#    -te_unresv_bw_priority3
#        The unreserved bandwidth for priority 3 to be advertised.
#    -te_unresv_bw_priority4
#        The unreserved bandwidth for priority 4 to be advertised.
#    -te_unresv_bw_priority5
#        The unreserved bandwidth for priority 5 to be advertised.
#    -te_unresv_bw_priority6
#        The unreserved bandwidth for priority 6 to be advertised.
#    -te_unresv_bw_priority7
#        The unreserved bandwidth for priority 7 to be advertised.
#x   -te_adv_ext_admin_group
#x       Advertise Ext Admin Group
#    -te_ext_admin_group_len
#        Ext Admin Group Length
#x   -te_ext_admin_group
#x       Ext Admin Group
#x   -te_adv_uni_dir_link_delay
#x       Advertise Uni-Directional Link Delay
#x   -te_uni_dir_link_delay_a_bit
#x       Uni-Directional Link Delay A-Bit
#    -te_uni_dir_link_delay
#        Uni-Directional Link Delay (us)
#x   -te_adv_min_max_unidir_link_delay
#x       Advertise Min/Max Uni-Directional Link Delay
#x   -te_min_max_unidir_link_delay_a_bit
#x       Min/Max Uni-Directional Link Delay A-Bit
#    -te_uni_dir_min_link_delay
#        Uni-Directional Min Link Delay (us)
#    -te_uni_dir_max_link_delay
#        Uni-Directional Max Link Delay (us)
#x   -te_adv_unidir_delay_variation
#x       Advertise Uni-Directional Delay Variation
#    -te_uni_dir_link_delay_variation
#        Delay Variation(us)
#x   -te_adv_unidir_link_loss
#x       Advertise Uni-Directional Link Loss
#x   -te_unidir_link_loss_a_bit
#x       Min/Max Uni-Directional Link Delay A-Bit
#    -te_uni_dir_link_loss
#        Link Loss(%)
#x   -te_adv_unidir_residual_bw
#x       Advertise Uni-Directional Residual BW
#    -te_uni_dir_residual_bw
#        Residual BW (B/sec)
#x   -te_adv_unidir_available_bw
#x       Advertise Uni-Directional Available BW
#    -te_uni_dir_available_bw
#        Available BW (B/sec)
#x   -te_adv_unidir_utilized_bw
#x       Advertise Uni-Directional Utilized BW
#    -te_uni_dir_utilized_bw
#        Utilized BW (B/sec)
#x   -te_mt_applicability_for_ipv6
#x       Multi-Topology Applicability for IPv6
#    -te_mt_id
#        MTID
#x   -te_adv_app_spec_traffic
#x       If this is set to True, link attributes will be advertised as sub-TLV of TLVs 22,23,141,222 and 223
#x       If set to False, the link atrributes will be advertised as wither sub-sub-tlv of Application Specific
#x       Link Attributes sub-TLV (Type 26) or sub-tlv of TLVs 22,23,141,222 and 223 depending upon the configuration of L flag
#x   -te_app_spec_std_app_type
#x       Standard Application Type
#x   -te_app_spec_l_flag
#x       If set to False, all link attributes will be advertised as sub-sub-tlv of sub tlv "Application Specific Link Attributes sub-TLV (Type 16) of TLV 22,23,141,222 and 223
#x       If true, then all link attributes will be advertised as sub-TLV of TLV 22,23,141,222 and 223.
#x   -te_app_spec_usr_def_app_bm_len
#x       User Defined Application BM Length
#x   -te_app_spec_usr_def_ap_bm
#x       User Defined Application BM
#n   -port_handle
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -atm_encapsulation
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -count
#        The number of ISIS routers to configure on the targeted Ixia
#        interface.The range is 0-1000.
#n   -dce_capability_router_id
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -dce_bcast_root_priority
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -dce_num_mcast_dst_trees
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -dce_device_id
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -dce_device_pri
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -dce_ftag_enable
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -dce_ftag
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -gateway_ip_addr
#        The gateway IP address.
#    -gateway_ip_addr_step
#        The gateway IP address increment value.
#    -gateway_ipv6_addr
#        The gateway IPv6 address.
#    -gateway_ipv6_addr_step
#        The gateway IPv6 address increment value.
#n   -hello_password
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -interface_handle
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -intf_ip_addr
#        The IP address of the Ixia Simulated ISIS router.If -count is > 1,
#        this IP address will increment by value specified
#        in -intf_ip_addr_step.
#x   -intf_ip_prefix_length
#x       Defines the mask of the IP address used for the Ixia (-intf_ip_addr)
#x       and the DUT interface.The range of the value is 1-32.
#    -intf_ip_addr_step
#        This value will be used for incrementing the IP address of Simulated
#        ISIS router if -count is > 1.
#    -intf_ipv6_addr
#        The IPv6 address of the Ixia Simulated ISIS router.If -count
#        is > 1, this IPv6 address will increment by the value specified
#        in -intf_ipv6_addr_step.
#    -intf_ipv6_prefix_length
#        Defines the mask of the IPv6 address used for the Ixia
#        (-intf_ipv6_addr) and the DUT interface.Valid range is 1-128.
#    -intf_ipv6_addr_step
#        This value will be used for incrementing the IPV6 address of Simulated
#        ISIS router if -count is > 1.
#n   -ip_version
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_bfd_registration
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_ip_addr
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_ip_addr_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_ip_prefix_length
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_ip_addr_count
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_metric
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_type
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_routing_level
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_l1_router_priority
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_l2_router_priority
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_metric
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_admin_group
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_max_bw
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_max_resv_bw
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority0
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority1
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority2
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority3
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority4
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority5
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority6
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_te_unresv_bw_priority7
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -loopback_hello_password
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -mac_address_init
#        This option defines the MAC address that will be configured on
#        the Ixia interface.If is -count > 1, this MAC address will
#        increment by default by step of 1, or you can specify another step by
#        using mac_address_step option.
#x   -mac_address_step
#x       This option defines the incrementing step for the MAC address that
#x       will be configured on the Ixia interface. Valid only when
#x       IxNetwork Tcl API is used.
#n   -no_write
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -reset
#x       If this option is selected, this will clear any ISIS-L3 router on
#x       the targeted interface.
#n   -type
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -vlan
#x       Enables vlan on the directly connected ISIS router interface.
#x       Valid options are: 0 - disable, 1 - enable.
#x       This option is valid only when -mode is create or -mode is modify
#x       and -handle is an ISIS router handle.
#    -vlan_id
#        If VLAN is enabled on the Ixia interface, this option will configure
#        the VLAN number.
#    -vlan_id_mode
#        If the user configures more than one interface on the Ixia with
#        VLAN, he can choose to automatically increment the VLAN tag
#        (increment)or leave it idle for each interface (fixed).
#    -vlan_id_step
#        If the -vlan_id_mode is increment, this will be the step value by
#        which the VLAN tags are incremented.
#        When vlan_id_step causes the vlan_id value to exceed it's maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
#        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
#    -vlan_user_priority
#        VLAN user priority assigned to emulated router node.
#n   -vpi
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vci
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vpi_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vci_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -router_id_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vlan_cfi
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#n   -multi_topology
#n       This argument defined by Cisco is not supported for NGPF implementation.
#
# Return Values:
#    A list containing the ethernet protocol stack handles that were added by the command (if any).
#x   key:ethernet_handle            value:A list containing the ethernet protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle                value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    A list containing the ipv6 protocol stack handles that were added by the command (if any).
#x   key:ipv6_handle                value:A list containing the ipv6 protocol stack handles that were added by the command (if any).
#    A list containing the isis l3 protocol stack handles that were added by the command (if any).
#x   key:isis_l3_handle             value:A list containing the isis l3 protocol stack handles that were added by the command (if any).
#    A list containing the isis l3 router protocol stack handles that were added by the command (if any).
#x   key:isis_l3_router_handle      value:A list containing the isis l3 router protocol stack handles that were added by the command (if any).
#    A list containing the isis l3 te protocol stack handles that were added by the command (if any).
#x   key:isis_l3_te_handle          value:A list containing the isis l3 te protocol stack handles that were added by the command (if any).
#    A list containing the srgb range  rtr protocol stack handles that were added by the command (if any).
#x   key:srgb_range_handle_rtr      value:A list containing the srgb range  rtr protocol stack handles that were added by the command (if any).
#    A list containing the sr tunnel  rtr protocol stack handles that were added by the command (if any).
#x   key:sr_tunnel_handle_rtr       value:A list containing the sr tunnel  rtr protocol stack handles that were added by the command (if any).
#    A list containing the sr tunnel seg  rtr protocol stack handles that were added by the command (if any).
#x   key:sr_tunnel_seg_handle_rtr   value:A list containing the sr tunnel seg  rtr protocol stack handles that were added by the command (if any).
#    A list containing the srlg range  rtr protocol stack handles that were added by the command (if any).
#x   key:srlg_range_handle_rtr      value:A list containing the srlg range  rtr protocol stack handles that were added by the command (if any).
#    A list containing the sr algoList  rtr protocol stack handles that were added by the command (if any).
#x   key:sr_algoList_handle_rtr     value:A list containing the sr algoList  rtr protocol stack handles that were added by the command (if any).
#    A list containing the srlb descList  rtr protocol stack handles that were added by the command (if any).
#x   key:srlb_descList_handle_rtr   value:A list containing the srlb descList  rtr protocol stack handles that were added by the command (if any).
#    A list containing the flex algo r protocol stack handles that were added by the command (if any).
#x   key:flex_algo_handler          value:A list containing the flex algo r protocol stack handles that were added by the command (if any).
#    A list containing the app spec srlg r protocol stack handles that were added by the command (if any).
#x   key:app_spec_srlg_handler      value:A list containing the app spec srlg r protocol stack handles that were added by the command (if any).
#    A list containing the isis te profile r protocol stack handles that were added by the command (if any).
#x   key:isis_te_profile_handler    value:A list containing the isis te profile r protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:interface_handle           value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:isis_handle                value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:isis_l3_te_handles         value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:srgb_range_handles_rtr     value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:sr_tunnel_handles_rtr      value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:sr_tunnel_seg_handles_rtr  value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:srlg_range_handles_rtr     value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:sr_algoList_handle_rtr     value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:srlb_descList_handle_rtr   value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:flex_algo_handler          value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:app_spec_srlg_handler      value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:isis_te_profile_handler    value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS | $::FAILURE
#    key:status                     value:$::SUCCESS | $::FAILURE
#    On status of failure, gives detailed information.
#    key:log                        value:On status of failure, gives detailed information.
#    list of router node handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:handle                     value:list of router node handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#    {status $::SUCCESS} {handle {router1 router2 router3 router4}}
#
# Notes:
#    This function does not support the following return values:
#    neighbor.<neighbor_handle>: area_id; system_id; pseudonode_num; intf_ip_addr; intf_ipv6_addr
#    link_local_ipv6_addr
#    link_local_ipv6_prefix_length
#    pseudonode_num
#    The following fields are used in creating a protocol interface.
#    If IxNetwork Tcl Api is used they are applicable only when mode = create.
#    ip_version
#    intf_ip_addr
#    intf_ip_prefix_length
#    intf_ip_addr_step
#    intf_ipv6_addr
#    intf_ipv6_prefix_length
#    intf_ipv6_addr_step
#    vlan
#    vlan_id
#    vlan_id_mode
#    vlan_idstep
#    vlan_user_priority
#    vpi
#    vci
#    vpi_step
#    vci_step
#    gateway_ip_addr      IP
#    gateway_ip_addr_step IP
#    mac_address_init
#    When -handle is provided with the /globals value the arguments that configure global protocol
#    setting accept both multivalue handles and simple values.
#    When -handle is provided with a a protocol stack handle or a protocol session handle, the arguments
#    that configure global settings will only accept simple values. In this situation, these arguments will
#    configure only the settings of the parent device group or the ports associated with the parent topology.
#    Notes:
#    Coded versus functional specification. If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  interface_handle, handle, isis_handle, isis_l3_te_handles, srgb_range_handles_rtr, sr_tunnel_handles_rtr, sr_tunnel_seg_handles_rtr, srlg_range_handles_rtr, sr_algoList_handle_rtr, srlb_descList_handle_rtr, flex_algo_handler, app_spec_srlg_handler, isis_te_profile_handler
#
# See Also:
#

proc ::ixiangpf::emulation_isis_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{-no_write -reset}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_isis_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
