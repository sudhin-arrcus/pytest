##Procedure Header
# Name:
#    ixiangpf::emulation_bfd_info
#
# Description:
#    This procedure retrieves information about the BFD sessions.
#
# Synopsis:
#    ixiangpf::emulation_bfd_info
#        -mode    CHOICES aggregate
#                 CHOICES stats_per_device_group
#                 CHOICES stats_per_session
#                 CHOICES learned_info
#                 CHOICES clear_stats
#                 DEFAULT aggregate
#        -handle  ANY
#
# Arguments:
#    -mode
#        The action that should be taken. Valid choices are:
#        aggregate_stats - retrieve stats aggregated per port
#        learned_info - retrieve learned information by the BFD protocol
#        clear_stats - clear stats
#    -handle
#        For -mode aggregate, this parameter should be provided with a
#        handle, but the command will return per port
#        aggregated stats. For -mode learned_info, this parameters should be provided
#        with a interface (for the emulated router) and the
#        command will return per interface learned CRP.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status                                              value:$::SUCCESS | $::FAILURE
#    On status of failure, gives detailed information.
#    key:log                                                 value:On status of failure, gives detailed information.
#    BFD stats port_name
#    key:port_name                                           value:BFD stats port_name
#    BFD number of sessions configured
#    key:sessions_configured                                 value:BFD number of sessions configured
#    BFD number of sessions auto configured
#    key:sessions_auto_created                               value:BFD number of sessions auto configured
#    BFD number of sessions configured up
#    key:sessions_configured_up                              value:BFD number of sessions configured up
#    BFD number of sessions auto configured up
#    key:sessions_auto_created_up                            value:BFD number of sessions auto configured up
#    BFD sessions flap count
#    key:session_flap_cnt                                    value:BFD sessions flap count
#    BFD control packet tx count
#    key:control_pkts_tx                                     value:BFD control packet tx count
#    BFD control packet rx count
#    key:control_pkts_rx                                     value:BFD control packet rx count
#    BFD echo packet tx count
#    key:echo_self_pkts_tx                                   value:BFD echo packet tx count
#    BFD echo packet rx count
#    key:echo_self_pkts_rx                                   value:BFD echo packet rx count
#    BFD echo dut packet tx count
#    key:echo_dut_pkts_tx                                    value:BFD echo dut packet tx count
#    BFD echo dut packet rx count
#    key:echo_dut_pkts_rx                                    value:BFD echo dut packet rx count
#    BFD mpls pdu tx count
#    key:mpls_tx                                             value:BFD mpls pdu tx count
#    BFD mpls pdu rx count
#    key:mpls_rx                                             value:BFD mpls pdu rx count
#    the source IP address for the session
#    key:<handle>.<bfd_learned_info>.local_ip_addr           value:the source IP address for the session
#    the remote IP address
#    key:<handle>.<bfd_learned_info>.remote_ip_addr          value:the remote IP address
#    the local discriminator
#    key:<handle>.<bfd_learned_info>.local_disc              value:the local discriminator
#    the session type: single hop or multihop
#    key:<handle>.<bfd_learned_info>.session_type            value:the session type: single hop or multihop
#    the session state
#    key:<handle>.<bfd_learned_info>.session_state           value:the session state
#    the protocol which is using the session
#    key:<handle>.<bfd_learned_info>.protocol_using_session  value:the protocol which is using the session
#    the up time for the remote router
#    key:<handle>.<bfd_learned_info>.session_up_time         value:the up time for the remote router
#    the remote discriminator
#    key:<handle>.<bfd_learned_info>.remote_disc             value:the remote discriminator
#    the state of the remote router
#    key:<handle>.<bfd_learned_info>.remote_state            value:the state of the remote router
#    the required minimum receive interval
#    key:<handle>.<bfd_learned_info>.rcvd_min_rx_interval    value:the required minimum receive interval
#    the minimum transmit interval desired for that that session
#    key:<handle>.<bfd_learned_info>.rcvd_tx_interval        value:the minimum transmit interval desired for that that session
#    the required minimum echo interval
#    key:<handle>.<bfd_learned_info>.rcvd_multiplier         value:the required minimum echo interval
#    the remote flags
#    key:<handle>.<bfd_learned_info>.remote_flags            value:the remote flags
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) For many handles specified as parameters this procedure will return a keyed
#    list formatted as follows: <handle>.aggregate.<key_name> when mode is aggregate,
#    or learned_info.<handle>.<key_name>, learned_info.<handle>.<key_name>
#    when mode is learned_info.
#    2) MVPN parameters are not supported with IxTclNetwork API (new API).
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_bfd_info {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_bfd_info', $args);
	# ixiahlt::utrackerLog ('emulation_bfd_info', $args);

	return ixiangpf::runExecuteCommand('emulation_bfd_info', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
