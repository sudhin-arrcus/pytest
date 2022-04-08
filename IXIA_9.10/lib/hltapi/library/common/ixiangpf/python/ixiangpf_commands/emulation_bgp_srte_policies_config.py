# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_bgp_srte_policies_config(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_bgp_srte_policies_config
		
		 Description:
		    This procedure configures BGP IPv4 and IPv6 SRTE Policies
		
		 Synopsis:
		    emulation_bgp_srte_policies_config
		        -mode                                           CHOICES create enable modify
		        [-handle                                        ANY]
		x       [-no_of_srte_policies                           NUMERIC]
		x       [-active                                        CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-policy_type                                   CHOICES ipv4 ipv6]
		x       [-distinguisher                                 NUMERIC]
		x       [-policy_color                                  NUMERIC]
		x       [-end_pointV4                                   IPV4]
		x       [-end_pointV6                                   IPV6]
		x       [-no_of_tunnels                                 RANGE 1-2]
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
		x       [-enable_add_path                               CHOICES 0 1]
		x       [-add_path_id                                   NUMERIC]
		x       [-enable_community                              CHOICES 0 1]
		x       [-no_of_communities                             RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-community_type                                CHOICES no_export
		x                                                       CHOICES no_advertised
		x                                                       CHOICES noexport_subconfed
		x                                                       CHOICES manual
		x                                                       CHOICES llgr_stale
		x                                                       CHOICES no_llgr
		x                                                       DEFAULT no_export]
		x       [-community_as_number                           RANGE 0-65535
		x                                                       DEFAULT 0]
		x       [-community_last_two_octets                     RANGE 0-65535
		x                                                       DEFAULT 0]
		x       [-enable_extended_community                     CHOICES 0 1]
		x       [-no_of_extended_community                      RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-ext_communities_type                          CHOICES admin_as_two_octet
		x                                                       CHOICES admin_ip
		x                                                       CHOICES admin_as_four_octet
		x                                                       CHOICES opaque
		x                                                       CHOICES evpn
		x                                                       CHOICES admin_as_two_octet_link_bw
		x                                                       DEFAULT admin_as_two_octet]
		x       [-ext_communities_subtype                       CHOICES route_target
		x                                                       CHOICES origin
		x                                                       CHOICES extended_bandwidth
		x                                                       CHOICES color
		x                                                       CHOICES encapsulation
		x                                                       CHOICES mac_address
		x                                                       DEFAULT route_target]
		x       [-ext_community_as_number                       RANGE 0-65535
		x                                                       DEFAULT 1]
		x       [-ext_community_target_assigned_number_4_octets NUMERIC
		x                                                       DEFAULT 1]
		x       [-ext_community_ip                              IP]
		x       [-ext_community_as_4_bytes                      NUMERIC
		x                                                       DEFAULT 1]
		x       [-ext_community_target_assigned_number_2_octets NUMERIC
		x                                                       DEFAULT 1]
		x       [-ext_community_opaque_data                     HEX]
		x       [-ext_community_colorCObits                     CHOICES 00 01 10 11
		x                                                       DEFAULT 00]
		x       [-ext_community_colorReservedBits               NUMERIC]
		x       [-ext_community_colorValue                      NUMERIC]
		x       [-ext_community_linkBandwidth                   NUMERIC]
		x       [-enable_override_peer_as_set_mode              CHOICES 0 1]
		x       [-as_set_mode                                   CHOICES include_as_seq
		x                                                       CHOICES include_as_seq_conf
		x                                                       CHOICES include_as_set
		x                                                       CHOICES include_as_set_conf
		x                                                       CHOICES no_include
		x                                                       CHOICES prepend_as
		x                                                       DEFAULT no_include]
		x       [-enable_as_path_segments                       CHOICES 0 1]
		x       [-no_of_as_path_segments                        RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-enable_as_path_segment                        CHOICES 0 1]
		x       [-as_path_segment_type                          CHOICES as_set
		x                                                       CHOICES as_seq
		x                                                       CHOICES as_set_confederation
		x                                                       CHOICES as_seq_confederation
		x                                                       DEFAULT as_set]
		x       [-number_of_as_number_in_segment                RANGE 0-50
		x                                                       DEFAULT 1]
		x       [-as_path_segment_enable_as_number              CHOICES 0 1]
		x       [-as_path_segment_as_number                     NUMERIC
		x                                                       DEFAULT 1]
		x       [-enable_cluster                                CHOICES 0 1]
		x       [-no_of_clusters                                RANGE 0-32
		x                                                       DEFAULT 1]
		x       [-cluster_id                                    IP]
		x       [-active_tunnel_tlv                             CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-no_of_segment_lists                           RANGE 1-10]
		x       [-enable_remote_endpoint_subtlv                 CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-as_number                                     NUMERIC
		x                                                       DEFAULT 0]
		x       [-address_family                                CHOICES ipv4 ipv6]
		x       [-ipv4_address                                  IPV4
		x                                                       DEFAULT 0.0.0.0]
		x       [-ipv6_address                                  IPV6
		x                                                       DEFAULT 0::0]
		x       [-enable_color_subtlv                           CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-color_co_bits                                 CHOICES 00 01 10 11
		x                                                       DEFAULT 00]
		x       [-color_reserved_bits                           NUMERIC
		x                                                       DEFAULT 0]
		x       [-color_value                                   NUMERIC
		x                                                       DEFAULT 0]
		x       [-enable_preference_sub_tlv                     CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-perference                                    NUMERIC
		x                                                       DEFAULT 0]
		x       [-enable_binding_subtlv                         CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-binding_SIDType                               CHOICES nobinding sid4 ipv6sid]
		x       [-sid_4octet                                    NUMERIC
		x                                                       DEFAULT 0]
		x       [-bsid_as_mpls_label                            CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-tunnel_tlv_ipv6_sid                           IPV6
		x                                                       DEFAULT 0::0]
		x       [-active_segment_lists                          CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-enable_weight                                 CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-weight                                        NUMERIC]
		x       [-no_of_segments                                RANGE 1-20]
		x       [-active_segments                               CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-segment_type                                  CHOICES mplssid
		x                                                       CHOICES ipv6sid
		x                                                       CHOICES ipv4nodeaddress
		x                                                       CHOICES ipv6nodeaddress
		x                                                       CHOICES ipv4nodeaddressindex
		x                                                       CHOICES ipv4localandremoteaddress
		x                                                       CHOICES ipv6nodeaddressindex
		x                                                       CHOICES ipv6localandremoteaddress]
		x       [-label                                         NUMERIC
		x                                                       DEFAULT 16]
		x       [-traffic_class                                 NUMERIC
		x                                                       DEFAULT 0]
		x       [-bottom_of_stack                               CHOICES 0 1
		x                                                       DEFAULT 0]
		x       [-ttl                                           NUMERIC
		x                                                       DEFAULT 255]
		x       [-ipv6_sid                                      IPV6
		x                                                       DEFAULT 0::0]
		x       [-ipv4_nodeaddress                              IPV4
		x                                                       DEFAULT 0.0.0.0]
		x       [-ipv6_nodeaddress                              IPV6
		x                                                       DEFAULT 0::0]
		x       [-interface_index                               NUMERIC
		x                                                       DEFAULT 0]
		x       [-ipv4_localaddress                             IPV4
		x                                                       DEFAULT 0.0.0.0]
		x       [-ipv4_remoteaddress                            IPV4
		x                                                       DEFAULT 0.0.0.0]
		x       [-ipv6_localaddress                             IPV6
		x                                                       DEFAULT 0::0]
		x       [-ipv6_remoteaddress                            IPV6
		x                                                       DEFAULT 0::0]
		x       [-optional_tlv_type                             CHOICES none mpls ipv6]
		x       [-optional_label                                NUMERIC
		x                                                       DEFAULT 16]
		x       [-optional_traffic_class                        NUMERIC
		x                                                       DEFAULT 0]
		x       [-optional_time_to_live                         NUMERIC
		x                                                       DEFAULT 255]
		x       [-optional_ipv6_sid                             IPV6
		x                                                       DEFAULT 0::0]
		
		 Arguments:
		    -mode
		        This option defines the action to be taken on the BGP server.
		    -handle
		        bgpSRTEPoliciesListV4: -handle is returned by procedure emulation_bgp_srte_policies_config when a IPv4 SRTE Policy is created or modified
		        bgpSRTEPoliciesListV6: -handle is returned by procedure emulation_bgp_srte_policies_config when a IPv6 SRTE Policy is created or modified
		x   -no_of_srte_policies
		x       Number of SRTE Policies
		x   -active
		x       Select the Active check box to activate the SRTE Policies. This means that the SRTE Policies can be started or stopped and is usable in the state machine.
		x       If this check box is not selected, the element is not able to respond to any action including Start and Stop.
		x   -policy_type
		x       Set Policy Type for BGP SRTE Policies
		x   -distinguisher
		x       Distinguisher for SRTE Policies
		x   -policy_color
		x       Policy Color for SRTE Policies
		x   -end_pointV4
		x       IPv4 End Point for SRTE Policies
		x   -end_pointV6
		x       IPv6 End Point for SRTE Policies
		x   -no_of_tunnels
		x       Number of Tunnel TLVs for SRTE Policies
		x   -enable_next_hop
		x       Enable Next Hop for SRTE Policies
		x   -set_next_hop
		x       Set IP Address of Next Hop for SRTE Policies
		x   -set_next_hop_ip_type
		x       Set Next Hop IP Type for SRTE Policies
		x   -ipv4_next_hop
		x       IPv4 Next Hop IP Address for SRTE Policies
		x   -ipv6_next_hop
		x       IPv6 Next Hop IP Address for SRTE Policies
		x   -enable_origin
		x       Enable Origin for SRTE Policies
		x   -origin
		x       Origin for SRTE Policies
		x   -enable_local_preference
		x       Enable Local Preference for SRTE Policies
		x   -local_preference
		x       Local Preference for SRTE Policies
		x   -enable_multi_exit_discriminator
		x       Enable Multi Exit Discriminator for SRTE Policies
		x   -multi_exit_discriminator
		x       Multi Exit Discriminator for SRTE Policies
		x   -enable_atomic_aggregate
		x       Enable Atomic Aggregate for SRTE Policies
		x   -enable_aggregator_id
		x       Enable Aggregator ID for SRTE Policies
		x   -aggregator_id
		x       Aggregator ID for SRTE Policies
		x   -aggregator_as
		x       Sets the AS asssociated with the Aggregator router id for SRTE Policies
		x   -enable_originator_id
		x       Enable Originator ID for SRTE Policies
		x   -originator_id
		x       Originator ID for the router that originated the rule for SRTE Policies
		x   -enable_add_path
		x       Enable Add Path for SRTE Policies
		x   -add_path_id
		x       Add Path ID for SRTE Policies
		x   -enable_community
		x       Enable Community for SRTE Policies
		x   -no_of_communities
		x       Number of Communities for SRTE Policies
		x   -community_type
		x       SRTE Policies Community Types
		x   -community_as_number
		x       SRTE Policies Communities AS Number
		x   -community_last_two_octets
		x       SRTE Policies Communities Last Two Octets
		x   -enable_extended_community
		x       Enable Ext Community for SRTE Policies
		x   -no_of_extended_community
		x       Number of Extended Communities for SRTE Policies
		x   -ext_communities_type
		x       SRTE Policies Extended Communities Type
		x   -ext_communities_subtype
		x       SRTE Policies Extended Communities SubType
		x   -ext_community_as_number
		x       SRTE Policies Extended Communities AS2 Number
		x   -ext_community_target_assigned_number_4_octets
		x       BGP SRTE Policies Extended Communities Target Assigned Number 4
		x   -ext_community_ip
		x       SRTE Policies Extended Communites IP
		x   -ext_community_as_4_bytes
		x       SRTE Policies Extended Community AS 4 Number
		x   -ext_community_target_assigned_number_2_octets
		x       SRTE Policies Extended Target Assigned Number 2
		x   -ext_community_opaque_data
		x       SRTE Policies Extended Communities Opaque Data (Hex)
		x   -ext_community_colorCObits
		x       SRTE Policies Extended Communities Color CO Bits
		x   -ext_community_colorReservedBits
		x       SRTE Policies Extended Communities Color Reserved Bits
		x   -ext_community_colorValue
		x       SRTE Policies Extended Communities Color Value
		x   -ext_community_linkBandwidth
		x       SRTE Policies Extended Communities Link Bandwidth
		x   -enable_override_peer_as_set_mode
		x       Enable override Reer as set mode for SRTE Policies
		x   -as_set_mode
		x       Set mode for AS value for SRTE Policies
		x   -enable_as_path_segments
		x       Enable AS Path Segments for IPv4 SRTE Policies
		x   -no_of_as_path_segments
		x       Number of AS Path Segments for IPv4 SRTE Policies
		x   -enable_as_path_segment
		x       Enable AS Path Segment for BGP SRTE Policies
		x   -as_path_segment_type
		x       AS Path Segment Type for BGP SRTE Policies
		x   -number_of_as_number_in_segment
		x       Number of AS Path Segments for BGP SRTE Policies
		x   -as_path_segment_enable_as_number
		x       Enable AS number for BGP SRTE Policies
		x   -as_path_segment_as_number
		x       AS Path Segments AS Number for BGP SRTE Policies
		x   -enable_cluster
		x       Enable cluster for SRTE Policies
		x   -no_of_clusters
		x       Number of Clusters for SRTE Policies
		x   -cluster_id
		x       BGP LS Cluster ID for SRTE Policies
		x   -active_tunnel_tlv
		x       Select the Active check box to activate the Tunnel TLV in SRTE Policies. This means that the Tunnel TLV in SRTE Policies can be started or stopped and is usable in the state machine.
		x       If this check box is not selected, the element is not able to respond to any action including Start and Stop.
		x   -no_of_segment_lists
		x       Number of Segment Lists for SRTE Policies
		x   -enable_remote_endpoint_subtlv
		x       Enable Remote Endpoint Sub-TLV
		x   -as_number
		x       AS Number for Tunnel TLV
		x   -address_family
		x       Address Family for Tunnel TLV
		x   -ipv4_address
		x       IPv4 Address for Tunnel TLV
		x   -ipv6_address
		x       IPv6 Address for Tunnel TLV
		x   -enable_color_subtlv
		x       Enable Color Sub-TLV for Tunnel TLV
		x   -color_co_bits
		x       Color CO Bits for Tunnel TLV
		x   -color_reserved_bits
		x       Color Reserved Bits for Tunnel TLV
		x   -color_value
		x       Color Value for Tunnel TLV
		x   -enable_preference_sub_tlv
		x       Enable Preference Sub-TLV for Tunnel TLV
		x   -perference
		x       Preference for Tunnel TLV
		x   -enable_binding_subtlv
		x       Enable Binding Sub-TLV for Tunnel TLV
		x   -binding_SIDType
		x       Binding SID Type for Tunnel TLV
		x   -sid_4octet
		x       4 Octet SID for Tunnel TLV
		x   -bsid_as_mpls_label
		x       BSID As MPLS Label for Tunnel TLV
		x   -tunnel_tlv_ipv6_sid
		x       IPv6 SID for Tunnel TLV
		x   -active_segment_lists
		x       Select the Active check box to activate the Sgement Lists in SRTE Policies. This means that the Sgement Lists in SRTE Policies can be started or stopped and is usable in the state machine.
		x       If this check box is not selected, the element is not able to respond to any action including Start and Stop.
		x   -enable_weight
		x       Enable Weight for Segment List
		x   -weight
		x       Weight for Segment Lists
		x   -no_of_segments
		x       Number of Segment per Segments Lists
		x   -active_segments
		x       Select the Active check box to activate the Sgements in SRTE Policies. This means that the Segments in SRTE Policies can be started or stopped and is usable in the state machine.
		x       If this check box is not selected, the element is not able to respond to any action including Start and Stop.
		x   -segment_type
		x       Segments Type for Segements
		x   -label
		x       Label for Segments
		x   -traffic_class
		x       Traffic Class for Segments
		x   -bottom_of_stack
		x       Bottom Of Stack for Segment List
		x   -ttl
		x       Time to live for Segments
		x   -ipv6_sid
		x       IPv6 SID for Segments
		x   -ipv4_nodeaddress
		x       IPv4 Node address for Segments
		x   -ipv6_nodeaddress
		x       IPv6 Node address for Segments
		x   -interface_index
		x       Interface Index for Segments
		x   -ipv4_localaddress
		x       IPv4 Local address for Segments
		x   -ipv4_remoteaddress
		x       IPv4 Remote address for Segments
		x   -ipv6_localaddress
		x       IPv6 Local address for Segments
		x   -ipv6_remoteaddress
		x       IPv6 Remote address for Segments
		x   -optional_tlv_type
		x       Optional TLV Type for Segments
		x   -optional_label
		x       Optional Label for Segments
		x   -optional_traffic_class
		x       Optional Traffic Class for Segments
		x   -optional_time_to_live
		x       Optional Time to live for Segments
		x   -optional_ipv6_sid
		x       Optional IPv6 SID for Segments
		
		 Return Values:
		    A list containing the bgpSRTEPoliciesListV6 protocol stack handles that were added by the command (if any).
		x   key:bgpSRTEPoliciesListV6_handle  value:A list containing the bgpSRTEPoliciesListV6 protocol stack handles that were added by the command (if any).
		    $::SUCCESS | $::FAILURE
		    key:status                        value:$::SUCCESS | $::FAILURE
		    When status is $::FAILURE, contains more information
		    key:log                           value:When status is $::FAILURE, contains more information
		    Handle of bgpSRTEPoliciesListV4 configured
		    key:bgpSRTEPoliciesListV4_handle  value:Handle of bgpSRTEPoliciesListV4 configured
		    Item Handle of any bgpSRTEPoliciesListV4 or bgpSRTEPoliciesListV6 configured
		    key:handles                       value:Item Handle of any bgpSRTEPoliciesListV4 or bgpSRTEPoliciesListV6 configured
		
		 Examples:
		    See files starting with BGP_ in the Samples subdirectory.  Also see some of the L2VPN, L3VPN, MPLS, and MVPN sample files for further examples of the BGP usage.
		    See the BGP example in Appendix A, "Example APIs," for one specific example usage.
		
		 Sample Input:
		
		 Sample Output:
		    {status $::SUCCESS}
		    {bgpSRTEPoliciesListV4 {/topology:1/deviceGroup:1/ethernet:1/ipv4:1/bgpIpv4Peer:1/bgpSRTEPoliciesListV4:1/}}
		    {bgpSRTEPoliciesListV6 {/topology:1/deviceGroup:1/ethernet:1/ipv4:1/bgpIpv4Peer:1/bgpSRTEPoliciesListV6:1/}}
		
		 Notes:
		    Coded versus functional specification.
		    When a -handle is provided with a BGP/BGP+ protocol stack handle or a protocol session handle, the api will create IPv4/IPv6 SRTE Policies
		    When a -handle is provided with a BGP SRTE Policies Handle, the api will modify the created IPv4/IPv6 SRTE Policies
		
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
				'emulation_bgp_srte_policies_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
