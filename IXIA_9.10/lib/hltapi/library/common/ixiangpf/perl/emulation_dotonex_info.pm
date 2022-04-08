##Procedure Header
# Name:
#    ixiangpf::emulation_dotonex_info
#
# Description:
#    Retrieves information about the Dotonex protocol.
#
# Synopsis:
#    ixiangpf::emulation_dotonex_info
#x       -mode         CHOICES per_port_stats
#x                     CHOICES per_session_stats
#x                     CHOICES clear_stats
#        -handle       ANY
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#
# Arguments:
#x   -mode
#    -handle
#        The 802.1x handle to act upon.
#    -port_handle
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status                       value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log                          value:If status is failure, detailed information provided.
#    IEEE 802.1X Up
#x   key:sessions_up                  value:IEEE 802.1X Up
#    IEEE 802.1X Down
#x   key:sessions_down                value:IEEE 802.1X Down
#    IEEE 802.1X Not Started
#x   key:sessions_not_started         value:IEEE 802.1X Not Started
#    IEEE 802.1X Total
#x   key:sessions_total               value:IEEE 802.1X Total
#    Establishment Time
#x   key:establishment_time           value:Establishment Time
#    Sessions Initiated
#x   key:sessions_initiated           value:Sessions Initiated
#    Sessions Succeeded
#x   key:sessions_succeeded           value:Sessions Succeeded
#    Sessions Failed
#x   key:sessions_failed              value:Sessions Failed
#    Setup Rate * 100
#x   key:setup_rate                   value:Setup Rate * 100
#    Min Setup Rate * 100
#x   key:min_setup_rate               value:Min Setup Rate * 100
#    Max Setup Rate * 100
#x   key:max_setup_rate               value:Max Setup Rate * 100
#    Avg Setup Rate * 100
#x   key:avg_setup_rate               value:Avg Setup Rate * 100
#    Sessions Teardown Succeeded
#x   key:sessions_teardown_succeeded  value:Sessions Teardown Succeeded
#    Sessions Teardown Failed
#x   key:sessions_teardown_failed     value:Sessions Teardown Failed
#    Teardown Rate * 100
#x   key:teardown_rate                value:Teardown Rate * 100
#    Min Teardown Rate * 100
#x   key:min_teardown_rate            value:Min Teardown Rate * 100
#    Max Teardown Rate * 100
#x   key:max_teardown_rate            value:Max Teardown Rate * 100
#    Avg Teardown Rate * 100
#x   key:avg_teardown_rate            value:Avg Teardown Rate * 100
#    EAPOL Start Tx
#x   key:eapol_start_tx               value:EAPOL Start Tx
#    EAPOL Logoff
#x   key:eapol_logoff                 value:EAPOL Logoff
#    EAP ID Responses
#x   key:eapid_responses              value:EAP ID Responses
#    EAP Non ID Responses
#x   key:eapnonid_responses           value:EAP Non ID Responses
#    EAP ID Requests
#x   key:eapid_requests               value:EAP ID Requests
#    EAP Non ID Requests
#x   key:eapnonid_requests            value:EAP Non ID Requests
#    EAP Success
#x   key:eap_success                  value:EAP Success
#    EAP Failure
#x   key:eap_failure                  value:EAP Failure
#    EAP Length Error Rx
#x   key:eap_length_err_rx            value:EAP Length Error Rx
#    EAP Alert Rx
#x   key:eap_alert_rx                 value:EAP Alert Rx
#    EAP Unexpected Failure
#x   key:eap_unexpected_failure       value:EAP Unexpected Failure
#    MD5 Sessions
#x   key:md5_sessions                 value:MD5 Sessions
#    MD5 Success
#x   key:md5_success                  value:MD5 Success
#    MD5 Timeout Failed
#x   key:md5_timeout_failed           value:MD5 Timeout Failed
#    MD5 EAP Failed
#x   key:md5_eap_failed               value:MD5 EAP Failed
#    MD5 Latency [ms]
#x   key:md5_latency                  value:MD5 Latency [ms]
#    TLS Sessions
#x   key:tls_sessions                 value:TLS Sessions
#    TLS Success
#x   key:tls_success                  value:TLS Success
#    TLS Timeout Failed
#x   key:tls_timeout_failed           value:TLS Timeout Failed
#    TLS EAP Failed
#x   key:tls_eap_failed               value:TLS EAP Failed
#    TLS Latency [ms]
#x   key:tls_latency                  value:TLS Latency [ms]
#    PEAP Sessions
#x   key:peap_sessions                value:PEAP Sessions
#    PEAP Success
#x   key:peap_success                 value:PEAP Success
#    PEAP Timeout Failed
#x   key:peap_timeout_failed          value:PEAP Timeout Failed
#    PEAP EAP Failed
#x   key:peap_eap_failed              value:PEAP EAP Failed
#    PEAP Latency [ms]
#x   key:peap_latency                 value:PEAP Latency [ms]
#    TTLS Sessions
#x   key:ttls_sessions                value:TTLS Sessions
#    TTLS Success
#x   key:ttls_success                 value:TTLS Success
#    TTLS Timeout Failed
#x   key:ttls_timeout_failed          value:TTLS Timeout Failed
#    TTLS EAP Failed
#x   key:ttls_eap_failed              value:TTLS EAP Failed
#    TTLS Latency [ms]
#x   key:ttls_latency                 value:TTLS Latency [ms]
#    FAST Sessions
#x   key:fast_sessions                value:FAST Sessions
#    FAST Success
#x   key:fast_success                 value:FAST Success
#    FAST Timeout Failed
#x   key:fast_timeout_failed          value:FAST Timeout Failed
#    FAST EAP Failed
#x   key:fast_eap_failed              value:FAST EAP Failed
#    FAST Latency [ms]
#x   key:fast_latency                 value:FAST Latency [ms]
#    Host Sessions
#x   key:host_sessions                value:Host Sessions
#    Host Success
#x   key:host_success                 value:Host Success
#    Host Timeout Failed
#x   key:host_timeout_failed          value:Host Timeout Failed
#    Host EAP Failed
#x   key:host_eap_failed              value:Host EAP Failed
#    User Sessions
#x   key:user_sessions                value:User Sessions
#    User Success
#x   key:user_success                 value:User Success
#    User Timeout Failed
#x   key:user_timeout_failed          value:User Timeout Failed
#    User EAP Failed
#x   key:user_eap_failed              value:User EAP Failed
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

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_dotonex_info {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_dotonex_info', $args);
	# ixiahlt::utrackerLog ('emulation_dotonex_info', $args);

	return ixiangpf::runExecuteCommand('emulation_dotonex_info', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
