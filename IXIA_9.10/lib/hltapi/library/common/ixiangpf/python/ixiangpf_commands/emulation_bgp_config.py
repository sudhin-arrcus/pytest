# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_bgp_config(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_bgp_config
		
		 Description:
		    This procedure configures BGP neighbors, internal and/or external. It is used to create, enable, modify, and to delete an emulated Border Gateway Protocol.
		    User can configure multiple BGP peers per interface by calling this procedure multiple times.
		
		 Synopsis:
		    emulation_bgp_config
		        -mode                                           CHOICES delete
		                                                        CHOICES disable
		                                                        CHOICES enable
		                                                        CHOICES create
		                                                        CHOICES modify
		                                                        CHOICES reset
		x       [-active                                        CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-md5_enable                                    CHOICES 0 1]
		x       [-md5_key                                       ANY]
		        [-port_handle                                   REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		        [-handle                                        ANY]
		x       [-return_detailed_handles                       CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-ip_version                                    CHOICES 4 6
		                                                        DEFAULT 4]
		        [-local_ip_addr                                 IPV4]
		        [-gateway_ip_addr                               IP]
		        [-remote_ip_addr                                IPV4]
		x       [-bgp_unnumbered                                CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-local_ipv6_addr                               IPV6]
		x       [-gateway_as_remote_ipv6_addr                   CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-remote_ipv6_addr                              IPV6]
		        [-local_addr_step                               IP]
		        [-remote_addr_step                              IP]
		        [-next_hop_enable                               CHOICES 0 1
		                                                        DEFAULT 1]
		        [-next_hop_ip                                   IP]
		x       [-enable_4_byte_as                              CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-local_as                                      RANGE 0-4294967295]
		x       [-local_as4                                     RANGE 0-4294967295]
		        [-local_as_mode                                 CHOICES fixed increment
		                                                        DEFAULT fixed]
		n       [-remote_as                                     ANY]
		        [-local_as_step                                 RANGE 0-4294967295
		                                                        DEFAULT 1]
		        [-update_interval                               RANGE 0-65535]
		        [-count                                         NUMERIC
		                                                        DEFAULT 1]
		        [-local_router_id                               IPV4]
		x       [-local_router_id_step                          IPV4
		x                                                       DEFAULT 0.0.0.1]
		x       [-vlan                                          CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-vlan_id                                       RANGE 0-4095]
		        [-vlan_id_mode                                  CHOICES fixed increment
		                                                        DEFAULT increment]
		        [-vlan_id_step                                  RANGE 0-4096
		                                                        DEFAULT 1]
		x       [-vlan_user_priority                            RANGE 0-7]
		n       [-vpi                                           ANY]
		n       [-vci                                           ANY]
		n       [-vpi_step                                      ANY]
		n       [-vci_step                                      ANY]
		n       [-atm_encapsulation                             ANY]
		x       [-interface_handle                              ANY]
		n       [-retry_time                                    ANY]
		        [-hold_time                                     NUMERIC]
		        [-neighbor_type                                 CHOICES internal external]
		        [-graceful_restart_enable                       CHOICES 0 1
		                                                        DEFAULT 0]
		        [-restart_time                                  RANGE 0-10000000]
		        [-stale_time                                    RANGE 0-10000000]
		        [-tcp_window_size                               RANGE 0-10000000]
		n       [-retries                                       ANY]
		        [-local_router_id_enable                        CHOICES 0 1
		                                                        DEFAULT 0]
		        [-netmask                                       RANGE 1-128]
		        [-mac_address_start                             MAC]
		x       [-mac_address_step                              MAC
		x                                                       DEFAULT 0000.0000.0001]
		x       [-ipv4_mdt_nlri                                 FLAG]
		x       [-ipv4_capability_mdt_nlri                      FLAG]
		        [-ipv4_unicast_nlri                             FLAG]
		        [-ipv4_capability_unicast_nlri                  FLAG]
		        [-ipv4_filter_unicast_nlri                      FLAG]
		        [-ipv4_multicast_nlri                           FLAG]
		        [-ipv4_capability_multicast_nlri                FLAG]
		        [-ipv4_filter_multicast_nlri                    FLAG]
		        [-ipv4_mpls_nlri                                FLAG]
		        [-ipv4_capability_mpls_nlri                     FLAG]
		        [-ipv4_filter_mpls_nlri                         FLAG]
		        [-ipv4_mpls_vpn_nlri                            FLAG]
		        [-ipv4_capability_mpls_vpn_nlri                 FLAG]
		        [-ipv4_filter_mpls_vpn_nlri                     FLAG]
		        [-ipv6_unicast_nlri                             FLAG]
		        [-ipv6_capability_unicast_nlri                  FLAG]
		        [-ipv6_filter_unicast_nlri                      FLAG]
		        [-ipv6_multicast_nlri                           FLAG]
		        [-ipv6_capability_multicast_nlri                FLAG]
		        [-ipv6_filter_multicast_nlri                    FLAG]
		        [-ipv6_mpls_nlri                                FLAG]
		        [-ipv6_capability_mpls_nlri                     FLAG]
		        [-ipv6_filter_mpls_nlri                         FLAG]
		        [-ipv6_mpls_vpn_nlri                            FLAG]
		        [-ipv6_capability_mpls_vpn_nlri                 FLAG]
		        [-ipv6_filter_mpls_vpn_nlri                     FLAG]
		x       [-capability_route_refresh                      CHOICES 0 1]
		x       [-capability_route_constraint                   CHOICES 0 1]
		x       [-local_loopback_ip_addr                        IP]
		x       [-local_loopback_ip_prefix_length               NUMERIC]
		x       [-local_loopback_ip_addr_step                   IP]
		x       [-remote_loopback_ip_addr                       IP]
		x       [-remote_loopback_ip_addr_step                  IP]
		x       [-ttl_value                                     NUMERIC]
		x       [-updates_per_iteration                         RANGE 0-10000000]
		x       [-bfd_registration                              CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-bfd_registration_mode                         CHOICES single_hop multi_hop
		x                                                       DEFAULT multi_hop]
		n       [-override_existence_check                      ANY]
		n       [-override_tracking                             ANY]
		n       [-no_write                                      ANY]
		n       [-vpls                                          ANY]
		        [-vpls_nlri                                     FLAG]
		        [-vpls_capability_nlri                          FLAG]
		        [-vpls_filter_nlri                              FLAG]
		n       [-advertise_host_route                          ANY]
		n       [-modify_outgoing_as_path                       ANY]
		n       [-remote_confederation_member                   ANY]
		n       [-reset                                         ANY]
		n       [-route_refresh                                 ANY]
		n       [-routes_per_msg                                ANY]
		n       [-suppress_notify                               ANY]
		n       [-timeout                                       ANY]
		n       [-update_msg_size                               ANY]
		n       [-vlan_cfi                                      ANY]
		x       [-act_as_restarted                              CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-discard_ixia_generated_routes                 CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-local_router_id_type                          CHOICES same new
		x                                                       DEFAULT new]
		x       [-send_ixia_signature_with_routes               CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-enable_flap                                   CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-flap_up_time                                  ANY]
		x       [-flap_down_time                                ANY]
		x       [-ipv4_multicast_vpn_nlri                       FLAG]
		x       [-ipv4_capability_multicast_vpn_nlri            FLAG]
		x       [-ipv4_filter_multicast_vpn_nlri                FLAG]
		x       [-ipv6_multicast_vpn_nlri                       FLAG]
		x       [-ipv6_capability_multicast_vpn_nlri            FLAG]
		x       [-ipv6_filter_multicast_vpn_nlri                FLAG]
		x       [-filter_ipv4_multicast_bgp_mpls_vpn            FLAG]
		x       [-filter_ipv6_multicast_bgp_mpls_vpn            FLAG]
		x       [-ipv4_multicast_bgp_mpls_vpn                   FLAG]
		x       [-ipv6_multicast_bgp_mpls_vpn                   FLAG]
		x       [-advertise_end_of_rib                          CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-configure_keepalive_timer                     CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-keepalive_timer                               RANGE 0-65535
		                                                        DEFAULT 30]
		        [-staggered_start_enable                        FLAG]
		        [-staggered_start_time                          RANGE 0-10000000]
		x       [-start_rate_enable                             CHOICES 0 1]
		x       [-start_rate_interval                           NUMERIC]
		x       [-start_rate                                    NUMERIC]
		x       [-start_rate_scale_mode                         CHOICES deviceGroup port]
		x       [-stop_rate_enable                              CHOICES 0 1]
		x       [-stop_rate_interval                            ANY]
		x       [-stop_rate                                     ANY]
		x       [-stop_rate_scale_mode                          CHOICES deviceGroup port]
		        [-active_connect_enable                         FLAG]
		x       [-disable_received_update_validation            CHOICES 0 1]
		x       [-enable_ad_vpls_prefix_length                  CHOICES 0 1]
		x       [-ibgp_tester_as_four_bytes                     NUMERIC]
		x       [-ibgp_tester_as_two_bytes                      NUMERIC]
		x       [-initiate_ebgp_active_connection               CHOICES 0 1]
		x       [-initiate_ibgp_active_connection               CHOICES 0 1]
		x       [-mldp_p2mp_fec_type                            HEX]
		x       [-request_vpn_label_exchange_over_lsp           CHOICES 0 1]
		x       [-trigger_vpls_pw_initiation                    CHOICES 0 1]
		x       [-as_path_set_mode                              CHOICES include_as_seq
		x                                                       CHOICES include_as_seq_conf
		x                                                       CHOICES include_as_set
		x                                                       CHOICES include_as_set_conf
		x                                                       CHOICES no_include
		x                                                       CHOICES prepend_as
		x                                                       DEFAULT no_include]
		x       [-router_id                                     IPV4]
		x       [-router_id_step                                IPV4]
		x       [-filter_link_state                             FLAG]
		x       [-capability_linkstate_nonvpn                   CHOICES 0 1]
		x       [-bgp_ls_id                                     RANGE 0-65256525
		x                                                       DEFAULT 0]
		x       [-instance_id                                   NUMERIC
		x                                                       DEFAULT 0]
		x       [-number_of_communities                         RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-enable_community                              CHOICES 0 1]
		x       [-community_type                                CHOICES no_export
		x                                                       CHOICES no_advertised
		x                                                       CHOICES noexport_subconfed
		x                                                       CHOICES manual
		x                                                       DEFAULT no_export]
		x       [-community_as_number                           RANGE 0-65535
		x                                                       DEFAULT 0]
		x       [-community_last_two_octets                     RANGE 0-65535
		x                                                       DEFAULT 0]
		x       [-number_of_ext_communities                     RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-enable_ext_community                          CHOICES 0 1]
		x       [-ext_communities_type                          CHOICES admin_as_two_octet
		x                                                       CHOICES admin_ip
		x                                                       CHOICES admin_as_four_octet
		x                                                       CHOICES opaque
		x                                                       CHOICES evpn]
		x       [-ext_communities_subtype                       CHOICES route_target
		x                                                       CHOICES origin
		x                                                       CHOICES extended_bandwidth
		x                                                       CHOICES encapsulation
		x                                                       CHOICES mac_address]
		x       [-ext_community_as_number                       RANGE 0-65535
		x                                                       DEFAULT 1]
		x       [-ext_community_target_assigned_number_4_octets NUMERIC
		x                                                       DEFAULT 1]
		x       [-ext_community_as_4_bytes                      NUMERIC
		x                                                       DEFAULT 1]
		x       [-ext_community_target_assigned_number_2_octets NUMERIC
		x                                                       DEFAULT 1]
		x       [-ext_community_ip                              IP]
		x       [-ext_community_opaque_data                     HEX]
		x       [-enable_override_peer_as_set_mode              CHOICES 0 1]
		x       [-bgp_ls_as_set_mode                            CHOICES include_as_seq
		x                                                       CHOICES include_as_seq_conf
		x                                                       CHOICES include_as_set
		x                                                       CHOICES include_as_set_conf
		x                                                       CHOICES no_include
		x                                                       CHOICES prepend_as
		x                                                       DEFAULT no_include]
		x       [-number_of_as_path_segments                    RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-enable_as_path_segments                       CHOICES 0 1]
		x       [-enable_as_path_segment                        CHOICES 0 1]
		x       [-number_of_as_number_in_segment                RANGE 0-50
		x                                                       DEFAULT 1]
		x       [-as_path_segment_type                          CHOICES as_set
		x                                                       CHOICES as_seq
		x                                                       CHOICES as_set_confederation
		x                                                       CHOICES as_seq_confederation
		x                                                       DEFAULT as_set]
		x       [-as_path_segment_enable_as_number              CHOICES 0 1]
		x       [-as_path_segment_as_number                     NUMERIC
		x                                                       DEFAULT 1]
		x       [-number_of_clusters                            RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-enable_cluster                                CHOICES 0 1]
		x       [-cluster_id                                    IP]
		x       [-active_ethernet_segment                       CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-esi_type                                      CHOICES type0
		x                                                       CHOICES type1
		x                                                       CHOICES type2
		x                                                       CHOICES type3
		x                                                       CHOICES type4
		x                                                       CHOICES type5]
		x       [-esi_value                                     ANY]
		x       [-b_mac_prefix                                  MAC]
		x       [-b_mac_prefix_length                           NUMERIC]
		x       [-use_same_sequence_number                      CHOICES 0 1]
		x       [-include_mac_mobility_extended_community       CHOICES 0 1]
		x       [-enable_sticky_static_flag                     CHOICES 0 1]
		x       [-support_multihomed_es_auto_discovery          CHOICES 0 1]
		x       [-auto_configure_es_import                      CHOICES 0 1]
		x       [-es_import                                     MAC]
		x       [-df_election_timer                             NUMERIC]
		x       [-support_fast_convergence                      CHOICES 0 1]
		x       [-enable_single_active                          CHOICES 0 1]
		x       [-esi_label                                     NUMERIC]
		x       [-advertise_aliasing_automatically              CHOICES 0 1]
		x       [-advertise_aliasing_before_AdPerEsRoute        CHOICES 0 1]
		x       [-aliasing_route_granularity                    CHOICES tag evi]
		x       [-advertise_inclusive_multicast_route           CHOICES 0 1]
		x       [-evis_count                                    NUMERIC]
		x       [-enable_next_hop                               CHOICES 0 1]
		x       [-set_next_hop                                  CHOICES manually sameaslocalip]
		x       [-set_next_hop_ip_type                          CHOICES ipv4 ipv6]
		x       [-ipv4_next_hop                                 IPV4]
		x       [-ipv6_next_hop                                 IPV6]
		x       [-enable_origin                                 CHOICES 0 1]
		x       [-origin                                        CHOICES igp egp incomplete]
		x       [-enable_local_preference                       CHOICES 0 1]
		x       [-local_preference                              NUMERIC]
		x       [-enable_multi_exit_discriminator               CHOICES 0 1]
		x       [-multi_exit_discriminator                      NUMERIC]
		x       [-enable_atomic_aggregate                       CHOICES 0 1]
		x       [-enable_aggregator_id                          CHOICES 0 1]
		x       [-aggregator_id                                 IPV4]
		x       [-aggregator_as                                 NUMERIC]
		x       [-enable_originator_id                          CHOICES 0 1]
		x       [-originator_id                                 IPV4]
		x       [-no_of_clusters                                NUMERIC]
		x       [-use_control_word                              CHOICES 0 1]
		x       [-vtep_ipv4_address                             IPV4]
		x       [-vtep_ipv6_address                             IPV6]
		x       [-routers_mac_address                           MAC]
		x       [-ethernet_segment_name                         ALPHA]
		x       [-ethernet_segments_count                       NUMERIC]
		x       [-filter_evpn                                   FLAG]
		x       [-evpn                                          FLAG]
		x       [-operational_model                             CHOICES symmetric asymmetric]
		x       [-routers_mac_or_irb_mac_address                ANY]
		x       [-ip_type                                       CHOICES ipv4 ipv6]
		x       [-ip_address                                    IP]
		x       [-ipv6_address                                  IP]
		x       [-enable_b_mac_mapped_ip                        CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-no_of_b_mac_mapped_ips                        NUMERIC]
		x       [-capability_ipv4_unicast_add_path              CHOICES 0 1]
		x       [-capability_ipv6_unicast_add_path              CHOICES 0 1]
		x       [-capability_ipv6_next_hop_encoding             CHOICES 0 1]
		x       [-ipv4_mpls_add_path_mode                       CHOICES receiveonly sendonly both]
		x       [-ipv6_mpls_add_path_mode                       CHOICES receiveonly sendonly both]
		x       [-ipv4_unicast_add_path_mode                    CHOICES receiveonly sendonly both]
		x       [-ipv6_unicast_add_path_mode                    CHOICES receiveonly sendonly both]
		x       [-ipv4_mpls_capability                          CHOICES 0 1]
		x       [-ipv6_mpls_capability                          CHOICES 0 1]
		x       [-capability_ipv4_mpls_add_path                 CHOICES 0 1]
		x       [-capability_ipv6_mpls_add_path                 CHOICES 0 1]
		x       [-custom_sid_type                               NUMERIC]
		x       [-srgb_count                                    RANGE 1-5
		x                                                       DEFAULT 1]
		x       [-start_sid                                     RANGE 1-1048575
		x                                                       DEFAULT 16000]
		x       [-sid_count                                     RANGE 1-1048575
		x                                                       DEFAULT 8000]
		x       [-ipv4_multiple_mpls_labels_capability          CHOICES 0 1]
		x       [-ipv6_multiple_mpls_labels_capability          CHOICES 0 1]
		x       [-mpls_labels_count_for_ipv4_mpls_route         RANGE 1-255
		x                                                       DEFAULT 1]
		x       [-mpls_labels_count_for_ipv6_mpls_route         RANGE 1-255
		x                                                       DEFAULT 1]
		x       [-noOfUserDefinedAfiSafi                        RANGE 0-1000
		x                                                       DEFAULT 0]
		x       [-afiSafi_active                                CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-afiValue                                      NUMERIC]
		x       [-safiValue                                     NUMERIC]
		x       [-lengthOfData                                  NUMERIC]
		x       [-dataValue                                     HEX]
		x       [-ipv4_unicast_flowSpec_nlri                    FLAG]
		x       [-capability_ipv4_unicast_flowSpec              FLAG]
		x       [-filter_ipv4_unicast_flowSpec                  FLAG]
		x       [-ipv6_unicast_flowSpec_nlri                    FLAG]
		x       [-capability_ipv6_unicast_flowSpec              FLAG]
		x       [-filter_ipv6_unicast_flowSpec                  FLAG]
		x       [-always_include_tunnel_enc_ext_community       ANY]
		x       [-ip_vrf_to_ip_vrf_type                         CHOICES interfacefullWithCorefacingIRB
		x                                                       CHOICES interfacefullWithUnnumberedCorefacingIRB
		x                                                       CHOICES interfaceLess]
		x       [-irb_interface_label                           ANY]
		x       [-irb_ipv4_address                              ANY]
		x       [-irb_ipv6_address                              ANY]
		x       [-ipv4_srte_policy_nlri                         FLAG]
		x       [-capability_ipv4_srte_policy                   FLAG]
		x       [-filter_ipv4_srte_policy                       FLAG]
		x       [-ipv6_srte_policy_nlri                         FLAG]
		x       [-capability_ipv6_srte_policy                   FLAG]
		x       [-filter_ipv6_srte_policy                       FLAG]
		x       [-srte_policy_safi                              NUMERIC]
		x       [-srte_policy_attr_type                         NUMERIC]
		x       [-srte_policy_type                              NUMERIC]
		x       [-srte_remote_endpoint_type                     NUMERIC]
		x       [-srte_color_type                               NUMERIC]
		x       [-srte_preference_type                          NUMERIC]
		x       [-srte_binding_type                             NUMERIC]
		x       [-srte_segment_list_type                        NUMERIC]
		x       [-srte_weight_type                              NUMERIC]
		x       [-srte_mplsSID_type                             NUMERIC]
		x       [-srte_ipv6SID_type                             NUMERIC]
		x       [-srte_ipv4_node_address_type                   NUMERIC]
		x       [-srte_ipv6_node_address_type                   NUMERIC]
		x       [-srte_ipv4_node_address_index_type             NUMERIC]
		x       [-srte_ipv4_local_remote_address                NUMERIC]
		x       [-srte_ipv6_node_address_index_type             NUMERIC]
		x       [-srte_ipv6_local_remote_address                NUMERIC]
		x       [-srte_include_length                           CHOICES 0 1]
		x       [-srte_length_unit                              CHOICES bits bytes
		x                                                       DEFAULT bits]
		
		 Arguments:
		    -mode
		        This option defines the action to be taken on the BGP server.
		x   -active
		x       Activates the item
		x   -md5_enable
		x       If set to 1, enables MD5 authentication for emulated
		x       BGP node.
		x   -md5_key
		x       The key used for md5 authentication.
		    -port_handle
		        The port on which the BGP neighbor is to be created.
		    -handle
		        BGP handle used for -mode modify/disable/delete.
		        When -handle is provided with the /globals value the arguments that configure global protocol
		        setting accept both multivalue handles and simple values.
		        When -handle is provided with a a protocol stack handle or a protocol session handle, the arguments
		        that configure global settings will only accept simple values. In this situation, these arguments will
		        configure only the settings of the parent device group or the ports associated with the parent topology.
		x   -return_detailed_handles
		x       This argument determines if individual interface, session or router handles are returned by the current command.
		x       This applies only to the command on which it is specified.
		x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
		x       decrease the size of command results and speed up script execution.
		x       The default is 0, meaning only protocol stack handles will be returned.
		    -ip_version
		        This option defines the IP version of the BGP4
		        neighbor to be configured on the Ixia interface.
		    -local_ip_addr
		        The IPv4 address of the Ixia simulated BGP node to be emulated.
		    -gateway_ip_addr
		        The gateway IPV4 or IPV6 address of the BGP4 neighbor interface. If this
		        parameter is not provided it will be initialized to the remote_ip_addr value.
		    -remote_ip_addr
		        The IPv4 address of the DUTs interface connected to the emulated BGP
		        port.
		x   -bgp_unnumbered
		x       This option is used to support BGP Unnumbered feature. When enabled, local IPv6
		x       will be link-local IP of the interface.
		    -local_ipv6_addr
		        The IPv6 address of the BGP node to be emulated by the test port.
		x   -gateway_as_remote_ipv6_addr
		x       This option is used to auto configure DUT IP. When enabled, DUT IP will be taken from
		x       interface gateway IP.
		    -remote_ipv6_addr
		        The IPv6 address of the DUT interface connected to emulated BGP node.
		        This parameter is mandatory when -mode is create, -ip_version is 6 and
		        parameter -neighbor_type is external, or -neighbor_type is internal
		        and ipv4_mpls_nlri, ipv6_mpls_nlri, ipv4_mpls_vpn_nlri, and
		        ipv6_mpls_vpn_nlri are not enabled.
		    -local_addr_step
		        Defines the mask and increment step for the next -local_ip_addr or
		        "-local_ipv6_addr".
		    -remote_addr_step
		        Defines the mask and increment step for the next -remote_ip_addr or
		        "-remote_ipv6_addr".
		    -next_hop_enable
		        This option is used for IPv4 traffic, and enables the
		        use of the BGP NEXT_HOP attributes.When enabled, the IP next hop
		        must be configured (using the -next_hop_ip option).
		    -next_hop_ip
		        Defines the IP of the next hop.This option is used if the
		        flag -next_hop_enable is set.
		x   -enable_4_byte_as
		x       Allow 4 byte values for -local_as.
		    -local_as
		        The AS number of the BGP node to be emulated by the test port.
		x   -local_as4
		x       The 4 bytes AS number of the BGP node to be emulated by the test port.
		    -local_as_mode
		        For External BGP type only. This option controls the AS number
		        (local_as) assigned to additional routers.
		n   -remote_as
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -local_as_step
		        If you configure more then 1 eBGP neighbor on the Ixia interface,
		        and if you select the option local_as_mode to increment, the option
		        local_as_step defines the step by which the AS number is incremented.
		    -update_interval
		        The time intervals at which UPDATE messages are sent to the DUT,
		        expressed in the number of milliseconds between UPDATE messages.
		    -count
		        Number of BGP nodes to create.
		    -local_router_id
		        BGP4 router ID of the emulated node, must be in IPv4 format.
		x   -local_router_id_step
		x       BGP4 router ID step of the emulated node, must be in IPv4 format.
		x   -vlan
		x       Enables vlan on the directly connected BGP router interface.
		x       Valid options are: 0 - disable, 1 - enable.
		x       This option is valid only when -mode is create or -mode is modify
		x       and -handle is a BGP router handle.
		x       This option is available only when IxNetwork tcl API is used.
		    -vlan_id
		        VLAN ID for the emulated router node.
		    -vlan_id_mode
		        For multiple neighbor configuration, configurest the VLAN ID mode.
		    -vlan_id_step
		        Defines the step for every VLAN When -vlan_id_mode is set to
		        increment.
		        When vlan_id_step causes the vlan_id value to exceed it's maximum value the
		        increment will be done modulo <number of possible vlan ids>.
		        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
		        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
		x   -vlan_user_priority
		x       The VLAN user priority assigned to emulated router node.
		n   -vpi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vci
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vpi_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vci_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -atm_encapsulation
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -interface_handle
		x       This parameter is valid only for IxTclNetwork API and represents a
		x       list of interfaces previously created using interface_config or
		x       another emulation_<protocol>_config command that returns the interface
		x       handles (for example: BFD).
		x       <p> Starting with IxNetwork 5.60 this parameter accepts handles returned by
		x       emulation_dhcp_group_config procedure in the following format:
		x       <DHCP Group Handle>|<interface index X>,<interface index Y>-<interface index Z>, ...
		x       The DHCP ranges are separated from the Interface Index identifiers with the (|) character.
		x       The Interface Index identifiers are separated with comas (,).
		x       A range of Interface Index identifiers can be defined using the dash (-) character. </p>
		x       <p> Ranges along with the Interface Index identifiers are grouped together in TCL Lists. The
		x       lists can contain mixed items, protocol interface handles returned by interface_config
		x       and handles returned by emulation_dhcp_group_config along with the interface index. </p>
		x       <p> Example:
		x       count 10 (10 BGP neighbors). 3 DHCP range handles returned by ::ixia::emulation_dhcp_group_config.
		x       Each DHCP range has 20 sessions (interfaces). If we pass a -interface_handle
		x       in the following format: [list $dhcp_r1|1,5 $dhcp_r2|1-3 $dhcp_r3|1,3,5-9,13]
		x       The interfaces will be distributed to the routers in the following manner: </p>
		x       <ol>
		x       BGP Neighbor 1: $dhcp_r1 -> interface 1 </p>
		x       <li> BGP Neighbor 2: $dhcp_r1 -> interface 5 </li>
		x       <li> BGP Neighbor 3: $dhcp_r2 -> interface 1 </li>
		x       <li> BGP Neighbor 4: $dhcp_r2 -> interface 2 </li>
		x       <li> BGP Neighbor 5: $dhcp_r2 -> interface 3 </li>
		x       <li> BGP Neighbor 6: $dhcp_r3 -> interface 1 </li>
		x       <li> BGP Neighbor 7: $dhcp_r3 -> interface 3 </li>
		x       <li> BGP Neighbor 8: $dhcp_r3 -> interface 5 </li>
		x       <li> BGP Neighbor 9: $dhcp_r3 -> interface 6 </li>
		x       <li> BGP Neighbor 10: $dhcp_r3 -> interface 7 </li>
		x       <li> BGP Neighbor 11: $dhcp_r3 -> interface 8 </li>
		x       <li> BGP Neighbor 12: $dhcp_r3 -> interface 9 </li>
		x       <li> BGP Neighbor 13 $dhcp_r3 -> interface 13 </li>
		x       </ol>
		x       <p> Starting with IxNetwork 6.30SP1 this parameter accepts handles returned by
		x       interface_config procedure with -l23_config_type static_type setting in the following format:
		x       <IP Range Handle>|<interface index X>,<interface index Y>-<interface index Z>, ...
		x       The IP ranges are separated from the Interface Index identifiers with the (|) character.
		x       The Interface Index identifiers are separated with comas (,).
		x       A range of Interface Index identifiers can be defined using the dash (-) character. </p>
		x       <p> Ranges along with the Interface Index identifiers are grouped together in TCL Lists. The
		x       lists can contain mixed items, protocol interface handles returned by interface_config
		x       with -l23_config_type protocol_interface and with -l23_config_type static_type. </p>
		x       <p> Example:
		x       count 10 (10 BGP neighbors). 3 IP range handles returned by ::ixia::interface_config.
		x       Each IP range has 20 sessions (interfaces). If we pass a -interface_handle
		x       in the following format: [list $ip_r1|1,5 $ip_r2|1-3 $ip_r3|1,3,5-9,13]
		x       The interfaces will be distributed to the routers in the following manner: </p>
		x       <ol>
		x       <li> BGP Neighbor 1: $ip_r1 -> interface 1 </li>
		x       <li> BGP Neighbor 2: $ip_r1 -> interface 5 </li>
		x       <li> BGP Neighbor 3: $ip_r2 -> interface 1 </li>
		x       <li> BGP Neighbor 4: $ip_r2 -> interface 2 </li>
		x       <li> BGP Neighbor 5: $ip_r2 -> interface 3 </li>
		x       <li> BGP Neighbor 6: $ip_r3 -> interface 1 </li>
		x       <li> BGP Neighbor 7: $ip_r3 -> interface 3 </li>
		x       <li> BGP Neighbor 8: $ip_r3 -> interface 5 </li>
		x       <li> BGP Neighbor 9: $ip_r3 -> interface 6 </li>
		x       <li> BGP Neighbor 10: $ip_r3 -> interface 7 </li>
		x       <li> BGP Neighbor 11: $ip_r3 -> interface 8 </li>
		x       <li> BGP Neighbor 12: $ip_r3 -> interface 9 </li>
		x       <li> BGP Neighbor 13 $ip_r3 -> interface 13 </li>
		x       </ol>
		x       <p> Valid for mode create for IxTclNetwork only. </p>
		n   -retry_time
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -hold_time
		        Configures the hold time for BGP sessions for this Neighbor.
		        Keepalives are sent out every one-third of this interval.If the
		        default value is 90, KeepAlive messages are sent every 30 seconds.
		    -neighbor_type
		        Sets the BGP neighbor type.
		    -graceful_restart_enable
		        Will enable graceful restart (HA) on the BGP4 neighbor.
		    -restart_time
		        If -graceful_restart_enable is set, sets the amount of time following
		        a restart operation allowed to re-establish a BGP session, in seconds.
		    -stale_time
		        If -graceful_restart_enable is set, sets the amount of time
		        after which an End-Of-RIB marker is sent in an Update
		        message to the peer to allow time for routing convergence via IGP
		        and BGP selection, in seconds.Stale routing information for that
		        address family is then deleted by the receiving peer.
		    -tcp_window_size
		        For External BGP neighbor only.The TCP window used for
		        communications from the neighbor.
		n   -retries
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -local_router_id_enable
		        Enables the BGP4 local router id option.
		    -netmask
		        Netmask represents ipv4_prefix_length / ipv6_prefix_length for Protocol Interface.
		        It is used in case Protocols Interface and BGP is configured from same BGP command without configure IP addresses in interface_config.
		    -mac_address_start
		        Initial MAC address of the interfaces created for the BGP4 neighbor.
		x   -mac_address_step
		x       The incrementing step for thr MAC address of the dirrectly connected
		x       interfaces created for the BGP4 neighbor.
		x       This option is valid only when IxTclNetwork API is used.
		x   -ipv4_mdt_nlri
		x       If checked, this BGP/BGP+ router/peer supports IPv4 MDT address family messages.
		x   -ipv4_capability_mdt_nlri
		x       If checked, this BGP/BGP+ router/peer supports IPv4 MDT address family messages.
		    -ipv4_unicast_nlri
		        If used, support for IPv4 Unicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_capability_unicast_nlri
		        If used, support for IPv4 Unicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_filter_unicast_nlri
		        If used, support for IPv4 Unicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_multicast_nlri
		        If used, support for IPv4 Multicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_capability_multicast_nlri
		        If used, support for IPv4 Multicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_filter_multicast_nlri
		        If used, support for IPv4 Multicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_mpls_nlri
		        If used, support for IPv4 MPLS is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_capability_mpls_nlri
		        If used, support for IPv4 MPLS is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_filter_mpls_nlri
		        If used, support for IPv4 MPLS is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_mpls_vpn_nlri
		        If used, support for IPv4 MPLS VPN is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_capability_mpls_vpn_nlri
		        If used, support for IPv4 MPLS VPN is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv4_filter_mpls_vpn_nlri
		        If used, support for IPv4 MPLS VPN is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_unicast_nlri
		        If used, support for IPv6 Unicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_capability_unicast_nlri
		        If used, support for IPv6 Unicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_filter_unicast_nlri
		        If used, support for IPv6 Unicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_multicast_nlri
		        If used, support for IPv6 Multicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_capability_multicast_nlri
		        If used, support for IPv6 Multicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_filter_multicast_nlri
		        If used, support for IPv6 Multicast is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_mpls_nlri
		        If used, support for IPv6 MPLS is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_capability_mpls_nlri
		        If used, support for IPv6 MPLS is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_filter_mpls_nlri
		        If used, support for IPv6 MPLS is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_mpls_vpn_nlri
		        If used, support for IPv6 MPLS VPN is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_capability_mpls_vpn_nlri
		        If used, support for IPv6 MPLS VPN is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		    -ipv6_filter_mpls_vpn_nlri
		        If used, support for IPv6 MPLS VPN is advertised in the Capabilities
		        Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		        message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		x   -capability_route_refresh
		x       Route Refresh
		x   -capability_route_constraint
		x       Route Constraint
		x   -local_loopback_ip_addr
		x       Required when the -ipv4_mpls_vpn_nlri option is used.
		x   -local_loopback_ip_prefix_length
		x       Prefix length for local_loopback_ip_addr.
		x   -local_loopback_ip_addr_step
		x       Required when the -ipv4_mpls_vpn_nlri option is used.
		x   -remote_loopback_ip_addr
		x       Required when the -ipv4_mpls_vpn_nlri option is used.
		x       This parameter is mandatory when -mode is create, and
		x       parameter -neighbor_type is internal and
		x       and ipv4_mpls_nlri, ipv6_mpls_nlri, ipv4_mpls_vpn_nlri, and
		x       ipv6_mpls_vpn_nlri are enabled.
		x   -remote_loopback_ip_addr_step
		x       Required when the -ipv4_mpls_vpn_nlri option is used.
		x   -ttl_value
		x       This attribute represents the limited number of iterations that a unit of data can experience
		x       before the data is discarded.
		x   -updates_per_iteration
		x       When the protocol server operates on older ports that do not possess
		x       a local processor, this tuning parameter controls how many UPDATE
		x       messages are sent at a time. When many routers are being simulated on
		x       such a port, changing this value may help to increase or decrease
		x       performance.
		x   -bfd_registration
		x       Enable or disable BFD registration.
		x   -bfd_registration_mode
		x       Set BFD registration mode to single hop or multi hop.
		n   -override_existence_check
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -override_tracking
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -no_write
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vpls
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -vpls_nlri
		        This BGP/BGP+ router/peer supports BGP/BGP+ VPLS per the Kompella draft.
		        This will enable the L2 Sites. If present, means VPLS capabilities are enabled.
		    -vpls_capability_nlri
		        This BGP/BGP+ router/peer supports BGP/BGP+ VPLS per the Kompella draft.
		        This will enable the L2 Sites. If present, means VPLS capabilities are enabled.
		    -vpls_filter_nlri
		        This BGP/BGP+ router/peer supports BGP/BGP+ VPLS per the Kompella draft.
		        This will enable the L2 Sites. If present, means VPLS capabilities are enabled.
		n   -advertise_host_route
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -modify_outgoing_as_path
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -remote_confederation_member
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -reset
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -route_refresh
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -routes_per_msg
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -suppress_notify
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -timeout
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -update_msg_size
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vlan_cfi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -act_as_restarted
		x       Act as restarted
		x   -discard_ixia_generated_routes
		x       Discard Ixia Generated Routes
		x   -local_router_id_type
		x       BGP ID Same as Router ID
		x   -send_ixia_signature_with_routes
		x       Send Ixia Signature With Routes
		x   -enable_flap
		x       Flap
		x   -flap_up_time
		x       Uptime in Seconds
		x   -flap_down_time
		x       Downtime in Seconds
		x   -ipv4_multicast_vpn_nlri
		x       IPv4 Multicast VPN
		x   -ipv4_capability_multicast_vpn_nlri
		x       IPv4 Multicast VPN
		x   -ipv4_filter_multicast_vpn_nlri
		x       IPv4 Multicast VPN
		x   -ipv6_multicast_vpn_nlri
		x       IPv6 Multicast VPN
		x   -ipv6_capability_multicast_vpn_nlri
		x       IPv6 Multicast VPN
		x   -ipv6_filter_multicast_vpn_nlri
		x       IPv6 Multicast VPN
		x   -filter_ipv4_multicast_bgp_mpls_vpn
		x       Filter IPv4 Multicast BGP/MPLS VPN
		x   -filter_ipv6_multicast_bgp_mpls_vpn
		x       Filter IPv4 Multicast BGP/MPLS VPN
		x   -ipv4_multicast_bgp_mpls_vpn
		x       IPv4 Multicast BGP/MPLS VPN
		x   -ipv6_multicast_bgp_mpls_vpn
		x       IPv6 Multicast BGP/MPLS VPN
		x   -advertise_end_of_rib
		x       Advertise End-Of-RIB
		x   -configure_keepalive_timer
		x       Configure Keepalive Timer
		    -keepalive_timer
		        Keepalive Timer
		    -staggered_start_enable
		        Enables staggered start of neighbors.
		    -staggered_start_time
		        When the -staggered_start_enable flag is used, this is the duration of
		        the start process in seconds.
		x   -start_rate_enable
		x       Enable bgp globals start rate
		x   -start_rate_interval
		x       Time interval used to calculate the rate for triggering an action (rate = count/interval)
		x   -start_rate
		x       Number of times an action is triggered per time interval
		x   -start_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		x   -stop_rate_enable
		x       Enable bgp globals stop rate
		x   -stop_rate_interval
		x       Time interval used to calculate the rate for triggering an action (rate = count/interval)
		x   -stop_rate
		x       Number of times an action is triggered per time interval
		x   -stop_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		    -active_connect_enable
		        For External BGP neighbor.If set, a HELLO message is actively sent
		        when BGP testing starts.Otherwise, the port waits for the DUT to
		        send its HELLO message.
		x   -disable_received_update_validation
		x       Disable Received Update Validation (Enabled for High Performance)
		x   -enable_ad_vpls_prefix_length
		x       Enable AD VPLS Prefix Length in Bits
		x   -ibgp_tester_as_four_bytes
		x       Tester 4 Byte AS# for iBGP
		x   -ibgp_tester_as_two_bytes
		x       Tester AS# for iBGP
		x   -initiate_ebgp_active_connection
		x       Initiate eBGP Active Connection
		x   -initiate_ibgp_active_connection
		x       Initiate iBGP Active Connection
		x   -mldp_p2mp_fec_type
		x       MLDP P2MP FEC Type (Hex)
		x   -request_vpn_label_exchange_over_lsp
		x       Request VPN Label Exchange over LSP
		x   -trigger_vpls_pw_initiation
		x       Trigger VPLS PW Initiation
		x   -as_path_set_mode
		x       For External routing only.
		x       Optional setup for the AS-Path.
		x   -router_id
		x       The ID of the router to be emulated.
		x   -router_id_step
		x       The value use to increment the router_id when count > 1.
		x       (DEFAULT = 0.0.0.1)
		x   -filter_link_state
		x       If used, support for Link State is advertised in the Capabilities
		x       Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		x       message and in addition, for IxTclNetwork, also sets the filters for the respective learned Link State
		x   -capability_linkstate_nonvpn
		x       If used, support for Link State is advertised in the Capabilities
		x       Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		x       message and in addition, for IxTclNetwork, also sets the filters for the respective learned Link State
		x   -bgp_ls_id
		x       BGP-LS ID
		x   -instance_id
		x       BGP-LS Instance ID
		x   -number_of_communities
		x       Number of Communities
		x   -enable_community
		x       Enable Community
		x   -community_type
		x       BGP L3 Site Target Types
		x   -community_as_number
		x       AS #
		x   -community_last_two_octets
		x       Last Two Octets
		x   -number_of_ext_communities
		x       Number of Extended Communities
		x   -enable_ext_community
		x       Enable Ext Community
		x   -ext_communities_type
		x       Type
		x   -ext_communities_subtype
		x       SubType
		x   -ext_community_as_number
		x       BGP LS Ext Community AS #
		x   -ext_community_target_assigned_number_4_octets
		x       BGP LS Ext Target Assigned Number 4
		x   -ext_community_as_4_bytes
		x       BGP LS Ext Community AS 4 #
		x   -ext_community_target_assigned_number_2_octets
		x       BGP LS Ext Target Assigned Number 2
		x   -ext_community_ip
		x       BGP LS Ext IP
		x   -ext_community_opaque_data
		x       Opaque Data (Hex)
		x   -enable_override_peer_as_set_mode
		x       enable_override_peer_as_set_mode
		x   -bgp_ls_as_set_mode
		x       For External routing only.
		x       Optional setup for the AS-Path.
		x   -number_of_as_path_segments
		x       Number of AS Path Segments
		x   -enable_as_path_segments
		x       Enable AS Path Segments
		x   -enable_as_path_segment
		x       Enable AS Path Segment
		x   -number_of_as_number_in_segment
		x       Number of AS Path Segments
		x   -as_path_segment_type
		x       as_path_segment_type
		x   -as_path_segment_enable_as_number
		x       enable as number
		x   -as_path_segment_as_number
		x       AS Path Segment AS Number
		x   -number_of_clusters
		x       Number of Communities
		x   -enable_cluster
		x       Enable cluster
		x   -cluster_id
		x       BGP LS Cluster ID
		x   -active_ethernet_segment
		x       Activates the ethernet segment
		x   -esi_type
		x       ESI Type
		x   -esi_value
		x       ESI Value
		x   -b_mac_prefix
		x       B-MAC Prefix
		x   -b_mac_prefix_length
		x       B-MAC Prefix Length
		x   -use_same_sequence_number
		x       Use B-MAC Same Sequence Number
		x   -include_mac_mobility_extended_community
		x       Include MAC Mobility Extended Community
		x   -enable_sticky_static_flag
		x       Enable B-MAC Sticky/Static Flag
		x   -support_multihomed_es_auto_discovery
		x       Support Multi-homed ES Auto Discovery
		x   -auto_configure_es_import
		x       Auto Configure ES-Import
		x   -es_import
		x       ES Import
		x   -df_election_timer
		x       DF Election Timer(s)
		x   -support_fast_convergence
		x       Support Fast Convergence
		x   -enable_single_active
		x       Enable Single-Active
		x   -esi_label
		x       ESI Label
		x   -advertise_aliasing_automatically
		x       Advertise Aliasing Automatically when the protocol starts
		x   -advertise_aliasing_before_AdPerEsRoute
		x       Advertise Aliasing before AD Per ES Route
		x   -aliasing_route_granularity
		x       Aliasing Route Granularity
		x   -advertise_inclusive_multicast_route
		x       Support Inclusive Multicast Ethernet Tag Route (RT Type 3)
		x   -evis_count
		x       Number of EVIs
		x   -enable_next_hop
		x       Enable Next Hop
		x   -set_next_hop
		x       Set Next Hop
		x   -set_next_hop_ip_type
		x       Set Next Hop IP Type
		x   -ipv4_next_hop
		x       IPv4 Next Hop
		x   -ipv6_next_hop
		x       IPv6 Next Hop
		x   -enable_origin
		x       Enable Origin
		x   -origin
		x       Origin
		x   -enable_local_preference
		x       Enable Local Preference
		x   -local_preference
		x       Local Preference
		x   -enable_multi_exit_discriminator
		x       Enable Multi Exit
		x   -multi_exit_discriminator
		x       Multi Exit
		x   -enable_atomic_aggregate
		x       Enable Atomic Aggregate
		x   -enable_aggregator_id
		x       Enable Aggregator ID
		x   -aggregator_id
		x       Aggregator ID
		x   -aggregator_as
		x       Aggregator AS
		x   -enable_originator_id
		x       Enable Originator ID
		x   -originator_id
		x       Originator ID
		x   -no_of_clusters
		x       Number of Clusters
		x   -use_control_word
		x       Use Control Word
		x   -vtep_ipv4_address
		x       VTEP IP Address
		x   -vtep_ipv6_address
		x       VTEP IP Address
		x   -routers_mac_address
		x       Router's Mac Address
		x   -ethernet_segment_name
		x       Name of NGPF element, guaranteed to be unique in Scenario
		x   -ethernet_segments_count
		x       Number of Ethernet Segments
		x   -filter_evpn
		x       Check box for EVPN filter
		x   -evpn
		x       Check box for EVPN
		x   -operational_model
		x       Operational Model
		x   -routers_mac_or_irb_mac_address
		x       Router's MAC/IRB MAC Address
		x   -ip_type
		x       IP Type
		x   -ip_address
		x       IPv4 Address
		x   -ipv6_address
		x       IPv6 Address
		x   -enable_b_mac_mapped_ip
		x       Activates the ethernet segment
		x   -no_of_b_mac_mapped_ips
		x       Number of B-MAC Mapped IPs
		x   -capability_ipv4_unicast_add_path
		x       Capability Ipv4 Unicast AddPath
		x   -capability_ipv6_unicast_add_path
		x       Capability Ipv6 Unicast AddPath
		x   -capability_ipv6_next_hop_encoding
		x       Capability Ipv6 Unicast AddPath
		x   -ipv4_mpls_add_path_mode
		x       IPv4 MPLS Add Path Mode
		x   -ipv6_mpls_add_path_mode
		x       IPv6 MPLS Add Path Mode
		x   -ipv4_unicast_add_path_mode
		x       IPv4 Unicast Add Path Mode
		x   -ipv6_unicast_add_path_mode
		x       IPv6 Unicast Add Path Mode
		x   -ipv4_mpls_capability
		x       Ipv4 Mpls Capability
		x   -ipv6_mpls_capability
		x       Ipv6 Mpls Capability
		x   -capability_ipv4_mpls_add_path
		x       Capability Ipv4 Mpls AddPath
		x   -capability_ipv6_mpls_add_path
		x       Capability Ipv6 Mpls AddPath
		x   -custom_sid_type
		x       Custom SID Type for BGP 3107
		x   -srgb_count
		x       SRGB Count for BGP 3107
		x   -start_sid
		x       Start SID for BGP 3107
		x   -sid_count
		x       SID Count for BGP 3107
		x   -ipv4_multiple_mpls_labels_capability
		x       IPv4 Multiple MPLS Labels Capability
		x   -ipv6_multiple_mpls_labels_capability
		x       IPv6 Multiple MPLS Labels Capability
		x   -mpls_labels_count_for_ipv4_mpls_route
		x       MPLS Labels Count For IPv4 MPLS Route
		x   -mpls_labels_count_for_ipv6_mpls_route
		x       MPLS Labels Count For IPv6 MPLS Route
		x   -noOfUserDefinedAfiSafi
		x       Number of User Defined Custom AFI-SAFI
		x   -afiSafi_active
		x       Select the Active check box to activate the Custom AFI SAFI.
		x   -afiValue
		x       AFI Value for Custom AFI SAFI.
		x   -safiValue
		x       SAFI Value for Custom AFI SAFI.
		x   -lengthOfData
		x       Length in bytes for Custom AFI SAFI.
		x   -dataValue
		x       Data Value for Custom AFI SAFI.
		x   -ipv4_unicast_flowSpec_nlri
		x       If used, support for IPv4 Unicast FlowSpec is advertised in the Capabilities
		x       Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		x       message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		x   -capability_ipv4_unicast_flowSpec
		x       IPv4 Unicast Flow Spec
		x   -filter_ipv4_unicast_flowSpec
		x       Filter IPv4 Unicast Flow Spec
		x   -ipv6_unicast_flowSpec_nlri
		x       If used, support for IPv6 Unicast FlowSpec is advertised in the Capabilities
		x       Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		x       message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		x   -capability_ipv6_unicast_flowSpec
		x       IPv6 Unicast Flow Spec
		x   -filter_ipv6_unicast_flowSpec
		x       Filter IPv6 Unicast Flow Spec
		x   -always_include_tunnel_enc_ext_community
		x       Always Include Tunnel Encapsulation Extended Community
		x   -ip_vrf_to_ip_vrf_type
		x       IP-VRF-to-IP-VRF Model Type
		x   -irb_interface_label
		x       Label to be used for Route Type 2 carrying IRB MAC and/or IRB IP in Route Type 2
		x   -irb_ipv4_address
		x       IRB IPv4 Address
		x   -irb_ipv6_address
		x       IRB IPv6 Address
		x   -ipv4_srte_policy_nlri
		x       If used, support for IPv4 SRTE Policies is advertised in the Capabilities
		x       Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		x       message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		x   -capability_ipv4_srte_policy
		x       IPv4 SRTE Policies
		x   -filter_ipv4_srte_policy
		x       Filter IPv4 SRTE Policies
		x   -ipv6_srte_policy_nlri
		x       If used, support for IPv6 SRTE Policies is advertised in the Capabilities
		x       Optional Parameter / Multiprotocol Extensions parameter in the OPEN
		x       message and in addition, for IxTclNetwork, also sets the filters for the respective learned routes.
		x   -capability_ipv6_srte_policy
		x       IPv6 SRTE Policies Capabilities
		x   -filter_ipv6_srte_policy
		x       Filter IPv6 SRTE Policies
		x   -srte_policy_safi
		x       SR TE Policy SAFI
		x   -srte_policy_attr_type
		x       SR TE Policy Tunnel Encaps Attribute Type
		x   -srte_policy_type
		x       SR TE Policy Tunnel Type for SR Policy
		x   -srte_remote_endpoint_type
		x       SR TE Policy Remote Endpoint Sub-TLV Type
		x   -srte_color_type
		x       SR TE Policy Color Sub-TLV Type
		x   -srte_preference_type
		x       SR TE Policy Preference Sub-TLV Type
		x   -srte_binding_type
		x       SR TE Policy Binding Sub-TLV Type
		x   -srte_segment_list_type
		x       SR TE Policy Segment List Sub-TLV Type
		x   -srte_weight_type
		x       SR TE Policy Weight Sub-TLV Type
		x   -srte_mplsSID_type
		x       SR TE Policy MPLS SID Type
		x   -srte_ipv6SID_type
		x       SR TE Policy IPv6 SID Type
		x   -srte_ipv4_node_address_type
		x       SR TE Policy IPv4 Node Address Type
		x   -srte_ipv6_node_address_type
		x       SR TE Policy IPv6 Node Address Type
		x   -srte_ipv4_node_address_index_type
		x       SR TE Policy IPv4 Node Address and Index Type
		x   -srte_ipv4_local_remote_address
		x       SR TE Policy IPv4 Local and remote address
		x   -srte_ipv6_node_address_index_type
		x       SR TE Policy IPv6 Node Address and Index Type
		x   -srte_ipv6_local_remote_address
		x       SR TE Policy IPv6 Local and remote address
		x   -srte_include_length
		x       Include length Field in SR TE Policy NLRI
		x   -srte_length_unit
		x       Length unit in SR TE Policy NLRI
		
		 Return Values:
		    A list containing the lscommunities  rtr protocol stack handles that were added by the command (if any).
		x   key:lscommunities_handle_rtr     value:A list containing the lscommunities  rtr protocol stack handles that were added by the command (if any).
		    A list containing the lsaspath  rtr protocol stack handles that were added by the command (if any).
		x   key:lsaspath_handle_rtr          value:A list containing the lsaspath  rtr protocol stack handles that were added by the command (if any).
		    A list containing the bgp ethernet segment protocol stack handles that were added by the command (if any).
		x   key:bgp_ethernet_segment_handle  value:A list containing the bgp ethernet segment protocol stack handles that were added by the command (if any).
		    A list containing the bgp b mac mapped ip protocol stack handles that were added by the command (if any).
		x   key:bgp_b_mac_mapped_ip_handle   value:A list containing the bgp b mac mapped ip protocol stack handles that were added by the command (if any).
		    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		x   key:lscommunities_handles_rtr    value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		x   key:lsaspath_handles_rtr         value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    $::SUCCESS | $::FAILURE
		    key:status                       value:$::SUCCESS | $::FAILURE
		    When status is $::FAILURE, contains more information
		    key:log                          value:When status is $::FAILURE, contains more information
		    Handle of bgpipv4peer or bgpipv6peer configured
		    key:bgp_handle                   value:Handle of bgpipv4peer or bgpipv6peer configured
		    Item Handle of any bgpipv4peer or bgpipv6peer configured Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    key:handles                      value:Item Handle of any bgpipv4peer or bgpipv6peer configured Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		    {status $::SUCCESS} {bgp_handle /topology:1/deviceGroup:1/ethernet:1/ipv4:1/bgpIpv4Peer:1} {handle {/topology:1/deviceGroup:1/ethernet:1/ipv4:1/bgpIpv4Peer:1/item:1}}
		
		 Notes:
		    Coded versus functional specification.
		    When -handle is provided with the /globals value the arguments that configure global protocol
		    setting accept both multivalue handles and simple values.
		    When -handle is provided with a a protocol stack handle or a protocol session handle, the arguments
		    that configure global settings will only accept simple values. In this situation, these arguments will
		    configure only the settings of the parent device group or the ports associated with the parent topology.
		    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handles, lscommunities_handles_rtr, lsaspath_handles_rtr
		
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
				'emulation_bgp_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
