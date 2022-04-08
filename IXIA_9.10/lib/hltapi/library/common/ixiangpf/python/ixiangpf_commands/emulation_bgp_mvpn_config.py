# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_bgp_mvpn_config(self, handle, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_bgp_mvpn_config
		
		 Description:
		    This procedure configures BGP mVRF neighbors, internal and/or external.
		    You can configure multiple BGP mVRF peers per interface by calling this
		    procedure multiple times.This command is also used to configure MVPN Sender
		    and MVPN Receiver Site. This command will be used to configure MVPN.
		
		 Synopsis:
		    emulation_bgp_mvpn_config
		        -handle                                          ANY
		        -mode                                            CHOICES disable enable create modify
		x       [-protocol_name                                  ALPHA]
		x       [-spmsi_name                                     ALPHA]
		x       [-active                                         CHOICES 0 1
		x                                                        DEFAULT 1]
		        [-num_sites                                      NUMERIC]
		        [-target                                         ANY]
		        [-target_assign                                  NUMERIC]
		        [-target_type                                    CHOICES as ip as4]
		x       [-import_rt_as_export_rt                         CHOICES 0 1]
		x       [-target_count                                   NUMERIC]
		x       [-import_target_count                            NUMERIC]
		        [-import_target                                  ANY]
		        [-import_target_assign                           NUMERIC]
		        [-import_target_type                             CHOICES as ip as4]
		x       [-include_pmsi_tunnel_attribute                  CHOICES 0 1]
		x       [-rsvp_p2mp_id                                   IPV4]
		x       [-rsvp_p2mp_id_as_number                         NUMERIC]
		x       [-rsvp_tunnel_id                                 NUMERIC]
		x       [-root_address                                   IPV4]
		x       [-multicast_distinguisher_as4_number             NUMERIC]
		x       [-multicast_distinguisher_as_number              NUMERIC]
		x       [-multicast_distinguisher_assigned_number        NUMERIC]
		x       [-multicast_distinguisher_ip_address             IPV4]
		x       [-multicast_distinguisher_type                   CHOICES as ip as4]
		x       [-enable_trm                                     CHOICES 0 1]
		x       [-advertise_impsi_routes                         CHOICES 0 1]
		x       [-mvrf_multicast_tunnel_type                     CHOICES tunneltypersvpp2mp
		x                                                        CHOICES tunneltypemldpp2mp
		x                                                        CHOICES tunneltypeingressreplication
		x                                                        CHOICES tunneltypebier
		x                                                        CHOICES tunneltypepimsm
		x                                                        CHOICES tunneltypepimssm]
		x       [-group_address                                  ANY]
		x       [-sender_address_p_root_node_address             ANY]
		x       [-umh_export_target_count                        NUMERIC]
		x       [-umh_import_target_count                        NUMERIC]
		x       [-same_as_export_rt                              CHOICES 0 1]
		x       [-same_as_import_rt                              CHOICES 0 1]
		        [-umh_import_target_type                         CHOICES as ip as4]
		        [-umh_import_target                              ANY]
		        [-umh_import_target_assign                       NUMERIC]
		        [-umh_target_type                                CHOICES as ip as4]
		        [-umh_target_assign                              NUMERIC]
		        [-umh_target                                     ANY]
		x       [-import_target_inner_step                       NUMERIC]
		x       [-target_inner_step                              NUMERIC]
		x       [-umh_import_target_inner_step                   NUMERIC]
		x       [-import_target_assign_inner_step                NUMERIC]
		x       [-target_assign_inner_step                       NUMERIC]
		x       [-umh_import_target_assign_inner_step            NUMERIC]
		x       [-umh_target_assign_inner_step                   NUMERIC]
		x       [-umh_target_inner_step                          NUMERIC]
		x       [-group_address_count                            NUMERIC]
		x       [-send_trigger_source_active_adroute             CHOICES 0 1]
		x       [-source_address_count                           NUMERIC]
		x       [-source_group_mapping                           CHOICES fullymeshed onetoone]
		x       [-start_group_address_ipv4                       IPV4]
		x       [-start_source_address_ipv4                      IPV4]
		x       [-start_source_or_crp_address_ipv4               IPV4]
		x       [-start_source_or_crp_address_ipv6               IPV6]
		x       [-start_group_address_ipv6                       IPV6]
		x       [-start_source_address_ipv6                      IPV6]
		x       [-c_multicast_route_type                         CHOICES sourcetreejoin sharedtreejoin]
		x       [-downstream_label                               NUMERIC]
		x       [-send_triggered_multicast_route                 CHOICES 0 1]
		x       [-upstream_or_downstream_assigned_label          NUMERIC]
		x       [-up_or_down_stream_assigned_label               NUMERIC]
		x       [-use_up_or_down_stream_assigned_label           CHOICES 0 1]
		x       [-spmsi_root_address                             IPV4]
		x       [-spmsi_rsvp_p2mp_id                             IPV4]
		x       [-spmsi_rsvp_p2mp_id_as_number                   NUMERIC]
		x       [-spmsi_rsvp_p2mp_id_inner_step                  NUMERIC]
		x       [-spmsi_rsvp_tunnel_id                           NUMERIC]
		x       [-spmsi_rsvp_tunnel_id_step                      NUMERIC]
		x       [-spmsi_tunnel_count                             NUMERIC]
		x       [-upstream_or_downstream_assigned_label_step     NUMERIC]
		x       [-use_upstream_or_downstream_assigned_label_step CHOICES 0 1]
		x       [-include_ipv6_explicit_null_label               CHOICES 0 1]
		
		 Arguments:
		    -handle
		        Valid values are:
		        BGP mVRF:
		        For create and modify -mode, handle should be its parent BGP Peer node handle.
		        For delete -mode, -handle should be its own handle i.e BGP mVRF node handle.
		        MVPN Sender Site:
		        For create -mode, handle should be the parent prefix pool node Handle.
		        For modify and delete -mode, handle should be its own handle i.e MVPN Sender Site node handle.
		        MVPN Receiver Site:
		        For create -mode, handle should be the parent prefix pool node handle.
		        For modify and delete -mode, handle should be its own handle i.e MVPN Receiver Site node handle.
		    -mode
		        This option defines the action to be taken on the BGP server.
		x   -protocol_name
		x       This is the name of the protocol stack as it appears in the GUI.
		x   -spmsi_name
		x       This is the name of the protocol stack as it appears in the GUI.
		x   -active
		x       Activates the item(like BGP mVRF, MVPN Sendert Sites or MVPN Receiver Sites)
		    -num_sites
		        Number of BGP mVRF to be created.
		    -target
		        AS number or IP address list based on the -target_type list.
		    -target_assign
		        The assigned number subfield of the value field of the target.It is
		        a number from a numbering space which is maintained by the enterprise
		        administers for a given IP address or ASN space.It is the local
		        part of the target.
		    -target_type
		        List of the target type.
		x   -import_rt_as_export_rt
		x       Import RT List Same As Export RT List
		x   -target_count
		x       Number of AS number or IP address list based on the -target_type list.
		x   -import_target_count
		x       Number of RTs in Import Route Target List
		    -import_target
		        AS number or IP address list based on the -import_target_type list.
		    -import_target_assign
		        The assigned number subfield of the value field of the import target.
		        It is a number from a numbering space which is maintained by the
		        enterprise administers for a given IP address or ASN space.It is the
		        local part of the import target.
		    -import_target_type
		        List of the import target type.
		x   -include_pmsi_tunnel_attribute
		x       Enable or Disable Include PMSI Tunnel Attribute.If selected, this causes the PE to include PMSI Tunnel Attribute in the Inclusive Multicast Ethernet Tag Routes containing tunnel information for ingress replication or P2MP.
		x   -rsvp_p2mp_id
		x       The P2MP Identifier represented in IP address format.
		x   -rsvp_p2mp_id_as_number
		x       The P2MP Identifier represented in integer format.
		x   -rsvp_tunnel_id
		x       This allows to select the P2MP LSP that can be used for this particular ES. An LSP is uniquely identified by P2MP-Id, Tunnel Id, and Extended Tunnel ID (Tunnel Head Address).
		x   -root_address
		x       The root address of the multicast LSP.
		x   -multicast_distinguisher_as4_number
		x       The 4-octet user-defined number that is used with the Multicast (Route) Distinguisher IP address or AS number to uniquely identify the MVRFs for this MVPN.
		x   -multicast_distinguisher_as_number
		x       If the Admin part Type is set to AS, this is the 2-byte AS number in the Administrator subfield of the Value field of the RD. If the Admin part Type was set to AS 4 Byte, this is the 4-byte AS number in the Administrator subfield of the Value field of the RD.
		x   -multicast_distinguisher_assigned_number
		x       If the Multicast (Route) Distinguisher Type is set to "AS", a 2-octet autonomous system number (for the local AS) can be configured in this field. If set to "AS 4 Byte", a 4-octet autonomous system number can be configured in this field.
		x   -multicast_distinguisher_ip_address
		x       If the Admin part Type is set to I, this is the 4-byte IP address in the Administrator sub-field of the Value field of the VPN RD.
		x   -multicast_distinguisher_type
		x       Choose the type of Route Distinguisher (RD). Options include the following:
		x         IP-The Administrator subfield is 4 bytes in length, and contains an IP address. (This is a Type 1 RD.)
		x        AS-The Administrator subfield is 2 bytes in length, and contains an Autonomous System number (ASN). (This is a Type 0 RD.)
		x         AS 4 Byte-The Administrator subfield is 4 bytes in length, and contains an Autonomous System number (ASN). (This is a Type 2 RD).
		x   -enable_trm
		x       Enables Tenant Routed Multicast support in EVPN.
		x       Upon Enabling,
		x       - "Advertise I-PMSI Routes" will be disabled (by default).
		x       - "Multicast Tunnel Type" will be "PIM-SSM" (by default).
		x       - "VRF Route Import Extended Community" is sent with EVPN Route Type 2 & 5 (always).
		x   -advertise_impsi_routes
		x       Enables I-PMSI Route Advertisement for MVPN (if True).
		x       Disables I-PMSI Route Advertisement for MVPN (if False).
		x       - Set to False when "Enable TRM" is Enabled (by deafult).
		x   -mvrf_multicast_tunnel_type
		x       The type of multicast tunnel to be configured. Options include the following:
		x        RSVP-TE P2MP: This helps to set up RSVP tunnels as P-Tunnel protocol following new draft.
		x        MLDP P2MP: This is described by a root address with combination of opaque value.
		x        Ingress Replication:This helps to setup ingress replication Tunnels as P-Tunnel Protocol for S-PMSI instances using RSVP P2P/LDP.
		x        BIER: When a multicast data packet enters the domain, the ingress router determines the set of egress routers to which the packets are sent. The ingress router then encapsulates the packet in a BIER header. The BIER header contains a bit string in which each bit represents exactly one egress router in the domain. To forward the packet to a given set of egress routers, the bits corresponding to those routers are set in the BIER header.
		x   -group_address
		x       Group Address
		x   -sender_address_p_root_node_address
		x       Sender Address/P-Root Node Address
		x   -umh_export_target_count
		x       Number of RTs in Export Route Target List(multiplier).
		x   -umh_import_target_count
		x       Number of RTs in Import Route Target List(multiplier).
		x   -same_as_export_rt
		x       If selected, UMH Export RT List will be same as Export RT List.
		x   -same_as_import_rt
		x       If selected, UMH Import RT List will be same as Import RT List.
		    -umh_import_target_type
		        List of the import target type.
		    -umh_import_target
		        AS number or IP address list based on the -import_target_type list.
		    -umh_import_target_assign
		        The assigned number subfield of the value field of the import target.
		        It is a number from a numbering space which is maintained by the
		        enterprise administers for a given IP address or ASN space.It is the
		        local part of the import target.
		    -umh_target_type
		        List of the target type.
		    -umh_target_assign
		        The assigned number subfield of the value field of the target.It is
		        a number from a numbering space which is maintained by the enterprise
		        administers for a given IP address or ASN space.It is the local
		        part of the target.
		    -umh_target
		        AS number or IP address list based on the -target_type list.
		x   -import_target_inner_step
		x       Increment value to step the base import target field when -target_count is greater than 1.
		x   -target_inner_step
		x       Increment value to step the base import target field when -target_count is greater than 1.
		x   -umh_import_target_inner_step
		x       Increment value to step the base import target field when -target_count is greater than 1.
		x   -import_target_assign_inner_step
		x       Increment value to step the base import target assigned number field when -target_count is greater than 1.
		x   -target_assign_inner_step
		x       Increment value to step the base import target assigned number field when -target_count is greater than 1.
		x   -umh_import_target_assign_inner_step
		x       Increment value to step the base import target assigned number field when -target_count is greater than 1.
		x   -umh_target_assign_inner_step
		x       Increment value to step the base target assigned number fieldwhen -target_count is greater than 1.
		x   -umh_target_inner_step
		x       Increment value to step the base target field when -target_count is greater than 1.
		x   -group_address_count
		x       The number of group addresses to be included in the Join message/ C-Multicast route.
		x   -send_trigger_source_active_adroute
		x       If selected, allows to send the Source Active A-D Route after receiving Source Tree Join C-Multicast route.
		x   -source_address_count
		x       The number of multicast source addresses to be included. The maximum number of valid possible addresses depends on the values for the Source Address and the Source Mask Width.
		x       The value changes to 1 and is not available for change when the C-Multicast Route Type is Shared Tree Join/meshing is One to one.
		x   -source_group_mapping
		x       Indicates the source group mapping. Options include the following:
		x       Fully-Meshed, One-To-One.
		x   -start_group_address_ipv4
		x       The first IPv4 Multicast group address in the range of group addresses included in this Join message/ C-Multicast route.
		x   -start_source_address_ipv4
		x       The Start Source Address is the first IPv4 source addresses that like to send multicast traffic towards interested receivers.
		x       (IPv4 Multicast addresses are not valid for sources)
		x   -start_source_or_crp_address_ipv4
		x       The Start Source Address is the first IPv4 source address to be included in this Join message when C-Multicast Route Type is Source Tree Join.
		x       (IPv4 Multicast addresses are not valid for sources)
		x       The C-RP Address is the IPv4 address of C-RP when C-Multicast Route Type is Shared Tree Join.
		x   -start_source_or_crp_address_ipv6
		x       The Start Source Address is the first IPv6 source address to be included in this Join message when C-Multicast Route Type is Source Tree Join.
		x       The C-RP Address is the IPv6 address of C-RP when C-Multicast Route Type is Shared Tree Join.
		x   -start_group_address_ipv6
		x       The first IPv6 Multicast group address in the range of group addresses included in this Join message/ C-Multicast route.
		x   -start_source_address_ipv6
		x       The Start Source Address is the first IPv6 source addresses that like to send multicast traffic towards interested receivers.
		x   -c_multicast_route_type
		x       Choose one of the C-Multicast Route Types. Options include the following:
		x       Source Tree Join, Shared Tree Join.
		x   -downstream_label
		x       Downstream Assigned Label in Leaf A-D route when tunnel type is Ingress Replication
		x   -send_triggered_multicast_route
		x       This helps to send Source Tree Join C-Multicast route after receiving Source Active A-D route. This is also required by Shared Tree Join C-Multicast route to send Source Tree Join after receiving Source Active A-D Route.
		x   -upstream_or_downstream_assigned_label
		x       This label is used when Use Upstream/Downstream is selected. The PMSI Tunnel Identifier contains this label value.
		x   -up_or_down_stream_assigned_label
		x       Upstream/Downstream Assigned Label
		x   -use_up_or_down_stream_assigned_label
		x       This field indicates whether the configured upstream label or downstream label(Ingress Replication) need to be used. If not selected, MPLS Assigned Upstream/Downstream Label is unavailable.
		x   -spmsi_root_address
		x       The root address of the multicast tunnel type. This field is available when Multicast Tunnel Type is mLDP P2MP.
		x   -spmsi_rsvp_p2mp_id
		x       The P2MP ID represented in IP address format. This field is available when Multicast Tunnel Type is RSVP-TE P2MP.
		x   -spmsi_rsvp_p2mp_id_as_number
		x       The P2MP ID represented in integer format. This field is available when Multicast Tunnel Type is RSVP-TE P2MP.
		x   -spmsi_rsvp_p2mp_id_inner_step
		x       The increment value in the range of RSVP P2MP IDs for that S-PMSI range. This field is available when Multicast Tunnel Type is RSVP-TE P2MP.
		x   -spmsi_rsvp_tunnel_id
		x       The first Tunnel ID value in the range of Tunnel IDs. This field is available when Multicast Tunnel Type is RSVP-TE P2MP.
		x   -spmsi_rsvp_tunnel_id_step
		x       The increment value in the range of Tunnel IDs for that S-PMSI range. This field is available when Multicast Tunnel Type is RSVP-TE P2MP.
		x   -spmsi_tunnel_count
		x       The total count of the S-PMSI Tunnel Count.
		x   -upstream_or_downstream_assigned_label_step
		x       This helps to assign unique upstream assigned label for each flow. This is applicable only if Use Upstream Assigned Label is selected.
		x   -use_upstream_or_downstream_assigned_label_step
		x       Indicates whether the configured upstream label or downstream label(Ingress Replication) need to be used. Except for BIER as Multicast Tunnel Type, if not selected, MPLS Assigned Upstream/Downstream Label is unavailable.
		x   -include_ipv6_explicit_null_label
		x       If selected, allows to include Explicit NULL label (2) in I-PMSI IPv6 PE-to-CE Traffic.
		
		 Return Values:
		    A list containing the network group protocol stack handles that were added by the command (if any).
		x   key:network_group_handle       value:A list containing the network group protocol stack handles that were added by the command (if any).
		    A list containing the bgp mvrf protocol stack handles that were added by the command (if any).
		x   key:bgp_mvrf                   value:A list containing the bgp mvrf protocol stack handles that were added by the command (if any).
		    A list containing the mvpn receiver site v4 protocol stack handles that were added by the command (if any).
		x   key:mvpn_receiver_site_v4      value:A list containing the mvpn receiver site v4 protocol stack handles that were added by the command (if any).
		    A list containing the mvpn sender site v4 protocol stack handles that were added by the command (if any).
		x   key:mvpn_sender_site_v4        value:A list containing the mvpn sender site v4 protocol stack handles that were added by the command (if any).
		    A list containing the mvpn sender site spmsi v4 protocol stack handles that were added by the command (if any).
		x   key:mvpn_sender_site_spmsi_v4  value:A list containing the mvpn sender site spmsi v4 protocol stack handles that were added by the command (if any).
		    A list containing the mvpn receiver site v6 protocol stack handles that were added by the command (if any).
		x   key:mvpn_receiver_site_v6      value:A list containing the mvpn receiver site v6 protocol stack handles that were added by the command (if any).
		    A list containing the mvpn sender site v6 protocol stack handles that were added by the command (if any).
		x   key:mvpn_sender_site_v6        value:A list containing the mvpn sender site v6 protocol stack handles that were added by the command (if any).
		    A list containing the mvpn sender site spmsi v6 protocol stack handles that were added by the command (if any).
		x   key:mvpn_sender_site_spmsi_v6  value:A list containing the mvpn sender site spmsi v6 protocol stack handles that were added by the command (if any).
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    Coded versus functional specification.
		    1) You can configure multiple BGP mVRF on each Ixia interface.
		    2) You can configure multiple MVPN(MVN Sender and Receiver Sites).
		
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
				'emulation_bgp_mvpn_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
