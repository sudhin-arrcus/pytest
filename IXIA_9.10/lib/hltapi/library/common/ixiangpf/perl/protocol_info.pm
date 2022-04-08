##Procedure Header
# Name:
#    ixiangpf::protocol_info
#
# Description:
#    This procedure is used to get session status statistics for NGPF protocols that support start and stop operations.
#
# Synopsis:
#    ixiangpf::protocol_info
#x       [-handle            ANY]
#x       [-port_filter       ANY]
#x       [-mode              CHOICES aggregate
#x                           CHOICES handles
#x                           CHOICES global_per_protocol
#x                           CHOICES global_per_port
#x                           DEFAULT global_per_protocol]
#x       [-execution_timeout NUMERIC
#x                           DEFAULT 1800]
#
# Arguments:
#x   -handle
#x       A handle or list of handles that correspond to NGPF protocols.
#x       If an invalid handle is given, a warning will be printed to the console and the corresponding handle will be ignored.
#x       If the argument is omitted, the command will return the status of all NGPF protocols that are found.
#x   -port_filter
#x       A port handle, virtual port handle or a list containing any combination of port handles and virtual ports.
#x       The ports that correspond to the specified handles will be used to filter the results of the command. If any of the specified handles does not match any of the port filters, no information about the sessions configured on that handle will be returned.
#x       If an invalid port is specified, the command will return an error.
#x   -mode
#x       Specifies the retrieval mode as either aggregate for all configured sessions or on a per session basis.
#x   -execution_timeout
#x       This is the time-out for the function.
#x       The setting is in seconds.
#x       Setting this to 60 means that the command must complete in under 60 seconds.
#x       If the command lasts more than 60 seconds the command is terminated by force.
#x       This flag can be used to prevent dead locks occurring in IxNetwork.
#
# Return Values:
#    The number of sessions belonging to the specified handle that are not joined. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.sessions_not_joined                   value:The number of sessions belonging to the specified handle that are not joined. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are joined. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.sessions_joined                       value:The number of sessions belonging to the specified handle that are joined. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are down. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.sessions_down                         value:The number of sessions belonging to the specified handle that are down. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are up. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.sessions_up                           value:The number of sessions belonging to the specified handle that are up. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are not started. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted.
#    key:[<handle>].aggregate.sessions_not_started                  value:The number of sessions belonging to the specified handle that are not started. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted.
#    The number of sessions belonging to the specified handle that are configured. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted.
#    key:[<handle>].aggregate.sessions_total                        value:The number of sessions belonging to the specified handle that are configured. This key is returned only if the mode is set to aggregate and the port_filter argument is omitted.
#    The number sessions belonging to the specified handle that are not joined on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.[<port_filter>].sessions_not_joined   value:The number sessions belonging to the specified handle that are not joined on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are joined on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.[<port_filter>].sessions_joined       value:The number of sessions belonging to the specified handle that are joined on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    The number sessions belonging to the specified handle that are down on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.[<port_filter>].sessions_down         value:The number sessions belonging to the specified handle that are down on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are up on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].aggregate.[<port_filter>].sessions_up           value:The number of sessions belonging to the specified handle that are up on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given. If the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The number of sessions belonging to the specified handle that are not started on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given.
#    key:[<handle>].aggregate.[<port_filter>].sessions_not_started  value:The number of sessions belonging to the specified handle that are not started on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given.
#    The number of sessions belonging to the specified handle that are configured on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given.
#    key:[<handle>].aggregate.[<port_filter>].sessions_total        value:The number of sessions belonging to the specified handle that are configured on the specified port. This key is returned only if the mode is set to aggregate and the port_filter argument is given.
#    The handles of all sessions belonging to the specified handle that are not joined. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are in the not joined state or the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    key:[<handle>].handles.sessions_not_joined                     value:The handles of all sessions belonging to the specified handle that are not joined. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are in the not joined state or the protocol that corresponds to handle does not support the notion of join/leave for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are joined. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are joined or the protocol that corresponds to handle does not support the notion of leave/join for its sessions, this key will not be returned.
#    key:[<handle>].handles.sessions_joined                         value:The handles of all sessions belonging to the specified handle that are joined. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are joined or the protocol that corresponds to handle does not support the notion of leave/join for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are down. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are down or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].handles.sessions_down                           value:The handles of all sessions belonging to the specified handle that are down. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are down or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned. 
#    The handles of all sessions belonging to the specified handle that are up. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are up or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].handles.sessions_up                             value:The handles of all sessions belonging to the specified handle that are up. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are up or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are not started. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If all sessions are started, this key will not be returned.
#    key:[<handle>].handles.sessions_not_started                    value:The handles of all sessions belonging to the specified handle that are not started. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If all sessions are started, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are configured. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are configured, this key will not be returned.
#    key:[<handle>].handles.sessions_total                          value:The handles of all sessions belonging to the specified handle that are configured. This key is returned only if the mode is set to handles and the port_filter argument is omitted. If no sessions are configured, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are not joined on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are in the not joined state or the protocol that corresponds to handle does not support the notion of leave/join for its sessions, this key will not be returned.
#    key:[<handle>].handles.[<port_filter>].sessions_not_joined     value:The handles of all sessions belonging to the specified handle that are not joined on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are in the not joined state or the protocol that corresponds to handle does not support the notion of leave/join for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are joined on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are joined or the protocol that corresponds to handle does not support the notion of leave/join for its sessions, this key will not be returned.
#    key:[<handle>].handles.[<port_filter>].sessions_joined         value:The handles of all sessions belonging to the specified handle that are joined on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are joined or the protocol that corresponds to handle does not support the notion of leave/join for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are down on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are down or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].handles.[<port_filter>].sessions_down           value:The handles of all sessions belonging to the specified handle that are down on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are down or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are up on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are up or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    key:[<handle>].handles.[<port_filter>].sessions_up             value:The handles of all sessions belonging to the specified handle that are up on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are up or the protocol that corresponds to handle does not support the notion of start/stop for its sessions, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are not started on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If all sessions are started, this key will not be returned.
#    key:[<handle>].handles.[<port_filter>].sessions_not_started    value:The handles of all sessions belonging to the specified handle that are not started on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If all sessions are started, this key will not be returned.
#    The handles of all sessions belonging to the specified handle that are configured on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are configured, this key will not be returned.
#    key:[<handle>].handles.[<port_filter>].sessions_total          value:The handles of all sessions belonging to the specified handle that are configured on the specified port. This key is returned only if the mode is set to handles and the port_filter argument is given. If no sessions are configured, this key will not be returned.
#    Name of the protocol. This is used as a grouping key when mode is global_per_protocol (default). This is returned for global_per_protocol mode.
#    key:[<grouping_key>].protocol                                  value:Name of the protocol. This is used as a grouping key when mode is global_per_protocol (default). This is returned for global_per_protocol mode.
#    Name of the port. This is used as grouping key when mode is global_per_port. This is returned for global_per_port mode.
#    key:[<grouping_key>].port_name                                 value:Name of the port. This is used as grouping key when mode is global_per_port. This is returned for global_per_port mode.
#    The number of sessions which are up. This is returned for global_per_protocol or global_per_port modes.
#    key:[<grouping_key>].sessions_up                               value:The number of sessions which are up. This is returned for global_per_protocol or global_per_port modes.
#    The number of sessions which are down. This is returned for global_per_protocol or global_per_port modes.
#    key:[<grouping_key>].sessions_down                             value:The number of sessions which are down. This is returned for global_per_protocol or global_per_port modes.
#    The number of sessions which are not started. This is returned for global_per_protocol or global_per_port modes.
#    key:[<grouping_key>].sessions_not_started                      value:The number of sessions which are not started. This is returned for global_per_protocol or global_per_port modes.
#    Total number of sessions. This is returned for global_per_protocol or global_per_port modes.
#    key:[<grouping_key>].sessions_total                            value:Total number of sessions. This is returned for global_per_protocol or global_per_port modes.
#    This value represents the Average Setup Rate. This is returned for global_per_protocol mode.
#    key:[<grouping_key>].setup_avg_rate                            value:This value represents the Average Setup Rate. This is returned for global_per_protocol mode.
#    This value represents the Average Teardown Rate. This is returned for global_per_protocol mode.
#    key:[<grouping_key>].teardown_avg_rate                         value:This value represents the Average Teardown Rate. This is returned for global_per_protocol mode.
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

package ixiangpf;

use utils;
use ixiahlt;

sub protocol_info {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('protocol_info', $args);
	# ixiahlt::utrackerLog ('protocol_info', $args);

	return ixiangpf::runExecuteCommand('protocol_info', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
