##Procedure Header
# Name:
#    ::ixiangpf::emulation_bondedgre_info
#
# Description:
#    Retrieves information about the BondedGRE protocol.
#
# Synopsis:
#    ::ixiangpf::emulation_bondedgre_info
#x       -mode         CHOICES per_port_stats
#x                     CHOICES per_session_stats
#x                     CHOICES clear_stats
#        -handle       ANY
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#
# Arguments:
#x   -mode
#    -handle
#        The BondedGRE handle to act upon.
#    -port_handle
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status                     value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log                        value:If status is failure, detailed information provided.
#    BondedGRE Up
#x   key:sessions_up                value:BondedGRE Up
#    BondedGRE Down
#x   key:sessions_down              value:BondedGRE Down
#    BondedGRE Not Started
#x   key:sessions_not_started       value:BondedGRE Not Started
#    BondedGRE Total
#x   key:sessions_total             value:BondedGRE Total
#    DSL Tunnel Up
#x   key:dsl_Tunnel_Up              value:DSL Tunnel Up
#    LTE Tunnel Up
#x   key:lte_Tunnel_Up              value:LTE Tunnel Up
#    Total Tunnel Up
#x   key:total_Tunnel_Up            value:Total Tunnel Up
#    DSL Tunnel Down
#x   key:dsl_Tunnel_Down            value:DSL Tunnel Down
#    LTE Tunnel Down
#x   key:lte_Tunnel_Down            value:LTE Tunnel Down
#    Total Tunnel Down
#x   key:total_Tunnel_Down          value:Total Tunnel Down
#    Setup Message Tx
#x   key:setup_Msg_Tx               value:Setup Message Tx
#    Accept Message Rx
#x   key:accept_Msg_Rx              value:Accept Message Rx
#    Setup Deny Message Rx
#x   key:setup_Deny_Msg_Rx          value:Setup Deny Message Rx
#    Tunnel Hello Tx
#x   key:tunnel_Hello_Tx            value:Tunnel Hello Tx
#    Tunnel Hello Rx
#x   key:tunnel_Hello_Rx            value:Tunnel Hello Rx
#    Tunnel Tear Down Rx
#x   key:tunnel_TearDown_Rx         value:Tunnel Tear Down Rx
#    Tunnel Notify Tx
#x   key:tunnel_Notify_Tx           value:Tunnel Notify Tx
#    Tunnel Notify Rx
#x   key:tunnel_Notify_Rx           value:Tunnel Notify Rx
#    Total GRE Messages Tx
#x   key:total_GRE_Msg_Tx           value:Total GRE Messages Tx
#    Total GRE Messages Rx
#x   key:total_GRE_Msg_Rx           value:Total GRE Messages Rx
#    Tunnel Verification
#x   key:tunnel_Verification        value:Tunnel Verification
#    Switching to DSL Tunnel
#x   key:switching_To_Dsl_Tunnel    value:Switching to DSL Tunnel
#    Overflowing to LTE Tunnel
#x   key:overflowing_To_Lte_Tunnel  value:Overflowing to LTE Tunnel
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

proc ::ixiangpf::emulation_bondedgre_info { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_bondedgre_info" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
