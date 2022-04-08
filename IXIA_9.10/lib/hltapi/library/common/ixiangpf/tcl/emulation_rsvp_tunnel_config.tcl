##Procedure Header
# Name:
#    ::ixiangpf::emulation_rsvp_tunnel_config
#
# Description:
#    This procedure will configure RSVP
#
# Synopsis:
#    ::ixiangpf::emulation_rsvp_tunnel_config
#        -mode                                               CHOICES create
#                                                            CHOICES delete
#                                                            CHOICES modify
#                                                            CHOICES enable
#                                                            CHOICES disable
#        [-port_handle                                       REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                                            ANY]
#x       [-return_detailed_handles                           CHOICES 0 1
#x                                                           DEFAULT 0]
#        [-count                                             ANY
#                                                            DEFAULT 1]
#        [-mac_address_init                                  MAC]
#x       [-mac_address_step                                  MAC
#x                                                           DEFAULT 0000.0000.0001]
#x       [-vlan                                              CHOICES 0 1]
#        [-vlan_id                                           RANGE 0-4095]
#        [-vlan_id_mode                                      CHOICES fixed increment
#                                                            DEFAULT increment]
#        [-vlan_id_step                                      RANGE 0-4096
#                                                            DEFAULT 1]
#        [-vlan_user_priority                                RANGE 0-7
#                                                            DEFAULT 0]
#        [-intf_ip_addr                                      IPV4
#                                                            DEFAULT 0.0.0.0]
#        [-intf_prefix_length                                RANGE 1-32
#                                                            DEFAULT 24]
#        [-intf_ip_addr_step                                 IPV4
#                                                            DEFAULT 0.0.1.0]
#x       [-gateway_ip_addr                                   IPV4]
#x       [-gateway_ip_addr_step                              IPV4
#x                                                           DEFAULT 0.0.1.0]
#x       [-loopback_ip_addr                                  IPV4]
#x       [-loopback_ip_addr_step                             IPV4
#x                                                           DEFAULT 0.0.1.0]
#x       [-rsvp_p2p_egress_enable                            FLAG]
#x       [-rsvp_p2p_ingress_enable                           FLAG]
#x       [-rsvp_p2mp_egress_enable                           FLAG]
#x       [-rsvp_p2mp_ingress_enable                          FLAG]
#x       [-rsvp_p2mp_ingress_sublsp_enable                   FLAG]
#x       [-p2p_ingress_lsps_count                            NUMERIC]
#x       [-enable_p2p_egress                                 CHOICES 0 1]
#x       [-lsp_active                                        ANY]
#x       [-remote_ip                                         ANY]
#x       [-tunnel_id                                         ANY]
#x       [-lsp_id                                            ANY]
#x       [-bandwidth                                         ANY]
#x       [-ingress_refresh_interval                          ANY]
#x       [-ingress_timeout_multiplier                        ANY]
#x       [-do_mbb_on_apply_changes                           CHOICES 0 1]
#x       [-using_headend_ip                                  ANY]
#x       [-source_ip                                         ANY]
#x       [-autoroute_traffic                                 ANY]
#x       [-auto_generate_session_name                        ANY]
#x       [-session_name                                      ANY]
#x       [-setup_priority                                    ANY]
#x       [-holding_priority                                  ANY]
#x       [-local_protection_desired                          ANY]
#x       [-label_recording_desired                           ANY]
#x       [-se_style_desired                                  ANY]
#x       [-bandwidth_protection_desired                      ANY]
#x       [-node_protection_desired                           ANY]
#x       [-resource_affinities                               ANY]
#x       [-exclude_any                                       ANY]
#x       [-include_any                                       ANY]
#x       [-include_all                                       ANY]
#x       [-token_bucket_rate                                 ANY]
#x       [-token_bucket_size                                 ANY]
#x       [-peak_data_rate                                    ANY]
#x       [-minimum_policed_unit                              ANY]
#x       [-maximum_packet_size                               ANY]
#x       [-enable_fast_reroute                               ANY]
#x       [-fast_reroute_setup_priority                       ANY]
#x       [-fast_reroute_holding_priority                     ANY]
#x       [-hop_limit                                         ANY]
#x       [-fast_reroute_bandwidth                            ANY]
#x       [-fast_reroute_exclude_any                          ANY]
#x       [-fast_reroute_include_any                          ANY]
#x       [-fast_reroute_include_all                          ANY]
#x       [-one_to_one_backup_desired                         ANY]
#x       [-facility_backup_desired                           ANY]
#x       [-send_detour                                       ANY]
#x       [-number_of_detour_sub_objects                      NUMERIC]
#x       [-backup_lsp_id                                     ANY]
#x       [-backup_lsp_session_id                             NUMERIC]
#x       [-enable_path_re_optimization                       ANY]
#x       [-enable_periodic_re_evaluation_request             ANY]
#x       [-re_evaluation_request_interval                    ANY]
#x       [-enable_ero                                        ANY]
#x       [-prepend_dut_to_ero                                CHOICES dontprepend
#x                                                           CHOICES prependloose
#x                                                           CHOICES prependstrict]
#x       [-ingress_p2p_prefix_length                         ANY]
#x       [-number_of_ero_sub_objects                         NUMERIC]
#x       [-send_rro                                          ANY]
#x       [-ingress_number_of_rro_sub_objects                 NUMERIC]
#x       [-p2p_ingress_active                                ANY]
#x       [-plr_id                                            ANY]
#x       [-avoid_node_id                                     ANY]
#x       [-ero_type                                          CHOICES ip as]
#x       [-ero_ip                                            ANY]
#x       [-prefix_length                                     ANY]
#x       [-as_number                                         ANY]
#x       [-loose_flag                                        ANY]
#x       [-rro_type                                          CHOICES ip label]
#x       [-rro_ip                                            ANY]
#x       [-ingress_protection_available                      ANY]
#x       [-ingress_protection_in_use                         ANY]
#x       [-ingress_label                                     ANY]
#x       [-ingress_c_type                                    ANY]
#x       [-ingress_global_label                              ANY]
#x       [-ingress_bandwidth_protection                      ANY]
#x       [-ingress_node_protection                           ANY]
#x       [-egress_refresh_interval                           ANY]
#x       [-egress_timeout_multiplier                         ANY]
#x       [-send_reservation_confirmation                     ANY]
#x       [-enable_fixed_label_for_reservations               ANY]
#x       [-label_value                                       ANY]
#x       [-reservation_style                                 CHOICES se ff auto]
#x       [-reflect_rro                                       ANY]
#x       [-egress_number_of_rro_sub_objects                  NUMERIC]
#x       [-egress_active                                     ANY]
#x       [-egress_type                                       CHOICES ip label]
#x       [-egress_ip                                         ANY]
#x       [-egress_protection_available                       ANY]
#x       [-egress_protection_in_use                          ANY]
#x       [-egress_label                                      ANY]
#x       [-egress_c_type                                     ANY]
#x       [-egress_global_label                               ANY]
#x       [-egress_bandwidth_protection                       ANY]
#x       [-egress_node_protection                            ANY]
#x       [-source_ipv6                                       ANY]
#x       [-insert_ipv6_explicit_null                         ANY]
#x       [-end_point_ipv6                                    ANY]
#x       [-p2mp_ingress_lsp_count                            NUMERIC]
#x       [-p2mp_egress_tunnel_count                          NUMERIC]
#x       [-p2mp_egress_active                                ANY]
#x       [-type_p2mp_id                                      CHOICES iP p2MPId]
#x       [-p2mp_id_as_number                                 ANY]
#x       [-p2mp_id_ip                                        ANY]
#x       [-p2mp_egress_refresh_interval                      ANY]
#x       [-p2mp_egress_timeout_multiplier                    ANY]
#x       [-p2mp_send_reservation_confirmation                ANY]
#x       [-p2mp_enable_fixed_label_for_reservations          ANY]
#x       [-p2mp_label_value                                  ANY]
#x       [-p2mp_reservation_style                            CHOICES se ff auto]
#x       [-sub_lsps_down                                     ANY]
#x       [-p2mp_destination_ipv4_group_address               ANY]
#x       [-p2mp_end_point_ipv6                               ANY]
#x       [-p2mp_reflect_rro                                  ANY]
#x       [-p2mp_include_leaf_ip_at_bottom                    ANY]
#x       [-p2mp_include_connected_ip_on_top                  ANY]
#x       [-p2mp_send_as_rro                                  ANY]
#x       [-p2mp_send_as_srro                                 ANY]
#x       [-p2mp_egress_number_of_rro_sub_objects             NUMERIC]
#x       [-p2mp_egress_rro_type                              CHOICES ip label]
#x       [-p2mp_egress_ip                                    ANY]
#x       [-p2mp_egress_protection_available                  ANY]
#x       [-p2mp_egress_protection_in_use                     ANY]
#x       [-p2mp_egress_label                                 ANY]
#x       [-p2mp_egress_c_type                                ANY]
#x       [-p2mp_egress_global_label                          ANY]
#x       [-p2mp_egress_bandwidth_protection                  ANY]
#x       [-p2mp_egress_node_protection                       ANY]
#x       [-p2mp_ingress_active                               ANY]
#x       [-ingress_type_p2mp_id                              CHOICES iP p2MPId]
#x       [-ingress_p2mp_id_as_number                         ANY]
#x       [-ingress_p2mp_id_ip                                ANY]
#x       [-p2mp_tunnel_id                                    ANY]
#x       [-p2mp_lsp_id                                       ANY]
#x       [-p2mp_ingress_refresh_interval                     ANY]
#x       [-p2mp_ingress_timeout_multiplier                   ANY]
#x       [-ingress_p2mp_sub_lsp_ranges                       NUMERIC]
#x       [-p2mp_using_headend_ip                             ANY]
#x       [-p2mp_source_ipv4                                  ANY]
#x       [-p2mp_source_ipv6                                  ANY]
#x       [-insert_i_pv6_explicit_null                        ANY]
#x       [-p2mp_auto_generate_session_name                   ANY]
#x       [-p2mp_session_name                                 ANY]
#x       [-p2mp_setup_priority                               ANY]
#x       [-p2mp_holding_priority                             ANY]
#x       [-p2mp_local_protection_desired                     ANY]
#x       [-p2mp_label_recording_desired                      ANY]
#x       [-p2mp_se_style_desired                             ANY]
#x       [-p2mp_bandwidth_protection_desired                 ANY]
#x       [-p2mp_node_protection_desired                      ANY]
#x       [-p2mp_resource_affinities                          ANY]
#x       [-p2mp_exclude_any                                  ANY]
#x       [-p2mp_include_any                                  ANY]
#x       [-p2mp_include_all                                  ANY]
#x       [-p2mp_token_bucket_rate                            ANY]
#x       [-p2mp_token_bucket_size                            ANY]
#x       [-p2mp_peak_data_rate                               ANY]
#x       [-p2mp_minimum_policed_unit                         ANY]
#x       [-p2mp_maximum_packet_size                          ANY]
#x       [-p2mp_enable_fast_reroute                          ANY]
#x       [-p2mp_fast_reroute_setup_priority                  ANY]
#x       [-p2mp_fast_reroute_holding_priority                ANY]
#x       [-p2mp_hop_limit                                    ANY]
#x       [-p2mp_fast_reroute_bandwidth                       ANY]
#x       [-p2mp_fast_reroute_exclude_any                     ANY]
#x       [-p2mp_fast_reroute_include_any                     ANY]
#x       [-p2mp_fast_reroute_include_all                     ANY]
#x       [-p2mp_one_to_one_backup_desired                    ANY]
#x       [-p2mp_facility_backup_desired                      ANY]
#x       [-p2mp_send_detour                                  ANY]
#x       [-p2mp_number_of_detour_sub_objects                 NUMERIC]
#x       [-p2mp_backup_lsp_id                                ANY]
#x       [-p2mp_enable_path_re_optimization                  ANY]
#x       [-p2mp_enable_periodic_re_evaluation_request        ANY]
#x       [-p2mp_re_evaluation_request_interval               ANY]
#x       [-p2mp_include_head_ip_at_bottom                    ANY]
#x       [-include_connected_ip_on_top                       ANY]
#x       [-p2mp_number_of_rro_sub_objects                    NUMERIC]
#x       [-p2mp_send_rro                                     ANY]
#x       [-p2mp_ingress_rro_type                             CHOICES ip label]
#x       [-p2mp_ingress_ip                                   ANY]
#x       [-p2mp_ingress_protection_available                 ANY]
#x       [-p2mp_ingress_protection_in_use                    ANY]
#x       [-p2mp_ingress_label                                ANY]
#x       [-p2mp_ingress_c_type                               ANY]
#x       [-p2mp_ingress_global_label                         ANY]
#x       [-p2mp_ingress_node_protection                      ANY]
#x       [-p2mp_ingress_bandwidth_protection                 ANY]
#x       [-sub_lsp_active                                    ANY]
#x       [-leaf_ip                                           ANY]
#x       [-prepend_dut                                       CHOICES dontprepend
#x                                                           CHOICES prependloose
#x                                                           CHOICES prependstrict]
#x       [-prefix_length_of_dut                              ANY]
#x       [-append_leaf                                       CHOICES dontappend
#x                                                           CHOICES appendloose
#x                                                           CHOICES appendstrict]
#x       [-prefix_length_of_leaf                             ANY]
#x       [-send_as_ero                                       ANY]
#x       [-send_as_sero                                      ANY]
#x       [-p2mp_enable_ero                                   ANY]
#x       [-p2mp_number_of_ero_sub_objects                    NUMERIC]
#x       [-p2mp_ero_type                                     CHOICES ip as]
#x       [-p2mp_ero_ip                                       ANY]
#x       [-p2mp_ero_as_number                                ANY]
#x       [-p2mp_ero_loose_flag                               ANY]
#x       [-p2mp_ero_prefix_length                            ANY]
#x       [-t_spec_same_as_primary                            CHOICES 0 1]
#x       [-backup_lsp_token_bucket_size                      ANY]
#x       [-backup_lsp_token_bucket_rate                      ANY]
#x       [-backup_lsp_peak_data_rate                         ANY]
#x       [-backup_lsp_minimum_policed_unit                   ANY]
#x       [-backup_lsp_maximum_packet_size                    ANY]
#x       [-ero_same_as_primary                               CHOICES 0 1]
#x       [-backup_lsp_enable_ero                             ANY]
#x       [-backup_lsp_prepend_dut_to_ero                     CHOICES dontprepend
#x                                                           CHOICES prependloose
#x                                                           CHOICES prependstrict]
#x       [-backup_lsp_prefix_length                          ANY]
#x       [-backup_lsp_number_of_ero_sub_objects              NUMERIC]
#x       [-backuplsp_ero_ip                                  ANY]
#x       [-backuplsp_ero_type                                CHOICES ip as]
#x       [-backuplsp_ero_prefix_length                       ANY]
#x       [-backuplsp_ero_as_number                           ANY]
#x       [-backuplsp_ero_loose_flag                          ANY]
#x       [-delay_lsp_switch_over                             CHOICES 0 1]
#x       [-lsp_switch_over_delay_time                        NUMERIC]
#x       [-p2mp_delay_lsp_switch_over                        CHOICES 0 1]
#x       [-p2mp_lsp_switch_over_delay_time                   NUMERIC]
#x       [-symbolic_path_name                                ANY]
#x       [-enable_r_r_o                                      ANY]
#x       [-pcep_expected_initiated_active                    ANY]
#x       [-pcep_expected_initiated_number_of_rro_sub_objects NUMERIC]
#x       [-pcep_expected_initiated_backup_lsp_id             ANY]
#x       [-expected_pce_initiated_lsps_count                 NUMERIC]
#x       [-initial_delegation                                ANY]
#x       [-redelegation_timeout_interval                     ANY]
#x       [-lsp_operative_mode                                CHOICES lspopeativemodesyncreport
#x                                                           CHOICES lspopeativemoderequest]
#x       [-configure_sync_lsp_object                         CHOICES elect_objects ppag]
#x       [-enable_bfd_mpls                                   ANY]
#x       [-enable_lsp_ping                                   ANY]
#x       [-include_association                               ANY]
#x       [-association_id                                    ANY]
#x       [-protection_lsp                                    ANY]
#x       [-standby_mode                                      ANY]
#x       [-disable_r_s_v_p_signal                            ANY]
#x       [-enable_lsp_self_ping                              CHOICES 0 1]
#x       [-lsp_self_ping_sessionId                           NUMERIC]
#x       [-ip_ttl_of_lsp_self_ping                           NUMERIC]
#x       [-ip_dscp_of_lsp_self_ping                          NUMERIC]
#x       [-lsp_self_ping_retry_count                         NUMERIC]
#x       [-lsp_self_ping_retry_interval                      NUMERIC]
#x       [-forward_lsp_self_ping                             CHOICES 0 1]
#x       [-ip_ttl_decrement_count                            NUMERIC]
#x       [-retain_lsp_self_ping_dscp                         CHOICES 0 1]
#x       [-lsp_self_ping_ip_dscp                             NUMERIC]
#x       [-initial_lsp_self_ping_drop_count                  NUMERIC]
#
# Arguments:
#    -mode
#    -port_handle
#    -handle
#        Specifies the parent node/object handle on which the rsvp configuration should be configured.
#        In case modes – modify/delete/disable/enable – this denotes the object node handle on which the action needs to be performed. The handle value syntax is dependent on the vendor.
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#    -count
#        The number of RsvpLsp to configure on the targeted Ixia
#        interface.The range is 0-1000.
#    -mac_address_init
#        MAC address to be used for the first session.
#x   -mac_address_step
#x       Valid only for -mode create.
#x       The incrementing step for the MAC address configured on the dirrectly
#x       connected interfaces. Valid only when IxNetwork Tcl API is used.
#x   -vlan
#x       Enables vlan on the directly connected ISIS router interface.
#x       Valid options are: 0 - disable, 1 - enable.
#x       This option is valid only when -mode is create or -mode is modify
#x       and -handle is an ISIS router handle.
#    -vlan_id
#        VLAN ID for protocol interface.
#    -vlan_id_mode
#        For multiple neighbor configuration, configures the VLAN ID mode.
#    -vlan_id_step
#        Valid only for -mode create.
#        Defines the step for the VLAN ID when the VLAN ID mode is increment.
#        When vlan_id_step causes the vlan_id value to exceed its maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
#        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
#    -vlan_user_priority
#        VLAN user priority assigned to protocol interface.
#    -intf_ip_addr
#        Interface IP address of the RSVP session router. Mandatory when -mode is create.
#        When using IxTclNetwork (new API) this parameter can be omitted if -interface_handle is used.
#        For IxTclProtocol (old API), when -mode is modify and one of the layer
#        2-3 parameters (-intf_ip_addr, -gateway_ip_addr, -loopback_ip_addr, etc)
#        needs to be modified, the emulation_ldp_config command must be provided
#        with the entire list of layer 2-3 parameters. Otherwise they will be
#        set to their default values.
#    -intf_prefix_length
#        Prefix length on the interface.
#    -intf_ip_addr_step
#        Define interface IP address for multiple sessions.
#        Valid only for -mode create.
#x   -gateway_ip_addr
#x       Gives the gateway IP address for the protocol interface that will
#x       be created for use by the simulated routers.
#x   -gateway_ip_addr_step
#x       Valid only for -mode create.
#x       Gives the step for the gateway IP address.
#x   -loopback_ip_addr
#x       The IP address of the unconnected protocol interface that will be
#x       created behind the intf_ip_addr interface. The loopback(unconnected)
#x       interface is the one that will be used for RSVP emulation. This type
#x       of interface is needed when creating extended Martini sessions.
#x   -loopback_ip_addr_step
#x       Valid only for -mode create.
#x       The incrementing step for the loopback_ip_addr parameter.
#x   -rsvp_p2p_egress_enable
#x       Enable Rsvp P2P Egress
#x   -rsvp_p2p_ingress_enable
#x       Enable Rsvp P2P Inress
#x   -rsvp_p2mp_egress_enable
#x       Enable Rsvp P2MP Egress
#x   -rsvp_p2mp_ingress_enable
#x       Enable Rsvp P2MP Ingress
#x   -rsvp_p2mp_ingress_sublsp_enable
#x       Enable Rsvp P2MP Ingress SubLsps
#x   -p2p_ingress_lsps_count
#x       Number of P2P Ingress LSPs configured per IPv4 Loopback
#x   -enable_p2p_egress
#x       Enable to configure P2P Egress LSPs
#x   -lsp_active
#x       Activate/Deactivate Configuration
#x   -remote_ip
#x       Remote IP Address
#x   -tunnel_id
#x       Tunnel ID
#x   -lsp_id
#x       LSP Id
#x   -bandwidth
#x       Bandwidth (bps)
#x   -ingress_refresh_interval
#x       Refresh Interval (ms)
#x   -ingress_timeout_multiplier
#x       Timeout Multiplier
#x   -do_mbb_on_apply_changes
#x       Do Make Before Break on Apply Changes
#x   -using_headend_ip
#x       Using Headend IP
#x   -source_ip
#x       Source IP
#x   -autoroute_traffic
#x       Autoroute Traffic
#x   -auto_generate_session_name
#x       Auto Generate Session Name
#x   -session_name
#x       Session Name
#x   -setup_priority
#x       Setup Priority
#x   -holding_priority
#x       Holding Priority
#x   -local_protection_desired
#x       Local Protection Desired
#x   -label_recording_desired
#x       Label Recording Desired
#x   -se_style_desired
#x       SE Style Desired
#x   -bandwidth_protection_desired
#x       Bandwidth Protection Desired
#x   -node_protection_desired
#x       Node Protection Desired
#x   -resource_affinities
#x       Resource Affinities
#x   -exclude_any
#x       Exclude Any
#x   -include_any
#x       Include Any
#x   -include_all
#x       Include All
#x   -token_bucket_rate
#x       Token Bucket Rate
#x   -token_bucket_size
#x       Token Bucket Size
#x   -peak_data_rate
#x       Peak Data Rate
#x   -minimum_policed_unit
#x       Minimum Policed Unit
#x   -maximum_packet_size
#x       Maximum Packet Size
#x   -enable_fast_reroute
#x       Enable Fast Reroute
#x   -fast_reroute_setup_priority
#x       Setup Priority
#x   -fast_reroute_holding_priority
#x       Holding Priority
#x   -hop_limit
#x       Hop Limit
#x   -fast_reroute_bandwidth
#x       Bandwidth (bps)
#x   -fast_reroute_exclude_any
#x       Exclude Any
#x   -fast_reroute_include_any
#x       Include Any
#x   -fast_reroute_include_all
#x       Include All
#x   -one_to_one_backup_desired
#x       One To One Backup Desired
#x   -facility_backup_desired
#x       Facility Backup Desired
#x   -send_detour
#x       Send Detour
#x   -number_of_detour_sub_objects
#x       Number Of Detour Sub-Objects
#x   -backup_lsp_id
#x       Backup LSP Id Pool Start
#x   -backup_lsp_session_id
#x       This specifies the Backup LSP session Id.
#x       The default value is 30000.
#x       The minimum value is 0 and the maximum value is 65535.
#x   -enable_path_re_optimization
#x       Enable Path Re-Optimization
#x   -enable_periodic_re_evaluation_request
#x       Enable Periodic Re-Evaluation Request
#x   -re_evaluation_request_interval
#x       Re-Evaluation Request Interval
#x   -enable_ero
#x       Enable ERO
#x   -prepend_dut_to_ero
#x       Prepend DUT to ERO
#x   -ingress_p2p_prefix_length
#x       Prefix Length
#x   -number_of_ero_sub_objects
#x       Number Of ERO Sub-Objects
#x   -send_rro
#x       Send RRO
#x   -ingress_number_of_rro_sub_objects
#x       Number Of RRO Sub-Objects
#x   -p2p_ingress_active
#x       Activate/Deactivate Configuration
#x   -plr_id
#x       PLR ID
#x   -avoid_node_id
#x       Avoid Node ID
#x   -ero_type
#x       Type
#x   -ero_ip
#x       IP
#x   -prefix_length
#x       Prefix Length
#x   -as_number
#x       AS
#x   -loose_flag
#x       Loose Flag
#x   -rro_type
#x       Reservation Style
#x   -rro_ip
#x       IP
#x   -ingress_protection_available
#x       Protection Available
#x   -ingress_protection_in_use
#x       Protection In Use
#x   -ingress_label
#x       Label
#x   -ingress_c_type
#x       C-Type
#x   -ingress_global_label
#x       Global Label
#x   -ingress_bandwidth_protection
#x       Bandwidth Protection
#x   -ingress_node_protection
#x       Node Protection
#x   -egress_refresh_interval
#x       Refresh Interval (ms)
#x   -egress_timeout_multiplier
#x       Timeout Multiplier
#x   -send_reservation_confirmation
#x       Send Reservation Confirmation
#x   -enable_fixed_label_for_reservations
#x       Enable Fixed Label For Reservations
#x   -label_value
#x       Label Value
#x   -reservation_style
#x       Reservation Style
#x   -reflect_rro
#x       Reflect RRO
#x   -egress_number_of_rro_sub_objects
#x       Number Of RRO Sub-Objects
#x   -egress_active
#x       Activate/Deactivate Configuration
#x   -egress_type
#x       Reservation Style
#x   -egress_ip
#x       IP
#x   -egress_protection_available
#x       Protection Available
#x   -egress_protection_in_use
#x       Protection In Use
#x   -egress_label
#x       Label
#x   -egress_c_type
#x       C-Type
#x   -egress_global_label
#x       Global Label
#x   -egress_bandwidth_protection
#x       Bandwidth Protection
#x   -egress_node_protection
#x       Node Protection
#x   -source_ipv6
#x       Source IPv6
#x   -insert_ipv6_explicit_null
#x       Insert IPv6 explicit NULL
#x   -end_point_ipv6
#x       Destination IPv6
#x   -p2mp_ingress_lsp_count
#x       Number of P2MP Ingress LSPs configured per IPv4 Loopback
#x   -p2mp_egress_tunnel_count
#x       Number of P2MP Egress Tunnels configured per IPv4 Loopback
#x   -p2mp_egress_active
#x       Activate/Deactivate Configuration
#x   -type_p2mp_id
#x       P2MP ID Type
#x   -p2mp_id_as_number
#x       P2MP ID displayed in Integer format
#x   -p2mp_id_ip
#x       P2MP ID displayed in IP Address format
#x   -p2mp_egress_refresh_interval
#x       Refresh Interval (ms)
#x   -p2mp_egress_timeout_multiplier
#x       Timeout Multiplier
#x   -p2mp_send_reservation_confirmation
#x       Send Reservation Confirmation
#x   -p2mp_enable_fixed_label_for_reservations
#x       Enable Fixed Label For Reservations
#x   -p2mp_label_value
#x       Label Value
#x   -p2mp_reservation_style
#x       Reservation Style
#x   -sub_lsps_down
#x       Sub LSPs Down
#x   -p2mp_destination_ipv4_group_address
#x       Destination IPv4 Group Address
#x   -p2mp_end_point_ipv6
#x       Destination IPv6
#x   -p2mp_reflect_rro
#x       Reflect RRO
#x   -p2mp_include_leaf_ip_at_bottom
#x       Include Leaf IP at bottom
#x   -p2mp_include_connected_ip_on_top
#x       Include connected IP on top
#x   -p2mp_send_as_rro
#x       Send As RRO
#x   -p2mp_send_as_srro
#x       Send As SRRO
#x   -p2mp_egress_number_of_rro_sub_objects
#x       Number Of RRO Sub-Objects
#x   -p2mp_egress_rro_type
#x       Type: Label Or IP
#x   -p2mp_egress_ip
#x       IP
#x   -p2mp_egress_protection_available
#x       Protection Available
#x   -p2mp_egress_protection_in_use
#x       Protection In Use
#x   -p2mp_egress_label
#x       Label
#x   -p2mp_egress_c_type
#x       C-Type
#x   -p2mp_egress_global_label
#x       Global Label
#x   -p2mp_egress_bandwidth_protection
#x       Bandwidth Protection
#x   -p2mp_egress_node_protection
#x       Node Protection
#x   -p2mp_ingress_active
#x       Activate/Deactivate Configuration
#x   -ingress_type_p2mp_id
#x       P2MP ID Type
#x   -ingress_p2mp_id_as_number
#x       P2MP ID displayed in Integer format
#x   -ingress_p2mp_id_ip
#x       P2MP ID displayed in IP Address format
#x   -p2mp_tunnel_id
#x       Tunnel ID
#x   -p2mp_lsp_id
#x       LSP Id
#x   -p2mp_ingress_refresh_interval
#x       Refresh Interval (ms)
#x   -p2mp_ingress_timeout_multiplier
#x       Timeout Multiplier
#x   -ingress_p2mp_sub_lsp_ranges
#x       Number of P2MP Ingress Sub LSPs configured per RSVP-TE P2MP Ingress LSP
#x   -p2mp_using_headend_ip
#x       Using Headend IP
#x   -p2mp_source_ipv4
#x       Source IPv4
#x   -p2mp_source_ipv6
#x       Source IPv6
#x   -insert_i_pv6_explicit_null
#x       Insert IPv6 explicit NULL
#x   -p2mp_auto_generate_session_name
#x       Auto Generate Session Name
#x   -p2mp_session_name
#x       Session Name
#x   -p2mp_setup_priority
#x       Setup Priority
#x   -p2mp_holding_priority
#x       Holding Priority
#x   -p2mp_local_protection_desired
#x       Local Protection Desired
#x   -p2mp_label_recording_desired
#x       Label Recording Desired
#x   -p2mp_se_style_desired
#x       SE Style Desired
#x   -p2mp_bandwidth_protection_desired
#x       Bandwidth Protection Desired
#x   -p2mp_node_protection_desired
#x       Node Protection Desired
#x   -p2mp_resource_affinities
#x       Resource Affinities
#x   -p2mp_exclude_any
#x       Exclude Any
#x   -p2mp_include_any
#x       Include Any
#x   -p2mp_include_all
#x       Include All
#x   -p2mp_token_bucket_rate
#x       Token Bucket Rate
#x   -p2mp_token_bucket_size
#x       Token Bucket Size
#x   -p2mp_peak_data_rate
#x       Peak Data Rate
#x   -p2mp_minimum_policed_unit
#x       Minimum Policed Unit
#x   -p2mp_maximum_packet_size
#x       Maximum Packet Size
#x   -p2mp_enable_fast_reroute
#x       Enable Fast Reroute
#x   -p2mp_fast_reroute_setup_priority
#x       Setup Priority
#x   -p2mp_fast_reroute_holding_priority
#x       Holding Priority
#x   -p2mp_hop_limit
#x       Hop Limit
#x   -p2mp_fast_reroute_bandwidth
#x       Bandwidth (bps)
#x   -p2mp_fast_reroute_exclude_any
#x       Exclude Any
#x   -p2mp_fast_reroute_include_any
#x       Include Any
#x   -p2mp_fast_reroute_include_all
#x       Include All
#x   -p2mp_one_to_one_backup_desired
#x       One To One Backup Desired
#x   -p2mp_facility_backup_desired
#x       Facility Backup Desired
#x   -p2mp_send_detour
#x       Send Detour
#x   -p2mp_number_of_detour_sub_objects
#x       Number Of Detour Sub-Objects
#x   -p2mp_backup_lsp_id
#x       Backup LSP Id Pool Start
#x   -p2mp_enable_path_re_optimization
#x       Enable Path Re-Optimization
#x   -p2mp_enable_periodic_re_evaluation_request
#x       Enable Periodic Re-Evaluation Request
#x   -p2mp_re_evaluation_request_interval
#x       Re-Evaluation Request Interval
#x   -p2mp_include_head_ip_at_bottom
#x       Include Head IP at bottom
#x   -include_connected_ip_on_top
#x       Include connected IP on top
#x   -p2mp_number_of_rro_sub_objects
#x       Number Of RRO Sub-Objects
#x   -p2mp_send_rro
#x       Send RRO
#x   -p2mp_ingress_rro_type
#x       Type: IP or Label
#x   -p2mp_ingress_ip
#x       IP
#x   -p2mp_ingress_protection_available
#x       Protection Available
#x   -p2mp_ingress_protection_in_use
#x       Protection In Use
#x   -p2mp_ingress_label
#x       Label
#x   -p2mp_ingress_c_type
#x       C-Type
#x   -p2mp_ingress_global_label
#x       Global Label
#x   -p2mp_ingress_node_protection
#x       Node Protection
#x   -p2mp_ingress_bandwidth_protection
#x       Bandwidth Protection
#x   -sub_lsp_active
#x       Activate/Deactivate Configuration
#x   -leaf_ip
#x       Leaf IP
#x   -prepend_dut
#x       Prepend DUT
#x   -prefix_length_of_dut
#x       Prefix Length of DUT
#x   -append_leaf
#x       Append Leaf
#x   -prefix_length_of_leaf
#x       Prefix Length of Leaf
#x   -send_as_ero
#x       Send As ERO
#x   -send_as_sero
#x       Send As SERO
#x   -p2mp_enable_ero
#x       Enable ERO
#x   -p2mp_number_of_ero_sub_objects
#x       Number Of ERO Sub-Objects
#x   -p2mp_ero_type
#x       Type: IP or AS
#x   -p2mp_ero_ip
#x       IP
#x   -p2mp_ero_as_number
#x       AS
#x   -p2mp_ero_loose_flag
#x       Loose Flag
#x   -p2mp_ero_prefix_length
#x       Prefix Length
#x   -t_spec_same_as_primary
#x       TSpec Same As Primary
#x   -backup_lsp_token_bucket_size
#x       Token Bucket Size
#x   -backup_lsp_token_bucket_rate
#x       Token Bucket Rate
#x   -backup_lsp_peak_data_rate
#x       Peak Data Rate
#x   -backup_lsp_minimum_policed_unit
#x       Minimum Policed Unit
#x   -backup_lsp_maximum_packet_size
#x       Maximum Packet Size
#x   -ero_same_as_primary
#x       ERO Same As Primary
#x   -backup_lsp_enable_ero
#x       Enable ERO
#x   -backup_lsp_prepend_dut_to_ero
#x       Prepend DUT to ERO
#x   -backup_lsp_prefix_length
#x       Prefix Length
#x   -backup_lsp_number_of_ero_sub_objects
#x       Number Of ERO Sub-Objects
#x   -backuplsp_ero_ip
#x       IP
#x   -backuplsp_ero_type
#x       Type
#x   -backuplsp_ero_prefix_length
#x       Prefix Length
#x   -backuplsp_ero_as_number
#x       AS
#x   -backuplsp_ero_loose_flag
#x       Loose Flag
#x   -delay_lsp_switch_over
#x       Delay LSP switch over
#x   -lsp_switch_over_delay_time
#x       LSP Switch Over Delay timer (sec)
#x   -p2mp_delay_lsp_switch_over
#x       Delay LSP switch over
#x   -p2mp_lsp_switch_over_delay_time
#x       LSP Switch Over Delay timer (sec)
#x   -symbolic_path_name
#x       This is used for generating the traffic for those LSPs from PCE for which the Symbolic Path Name is configured and matches the value.
#x   -enable_r_r_o
#x       Enable RRO
#x   -pcep_expected_initiated_active
#x       Activate/Deactivate RSVP-TE PCEP Expected Initiated LSPs
#x   -pcep_expected_initiated_number_of_rro_sub_objects
#x       Number Of RRO Sub-Objects
#x   -pcep_expected_initiated_backup_lsp_id
#x       Backup LSP Id
#x   -expected_pce_initiated_lsps_count
#x       Number of Expected PCE Initiated RSVP-TE LSPs
#x   -initial_delegation
#x       Initial Delegation
#x   -redelegation_timeout_interval
#x       The period of time a PCC waits for, when a PCEP session is terminated, before revoking LSP delegation
#x       to a PCE and attempting to redelegate LSPs associated with the terminated PCEP session to PCE.
#x   -lsp_operative_mode
#x       The mode of LSP in which it is currently behaving.
#x   -configure_sync_lsp_object
#x       Include Objects
#x   -enable_bfd_mpls
#x       If selected, BFD MPLS is enabled.
#x   -enable_lsp_ping
#x       If set to True, LSP Ping is enabled for learned LSPs.
#x   -include_association
#x       Indicates whether Association will be included in a RSVP Sync LSP. All other attributes in sub-tab-PPAG would be editable only if this checkbox is enabled.
#x   -association_id
#x       The Association ID of this LSP.
#x   -protection_lsp
#x       Indicates whether Protection LSP Bit is On.
#x   -standby_mode
#x       Indicates whether Standby LSP Bit is On.
#x   -disable_r_s_v_p_signal
#x       Disable RSVP Signaling For PCEP
#x   -enable_lsp_self_ping
#x       If set to True, LSP Self Ping is turned on for RSVP Ingress.
#x   -lsp_self_ping_sessionId
#x       This specifies the session Id of the LSP Self Ping.
#x       The default value is 1.
#x       The minimum value is 1 and the maximum value is 2^64-1.
#x   -ip_ttl_of_lsp_self_ping
#x       This specifies the IP header TTL of the Self Ping packet.
#x       The default value is 255.
#x       The minimum value is 1 and the maximum value is 255.
#x   -ip_dscp_of_lsp_self_ping
#x       This specifies the IP header DSCP of the Self Ping packet.
#x       The default value is 48.
#x       The minimum value is 0 and the maximum value is 63.
#x   -lsp_self_ping_retry_count
#x       This specifies the number of times Ingress LSR should transmit the LSP Self Ping packet.
#x       The default value is 3.
#x       The minimum value is 1 and the maximum value is 2^32-1.
#x   -lsp_self_ping_retry_interval
#x       This is the time interval (in milliseconds) between two LSP Self Ping packet re-transmissions.
#x       The default value is 1000.
#x       The minimum value is 1000 and the maximum value is 30000.
#x   -forward_lsp_self_ping
#x       If set to True, RSVP Egress forwards the LSP Self Ping packet to Ingress LSR.
#x   -ip_ttl_decrement_count
#x       This specifies the amount by which the IP header's TTL value is decremented, before forwarding LSP Self Ping Packet to Ingress LSR.
#x   -retain_lsp_self_ping_dscp
#x       If set to True, Egress LSR keeps the IP header DSCP value of the forwarded LSP self ping packet as it is.
#x       If set to False, Egress LSR overwrites the IP header DSCP value with the value configured in LSP Self Ping IP DSCP field, before forwarding self ping packet to Ingress LSR.
#x   -lsp_self_ping_ip_dscp
#x       This specifies the value to be set in the IP header DSCP field of the forwarded Self Ping packet (when Retain LSP Self Ping DSCP is not selected).
#x       The default value is 48.
#x       The minimum value is 0 and the maximum value is 63.
#x   -initial_lsp_self_ping_drop_count
#x       This specifies the number of times Egress LSR drops the Self Ping packet.
#x       The default value is 0.
#
# Return Values:
#    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#x   key:ipv4_loopback_handle                      value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle                               value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    A list containing the ethernet protocol stack handles that were added by the command (if any).
#x   key:ethernet_handle                           value:A list containing the ethernet protocol stack handles that were added by the command (if any).
#    $::SUCCESS | $::FAILURE
#    key:status                                    value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, contains more information
#    key:log                                       value:When status is $::FAILURE, contains more information
#    Handle of RSVP TE LSP configured
#    key:rsvpte_lsp_handle                         value:Handle of RSVP TE LSP configured
#    Handle of RSVP P2P Ingress configured Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:rsvpte_p2p_ingress_handle                 value:Handle of RSVP P2P Ingress configured Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    Handle of RSVP P2 Egress configured
#    key:rsvpte_p2p_egress_handle                  value:Handle of RSVP P2 Egress configured
#    Handle of RSVP P2MP Ingress configured Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:rsvpte_p2mp_ingress_handle                value:Handle of RSVP P2MP Ingress configured Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    Handle of RSVP P2MP Egress configured
#    key:rsvpte_p2mp_egress_handle                 value:Handle of RSVP P2MP Egress configured
#    Handle of RSVP P2MP Ingress SubLSP configured
#    key:rsvpte_p2mp_ingress_sublsp_handle         value:Handle of RSVP P2MP Ingress SubLSP configured
#    Handle of RSVP-TE Expected PCE Initiated P2P LSPs configured
#    key:rsvp_pcep_expected_initiated_lsps_handle  value:Handle of RSVP-TE Expected PCE Initiated P2P LSPs configured
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  rsvpte_p2p_ingress_handle, rsvpte_p2mp_ingress_handle
#
# See Also:
#

proc ::ixiangpf::emulation_rsvp_tunnel_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{-rsvp_p2p_egress_enable -rsvp_p2p_ingress_enable -rsvp_p2mp_egress_enable -rsvp_p2mp_ingress_enable -rsvp_p2mp_ingress_sublsp_enable}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_rsvp_tunnel_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
