##Procedure Header
# Name:
#    ::ixiangpf::emulation_pcc_info
#
# Description:
#    This procedure retrieves information about the PCEP sessions.
#    This procedure is also used to fetch stats, learned information and configured properties of PCC, depending on the given mode and handle.
#
# Synopsis:
#    ::ixiangpf::emulation_pcc_info
#x       -mode                        CHOICES per_port_stats
#x                                    CHOICES per_session_stats
#x                                    CHOICES per_device_group_stats
#x                                    CHOICES clear_stats
#x                                    CHOICES fetch_info
#x                                    CHOICES learned_info_sr_basic_pce_initiated
#x                                    CHOICES learned_info_sr_basic_pcc_requested
#x                                    CHOICES learned_info_sr_basic_pcc_sync
#x                                    CHOICES learned_info_sr_basic_all
#x                                    CHOICES learned_info_sr_detailed_all
#x                                    CHOICES clear_learned_info
#        -handle                      ANY
#        [-port_handle                REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#x       [-lsp_delegation_state       FLAG]
#x       [-re_delegation_timer_status FLAG]
#
# Arguments:
#x   -mode
#x       For fetching per_port_stats provide any PCC handle, for per_session_stats and per_device_group_stats provide a PCC handle which is on the corresponding port.
#x       For fetching learned information, PCC handle needs to be given.
#x       Forfetch_info, provide handle of the node/object from which you need to fetch a property.
#    -handle
#        The PCEP PCC handle to act upon.
#    -port_handle
#        Port handle.
#x   -lsp_delegation_state
#x       Get LSP Delegation State. Mandatory flag for fetching LSP Delegation State of PCC Requested SR LSPs/ PCC Pre-Established SR LSPs
#x   -re_delegation_timer_status
#x       Get Re-Delegation Timer Status. Mandatory flag for fetching Re-Delegation Timer Status of PCC Requested SR LSPs/ PCC Pre-Established SR LSPs
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status                                                       value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log                                                          value:If status is failure, detailed information provided.
#    Sessions Up
#x   key:sessions_up                                                  value:Sessions Up
#    Sessions Down
#x   key:sessions_down                                                value:Sessions Down
#    Sessions Not Started
#x   key:sessions_not_started                                         value:Sessions Not Started
#    Sessions Total
#x   key:sessions_total                                               value:Sessions Total
#    Session Flap Count
#x   key:session_flap_count                                           value:Session Flap Count
#    Open Message Rx
#x   key:open_message_rx                                              value:Open Message Rx
#    Open Message Tx
#x   key:open_message_tx                                              value:Open Message Tx
#    Keepalive Message Rx
#x   key:keepalive_message_rx                                         value:Keepalive Message Rx
#    Keepalive Message Tx
#x   key:keepalive_message_tx                                         value:Keepalive Message Tx
#    Close Message Rx
#x   key:close_message_rx                                             value:Close Message Rx
#    Close Message Tx
#x   key:close_message_tx                                             value:Close Message Tx
#    Unknown Message Rx
#x   key:unknown_message_rx                                           value:Unknown Message Rx
#    Total TCP Connection Established
#x   key:total_tcp_connection_established                             value:Total TCP Connection Established
#    PCInitiate Message Rx
#x   key:pcinitiate_message_rx                                        value:PCInitiate Message Rx
#    Remove Initiated LSP Rx
#x   key:remove_initiated_lsp_rx                                      value:Remove Initiated LSP Rx
#    PCRpt Message Tx
#x   key:pcrpt_message_tx                                             value:PCRpt Message Tx
#    PCUpdate Message Rx
#x   key:pcupdate_message_rx                                          value:PCUpdate Message Rx
#    PCErr Message Rx
#x   key:pcerr_message_rx                                             value:PCErr Message Rx
#    PCErr Message Tx
#x   key:pcerr_message_tx                                             value:PCErr Message Tx
#    Total Initiated LSP Rx
#x   key:total_initiated_lsp_rx                                       value:Total Initiated LSP Rx
#    Sync LSP Tx
#x   key:sync_lsp_tx                                                  value:Sync LSP Tx
#    PCReq Message Tx
#x   key:pcreq_message_tx                                             value:PCReq Message Tx
#    PCRep Message Rx
#x   key:pcrep_message_rx                                             value:PCRep Message Rx
#    Total Requested LSP Tx
#x   key:total_requested_lsp_tx                                       value:Total Requested LSP Tx
#    Total Responded LSP Rx
#x   key:total_responded_lsp_rx                                       value:Total Responded LSP Rx
#    No Path Rx
#x   key:no_path_rx                                                   value:No Path Rx
#    RSVP Going Up LSP Tx
#x   key:rsvp_going_up_lsp_tx                                         value:RSVP Going Up LSP Tx
#    RSVP Up LSP Tx
#x   key:rsvp_up_lsp_tx                                               value:RSVP Up LSP Tx
#    RSVP Remove LSP Tx
#x   key:rsvp_remove_lsp_tx                                           value:RSVP Remove LSP Tx
#    RSVP Delegated LSP Tx
#x   key:rsvp_delegated_lsp_tx                                        value:RSVP Delegated LSP Tx
#    RSVP Revoked LSP Tx
#x   key:rsvp_revoked_lsp_tx                                          value:RSVP Revoked LSP Tx
#    RSVP Delegation Returned LSP Rx
#x   key:rsvp_delegation_returned_lsp_rx                              value:RSVP Delegation Returned LSP Rx
#    SR Delegated LSP Tx
#x   key:sr_delegated_lsp_tx                                          value:SR Delegated LSP Tx
#    SR Revoked LSP Tx
#x   key:sr_revoked_lsp_tx                                            value:SR Revoked LSP Tx
#    SR Delegation Returned LSP Rx
#x   key:sr_delegation_returned_lsp_rx                                value:SR Delegation Returned LSP Rx
#    PCE IP
#x   key:<handle>.pccsrlearnedinformation.learned_pce_ip_address      value:PCE IP
#    LSP Type
#x   key:<handle>.pccsrlearnedinformation.learned_lsp_type            value:LSP Type
#    Symbolic Path Name
#x   key:<handle>.pccsrlearnedinformation.symbolic_path_name          value:Symbolic Path Name
#    PLSP-ID
#x   key:<handle>.pccsrlearnedinformation.plsp_id                     value:PLSP-ID
#    Source IP Address
#x   key:<handle>.pccsrlearnedinformation.source_ip_address           value:Source IP Address
#    Destination IP Address
#x   key:<handle>.pccsrlearnedinformation.dest_ip_address             value:Destination IP Address
#    Bandwidth (Bps)
#x   key:<handle>.pccsrlearnedinformation.bandwidth                   value:Bandwidth (Bps)
#    ERO Info
#x   key:<handle>.pccsrlearnedinformation.ero_info                    value:ERO Info
#    Error Info
#x   key:<handle>.pccsrlearnedinformation.learned_error_info          value:Error Info
#    LSP Index
#x   key:<handle>.pccdetailedlearnedinformation.learned_lsp_index     value:LSP Index
#    LSP Type
#x   key:<handle>.pccdetailedlearnedinformation.learned_msg_db_type   value:LSP Type
#    Request ID
#x   key:<handle>.pccdetailedlearnedinformation.request_id            value:Request ID
#    LSP-ID
#x   key:<handle>.pccdetailedlearnedinformation.plsp_id               value:LSP-ID
#    Symbolic Path Name
#x   key:<handle>.pccdetailedlearnedinformation.symbolic_path_name    value:Symbolic Path Name
#    IP Version
#x   key:<handle>.pccdetailedlearnedinformation.ip_version            value:IP Version
#    Source IPv4 Address
#x   key:<handle>.pccdetailedlearnedinformation.source_ipv4_address   value:Source IPv4 Address
#    Destination IPv4 Address
#x   key:<handle>.pccdetailedlearnedinformation.dest_ipv4_address     value:Destination IPv4 Address
#    Source IPv6 Address
#x   key:<handle>.pccdetailedlearnedinformation.source_ipv6_address   value:Source IPv6 Address
#    Destination IPv6 Address
#x   key:<handle>.pccdetailedlearnedinformation.dest_ipv6_address     value:Destination IPv6 Address
#    SID-Type
#x   key:<handle>.pccdetailedlearnedinformation.sid_type              value:SID-Type
#    SID
#x   key:<handle>.pccdetailedlearnedinformation.sid                   value:SID
#    MPLS Label
#x   key:<handle>.pccdetailedlearnedinformation.mpls_label            value:MPLS Label
#    NAI-Type
#x   key:<handle>.pccdetailedlearnedinformation.nai_type              value:NAI-Type
#    IPv4 Node ID
#x   key:<handle>.pccdetailedlearnedinformation.ipv4_node_id          value:IPv4 Node ID
#    IPv6 Node ID
#x   key:<handle>.pccdetailedlearnedinformation.ipv6_node_id          value:IPv6 Node ID
#    Local IPv4 Address
#x   key:<handle>.pccdetailedlearnedinformation.local_i_pv4address    value:Local IPv4 Address
#    Remote IPv4 Address
#x   key:<handle>.pccdetailedlearnedinformation.remote_i_pv4address   value:Remote IPv4 Address
#    Local IPv6 Address
#x   key:<handle>.pccdetailedlearnedinformation.local_i_pv6address    value:Local IPv6 Address
#    Remote IPv6 Address
#x   key:<handle>.pccdetailedlearnedinformation.remote_i_pv6address   value:Remote IPv6 Address
#    Local Node-ID
#x   key:<handle>.pccdetailedlearnedinformation.local_node_i_d        value:Local Node-ID
#    Local Interface ID
#x   key:<handle>.pccdetailedlearnedinformation.local_inteface_i_d    value:Local Interface ID
#    Remote Node-ID
#x   key:<handle>.pccdetailedlearnedinformation.remote_node_i_d       value:Remote Node-ID
#    Remote Interface ID
#x   key:<handle>.pccdetailedlearnedinformation.remote_interface_i_d  value:Remote Interface ID
#    Error Info
#x   key:<handle>.pccdetailedlearnedinformation.error_info            value:Error Info
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

proc ::ixiangpf::emulation_pcc_info { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{-lsp_delegation_state -re_delegation_timer_status}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_pcc_info" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
