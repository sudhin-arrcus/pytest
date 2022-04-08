##Procedure Header
# Name:
#    ixiangpf::emulation_msrp_talker_config
#
# Description:
#    This procedure will configure MSRP Talker
#
# Synopsis:
#    ixiangpf::emulation_msrp_talker_config
#        -mode                        CHOICES create
#                                     CHOICES delete
#                                     CHOICES modify
#                                     CHOICES enable
#                                     CHOICES disable
#        [-port_handle                REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                     ANY]
#        [-mac_address_init           MAC]
#x       [-mac_address_step           MAC
#x                                    DEFAULT 0000.0000.0001]
#x       [-vlan                       CHOICES 0 1]
#        [-vlan_id                    RANGE 0-4095]
#        [-vlan_id_mode               CHOICES fixed increment
#                                     DEFAULT increment]
#        [-vlan_id_step               RANGE 0-4096
#                                     DEFAULT 1]
#        [-vlan_user_priority         RANGE 0-7
#                                     DEFAULT 0]
#        [-count                      ANY
#                                     DEFAULT 1]
#x       [-reset                      FLAG]
#x       [-msrp_talker_active         CHOICES 0 1]
#x       [-stream_active              CHOICES 0 1]
#x       [-source_mac                 MAC
#x                                    DEFAULT 0011.0100.0001]
#x       [-unique_id                  RANGE 1-65535
#x                                    DEFAULT 1]
#x       [-stream_name                REGEXP ^[0-9,a-f,A-F]+$]
#x       [-destination_mac            MAC
#x                                    DEFAULT 91E0.F000.FE00]
#x       [-stream_vlan_id             RANGE 1-4094
#x                                    DEFAULT 2]
#x       [-max_frame_size             RANGE 1-65535
#x                                    DEFAULT 100]
#x       [-max_interval_frames        RANGE 1-65535
#x                                    DEFAULT 1]
#x       [-per_frame_overhead         RANGE 0-65535
#x                                    DEFAULT 42]
#x       [-class_measurement_interval RANGE 0-4294967295
#x                                    DEFAULT 125]
#x       [-data_frame_priority        RANGE 0-7
#x                                    DEFAULT 3]
#x       [-rank                       CHOICES emergency nonemergency
#x                                    DEFAULT nonemergency]
#x       [-port_tc_max_latency        RANGE 1-4294967295
#x                                    DEFAULT 20]
#x       [-protocol_version           HEX]
#x       [-join_timer                 RANGE 200-100000000
#x                                    DEFAULT 200]
#x       [-leave_timer                RANGE 600-100000000
#x                                    DEFAULT 600]
#x       [-leave_all_timer            RANGE 10000-100000000
#x                                    DEFAULT 10000]
#x       [-advertise_vlan_membership  CHOICES 0 1
#x                                    DEFAULT 1]
#x       [-advertise_as               CHOICES joinmt new
#x                                    DEFAULT new]
#x       [-domain_count               RANGE 1-2
#x                                    DEFAULT 1]
#x       [-stream_count               RANGE 0-1024000
#x                                    DEFAULT 1]
#x       [-sr_class_id                RANGE 0-255
#x                                    DEFAULT 6]
#x       [-sr_class_priority_type     RANGE 0-7
#x                                    DEFAULT 3]
#x       [-sr_class_vid               RANGE 1-4094
#x                                    DEFAULT 2]
#x       [-domain_active              CHOICES 0 1]
#
# Arguments:
#    -mode
#    -port_handle
#    -handle
#        Specifies the parent node/object handle on which the talker configuration should be configured.
#        In case modes – modify/delete/disable/enable – this denotes the object node handle on which the action needs to be performed. The handle value syntax is dependent on the vendor.
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
#x   -msrp_talker_active
#x       MSRP Active.
#x   -stream_active
#x       Stream Active.
#x   -source_mac
#x       This mac address is to be retrieved from own lower Ethernet layer by default. This field is editable by user for negative testing. This field is used for determining the Stream Id
#x   -unique_id
#x       2 bytes unsigned integer. Default value is 1. Min value is 1 and Max value is 65535. For each successive SRP stream ids this value has to be increased by 1 under a talker. This field is used for determining the Stream Id
#x   -stream_name
#x       A user editable name for each stream.
#x   -destination_mac
#x       Multicast/Unicast Destination MAC address. Multicast address Range is 91:E0:F0:00:FE:00 - 91:E0:F0:00:FE:FF. Default is 91:E0:F0:00:FE:00. Unicast address is any valid unicast mac address. Default is Multicast.
#x   -stream_vlan_id
#x       VLAN ID. Range is 1 through 4094. On exceeding the max value subsequent rows will remain on max value.
#x   -max_frame_size
#x       2 bytes unsigned integer. RANGE 1-65535
#x   -max_interval_frames
#x       2 bytes unsigned integer. Min is 1 and Max is 65535
#x   -per_frame_overhead
#x       per Frame Overhead. RANGE 0-65535
#x   -class_measurement_interval
#x       If value of “SR Class” is ‘Class A’ then default value of “Class Measurement Interval” should be 125 micro Seconds. If value of “SR Class” is ‘Class B’ then default value of “Class Measurement Interval” should be 250 us. If value of “SR Class” is ‘No class associated’ then default value of “Class Measurement Interval” should be 0. (This will result to 0 bandwidth, and in a way asking user to key in value for class measurement interval so that bandwidth can be calculated when priorities are not mapped according to IEEE standard ). RANGE 0-4294967295
#x   -data_frame_priority
#x       Data Frame Priority. RANGE 0-7
#x   -rank
#x       Single bit field. Nonemergency traffic shall set this bit to a 1 and emergency traffic shall set it to zero. Default is 1.
#x   -port_tc_max_latency
#x       Port Tc Max Latency (ns). Range 1-4294967295
#x   -protocol_version
#x       This one-octet field indicates the version supported by the applicant. Default value is 0x00. Maximum value is 0xFF
#x   -join_timer
#x       The Join Period Timer controls the interval, in milliseconds, between transmit opportunities that are applied to the Applicant state machine. Minimum is 200 ms and Maximum is 100000000 ms
#x   -leave_timer
#x       The leave timer controls the period of time, in milliseconds, that the Registrar state machine will wait in the LV state before transiting to the MT state. Default is 600 ms.
#x       Min is 600 ms and Max is 100000000 ms. The leave time should be at least twice the join time to allow re-registration after a leave or leave-all message, even if a message is lost.
#x   -leave_all_timer
#x       Controls the frequency, in milliseconds, with which the LeaveAll state machine generates Leave All PDUs. Default is 10000 ms. Minimum value is 10000 ms and Maximum value is 100000000 ms.
#x       To minimize the volume of re-joining traffic generated following a leaveall message, the leaveall time should be larger than the leave time.
#x   -advertise_vlan_membership
#x       This field denotes that talker will advertise the vlan membership information.
#x   -advertise_as
#x       Advertise As
#x   -domain_count
#x       Number of domains to be configured under a talker. Min value is 1 and max value is 2.
#x   -stream_count
#x       Number of streams to be configured under a talker. The minimum value is always 1. Talker is always configured with at least 1 Stream. stream_count cannot be zero for a talker.
#x   -sr_class_id
#x       One byte field. It will be drop down list of {Class A(6), Class B(5)}. Default is Class A(6). Note: User will not see number. User will see only Class A/B. RANGE 0-255
#x   -sr_class_priority_type
#x       one byte field. It will be drop down list of {Class A(3), Class B(2)}. Default is Class A(3). Note: User will not see number. User will see only Class A/B.. RANGE 0-7
#x   -sr_class_vid
#x       SR Class VID. RANGE 1-4094
#x   -domain_active
#x       Domain Active.
#
# Return Values:
#    A list containing the ethernet protocol stack handles that were added by the command (if any).
#x   key:ethernet_handle             value:A list containing the ethernet protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:msrp_talker_handles         value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:msrp_stream_handles         value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:msrp_talker_domain_handles  value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS | $::FAILURE
#    key:status                      value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, contains more information
#    key:log                         value:When status is $::FAILURE, contains more information
#    Handle of MSRP Talker configured
#    key:msrp_talker_handle          value:Handle of MSRP Talker configured
#    Handle of MSRP Talker streams configured
#    key:msrp_stream_handle          value:Handle of MSRP Talker streams configured
#    Handle of MSRP Talker Domain configured
#    key:msrp_talker_domain_handle   value:Handle of MSRP Talker Domain configured
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  msrp_talker_handles, msrp_stream_handles, msrp_talker_domain_handles
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_msrp_talker_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_msrp_talker_config', $args);
	# ixiahlt::utrackerLog ('emulation_msrp_talker_config', $args);

	return ixiangpf::runExecuteCommand('emulation_msrp_talker_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
