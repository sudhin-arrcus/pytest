##Procedure Header
# Name:
#    ixiangpf::emulation_msrp_listener_config
#
# Description:
#    This procedure will configure MSRP Listener
#
# Synopsis:
#    ixiangpf::emulation_msrp_listener_config
#        -mode                      CHOICES create
#                                   CHOICES delete
#                                   CHOICES modify
#                                   CHOICES enable
#                                   CHOICES disable
#        [-port_handle              REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                   ANY]
#        [-mac_address_init         MAC]
#x       [-mac_address_step         MAC
#x                                  DEFAULT 0000.0000.0001]
#x       [-vlan                     CHOICES 0 1]
#        [-vlan_id                  RANGE 0-4095]
#        [-vlan_id_mode             CHOICES fixed increment
#                                   DEFAULT increment]
#        [-vlan_id_step             RANGE 0-4096
#                                   DEFAULT 1]
#        [-vlan_user_priority       RANGE 0-7
#                                   DEFAULT 0]
#        [-count                    ANY
#                                   DEFAULT 1]
#x       [-reset                    FLAG]
#x       [-msrp_Listener_active     CHOICES 0 1]
#x       [-start_vlan_id            RANGE 1-4094
#x                                  DEFAULT 2]
#x       [-vlan_count               RANGE 1-4094
#x                                  DEFAULT 1]
#x       [-protocol_version         HEX]
#x       [-join_timer               RANGE 200-100000000
#x                                  DEFAULT 200]
#x       [-leave_timer              RANGE 600-100000000
#x                                  DEFAULT 600]
#x       [-leave_all_timer          RANGE 10000-100000000
#x                                  DEFAULT 10000]
#x       [-declare_unsolicited_vlan CHOICES 0 1
#x                                  DEFAULT 0]
#x       [-advertise_as             CHOICES joinmt new
#x                                  DEFAULT new]
#x       [-subscribe_all            CHOICES 0 1
#x                                  DEFAULT 0]
#x       [-domain_count             RANGE 1-2
#x                                  DEFAULT 1]
#x       [-subscribed_stream_count  RANGE 1-65535
#x                                  DEFAULT 1]
#x       [-sr_class_id              RANGE 0-255
#x                                  DEFAULT 6]
#x       [-sr_class_priority_type   RANGE 0-7
#x                                  DEFAULT 3]
#x       [-sr_class_vid             RANGE 1-4094
#x                                  DEFAULT 2]
#x       [-domain_active            CHOICES 0 1]
#x       [-subscribed_stream_active CHOICES 0 1]
#x       [-stream_id                HEX]
#
# Arguments:
#    -mode
#    -port_handle
#    -handle
#        MSRP Listener protocol Handle
#    -mac_address_init
#        This option defines the MAC address that will be configured on
#        the Ixia interface.If is -count > 1, this MAC address will
#        increment by default by step of 1, or you can specify another step by
#        using mac_address_step option.
#x   -mac_address_step
#x       This option defines the incrementing step for the MAC address that
#x       will be configured on the Ixia interface. Valid only when
#x       IxNetwork Tcl API is used.
#x   -vlan
#x       Enables vlan on the directly connected ISIS router interface.
#x       Valid options are: 0 - disable, 1 - enable.
#x       This option is valid only when -mode is create or -mode is modify
#x       and -handle is an ISIS router handle.
#    -vlan_id
#        If VLAN is enabled on the Ixia interface, this option will configure
#        the VLAN number.
#    -vlan_id_mode
#        If the user configures more than one interface on the Ixia with
#        VLAN, he can choose to automatically increment the VLAN tag
#        (increment)or leave it idle for each interface (fixed).
#    -vlan_id_step
#        If the -vlan_id_mode is increment, this will be the step value by
#        which the VLAN tags are incremented.
#        When vlan_id_step causes the vlan_id value to exceed it's maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
#        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
#    -vlan_user_priority
#        VLAN user priority assigned to emulated router node.
#    -count
#        The number of Talkers to configure on the targeted Ixia
#        interface.The range is 0-1000.
#x   -reset
#x       If this option is selected, this will clear any MSRP Talker on
#x       the targeted interface.
#x   -msrp_Listener_active
#x       MSRP Active.
#x   -start_vlan_id
#x       2 byte VLAN ID This field will be editable when “Eanble UnSol VLAN membership” is enabled. Range is 1 through 4094
#x   -vlan_count
#x       2 bytes field. Default is 1. This field will be editable when “Enable UnSol VLAN membership” is enabled
#x       If true then all stream requests will be accepted and ready message will be sent.In this case withdraw/advertisement will be done from learned info trigger. If false then stream request will be accepted based on the srp stream IDs configured.
#x   -protocol_version
#x       Administrator Group
#x   -join_timer
#x       The Join Period Timer controls the interval, in milliseconds, between transmit opportunities that are applied to the Applicant state machine. Minimum is 200 ms and Maximum is 100000000 ms
#x   -leave_timer
#x       The leave timer controls the period of time, in milliseconds, that the Registrar state machine will wait in the LV state before transiting to the MT state. Default is 600 ms. Min is 600 ms and Max is 100000000 ms. The leave time should be at least twice the join time to allow re-registration after a leave or leave-all message, even if a message is lost.
#x   -leave_all_timer
#x       Controls the frequency, in milliseconds, with which the LeaveAll state machine generates Leave All PDUs. Default is 10000 ms. Minimum value is 10000 ms and Maximum value is 100000000 ms. To minimize the volume of re-joining traffic generated following a leaveall message, the leaveall time should be larger than the leave time.
#x   -declare_unsolicited_vlan
#x       This is used to advertise vlan membership prior to advertising listener advertisement. Required vlans information will be obtained from “Start VLAN ID” and “VLAN Count” fields.
#x   -advertise_as
#x       Advertise As
#x   -subscribe_all
#x       subscribe All
#x   -domain_count
#x       Number of domains to be configured under a listener. Min value is 1 and max value is 2. Default value is 1.
#x   -subscribed_stream_count
#x       subscribed Stream Count
#x   -sr_class_id
#x       One byte field. It will be drop down list of {Class A(6), Class B(5)}. Default is Class A(6). Note: User will not see number. User will see only Class A/B.. RANGE 0-255
#x   -sr_class_priority_type
#x       one byte field. It will be drop down list of {Class A(3), Class B(2)}. Default is Class A(3). Note: User will not see number. User will see only Class A/B.. RANGE 0-7
#x   -sr_class_vid
#x       2 bytes field. Value will be in the range {1, 4094}. Default is 2
#x   -domain_active
#x       Domain Active.
#x   -subscribed_stream_active
#x       MSRP Subscribed Streams Active.
#x   -stream_id
#x       MSRP Stream ID
#
# Return Values:
#    A list containing the ethernet protocol stack handles that were added by the command (if any).
#x   key:ethernet_handle                          value:A list containing the ethernet protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:msrp_listener_handles                    value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:msrp_listener_domain_handles             value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:msrp_listener_subscribed_stream_handles  value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS | $::FAILURE
#    key:status                                   value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, contains more information
#    key:log                                      value:When status is $::FAILURE, contains more information
#    Handle of MSRP Listener configured
#    key:msrp_listener_handle                     value:Handle of MSRP Listener configured
#    Handle of MSRP Listener domain configured
#    key:msrp_listener_domain_handle              value:Handle of MSRP Listener domain configured
#    Handle of MSRP Listener streams configured
#    key:msrp_listener_subscribed_stream_handle   value:Handle of MSRP Listener streams configured
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  msrp_listener_handles, msrp_listener_domain_handles, msrp_listener_subscribed_stream_handles
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_msrp_listener_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_msrp_listener_config', $args);
	# ixiahlt::utrackerLog ('emulation_msrp_listener_config', $args);

	return ixiangpf::runExecuteCommand('emulation_msrp_listener_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
