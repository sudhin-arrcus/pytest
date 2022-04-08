# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_ldp_config(self, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_ldp_config
		
		 Description:
		    This procedure configures LDP simulated routers and the router interfaces.
		
		 Synopsis:
		    emulation_ldp_config
		        [-handle                                        ANY]
		        [-mode                                          CHOICES create
		                                                        CHOICES delete
		                                                        CHOICES disable
		                                                        CHOICES enable
		                                                        CHOICES modify]
		n       [-port_handle                                   ANY]
		        [-label_adv                                     CHOICES unsolicited on_demand
		                                                        DEFAULT unsolicited]
		n       [-peer_discovery                                ANY]
		        [-count                                         NUMERIC
		                                                        DEFAULT 1]
		n       [-interface_handle                              ANY]
		n       [-interface_mode                                ANY]
		        [-intf_ip_addr                                  IPV4
		                                                        DEFAULT 0.0.0.0]
		        [-intf_prefix_length                            RANGE 1-32
		                                                        DEFAULT 24]
		        [-intf_ip_addr_step                             IPV4
		                                                        DEFAULT 0.0.1.0]
		x       [-loopback_ip_addr                              IPV4]
		x       [-loopback_ip_addr_step                         IPV4
		x                                                       DEFAULT 0.0.1.0]
		        [-intf_ipv6_addr                                IPV6
		                                                        DEFAULT 0:0:0:1::0]
		        [-intf_ipv6_prefix_length                       RANGE 1-64
		                                                        DEFAULT 64]
		        [-intf_ipv6_addr_step                           IPV6
		                                                        DEFAULT 0:0:0:1::0]
		x       [-loopback_ipv6_addr                            IPV6]
		x       [-loopback_ipv6_addr_step                       IPV6
		x                                                       DEFAULT 0:0:0:1::0]
		        [-lsr_id                                        IPV4]
		        [-label_space                                   RANGE 0-65535]
		        [-lsr_id_step                                   IPV4
		                                                        DEFAULT 0.0.1.0]
		        [-mac_address_init                              MAC]
		x       [-mac_address_step                              MAC
		x                                                       DEFAULT 0000.0000.0001]
		        [-remote_ip_addr                                IPV4]
		        [-remote_ip_addr_target                         IPV6]
		        [-remote_ip_addr_step                           IPV4]
		        [-remote_ip_addr_step_target                    IPV6]
		        [-hello_interval                                RANGE 0-65535]
		        [-hello_hold_time                               RANGE 0-65535]
		        [-keepalive_interval                            RANGE 0-65535]
		        [-keepalive_holdtime                            RANGE 0-65535]
		        [-discard_self_adv_fecs                         CHOICES 0 1]
		x       [-vlan                                          CHOICES 0 1
		x                                                       DEFAULT 0]
		        [-vlan_id                                       RANGE 0-4095]
		        [-vlan_id_mode                                  CHOICES fixed increment
		                                                        DEFAULT increment]
		        [-vlan_id_step                                  RANGE 0-4096
		                                                        DEFAULT 1]
		        [-vlan_user_priority                            RANGE 0-7
		                                                        DEFAULT 0]
		n       [-vpi                                           ANY]
		n       [-vci                                           ANY]
		n       [-vpi_step                                      ANY]
		n       [-vci_step                                      ANY]
		n       [-atm_encapsulation                             ANY]
		x       [-auth_mode                                     CHOICES null md5
		x                                                       DEFAULT null]
		x       [-auth_key                                      ANY]
		x       [-bfd_registration                              CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-bfd_registration_mode                         CHOICES single_hop multi_hop
		x                                                       DEFAULT multi_hop]
		n       [-atm_range_max_vpi                             ANY]
		n       [-atm_range_min_vpi                             ANY]
		n       [-atm_range_max_vci                             ANY]
		n       [-atm_range_min_vci                             ANY]
		n       [-atm_vc_dir                                    ANY]
		n       [-enable_explicit_include_ip_fec                ANY]
		n       [-enable_l2vpn_vc_fecs                          ANY]
		n       [-enable_remote_connect                         ANY]
		n       [-enable_vc_group_matching                      ANY]
		x       [-gateway_ip_addr                               IPV4]
		x       [-gateway_ip_addr_step                          IPV4
		x                                                       DEFAULT 0.0.1.0]
		x       [-gateway_ipv6_addr                             IPV6]
		x       [-gateway_ipv6_addr_step                        IPV6
		x                                                       DEFAULT 0:0:0:1::0]
		x       [-graceful_restart_enable                       CHOICES 0 1]
		n       [-no_write                                      ANY]
		x       [-reconnect_time                                RANGE 0-300000]
		x       [-recovery_time                                 RANGE 0-300000]
		x       [-reset                                         FLAG]
		x       [-targeted_hello_hold_time                      RANGE 0-65535]
		x       [-targeted_hello_interval                       RANGE 0-65535]
		n       [-override_existence_check                      ANY]
		n       [-override_tracking                             ANY]
		n       [-cfi                                           ANY]
		n       [-config_seq_no                                 ANY]
		n       [-egress_label_mode                             ANY]
		n       [-label_start                                   ANY]
		n       [-label_step                                    ANY]
		n       [-label_type                                    ANY]
		n       [-loop_detection                                ANY]
		n       [-max_lsps                                      ANY]
		n       [-max_pdu_length                                ANY]
		n       [-message_aggregation                           ANY]
		n       [-mtu                                           ANY]
		n       [-path_vector_limit                             ANY]
		n       [-timeout                                       ANY]
		n       [-transport_ip_addr                             ANY]
		n       [-user_priofity                                 ANY]
		n       [-vlan_cfi                                      ANY]
		x       [-peer_count                                    NUMERIC]
		x       [-interface_name                                ALPHA]
		x       [-interface_multiplier                          NUMERIC]
		x       [-interface_active                              CHOICES 0 1]
		x       [-target_name                                   ALPHA]
		x       [-target_multiplier                             NUMERIC]
		x       [-target_auth_key                               ANY]
		x       [-initiate_targeted_hello                       CHOICES 0 1]
		x       [-target_auth_mode                              CHOICES null md5]
		x       [-target_active                                 CHOICES 0 1]
		x       [-router_name                                   ALPHA]
		x       [-router_multiplier                             NUMERIC]
		x       [-router_active                                 CHOICES 0 1]
		x       [-targeted_peer_name                            ALPHA]
		x       [-start_rate_scale_mode                         CHOICES port device_group
		x                                                       DEFAULT port]
		x       [-start_rate_enabled                            CHOICES 0 1]
		x       [-start_rate                                    NUMERIC]
		x       [-start_rate_interval                           NUMERIC]
		x       [-stop_rate_scale_mode                          CHOICES port device_group
		x                                                       DEFAULT port]
		x       [-stop_rate_enabled                             CHOICES 0 1]
		x       [-stop_rate                                     NUMERIC]
		x       [-stop_rate_interval                            NUMERIC]
		x       [-lpb_interface_name                            ALPHA]
		x       [-lpb_interface_active                          CHOICES 0 1]
		x       [-root_ranges_count_v4                          NUMERIC]
		x       [-leaf_ranges_count_v4                          NUMERIC]
		x       [-root_ranges_count_v6                          NUMERIC]
		x       [-leaf_ranges_count_v6                          NUMERIC]
		x       [-ipv6_peer_count                               NUMERIC]
		x       [-ldp_version                                   CHOICES version1 version2]
		x       [-session_preference                            CHOICES any ipv4 ipv6]
		x       [-include_sac                                   ANY]
		x       [-enable_ipv4_fec                               ANY]
		x       [-enable_ipv6_fec                               ANY]
		x       [-enable_fec128                                 ANY]
		x       [-enable_fec129                                 ANY]
		x       [-ignore_received_sac                           ANY]
		x       [-enable_p2mp_capability                        ANY]
		x       [-enable_bfd_mpls_learned_lsp                   ANY]
		x       [-enable_lsp_ping_learned_lsp                   ANY]
		x       [-lsp_type                                      CHOICES p2MP]
		x       [-root_address                                  ANY]
		x       [-root_address_count                            ANY]
		x       [-root_address_step                             ANY]
		x       [-lsp_count_per_root                            ANY]
		x       [-label_value_start                             ANY]
		x       [-label_value_step                              ANY]
		x       [-continuous_increment_opaque_value_across_root ANY]
		x       [-number_of_tlvs                                NUMERIC]
		x       [-group_address_v4                              ANY]
		x       [-group_address_v6                              ANY]
		x       [-group_count_per_lsp                           ANY]
		x       [-group_count_per_lsp_root                      ANY]
		x       [-source_address_v4                             ANY]
		x       [-source_address_v6                             ANY]
		x       [-source_count_per_lsp                          ANY]
		x       [-filter_on_group_address                       ANY]
		x       [-start_group_address_v4                        ANY]
		x       [-start_group_address_v6                        ANY]
		x       [-active_leafrange                              ANY]
		x       [-name                                          ALPHA]
		x       [-active                                        ANY]
		x       [-type                                          ANY]
		x       [-tlv_length                                    ANY]
		x       [-value                                         ANY]
		x       [-increment                                     ANY]
		
		 Arguments:
		    -handle
		        An LDP handle returned from this procedure and now being used when
		        the -mode is anything but create.
		        When -handle is provided with the /globals value the arguments that configure global protocol
		        setting accept both multivalue handles and simple values.
		        When -handle is provided with a a protocol stack handle or a protocol session handle, the arguments
		        that configure global settings will only accept simple values. In this situation, these arguments will
		        configure only the settings of the parent device group or the ports associated with the parent topology.
		    -mode
		        The mode that is being performed. All but create require the use of
		        the -handle option.
		n   -port_handle
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -label_adv
		        The mode by which the simulated router advertises its FEC ranges.
		n   -peer_discovery
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -count
		        Defines the number of LDP interfaces to create.
		n   -interface_handle
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -interface_mode
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -intf_ip_addr
		        Interface IP address of the LDP session router. Mandatory when -mode is create.
		        When using IxTclNetwork (new API) this parameter can be omitted if -interface_handle is used.
		        For IxTclProtocol (old API), when -mode is modify and one of the layer
		        2-3 parameters (-intf_ip_addr, -gateway_ip_addr, -loopback_ip_addr, etc)
		        needs to be modified, the emulation_ldp_config command must be provided
		        with the entire list of layer 2-3 parameters. Otherwise they will be
		        set to their default values.
		    -intf_prefix_length
		        Prefix length on the interface.
		    -intf_ip_addr_step
		        Define interface IP address for multiple sessions.
		        Valid only for -mode create.
		x   -loopback_ip_addr
		x       The IP address of the unconnected protocol interface that will be
		x       created behind the intf_ip_addr interface. The loopback(unconnected)
		x       interface is the one that will be used for LDP emulation. This type
		x       of interface is needed when creating extended Martini sessions.
		x   -loopback_ip_addr_step
		x       Valid only for -mode create.
		x       The incrementing step for the loopback_ip_addr parameter.
		    -intf_ipv6_addr
		        Interface IP address of the LDP session router. Mandatory when -mode is create.
		        When using IxTclNetwork (new API) this parameter can be omitted if -interface_handle is used.
		        For IxTclProtocol (old API), when -mode is modify and one of the layer
		        2-3 parameters (-intf_ip_addr, -gateway_ip_addr, -loopback_ip_addr, etc)
		        needs to be modified, the emulation_ldp_config command must be provided
		        with the entire list of layer 2-3 parameters. Otherwise they will be
		        set to their default values.
		    -intf_ipv6_prefix_length
		        Prefix length on the interface.
		    -intf_ipv6_addr_step
		        Define interface IP address for multiple sessions.
		        Valid only for -mode create.
		x   -loopback_ipv6_addr
		x       The IP address of the unconnected protocol interface that will be
		x       created behind the intf_ip_addr interface. The loopback(unconnected)
		x       interface is the one that will be used for LDP emulation. This type
		x       of interface is needed when creating extended Martini sessions.
		x   -loopback_ipv6_addr_step
		x       Valid only for -mode create.
		x       The incrementing step for the loopback_ip_addr parameter.
		    -lsr_id
		        The ID of the router to be emulated.
		    -label_space
		        The label space identifier for the interface.
		    -lsr_id_step
		        Used to define the lsr_id step for multiple interface creations.
		        Valid only for -mode create.
		    -mac_address_init
		        MAC address to be used for the first session.
		x   -mac_address_step
		x       Valid only for -mode create.
		x       The incrementing step for the MAC address configured on the directly
		x       connected interfaces. Valid only when IxNetwork Tcl API is used.
		    -remote_ip_addr
		        The IPv4 address of a targeted peer.
		    -remote_ip_addr_target
		        The IPv6 address of a targeted peer.
		    -remote_ip_addr_step
		        When creating multiple sessions and using the -remote_ip_addr, tells
		        how to increment between sessions.
		        Valid only for -mode create.
		    -remote_ip_addr_step_target
		        When creating multiple sessions and using the -remote_ip_addr, tells
		        how to increment between sessions.
		        Valid only for -mode create.
		    -hello_interval
		        The amount of time, expressed in seconds, between transmitted
		        HELLO messages.
		    -hello_hold_time
		        The amount of time, expressed in seconds, that an LDP adjacency
		        will be maintained in the absence of a HELLO message.
		    -keepalive_interval
		        The amount of time, expressed in seconds, between keep-alive messages
		        sent from simulated routers to their adjacency in the absence of
		        other PDUs sent to the adjacency.
		    -keepalive_holdtime
		        The amount of time, expressed in seconds, that an LDP adjacency
		        will be maintained in the absence of a PDU received from the adjacency.
		    -discard_self_adv_fecs
		        Discard learned labels from the DUT that match any of the enabled
		        configured IPv4 FEC ranges.This flag is only set when LDP is
		        started.If it is to be changed later, LDP should be stopped,
		        the value changed and then restart LDP.
		x   -vlan
		x       Enables vlan on the directly connected LDP router interface.
		x       Valid options are: 0 - disable, 1 - enable.
		x       This option is valid only when -mode is create or -mode is modify
		x       and -handle is a LDP router handle.
		x       This option is available only when IxNetwork tcl API is used.
		    -vlan_id
		        VLAN ID for protocol interface.
		    -vlan_id_mode
		        For multiple neighbor configuration, configures the VLAN ID mode.
		    -vlan_id_step
		        Valid only for -mode create.
		        Defines the step for the VLAN ID when the VLAN ID mode is increment.
		        When vlan_id_step causes the vlan_id value to exceed its maximum value the
		        increment will be done modulo <number of possible vlan ids>.
		        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
		        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
		    -vlan_user_priority
		        VLAN user priority assigned to protocol interface.
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
		x   -auth_mode
		x       Select the type of cryptographic authentication to be used for this targeted peer.
		x   -auth_key
		x       Active only when "md5" is selected in the Authentication Type field.
		x       (String) Enter a value to be used as a "secret" MD5 key for authentication.
		x       The maximum length allowed is 255 characters.
		x       One MD5 key can be configured per interface.
		x   -bfd_registration
		x       Enable or disable BFD registration.
		x   -bfd_registration_mode
		x       Set BFD registration mode to single hop or multi hop.
		n   -atm_range_max_vpi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -atm_range_min_vpi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -atm_range_max_vci
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -atm_range_min_vci
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -atm_vc_dir
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -enable_explicit_include_ip_fec
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -enable_l2vpn_vc_fecs
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -enable_remote_connect
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -enable_vc_group_matching
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -gateway_ip_addr
		x       Gives the gateway IP address for the protocol interface that will
		x       be created for use by the simulated routers.
		x   -gateway_ip_addr_step
		x       Valid only for -mode create.
		x       Gives the step for the gateway IP address.
		x   -gateway_ipv6_addr
		x       Gives the gateway IP address for the protocol interface that will
		x       be created for use by the simulated routers.
		x   -gateway_ipv6_addr_step
		x       Valid only for -mode create.
		x       Gives the step for the gateway IP address.
		x   -graceful_restart_enable
		x       Will enable graceful restart (HA) on the LDP neighbor.
		n   -no_write
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -reconnect_time
		x       (in milliseconds) This Fault Tolerant (FT) Reconnect Timer value is
		x       advertised in the FT Session TLV in the Initialization message sent by
		x       a neighbor LSR. It is a request sent by an LSR to its neighbor(s) - in
		x       the event that the receiving neighbor detects that the LDP session has
		x       failed, the receiver should maintain MPLS forwarding state and wait
		x       for the sender to perform a restart of the control plane and LDP
		x       protocol. If the value = 0, the sender is indicating that it will not
		x       preserve its MPLS forwarding state across the restart.
		x       If -graceful_restart_enable is set.
		x   -recovery_time
		x       If -graceful_restart_enable is set; (in milliseconds)
		x       The restarting LSR is advertising the amount of time that it will
		x       retain its MPLS forwarding state. This time period begins when it
		x       sends the restart Initialization message, with the FT session TLV,
		x       to the neighbor LSRs (to re-establish the LDP session). This timer
		x       allows the neighbors some time to resync the LSPs in an orderly
		x       manner. If the value = 0, it means that the restarting LSR was not
		x       able to preserve the MPLS forwarding state.
		x   -reset
		x       If set, then all existing simulated routers will be removed
		x       before creating a new one.
		x   -targeted_hello_hold_time
		x       The amount of time, expressed in seconds, that an LDP adjacency will
		x       be maintained for a targeted peer in the absence of a HELLO message.
		x   -targeted_hello_interval
		x       The amount of time, expressed in seconds, between transmitted HELLO
		x       messages to targeted peers.
		n   -override_existence_check
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -override_tracking
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -cfi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -config_seq_no
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -egress_label_mode
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -label_start
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -label_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -label_type
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -loop_detection
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -max_lsps
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -max_pdu_length
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -message_aggregation
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -mtu
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -path_vector_limit
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -timeout
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -transport_ip_addr
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -user_priofity
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vlan_cfi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -peer_count
		x       Peer Count(multiplier)
		x   -interface_name
		x       NOT DEFINED
		x   -interface_multiplier
		x       number of layer instances per parent instance (multiplier)
		x   -interface_active
		x       Flag.
		x   -target_name
		x       NOT DEFINED
		x   -target_multiplier
		x       number of this object per parent object
		x   -target_auth_key
		x       MD5Key
		x   -initiate_targeted_hello
		x       Initiate Targeted Hello
		x   -target_auth_mode
		x       The Authentication mode which will be used.
		x   -target_active
		x       Enable or Disable LDP Targeted Peer
		x   -router_name
		x       NOT DEFINED
		x   -router_multiplier
		x       number of layer instances per parent instance (multiplier)
		x   -router_active
		x       Enable or Disable LDP Router
		x   -targeted_peer_name
		x       Targted Peer Name.
		x   -start_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		x   -start_rate_enabled
		x       Enabled
		x   -start_rate
		x       Number of times an action is triggered per time interval
		x   -start_rate_interval
		x       Time interval used to calculate the rate for triggering an action (rate = count/interval)
		x   -stop_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		x   -stop_rate_enabled
		x       Enabled
		x   -stop_rate
		x       Number of times an action is triggered per time interval
		x   -stop_rate_interval
		x       Time interval used to calculate the rate for triggering an action (rate = count/interval)
		x   -lpb_interface_name
		x       Name of NGPF element
		x   -lpb_interface_active
		x       Enable or Disable LDP Interface
		x   -root_ranges_count_v4
		x       The number of Root Ranges configured for this LDP router
		x   -leaf_ranges_count_v4
		x       The number of Leaf Ranges configured for this LDP router
		x   -root_ranges_count_v6
		x       The number of Root Ranges configured for this LDP router
		x   -leaf_ranges_count_v6
		x       The number of Leaf Ranges configured for this LDP router
		x   -ipv6_peer_count
		x       The number of Ipv6 peers
		x   -ldp_version
		x       Version of LDP. When RFC 5036 is chosen, LDP version is version 1. When draft-pdutta-mpls-ldp-adj-capability-00 is chosen, LDP version is version 2
		x   -session_preference
		x       The transport connection preference of the LDP router that is conveyed in Dual-stack capability TLV included in LDP Hello message.
		x   -include_sac
		x       Select to include 'State Advertisement Control Capability' TLV in Initialization message and Capability message
		x   -enable_ipv4_fec
		x       If selected, IPv4-Prefix LSP app type is enabled in SAC TLV.
		x   -enable_ipv6_fec
		x       If selected, IPv6-Prefix LSP app type is enabled in SAC TLV.
		x   -enable_fec128
		x       If selected, FEC128 P2P-PW app type is enabled in SAC TLV.
		x   -enable_fec129
		x       If selected, FEC129 P2P-PW app type is enabled in SAC TLV.
		x   -ignore_received_sac
		x       If selected, LDP Router ignores SAC TLV it receives.
		x   -enable_p2mp_capability
		x       If selected, LDP Router is P2MP capable.
		x   -enable_bfd_mpls_learned_lsp
		x       If selected, BFD MPLS is enabled.
		x   -enable_lsp_ping_learned_lsp
		x       If selected, LSP Ping is enabled for learned LSPs.
		x   -lsp_type
		x       LSP Type
		x   -root_address
		x       Root Address
		x   -root_address_count
		x       Root Address Count
		x   -root_address_step
		x       Root Address Step
		x   -lsp_count_per_root
		x       LSP Count Per Root
		x   -label_value_start
		x       Label Value Start
		x   -label_value_step
		x       Label Value Step
		x   -continuous_increment_opaque_value_across_root
		x       Continuous Increment Opaque Value Across Root
		x   -number_of_tlvs
		x       Number Of TLVs
		x   -group_address_v4
		x       IPv4 Group Address
		x   -group_address_v6
		x       IPv6 Group Address
		x   -group_count_per_lsp
		x       Group Count per LSP
		x   -group_count_per_lsp_root
		x       Group Count per LSP
		x   -source_address_v4
		x       IPv4 Source Address
		x   -source_address_v6
		x       IPv6 Source Address
		x   -source_count_per_lsp
		x       Source Count Per LSP
		x   -filter_on_group_address
		x       If selected, all the LSPs will belong to the same set of groups
		x   -start_group_address_v4
		x       Start Group Address(V4)
		x   -start_group_address_v6
		x       Start Group Address(V6)
		x   -active_leafrange
		x       Activate/Deactivate Configuration
		x   -name
		x       Name of NGPF element, guaranteed to be unique in Scenario
		x   -active
		x       If selected, Then the TLV is enabled
		x   -type
		x       Type
		x   -tlv_length
		x       Length
		x   -value
		x       Value
		x   -increment
		x       Increment Step
		
		 Return Values:
		    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
		x   key:ipv4_loopback_handle              value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
		    A list containing the ipv6 loopback protocol stack handles that were added by the command (if any).
		x   key:ipv6_loopback_handle              value:A list containing the ipv6 loopback protocol stack handles that were added by the command (if any).
		    A list containing the ipv4 protocol stack handles that were added by the command (if any).
		x   key:ipv4_handle                       value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
		    A list containing the ipv6 protocol stack handles that were added by the command (if any).
		x   key:ipv6_handle                       value:A list containing the ipv6 protocol stack handles that were added by the command (if any).
		    A list containing the ethernet protocol stack handles that were added by the command (if any).
		x   key:ethernet_handle                   value:A list containing the ethernet protocol stack handles that were added by the command (if any).
		    A list containing the ldp basic router protocol stack handles that were added by the command (if any).
		x   key:ldp_basic_router_handle           value:A list containing the ldp basic router protocol stack handles that were added by the command (if any).
		    A list containing the ldp connected interface protocol stack handles that were added by the command (if any).
		x   key:ldp_connected_interface_handle    value:A list containing the ldp connected interface protocol stack handles that were added by the command (if any).
		    A list containing the ldp targeted router protocol stack handles that were added by the command (if any).
		x   key:ldp_targeted_router_handle        value:A list containing the ldp targeted router protocol stack handles that were added by the command (if any).
		    A list containing the leaf ranges protocol stack handles that were added by the command (if any).
		x   key:leaf_ranges                       value:A list containing the leaf ranges protocol stack handles that were added by the command (if any).
		    A list containing the root ranges protocol stack handles that were added by the command (if any).
		x   key:root_ranges                       value:A list containing the root ranges protocol stack handles that were added by the command (if any).
		    A list containing the ldpv6 basic router protocol stack handles that were added by the command (if any).
		x   key:ldpv6_basic_router_handle         value:A list containing the ldpv6 basic router protocol stack handles that were added by the command (if any).
		    A list containing the ldpv6 connected interface protocol stack handles that were added by the command (if any).
		x   key:ldpv6_connected_interface_handle  value:A list containing the ldpv6 connected interface protocol stack handles that were added by the command (if any).
		    A list containing the ldpv6 targeted router protocol stack handles that were added by the command (if any).
		x   key:ldpv6_targeted_router_handle      value:A list containing the ldpv6 targeted router protocol stack handles that were added by the command (if any).
		    $::SUCCESS | $::FAILURE
		    key:status                            value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log                               value:If status is failure, detailed information provided.
		    List of LDP routers created Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    key:handle                            value:List of LDP routers created Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		
		 Examples:
		    See files starting with LDP_ in the Samples subdirectory.  Also see some of the L2VPN, L3VPN, MPLS, and MVPN sample files for further examples of the LDP usage.
		    See the LDP example in Appendix A, "Example APIs," for one specific example usage.
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    Coded versus functional specification.
		    If one wants to modify the ineterface to which the protocol interface is
		    connected, one has to specify the correct MAC address of that interface.
		    If this requirement is not fulfilled, the interface is not guaranteed to
		    be correctly determined because more interfaces can have the exact same
		    configuration.
		    When -handle is provided with the /globals value the arguments that configure global protocol
		    setting accept both multivalue handles and simple values.
		    When -handle is provided with a a protocol stack handle or a protocol session handle, the arguments
		    that configure global settings will only accept simple values. In this situation, these arguments will
		    configure only the settings of the parent device group or the ports associated with the parent topology.
		    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle
		
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
				'emulation_ldp_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
