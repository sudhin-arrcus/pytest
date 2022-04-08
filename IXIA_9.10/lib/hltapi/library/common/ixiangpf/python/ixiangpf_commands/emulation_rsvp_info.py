# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_rsvp_info(self, mode, handle, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_rsvp_info
		
		 Description:
		    Retrieves information about the LDP protocol.
		
		 Synopsis:
		    emulation_rsvp_info
		x       -mode                        CHOICES stats
		x                                    CHOICES clear_stats
		x                                    CHOICES fetch_info
		x                                    CHOICES learned_info
		        -handle                      ANY
		        [-port_handle                REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		x       [-lsp_delegation_state       FLAG]
		x       [-re_delegation_timer_status FLAG]
		x       [-session_information        FLAG]
		x       [-lsp_self_ping_status       FLAG]
		
		 Arguments:
		x   -mode
		    -handle
		        The RSVP-TE IF handle to act upon.
		    -port_handle
		x   -lsp_delegation_state
		x       Get LSP Delegation State of RSVP-TE p2p Head ( Ingress ) LSPs
		x   -re_delegation_timer_status
		x       Get Re-Delegation Timer Status of RSVP-TE p2p Head ( Ingress ) LSPs
		x   -session_information
		x       Get Session Information of RSVP-TE PCEP Expected Initiated LSPs
		x   -lsp_self_ping_status
		x       Get the LSP Self Ping Status ( Ingress ) LSPs.
		x       This is a read-only field that shows the status of the LSP Self Ping session.
		x       The status can be one of following based on different scenarios: Success, Timed Out.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status                                         value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log                                            value:If status is failure, detailed information provided.
		    Sessions Up
		x   key:sessions_up                                    value:Sessions Up
		    Sessions Down
		x   key:sessions_down                                  value:Sessions Down
		    Sessions Not Started
		x   key:sessions_not_started                           value:Sessions Not Started
		    Sessions Total
		x   key:sessions_total                                 value:Sessions Total
		    Ingress Lsps Configured
		n   key:ingress_lsps_configured                        value:Ingress Lsps Configured
		    Ingress SubLSPs Configured
		n   key:ingress_sub_lsps_configured                    value:Ingress SubLSPs Configured
		    Ingress Lsps Up
		n   key:ingress_lsps_up                                value:Ingress Lsps Up
		    The number of LSP self ping messages transmitted by Ingress.
		n   key:lsp_self_ping_sent_from_ingress                value:The number of LSP self ping messages transmitted by Ingress.
		    The number of LSP self ping messages received by Ingress.
		n   key:lsp_self_ping_received_by_ingress              value:The number of LSP self ping messages received by Ingress.
		    The number of LSP self ping messages received by Egress.
		n   key:lsp_self_ping_received_by_egress               value:The number of LSP self ping messages received by Egress.
		    The number of LSP self ping messages forwarded by Egress.
		n   key:lsp_self_ping_forwarded_by_egress              value:The number of LSP self ping messages forwarded by Egress. 
		    Ingress SubLSPs Up
		n   key:ingress_sub_lsps_up                            value:Ingress SubLSPs Up
		    Egress LSPs Up
		n   key:egress_lsps_up                                 value:Egress LSPs Up
		    Egress Sub LSPs Up
		n   key:egress_sub_lsps_up                             value:Egress Sub LSPs Up
		    Session Flap Count
		n   key:session_flap_count                             value:Session Flap Count
		    Down State Count
		n   key:down_state_count                               value:Down State Count
		    Path Sent State Count
		n   key:path_sent_state_count                          value:Path Sent State Count
		    Up State Count
		n   key:up_state_count                                 value:Up State Count
		    Paths Tx
		n   key:paths_tx                                       value:Paths Tx
		    Paths Rx
		n   key:paths_rx                                       value:Paths Rx
		    Resvs Tx
		n   key:resvs_tx                                       value:Resvs Tx
		    Resvs Rx
		n   key:resvs_rx                                       value:Resvs Rx
		    Path Tears Tx
		n   key:path_tears_tx                                  value:Path Tears Tx
		    Path Tears Tx
		    key:path_tears_rx                                  value:Path Tears Tx
		    Resv Tears Tx
		    key:resv_tears_tx                                  value:Resv Tears Tx
		    Resv Tears Rx
		    key:resv_tears_rx                                  value:Resv Tears Rx
		    Path Errs Tx
		    key:path_errs_tx                                   value:Path Errs Tx
		    Path Errs Rx
		    key:path_errs_rx                                   value:Path Errs Rx
		    Resv_Errs_Tx
		    key:resv_errs_tx                                   value:Resv_Errs_Tx
		    Resv Errs Rx
		    key:resv_errs_rx                                   value:Resv Errs Rx
		    Resv Confs Tx
		    key:resv_confs_tx                                  value:Resv Confs Tx
		    Resv Confs Rx
		    key:resv_confs_rx                                  value:Resv Confs Rx
		    Ingress Out Of Order Messages Rx
		    key:ingress_out_of_order_messages_rx               value:Ingress Out Of Order Messages Rx
		    Egress Out Of Order Messages Rx
		    key:egress_out_of_order_messages_rx                value:Egress Out Of Order Messages Rx
		    Hellos Tx
		    key:hellos_tx                                      value:Hellos Tx
		    Hellos Rx
		n   key:hellos_rx                                      value:Hellos Rx
		    Acks Tx
		n   key:acks_tx                                        value:Acks Tx
		    Acks Tx
		n   key:acks_rx                                        value:Acks Tx
		    Nacks Tx
		    key:nacks_tx                                       value:Nacks Tx
		    Nacks Rx
		n   key:nacks_rx                                       value:Nacks Rx
		    Srefreshs Tx
		    key:srefreshs_tx                                   value:Srefreshs Tx
		    Srefreshs Rx
		    key:srefreshs_rx                                   value:Srefreshs Rx
		    Bundle Messages Tx
		    key:bundle_messages_tx                             value:Bundle Messages Tx
		    Bundle Messages Rx
		    key:bundle_messages_rx                             value:Bundle Messages Rx
		    Paths With Recovery Labels Tx
		    key:paths_with_recovery_labels_tx                  value:Paths With Recovery Labels Tx
		    Paths With Recovery Labels Rx
		    key:paths_with_recovery_labels_rx                  value:Paths With Recovery Labels Rx
		    Unrecovered Resvs Deleted
		    key:unrecovered_resvs_deleted                      value:Unrecovered Resvs Deleted
		    Own Graceful Restarts
		    key:own_graceful_restarts                          value:Own Graceful Restarts
		    Peer Graceful Restarts
		    key:peer_graceful_restarts                         value:Peer Graceful Restarts
		    Number Of Path Reoptimizations
		    key:number_of_path_reoptimizations                 value:Number Of Path Reoptimizations
		    Path Reevaluation Request Tx
		    key:path_reevaluation_request_tx                   value:Path Reevaluation Request Tx
		    Device ID
		x   key:<handle>.assigned.device_id                    value:Device ID
		    Our IP
		x   key:<handle>.assigned.our_ip                       value:Our IP
		    DUT IP
		x   key:<handle>.assigned.dut_ip                       value:DUT IP
		    Session IP
		x   key:<handle>.assigned.session_ip                   value:Session IP
		    Tunnel ID
		x   key:<handle>.assigned.tunnel_id                    value:Tunnel ID
		    Headend IP
		x   key:<handle>.assigned.headend_ip                   value:Headend IP
		    LSP ID
		x   key:<handle>.assigned.lsp_id                       value:LSP ID
		    Last Flap Reason
		x   key:<handle>.assigned.last_flap_reason             value:Last Flap Reason
		    Current State
		x   key:<handle>.assigned.current_state                value:Current State
		    Label Value
		x   key:<handle>.assigned.label                        value:Label Value
		    Reservation State
		x   key:<handle>.assigned.reservation_state            value:Reservation State
		    Setup Time(ms)
		x   key:<handle>.assigned.setup_time                   value:Setup Time(ms)
		    Up Time(ms)
		x   key:<handle>.assigned.up_time                      value:Up Time(ms)
		    BandWidth (in bps)
		x   key:<handle>.assigned.bandwidth                    value:BandWidth (in bps)
		    ERO Type
		x   key:<handle>.assigned.ero_type                     value:ERO Type
		    ERO IP
		x   key:<handle>.assigned.ero_ip                       value:ERO IP
		    ERO Prefix Length
		x   key:<handle>.assigned.ero_prefix_length            value:ERO Prefix Length
		    ERO AS Number
		x   key:<handle>.assigned.ero_as_number                value:ERO AS Number
		    Device ID
		x   key:<handle>.received.device_id                    value:Device ID
		    Our IP
		x   key:<handle>.received.our_ip                       value:Our IP
		    DUT IP
		x   key:<handle>.received.dut_ip                       value:DUT IP
		    Session IP
		x   key:<handle>.received.session_ip                   value:Session IP
		    Tunnel ID
		x   key:<handle>.received.tunnel_id                    value:Tunnel ID
		    Headend IP
		x   key:<handle>.received.headend_ip                   value:Headend IP
		    LSP ID
		x   key:<handle>.received.lsp_id                       value:LSP ID
		    Last Flap Reason
		x   key:<handle>.received.last_flap_reason             value:Last Flap Reason
		    Current State
		x   key:<handle>.received.current_state                value:Current State
		    Label Value
		x   key:<handle>.received.label                        value:Label Value
		    Reservation State
		x   key:<handle>.received.reservation_state            value:Reservation State
		    Setup Time(ms)
		x   key:<handle>.received.setup_time                   value:Setup Time(ms)
		    Up Time(ms)
		x   key:<handle>.received.up_time                      value:Up Time(ms)
		    BandWidth (in bps)
		x   key:<handle>.received.bandwidth                    value:BandWidth (in bps)
		    ERO Type
		x   key:<handle>.received.ero_type                     value:ERO Type
		    ERO IP
		x   key:<handle>.received.ero_ip                       value:ERO IP
		    ERO Prefix Length
		x   key:<handle>.received.ero_prefix_length            value:ERO Prefix Length
		    ERO AS Number
		x   key:<handle>.received.ero_as_number                value:ERO AS Number
		    RRO Type
		x   key:<handle>.received.rro_type                     value:RRO Type
		    RRO IP
		x   key:<handle>.received.rro_ip                       value:RRO IP
		    RRO Label
		x   key:<handle>.received.rro_label                    value:RRO Label
		    RRO C-Type
		x   key:<handle>.received.rro_c_type                   value:RRO C-Type
		    Symbolic Path Name
		x   key:<handle>.received.symbolic_path_name           value:Symbolic Path Name
		    Device ID
		x   key:<handle>.p2mpassigned.device_id                value:Device ID
		    Our IP
		x   key:<handle>.p2mpassigned.our_ip                   value:Our IP
		    Dut IP
		x   key:<handle>.p2mpassigned.dut_ip                   value:Dut IP
		    P2MP ID
		x   key:<handle>.p2mpassigned.p2mp_id                  value:P2MP ID
		    P2MP ID as Number
		x   key:<handle>.p2mpassigned.p2mp_id_as_number        value:P2MP ID as Number
		    Tunnel ID
		x   key:<handle>.p2mpassigned.tunnel_id                value:Tunnel ID
		    Head End IP
		x   key:<handle>.p2mpassigned.head_end_ip              value:Head End IP
		    LSP ID
		x   key:<handle>.p2mpassigned.lsp_id                   value:LSP ID
		    Leaf IP
		x   key:<handle>.p2mpassigned.leaf_ip                  value:Leaf IP
		    Sub Group Originator ID
		x   key:<handle>.p2mpassigned.sub_group_originator_id  value:Sub Group Originator ID
		    Sub Group ID
		x   key:<handle>.p2mpassigned.sub_group_id             value:Sub Group ID
		    Current State
		x   key:<handle>.p2mpassigned.current_state            value:Current State
		    Last Flap Reason
		x   key:<handle>.p2mpassigned.last_flap_reason         value:Last Flap Reason
		    Label
		x   key:<handle>.p2mpassigned.label                    value:Label
		    Reservation State
		x   key:<handle>.p2mpassigned.reservation_state        value:Reservation State
		    Setup Time(ms)
		x   key:<handle>.p2mpassigned.setup_time               value:Setup Time(ms)
		    Up Time(ms)
		x   key:<handle>.p2mpassigned.up_time                  value:Up Time(ms)
		    Device ID
		x   key:<handle>.p2mpreceived.device_id                value:Device ID
		    Our IP
		x   key:<handle>.p2mpreceived.our_ip                   value:Our IP
		    Dut IP
		x   key:<handle>.p2mpreceived.dut_ip                   value:Dut IP
		    P2MP ID
		x   key:<handle>.p2mpreceived.p2mp_id                  value:P2MP ID
		    P2MP ID as Number
		x   key:<handle>.p2mpreceived.p2mp_id_as_number        value:P2MP ID as Number
		    Tunnel ID
		x   key:<handle>.p2mpreceived.tunnel_id                value:Tunnel ID
		    Head End IP
		x   key:<handle>.p2mpreceived.head_end_ip              value:Head End IP
		    LSP ID
		x   key:<handle>.p2mpreceived.lsp_id                   value:LSP ID
		    Leaf IP
		x   key:<handle>.p2mpreceived.leaf_ip                  value:Leaf IP
		    Sub Group Originator ID
		x   key:<handle>.p2mpreceived.sub_group_originator_id  value:Sub Group Originator ID
		    Sub Group ID
		x   key:<handle>.p2mpreceived.sub_group_id             value:Sub Group ID
		    Current State
		x   key:<handle>.p2mpreceived.current_state            value:Current State
		    Last Flap Reason
		x   key:<handle>.p2mpreceived.last_flap_reason         value:Last Flap Reason
		    Label
		x   key:<handle>.p2mpreceived.label                    value:Label
		    Reservation State
		x   key:<handle>.p2mpreceived.reservation_state        value:Reservation State
		    Setup Time(ms)
		x   key:<handle>.p2mpreceived.setup_time               value:Setup Time(ms)
		    Up Time(ms)
		x   key:<handle>.p2mpreceived.up_time                  value:Up Time(ms)
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    Coded versus functional specification.
		    For  -mode choice fetch_info, provide handle of the node/object from which you need to fetch a property.
		
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
				'emulation_rsvp_info', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
