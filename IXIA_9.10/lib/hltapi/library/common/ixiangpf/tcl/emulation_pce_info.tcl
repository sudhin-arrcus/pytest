##Procedure Header
# Name:
#    ::ixiangpf::emulation_pce_info
#
# Description:
#    This procedure retrieves information about the PCEP sessions.
#    This procedure is also used to fetch stats, learned information and configured properties of PCE, depending on the given mode and handle.
#
# Synopsis:
#    ::ixiangpf::emulation_pce_info
#x       -mode                         CHOICES per_port_stats
#x                                     CHOICES per_session_stats
#x                                     CHOICES per_device_group_stats
#x                                     CHOICES clear_stats
#x                                     CHOICES fetch_info
#x                                     CHOICES learned_info_sr_basic_pce_initiated
#x                                     CHOICES learned_info_sr_basic_pcc_requested
#x                                     CHOICES learned_info_sr_basic_pcc_sync
#x                                     CHOICES learned_info_sr_basic_all
#x                                     CHOICES learned_info_rsvp_basic_pce_initiated
#x                                     CHOICES learned_info_rsvp_basic_pcc_requested
#x                                     CHOICES learned_info_rsvp_basic_pcc_sync
#x                                     CHOICES learned_info_rsvp_basic_all
#x                                     CHOICES learned_info_sr_detailed_pce_initiated
#x                                     CHOICES learned_info_sr_detailed_pcc_requested
#x                                     CHOICES learned_info_sr_detailed_pcc_sync
#x                                     CHOICES learned_info_sr_detailed_all
#x                                     CHOICES learned_info_rsvp_detailed_pce_initiated
#x                                     CHOICES learned_info_rsvp_detailed_pcc_requested
#x                                     CHOICES learned_info_rsvp_detailed_pcc_sync
#x                                     CHOICES learned_info_rsvp_detailed_all
#x                                     CHOICES clear_learned_info
#        -handle                       ANY
#        [-port_handle                 REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#x       [-lsp_state                   FLAG]
#x       [-received_plsp_id            FLAG]
#x       [-received_symbolic_path_name FLAG]
#
# Arguments:
#x   -mode
#x       For fetching per_port_stats provide any PCE handle, for per_session_stats and per_device_group_stats provide a PCE handle which is on the corresponding port.
#x       For fetching learned information, PCE handle needs to be given.
#x       Forfetch_info, provide handle of the node/object from which you need to fetch a property.
#    -handle
#        The PCEP PCE handle to act upon.
#    -port_handle
#        Port handle.
#x   -lsp_state
#x       Get LSP State. Mandatory flag for fetching LSP State of PCEInitiated LSP Parameters.
#x   -received_plsp_id
#x       Get Received PLSP-ID. Mandatory flag for fetching Received PLSP-ID of PCReply LSP Parameters.
#x   -received_symbolic_path_name
#x       Get Received Symbolic Path Name. Mandatory flag for fetching Received Symbolic Path Name of PCReply LSP Parameters.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status                                                                   value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log                                                                      value:If status is failure, detailed information provided.
#    Sessions Up
#x   key:sessions_up                                                              value:Sessions Up
#    Sessions Down
#x   key:sessions_down                                                            value:Sessions Down
#    Sessions Not Started
#x   key:sessions_not_started                                                     value:Sessions Not Started
#    Sessions Total
#x   key:sessions_total                                                           value:Sessions Total
#    Session Flap Count
#x   key:session_flap_count                                                       value:Session Flap Count
#    Open Message Rx
#x   key:open_message_rx                                                          value:Open Message Rx
#    Open Message Tx
#x   key:open_message_tx                                                          value:Open Message Tx
#    Keepalive Message Rx
#x   key:keepalive_message_rx                                                     value:Keepalive Message Rx
#    Keepalive Message Tx
#x   key:keepalive_message_tx                                                     value:Keepalive Message Tx
#    Close Message Rx
#x   key:close_message_rx                                                         value:Close Message Rx
#    Close Message Tx
#x   key:close_message_tx                                                         value:Close Message Tx
#    Unknown Message Rx
#x   key:unknown_message_rx                                                       value:Unknown Message Rx
#    Total TCP Connection Request Received
#x   key:total_tcp_connection_request_received                                    value:Total TCP Connection Request Received
#    PCInitiate Message Tx
#x   key:pcinitiate_message_tx                                                    value:PCInitiate Message Tx
#    Remove Initiated LSP Tx
#x   key:remove_initiated_lsp_tx                                                  value:Remove Initiated LSP Tx
#    PCRpt Message Rx
#x   key:pcrpt_message_rx                                                         value:PCRpt Message Rx
#    PCUpdate Message Tx
#x   key:pcupdate_message_tx                                                      value:PCUpdate Message Tx
#    PCErr Message Rx
#x   key:pcerr_message_rx                                                         value:PCErr Message Rx
#    PCErr Message Tx
#x   key:pcerr_message_tx                                                         value:PCErr Message Tx
#    Total Initiated LSP Tx
#x   key:total_initiated_lsp_tx                                                   value:Total Initiated LSP Tx
#    Total Delegated LSP
#x   key:total_delegated_lsp                                                      value:Total Delegated LSP
#    PCReq Message Rx
#x   key:pcreq_message_rx                                                         value:PCReq Message Rx
#    PCRep Message Tx
#x   key:pcrep_message_tx                                                         value:PCRep Message Tx
#    No Path Tx
#x   key:no_path_tx                                                               value:No Path Tx
#    Total Requested LSP Rx
#x   key:total_requested_lsp_rx                                                   value:Total Requested LSP Rx
#    Total Responded LSP Tx
#x   key:total_responded_lsp_tx                                                   value:Total Responded LSP Tx
#    Sync LSP Rx
#x   key:sync_lsp_rx                                                              value:Sync LSP Rx
#    PCC IP
#x   key:<handle>.pcebasiclearnedinformation.learned_pcc_ip_address               value:PCC IP
#    LSP Type
#x   key:<handle>.pcebasiclearnedinformation.learned_lsp_type                     value:LSP Type
#    Symbolic Path Name
#x   key:<handle>.pcebasiclearnedinformation.learned_symbolic_path_name           value:Symbolic Path Name
#    PLSP-ID
#x   key:<handle>.pcebasiclearnedinformation.learned_plsp_id                      value:PLSP-ID
#    Operational State
#x   key:<handle>.pcebasiclearnedinformation.learned_operational_state            value:Operational State
#    Delegation State
#x   key:<handle>.pcebasiclearnedinformation.learned_delegation_state             value:Delegation State
#    RRO Info
#x   key:<handle>.pcebasiclearnedinformation.learned_rro_info                     value:RRO Info
#    Error Info
#x   key:<handle>.pcebasiclearnedinformation.learned_error_info                   value:Error Info
#    Triggers
#x   key:<handle>.pcebasiclearnedinformation.pce_triggers_choice_list             value:Triggers
#    Tunnel ID
#x   key:<handle>.pcersvpbasiclearnedinformation.learned_tunnel_id                value:Tunnel ID
#    RSVP LSP ID
#x   key:<handle>.pcersvpbasiclearnedinformation.learned_rsvp_lsp_id              value:RSVP LSP ID
#    Symbolic Path Name
#x   key:<handle>.pcedetailedlearnedinformation.learned_symbolic_path_name        value:Symbolic Path Name
#    IPv4 Source Endpoint
#x   key:<handle>.pcedetailedlearnedinformation.learned_ipv4_tunnel_src_addr      value:IPv4 Source Endpoint
#    IPv4 Destination Endpoint
#x   key:<handle>.pcedetailedlearnedinformation.learned_ipv4_tunnel_dest_addr     value:IPv4 Destination Endpoint
#    IPv6 Source Endpoint
#x   key:<handle>.pcedetailedlearnedinformation.learned_ipv6_tunnel_src_addr      value:IPv6 Source Endpoint
#    IPv6 Destination Endpoint
#x   key:<handle>.pcedetailedlearnedinformation.learned_ipv6_tunnel_dest_addr     value:IPv6 Destination Endpoint
#    Actual Bandwidth(Bps)
#x   key:<handle>.pcedetailedlearnedinformation.learned_actual_bandwidth          value:Actual Bandwidth(Bps)
#    Holding Priority
#x   key:<handle>.pcedetailedlearnedinformation.learned_holding_priority          value:Holding Priority
#    Setup Priority
#x   key:<handle>.pcedetailedlearnedinformation.learned_setup_priority            value:Setup Priority
#    Actual Metric Type
#x   key:<handle>.pcedetailedlearnedinformation.learned_actual_metric_type        value:Actual Metric Type
#    Actual Metric Value
#x   key:<handle>.pcedetailedlearnedinformation.learned_actual_metric_value       value:Actual Metric Value
#    RRO SID Type
#x   key:<handle>.pcesrdetailedlearnedinformation.learned_rro_sid_type            value:RRO SID Type
#    RRO SID Value
#x   key:<handle>.pcesrdetailedlearnedinformation.learned_rro_sid_value           value:RRO SID Value
#    RRO NAI Type
#x   key:<handle>.pcesrdetailedlearnedinformation.learned_rro_nai_type            value:RRO NAI Type
#    RRO NAI Value
#x   key:<handle>.pcesrdetailedlearnedinformation.learned_rro_nai_value           value:RRO NAI Value
#    RRO Sub-Object Type
#x   key:<handle>.pcersvpdetailedlearnedinformation.learned_rro_sub_object_type   value:RRO Sub-Object Type
#    RRO Sub-Object Value
#x   key:<handle>.pcersvpdetailedlearnedinformation.learned_rro_sub_object_value  value:RRO Sub-Object Value
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

proc ::ixiangpf::emulation_pce_info { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{-lsp_state -received_plsp_id -received_symbolic_path_name}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_pce_info" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
