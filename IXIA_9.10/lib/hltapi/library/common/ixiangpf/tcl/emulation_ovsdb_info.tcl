##Procedure Header
# Name:
#    ::ixiangpf::emulation_ovsdb_info
#
# Description:
#    Retrieves information about the OVSDB Controller protocol.
#
# Synopsis:
#    ::ixiangpf::emulation_ovsdb_info
#        -mode               CHOICES aggregate_stats
#                            CHOICES stats
#                            CHOICES clear_stats
#x       [-execution_timeout NUMERIC
#x                           DEFAULT 1800]
#        [-handle            ANY]
#        [-port_handle       REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#
# Arguments:
#    -mode
#        What action will be taken.Valid options are:
#        aggregate_stats
#        stats
#        clear_stats
#x   -execution_timeout
#x       This is the timeout for the function.
#x       The setting is in seconds.
#x       Setting this setting to 60 it will mean that the command must complete in under 60 seconds.
#x       If the command will last more than 60 seconds the command will be terminated by force.
#x       This flag can be used to prevent dead locks occuring in IxNetwork.
#    -handle
#        The Ovsdb Controller /switch session handle to act upon.
#    -port_handle
#        The port from which to extract Ovsdb Controller data.
#        One of the two parameters is required: port_handle/handle.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status                                        value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log                                           value:If status is failure, detailed information provided.
#    key:Aggregate stats:                              value:
#    key:<port_handle>.aggregate.port_name             value:
#    key:<port_handle>.aggregate.sessions_up           value:
#    key:<port_handle>.aggregate.sessions_down         value:
#    key:<port_handle>.aggregate.sessions_not_started  value:
#    key:<port_handle>.aggregate.sessions_total        value:
#    key:<port_handle>.aggregate.json_rx               value:
#    key:<port_handle>.aggregate.json_tx               value:
#    key:<port_handle>.aggregate.invalid_json_rx       value:
#    key:<port_handle>.aggregate.monitor_tx            value:
#    key:<port_handle>.aggregate.monitor_rx            value:
#    key:<port_handle>.aggregate.transact_tx           value:
#    key:<port_handle>.aggregate.transact_rx           value:
#    key:<port_handle>.aggregate.reply_rx              value:
#    key:<port_handle>.aggregate.error_rx              value:
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    Coded versus functional specification.
#
# See Also:
#

proc ::ixiangpf::emulation_ovsdb_info { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_ovsdb_info" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
