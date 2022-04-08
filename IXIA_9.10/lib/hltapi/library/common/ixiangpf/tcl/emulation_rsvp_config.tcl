##Procedure Header
# Name:
#    ::ixiangpf::emulation_rsvp_config
#
# Description:
#    This procedure will configure RSVP
#
# Synopsis:
#    ::ixiangpf::emulation_rsvp_config
#        -mode                                         CHOICES create
#                                                      CHOICES delete
#                                                      CHOICES modify
#                                                      CHOICES enable
#                                                      CHOICES disable
#        [-port_handle                                 REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                                      ANY]
#x       [-return_detailed_handles                     CHOICES 0 1
#x                                                     DEFAULT 0]
#        [-count                                       ANY
#                                                      DEFAULT 1]
#        [-mac_address_init                            MAC]
#x       [-mac_address_step                            MAC
#x                                                     DEFAULT 0000.0000.0001]
#x       [-vlan                                        CHOICES 0 1]
#        [-vlan_id                                     RANGE 0-4095]
#        [-vlan_id_mode                                CHOICES fixed increment
#                                                      DEFAULT increment]
#        [-vlan_id_step                                RANGE 0-4096
#                                                      DEFAULT 1]
#        [-vlan_user_priority                          RANGE 0-7
#                                                      DEFAULT 0]
#        [-intf_ip_addr                                IPV4
#                                                      DEFAULT 0.0.0.0]
#        [-intf_prefix_length                          RANGE 1-32
#                                                      DEFAULT 24]
#        [-intf_ip_addr_step                           IPV4
#                                                      DEFAULT 0.0.1.0]
#x       [-gateway_ip_addr                             IPV4]
#x       [-gateway_ip_addr_step                        IPV4
#x                                                     DEFAULT 0.0.1.0]
#x       [-using_gateway_ip                            CHOICES 0 1]
#x       [-dut_ip                                      ANY]
#x       [-label_space_start                           ANY]
#x       [-label_space_end                             ANY]
#x       [-enable_refresh_reduction                    CHOICES 0 1]
#x       [-summary_refresh_interval                    ANY]
#x       [-enable_bundle_message_sending               CHOICES 0 1]
#x       [-enable_hello_extension                      CHOICES 0 1]
#x       [-hello_interval                              ANY]
#x       [-hello_timeout_multiplier                    ANY]
#x       [-enable_graceful_restart_helper_mode         CHOICES 0 1]
#x       [-enable_graceful_restart_restarting_mode     CHOICES 0 1]
#x       [-advertised_restart_time                     ANY]
#x       [-actual_restart_time                         ANY]
#x       [-recovery_time                               ANY]
#x       [-number_of_restarts                          ANY]
#x       [-restart_start_time                          ANY]
#x       [-restart_up_time                             ANY]
#x       [-enable_bfd_registration                     CHOICES 0 1]
#x       [-rsvp_neighbor_active                        CHOICES 0 1]
#x       [-enable_bundle_message_threshold_timer       ANY]
#x       [-bundle_message_threshold_time               ANY]
#x       [-use_same_authentication_keyfor_peer         ANY]
#x       [-authentication_algorithm                    CHOICES none md5 sha1]
#x       [-handshake_required                          ANY]
#x       [-check_integrityfor_received_packets         ANY]
#x       [-authentication_keyfor_received_packets      ANY]
#x       [-auto_generate_authentication_key_identifier ANY]
#x       [-authentication_key_identifier               ANY]
#x       [-generate_sequence_number_basedon_real_time  ANY]
#x       [-initial_sequence_number                     ANY]
#x       [-authentication_key_for_sent_packets         ANY]
#
# Arguments:
#    -mode
#    -port_handle
#    -handle
#        Specifies the parent node/object handle on which the rsvp configuration should be configured.
#        In case modes – modify/delete/disable/enable – this denotes the object node handle on which the action needs to be performed. The handle value syntax is dependent on the vendor.
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#    -count
#        The number of RsvpIf to configure on the targeted Ixia
#        interface.The range is 0-1000.
#    -mac_address_init
#        MAC address to be used for the first session.
#x   -mac_address_step
#x       Valid only for -mode create.
#x       The incrementing step for the MAC address configured on the dirrectly
#x       connected interfaces. Valid only when IxNetwork Tcl API is used.
#x   -vlan
#x       Enables vlan on the directly connected ISIS router interface.
#x       Valid options are: 0 - disable, 1 - enable.
#x       This option is valid only when -mode is create or -mode is modify
#x       and -handle is an ISIS router handle.
#    -vlan_id
#        VLAN ID for protocol interface.
#    -vlan_id_mode
#        For multiple neighbor configuration, configures the VLAN ID mode.
#    -vlan_id_step
#        Valid only for -mode create.
#        Defines the step for the VLAN ID when the VLAN ID mode is increment.
#        When vlan_id_step causes the vlan_id value to exceed its maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
#        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
#    -vlan_user_priority
#        VLAN user priority assigned to protocol interface.
#    -intf_ip_addr
#        Interface IP address of the RSVP session router. Mandatory when -mode is create.
#        When using IxTclNetwork (new API) this parameter can be omitted if -interface_handle is used.
#        For IxTclProtocol (old API), when -mode is modify and one of the layer
#        2-3 parameters (-intf_ip_addr, -gateway_ip_addr, -loopback_ip_addr, etc)
#        needs to be modified, the emulation_ldp_config command must be provided
#        with the entire list of layer 2-3 parameters. Otherwise they will be
#        set to their default values.
#    -intf_prefix_length
#        Prefix length on the interface.
#    -intf_ip_addr_step
#        Define interface IP address for multiple sessions.
#        Valid only for -mode create.
#x   -gateway_ip_addr
#x       Gives the gateway IP address for the protocol interface that will
#x       be created for use by the simulated routers.
#x   -gateway_ip_addr_step
#x       Valid only for -mode create.
#x       Gives the step for the gateway IP address.
#x   -using_gateway_ip
#x       Using Gateway IP
#x   -dut_ip
#x       DUT IP
#x   -label_space_start
#x       Label Space Start
#x   -label_space_end
#x       Label Space End
#x   -enable_refresh_reduction
#x       Enable Refresh Reduction
#x   -summary_refresh_interval
#x       Summary Refresh Interval (ms)
#x   -enable_bundle_message_sending
#x       Enable Bundle Message Sending
#x   -enable_hello_extension
#x       Enable Hello Extension
#x   -hello_interval
#x       Hello Interval (ms)
#x   -hello_timeout_multiplier
#x       Hello Timeout Multiplier
#x   -enable_graceful_restart_helper_mode
#x       Enable Helper-Mode
#x   -enable_graceful_restart_restarting_mode
#x       Enable Restarting-Mode
#x   -advertised_restart_time
#x       Advertised Restart Time (ms)
#x   -actual_restart_time
#x       Actual Restart Time (ms)
#x   -recovery_time
#x       Recovery Time (ms)
#x   -number_of_restarts
#x       Number of Restarts
#x   -restart_start_time
#x       Restart Start Time (ms)
#x   -restart_up_time
#x       Restart Up Time (ms)
#x   -enable_bfd_registration
#x       Enable BFD Registration
#x   -rsvp_neighbor_active
#x       Activate/Deactivate Configuration
#x   -enable_bundle_message_threshold_timer
#x       Enable Bundle Message Threshold Timer
#x   -bundle_message_threshold_time
#x       Bundle Message Threshold Time (ms)
#x   -use_same_authentication_keyfor_peer
#x       Use Same Authentication Key for Peer
#x   -authentication_algorithm
#x       Authentication Algorithm
#x   -handshake_required
#x       Handshake Required
#x   -check_integrityfor_received_packets
#x       Check Integrity for Received Packets
#x   -authentication_keyfor_received_packets
#x       Authentication Key for Received Packets
#x   -auto_generate_authentication_key_identifier
#x       Auto Generate Authentication Key Identifier
#x   -authentication_key_identifier
#x       Authentication Key Identifier
#x   -generate_sequence_number_basedon_real_time
#x       Generate Sequence Number Based on Real Time
#x   -initial_sequence_number
#x       Initial Sequence Number
#x   -authentication_key_for_sent_packets
#x       Authentication Key for Sent Packets
#
# Return Values:
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle      value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    A list containing the ethernet protocol stack handles that were added by the command (if any).
#x   key:ethernet_handle  value:A list containing the ethernet protocol stack handles that were added by the command (if any).
#    $::SUCCESS | $::FAILURE
#    key:status           value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, contains more information
#    key:log              value:When status is $::FAILURE, contains more information
#    RSVP IF configured
#    key:rsvp_if_handle   value:RSVP IF configured
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

proc ::ixiangpf::emulation_rsvp_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_rsvp_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
