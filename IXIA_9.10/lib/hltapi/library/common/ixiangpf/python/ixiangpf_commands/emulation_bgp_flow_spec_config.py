# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_bgp_flow_spec_config(self, mode, fs_mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_bgp_flow_spec_config
		
		 Description:
		    This procedure allows user to configure BGP Flow Spec capabilites of BGP Peer. BGP Flow Spec enables user rapidly deploy and propagate filtering and policing functionality among a large number of BGP peer.
		
		 Synopsis:
		    emulation_bgp_flow_spec_config
		        -mode                                           CHOICES create modify enable
		        -fs_mode                                        CHOICES fsv4 fsv6
		        [-handle                                        ANY]
		x       [-no_of_flowSpecRangeV4                         NUMERIC]
		x       [-no_of_flowSpecRangeV6                         NUMERIC]
		x       [-active                                        CHOICES 0 1
		x                                                       DEFAULT 1]
		x       [-flowSpecName                                  ANY]
		x       [-fsv4_enableDestPrefix                         CHOICES 0 1]
		x       [-fsv6_enableDestPrefix                         CHOICES 0 1]
		x       [-fsv4_destPrefix                               IPV4]
		x       [-fsv6_destPrefix                               IPV6]
		x       [-fsv4_destPrefixLength                         NUMERIC]
		x       [-fsv6_destPrefixLength                         NUMERIC]
		x       [-fsv6_destPrefixOffset                         NUMERIC]
		x       [-fsv4_enableSrcPrefix                          CHOICES 0 1]
		x       [-fsv6_enableSrcPrefix                          CHOICES 0 1]
		x       [-fsv4_srcPrefix                                IPV4]
		x       [-fsv6_srcPrefix                                IPV6]
		x       [-fsv4_srcPrefixLength                          NUMERIC]
		x       [-fsv6_srcPrefixLength                          NUMERIC]
		x       [-fsv6_srcPrefixOffset                          NUMERIC]
		x       [-fsv4_ipProto                                  ANY]
		x       [-fsv6_nextHeader                               RANGE 0-65535
		x                                                       DEFAULT 1]
		x       [-portMatch                                     ANY]
		x       [-destPortMatch                                 ANY]
		x       [-srcPortMatch                                  ANY]
		x       [-icmpTypeMatch                                 ANY]
		x       [-icmpCodeMatch                                 ANY]
		x       [-tcpFlagsMatch                                 ANY]
		x       [-ipPacketMatch                                 ANY]
		x       [-dscpMatch                                     ANY]
		x       [-fsv4_fragmentMatch                            ANY]
		x       [-fsv6_fragmentMatch                            ANY]
		x       [-fsv6_flowLabel                                ANY]
		x       [-enable_traffic_rate                           CHOICES 0 1]
		x       [-trafficRate                                   NUMERIC]
		x       [-enable_trafficAction                          CHOICES 0 1]
		x       [-terminalAction                                CHOICES 0 1]
		x       [-trafficActionSample                           CHOICES 0 1]
		x       [-enable_redirect                               CHOICES 0 1]
		x       [-redirect_ext_communities_type                 CHOICES rdAS2byte
		x                                                       CHOICES rdIPv4
		x                                                       CHOICES rdAS4byte
		x                                                       CHOICES rdnextHop]
		x       [-as_2_bytes                                    RANGE 0-65535
		x                                                       DEFAULT 1]
		x       [-as_4_bytes                                    NUMERIC
		x                                                       DEFAULT 1]
		x       [-fsv4_ipv4                                     IPV4]
		x       [-fsv6_ipv6                                     IPV6]
		x       [-assigned_number_2_octets                      NUMERIC
		x                                                       DEFAULT 1]
		x       [-assigned_number_4_octets                      NUMERIC
		x                                                       DEFAULT 1]
		x       [-Cbit                                          CHOICES 0 1]
		x       [-nextHop                                       IPV4]
		x       [-enable_trafficMarking                         CHOICES 0 1]
		x       [-dscp                                          NUMERIC]
		x       [-fsv6_enable_redirectIPv6                      CHOICES 0 1]
		x       [-fsv6_redirectIPv6                             IPV6]
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
		x       [-enable_community                              CHOICES 0 1]
		x       [-number_of_communities                         RANGE 0-32
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
		        [-enable_large_communitiy                       CHOICES 0 1]
		x       [-num_of_large_communities                      NUMERIC]
		x       [-large_community                               ANY]
		x       [-enable_ext_community                          CHOICES 0 1]
		x       [-number_of_ext_communities                     RANGE 0-32
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
		x       [-as_path_set_mode                              CHOICES include_as_seq
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
		
		 Arguments:
		    -mode
		        This option defines the action to be taken on the BGP server.
		    -fs_mode
		        This option defines the type of Flowspec.
		    -handle
		        bgp_flowSpecV4_handle: -handle is returned by procedure emulation_bgp_flow_spec_config when a IPv4 Flow Spec is created or modified
		        bgp_flowSpecV6_handle: -handle is returned by procedure emulation_bgp_flow_spec_config when a IPv6 Flow Spec is created or modified
		x   -no_of_flowSpecRangeV4
		x       Number of IPV4 Flow Spec Ranges
		x   -no_of_flowSpecRangeV6
		x       Number of IPV6 Flow Spec Ranges
		x   -active
		x       Select the Active check box to activate the Flow Spec. This means that the Flow Spec can be started or stopped and is usable in the state machine.
		x       If this check box is not selected, the element is not able to respond to any action including Start and Stop.
		x   -flowSpecName
		x       BGP Flow Spec Name
		x   -fsv4_enableDestPrefix
		x       Enables Destination Prefix and Prefix Length for Flow Spec
		x   -fsv6_enableDestPrefix
		x       Enables Destination Prefix and Prefix Length for Flow Spec
		x   -fsv4_destPrefix
		x       Destination Prefix for IPv4 Flow Spec
		x   -fsv6_destPrefix
		x       Destination Prefix for IPv6 Flow Spec
		x   -fsv4_destPrefixLength
		x       Destination Prefix Length for IPv4 Flow Spec
		x   -fsv6_destPrefixLength
		x       Destination Prefix Length for IPv6 Flow Spec
		x   -fsv6_destPrefixOffset
		x       Destination Prefix Offset for IPv6 Flow Spec
		x   -fsv4_enableSrcPrefix
		x       Enables Source Prefix and Prefix Length for IPv4 Flow Spec
		x   -fsv6_enableSrcPrefix
		x       Enables Source Prefix and Prefix Length for IPv6 Flow Spec
		x   -fsv4_srcPrefix
		x       Source Prefix for IPv4 Flow Spec
		x   -fsv6_srcPrefix
		x       Source Prefix for IPv6 Flow Spec
		x   -fsv4_srcPrefixLength
		x       Source Prefix Length for IPv4 Flow Spec
		x   -fsv6_srcPrefixLength
		x       Source Prefix Length for IPv6 Flow Spec
		x   -fsv6_srcPrefixOffset
		x       Source Prefix Offset for IPv6 Flow Spec
		x   -fsv4_ipProto
		x       IPv4 Flow Spec Proto Match. Minimum Value: 0 Maximum Value: 65535
		x   -fsv6_nextHeader
		x       IPv6 Flow Spec Next Header
		x   -portMatch
		x       Flow Spec Port match. Minimum Value: 0 Maximum Value: 65535
		x   -destPortMatch
		x       Flow Spec Destination Port Match. Minimum Value: 0 Maximum Value: 65535
		x   -srcPortMatch
		x       Flow Spec Source Port Match. Minimum Value: 0 Maximum Value: 65535
		x   -icmpTypeMatch
		x       Flow Spec ICMP Type Match. Minimum Value: 0 Maximum Value: 255
		x   -icmpCodeMatch
		x       Flow Spec ICMP Code Match. Minimum Value: 0 Maximum Value: 255
		x   -tcpFlagsMatch
		x       Flow Spec TCP Flags Match. Minimum Value: 0 Maximum Value: 0xFFF
		x   -ipPacketMatch
		x       Flow Spec IP Packet Match. Minimum Value: 0 Maximum Value: 65535
		x   -dscpMatch
		x       Flow Spec DSCP Match. Minimum Value: 0 Maximum Value: 63
		x   -fsv4_fragmentMatch
		x       IPv4 Flow Spec Fragment Match. Minimum Value: 0 Maximum Value: 0xFF
		x   -fsv6_fragmentMatch
		x       IPv6 Flow Spec Fragment Match. Minimum Value: 0 Maximum Value: 0xFF
		x   -fsv6_flowLabel
		x       IPv6 Flow Spec Flow Label
		x   -enable_traffic_rate
		x       Enable Traffic Rate for Flow Spec
		x   -trafficRate
		x       Traffic Rate for Flow Spec
		x   -enable_trafficAction
		x       Enable Traffic Action for Flow Spec
		x   -terminalAction
		x       Enable Terminal Action for Flow Spec. Set Terminal(T) flag for Traffic action
		x   -trafficActionSample
		x       Traffic Action Sample for Flow Spec. Set Sample(S) flag for Traffic action
		x   -enable_redirect
		x       Enable Redirect for Flow Spec
		x   -redirect_ext_communities_type
		x       Relates to the high-order Extended Community Type field for Flow Spec Actions
		x   -as_2_bytes
		x       2-byte Autonomous System (AS) number for Flow Spec
		x   -as_4_bytes
		x       4-byte Autonomous System (AS) number for Flow Spec
		x   -fsv4_ipv4
		x       IP Address for IPv4 Flow Spec
		x   -fsv6_ipv6
		x       IP Address for IPv6 Flow Spec
		x   -assigned_number_2_octets
		x       2 Octet assigned Number for Flow Spec
		x   -assigned_number_4_octets
		x       4 Octet assigned Number for Flow Spec
		x   -Cbit
		x       C Bit for Flow Spec. It is the highest order bit in the VC Type field. If the bit is set, it indicates the presence of a control word on this VC.
		x   -nextHop
		x       Next Hop for Flow Spec
		x   -enable_trafficMarking
		x       Enable Traffic Marking for Flow Spec
		x   -dscp
		x       DSCP for IPv4 Flow Spec
		x   -fsv6_enable_redirectIPv6
		x       Enable Redirect IPv6 for IPv6 Flow Spec
		x   -fsv6_redirectIPv6
		x       Redirected IPv6 Address for IPv6 Flow Spec
		x   -enable_next_hop
		x       Enable Next Hop for Flow Spec
		x   -set_next_hop
		x       Set IP Address of Next Hop for Flow Spec
		x   -set_next_hop_ip_type
		x       Set Next Hop IP Type for Flow Spec
		x   -ipv4_next_hop
		x       IPv4 Next Hop IP Address for Flow Spec
		x   -ipv6_next_hop
		x       IPv6 Next Hop IP Address for Flow Spec
		x   -enable_origin
		x       Enable Origin for Flow Spec
		x   -origin
		x       Origin for Flow Spec
		x   -enable_local_preference
		x       Enable Local Preference for Flow Spec
		x   -local_preference
		x       Local Preference for Flow Spec
		x   -enable_multi_exit_discriminator
		x       Enable Multi Exit Discriminator for Flow Spec
		x   -multi_exit_discriminator
		x       Multi Exit Discriminator for Flow Spec
		x   -enable_atomic_aggregate
		x       Enable Atomic Aggregate for Flow Spec
		x   -enable_aggregator_id
		x       Enable Aggregator ID for Flow Spec
		x   -aggregator_id
		x       Aggregator ID for Flow Spec
		x   -aggregator_as
		x       Sets the AS asssociated with the Aggregator router id for Flow Spec
		x   -enable_originator_id
		x       Enable Originator ID for Flow Spec
		x   -originator_id
		x       Originator ID for the router that originated the rule for Flow Spec
		x   -enable_community
		x       Enable Community for BGP Flow Spec
		x   -number_of_communities
		x       Number of Communities for Flow Spec
		x   -community_type
		x       BGP Flow Spec Community Types
		x   -community_as_number
		x       BGP Flow Spec AS Number
		x   -community_last_two_octets
		x       BGP FlowSpec Last Two Octets
		    -enable_large_communitiy
		        Enables or disables Large communities.
		x   -num_of_large_communities
		x       Internal mapping to implicit list length param
		x   -large_community
		x       Large Community in cannonical format as defined in RFC8092 which is:
		x       GlobalAdmin:LocalDataPart1:LocalDataPart2
		x       where each value must have range 1-4294967295.
		x       e.g. 65535:100:10 or 4294967295:1:65535
		x   -enable_ext_community
		x       Enable Ext Community for Flow Spec
		x   -number_of_ext_communities
		x       Number of Extended Communities for Flow Spec
		x   -ext_communities_type
		x       BGP Flow Spec Extended Communities Type
		x   -ext_communities_subtype
		x       BGP Flow Spec Extended Communities SubType
		x   -ext_community_as_number
		x       BGP Flow Spec Extended Communities AS2 Number
		x   -ext_community_target_assigned_number_4_octets
		x       BGP Flow Spec Extended Communities Target Assigned Number 4
		x   -ext_community_ip
		x       BGP Flow Spec Extended Communites IP
		x   -ext_community_as_4_bytes
		x       BGP Flow Spec Extended Community AS 4 Number
		x   -ext_community_target_assigned_number_2_octets
		x       BGP Flow Spec Extended Target Assigned Number 2
		x   -ext_community_opaque_data
		x       BGP Flow Spec Extended Communities Opaque Data (Hex)
		x   -ext_community_colorCObits
		x       BGP Flow Spec Extended Communities Color CO Bits
		x   -ext_community_colorReservedBits
		x       BGP Flow Spec Extended Communities Color Reserved Bits
		x   -ext_community_colorValue
		x       BGP Flow Spec Extended Communities Color Value
		x   -ext_community_linkBandwidth
		x       BGP Flow Spec Extended Communities Link Bandwidth
		x   -enable_override_peer_as_set_mode
		x       Enable override Reer as set mode for Flow Spec
		x   -as_path_set_mode
		x       Set mode for AS value for Flow Spec
		x   -enable_as_path_segments
		x       Enable AS Path Segments for Flow Spec
		x   -no_of_as_path_segments
		x       Number of AS Path Segments for Flow Spec
		x   -enable_as_path_segment
		x       Enable AS Path Segment for BGP Flow Spec
		x   -as_path_segment_type
		x       AS Path Segment Type for BGP Flow Spec
		x   -number_of_as_number_in_segment
		x       Number of AS Path Segments for BGP Flow Spec
		x   -as_path_segment_enable_as_number
		x       Enable AS number for BGP Flow Spec
		x   -as_path_segment_as_number
		x       AS Path Segments AS Number for BGP Flow Spec
		x   -enable_cluster
		x       Enable cluster for Flow Spec
		x   -no_of_clusters
		x       Number of Clusters for Flow Spec
		x   -cluster_id
		x       BGP LS Cluster ID for BGP Flow Specs
		
		 Return Values:
		    A list containing the bgp flowSpecV6 protocol stack handles that were added by the command (if any).
		x   key:bgp_flowSpecV6_handle  value:A list containing the bgp flowSpecV6 protocol stack handles that were added by the command (if any).
		    $::SUCCESS | $::FAILURE
		    key:status                 value:$::SUCCESS | $::FAILURE
		    When status is $::FAILURE, contains more information
		    key:log                    value:When status is $::FAILURE, contains more information
		    Handle of bgpipv4flowspec configured
		    key:bgp_flowSpecV4_handle  value:Handle of bgpipv4flowspec configured
		    Item Handle of any bgpFlowSpecRangesListV4 or bgpFlowSpecRangesListV6 configured
		    key:handles                value:Item Handle of any bgpFlowSpecRangesListV4 or bgpFlowSpecRangesListV6 configured
		
		 Examples:
		    See files starting with BGP_ in the Samples subdirectory.  Also see some of the L2VPN, L3VPN, MPLS, and MVPN sample files for further examples of the BGP usage.
		    See the BGP example in Appendix A, "Example APIs," for one specific example usage.
		
		 Sample Input:
		
		 Sample Output:
		    {status $::SUCCESS}
		    {bgp_flowSpecV4_handle {/topology:1/deviceGroup:1/ethernet:1/ipv4:1/bgpIpv4Peer:1/bgpFlowSpecRangesListV4:1/} {/topology:1/deviceGroup:1/ethernet:1/ipv6:1/bgpIpv6Peer:1/bgpFlowSpecRangesListV4:1/}}
		    {bgp_flowSpecV6_handle {/topology:1/deviceGroup:1/ethernet:1/ipv4:1/bgpIpv4Peer:1/bgpFlowSpecRangesListV6:1/} {/topology:1/deviceGroup:1/ethernet:1/ipv6:1/bgpIpv6Peer:1/bgpFlowSpecRangesListV6:1/}}
		
		 Notes:
		    Coded versus functional specification.
		    When a -handle is provided with a BGP/BGP+ protocol stack handle or a protocol session handle, the api will create IPv4/IPv6 Flow Spec
		    When a -handle is provided with a BGP Flow Spec Handle, the api will modify the created IPv4/IPv6 Flow Spec
		
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
				'emulation_bgp_flow_spec_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
