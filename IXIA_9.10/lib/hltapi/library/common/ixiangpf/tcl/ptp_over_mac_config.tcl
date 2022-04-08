##Procedure Header
# Name:
#    ::ixiangpf::ptp_over_mac_config
#
# Description:
#    Performs ptp_over_mac configuration. Manages a device group of PTP clocks.
#
# Synopsis:
#    ::ixiangpf::ptp_over_mac_config
#        -mode                                 CHOICES create add modify delete
#        -parent_handle                        ANY
#        [-handle                              ANY]
#n       [-style                               ANY]
#x       [-profile                             CHOICES ieee1588
#x                                             CHOICES g82651
#x                                             CHOICES g82751
#x                                             CHOICES ieee8021as]
#        [-announce_current_utc_offset_valid   CHOICES 0 1]
#        [-current_utc_offset                  RANGE 0-32767
#                                              DEFAULT 0]
#        [-announce_drop_rate                  RANGE 0-100
#                                              DEFAULT 0]
#        [-announce_frequency_traceable        CHOICES 0 1
#                                              DEFAULT 0]
#        [-announce_leap59                     CHOICES 0 1
#                                              DEFAULT 0]
#        [-announce_leap61                     CHOICES 0 1
#                                              DEFAULT 0]
#        [-announce_ptp_timescale              CHOICES 0 1
#                                              DEFAULT 0]
#        [-announce_receipt_timeout            RANGE 0-128
#                                              DEFAULT 3]
#        [-announce_time_traceable             CHOICES 0 1
#                                              DEFAULT 0]
#x       [-sync_receipt_timeout_gptp           RANGE 1-128
#x                                             DEFAULT 3]
#x       [-bmca                                CHOICES 0 1
#x                                             DEFAULT 1]
#x       [-reverse_sync                        CHOICES 0 1
#x                                             DEFAULT 0]
#x       [-reverse_sync_interval_percent       RANGE 0-4294967295
#x                                             DEFAULT 96]
#x       [-cumulative_scaled_rate_offset       ANY
#x                                             DEFAULT 0x0]
#x       [-gm_time_base_indicator              RANGE 0-65535
#x                                             DEFAULT 0]
#x       [-last_gm_phase_change                RANGE 0-9223372036854775807
#x                                             DEFAULT 0]
#x       [-scaled_last_gm_freq_change          RANGE 0-4294967295
#x                                             DEFAULT 0]
#x       [-update_time                         CHOICES 0 1
#x                                             DEFAULT 1]
#x       [-nanoseconds_per_second              RANGE 999023438-1000976562
#x                                             DEFAULT 1000000000]
#        [-slave_count                         RANGE 1-500
#                                              DEFAULT 1]
#        [-slave_ip_address                    ANY
#                                              DEFAULT 10.10.0.1]
#        [-slave_ip_increment_by               ANY
#                                              DEFAULT 0.0.0.1]
#        [-slave_mac_address                   ANY
#                                              DEFAULT aa:bb:cd:00:00:00]
#        [-slave_mac_increment_by              ANY
#                                              DEFAULT 00:00:00:00:00:01]
#        [-clock_accuracy                      CHOICES 32
#                                              CHOICES 33
#                                              CHOICES 34
#                                              CHOICES 35
#                                              CHOICES 36
#                                              CHOICES 37
#                                              CHOICES 38
#                                              CHOICES 39
#                                              CHOICES 40
#                                              CHOICES 41
#                                              CHOICES 42
#                                              CHOICES 43
#                                              CHOICES 44
#                                              CHOICES 45
#                                              CHOICES 46
#                                              CHOICES 47
#                                              CHOICES 48
#                                              CHOICES 49
#                                              DEFAULT 47]
#        [-clock_class                         RANGE 0-255
#                                              DEFAULT 6]
#n       [-clock_increment                     ANY]
#        [-communication_mode                  CHOICES multicast
#                                              CHOICES unicast
#                                              CHOICES mixedmode
#                                              CHOICES g8265
#                                              DEFAULT multicast]
#        [-delay_mechanism                     CHOICES E2E P2P 1WAY
#                                              DEFAULT E2E]
#        [-delay_resp_drop_rate                RANGE 0-100
#                                              DEFAULT 0]
#        [-delay_resp_receipt_timeout          RANGE 1-1000
#                                              DEFAULT 100]
#        [-delay_response_delay                RANGE 0-1000000000
#                                              DEFAULT 0]
#        [-delay_response_delay_insertion_rate RANGE 0-100
#                                              DEFAULT 0]
#        [-domain                              RANGE 0-255
#                                              DEFAULT 0]
#x       [-drop_malformed                      CHOICES 0 1]
#        [-drop_signal_req_announce            CHOICES 0 1]
#        [-drop_signal_req_delay_resp          CHOICES 0 1]
#        [-drop_signal_req_sync                CHOICES 0 1]
#n       [-enabled                             ANY]
#        [-first_clock                         ANY
#                                              DEFAULT 00:00:00:00:00:00:11:11]
#        [-follow_up_bad_crc_rate              RANGE 0-100
#                                              DEFAULT 0]
#        [-follow_up_delay                     RANGE 0-1000000000
#                                              DEFAULT 0]
#        [-follow_up_delay_insertion_rate      RANGE 0-100
#                                              DEFAULT 0]
#        [-follow_up_drop_rate                 RANGE 0-100
#                                              DEFAULT 0]
#x       [-delay_req_drop_rate                 RANGE 0-100
#x                                             DEFAULT 0]
#x       [-delay_req_offset                    RANGE 50-200
#x                                             DEFAULT 100]
#x       [-delay_req_spread                    RANGE 0-50
#x                                             DEFAULT 0]
#        [-grant_delay_resp_duration_interval  RANGE 5-1200
#                                              DEFAULT 300]
#        [-grant_sync_duration_interval        RANGE 5-1200
#                                              DEFAULT 300]
#        [-grant_unicast_duration_interval     RANGE 5-1200
#                                              DEFAULT 300]
#        [-ip_tos                              RANGE 0-255
#                                              DEFAULT 0]
#        [-learn_port_id                       CHOICES 0 1]
#        [-log_announce_interval               CHOICES 247
#                                              CHOICES 248
#                                              CHOICES 249
#                                              CHOICES 250
#                                              CHOICES 251
#                                              CHOICES 252
#                                              CHOICES 253
#                                              CHOICES 254
#                                              CHOICES 255
#                                              CHOICES 0
#                                              CHOICES 1
#                                              CHOICES 2
#                                              CHOICES 3
#                                              CHOICES 4
#                                              CHOICES 5
#                                              CHOICES 6
#                                              CHOICES 7
#                                              CHOICES 8
#                                              CHOICES 9
#                                              DEFAULT 0]
#        [-log_delay_req_interval              CHOICES 247
#                                              CHOICES 248
#                                              CHOICES 249
#                                              CHOICES 250
#                                              CHOICES 251
#                                              CHOICES 252
#                                              CHOICES 253
#                                              CHOICES 254
#                                              CHOICES 255
#                                              CHOICES 0
#                                              CHOICES 1
#                                              CHOICES 2
#                                              CHOICES 3
#                                              CHOICES 4
#                                              CHOICES 5
#                                              CHOICES 6
#                                              CHOICES 7
#                                              CHOICES 8
#                                              CHOICES 9
#                                              DEFAULT 0]
#        [-log_sync_interval                   CHOICES 247
#                                              CHOICES 248
#                                              CHOICES 249
#                                              CHOICES 250
#                                              CHOICES 251
#                                              CHOICES 252
#                                              CHOICES 253
#                                              CHOICES 254
#                                              CHOICES 255
#                                              CHOICES 0
#                                              CHOICES 1
#                                              CHOICES 2
#                                              CHOICES 3
#                                              CHOICES 4
#                                              CHOICES 5
#                                              CHOICES 6
#                                              CHOICES 7
#                                              CHOICES 8
#                                              CHOICES 9
#                                              DEFAULT 0]
#        [-master_count                        RANGE 1-500
#                                              DEFAULT 1]
#        [-master_ip_address                   ANY
#                                              DEFAULT 10.10.0.1]
#        [-master_ip_increment_by              ANY
#                                              DEFAULT 0.0.0.1]
#n       [-master_ip_increment_inter_entity    ANY]
#        [-master_mac_address                  ANY
#                                              DEFAULT aa:bb:cd:00:00:00]
#        [-master_mac_increment_by             ANY
#                                              DEFAULT 00:00:00:00:00:01]
#n       [-master_mac_increment_inter_entity   ANY]
#x       [-multicastAddress                    CHOICES nonforwardable forwardable
#x                                             DEFAULT nonforwardable]
#        [-name                                ALPHA]
#x       [-not_slave                           CHOICES 0 1]
#        [-port_number                         RANGE 1-65535
#                                              DEFAULT 1]
#n       [-port_number_increment               ANY]
#        [-priority1                           RANGE 0-255
#                                              DEFAULT 128]
#        [-priority2                           RANGE 0-255
#                                              DEFAULT 128]
#        [-renewal_invited                     CHOICES 0 1]
#        [-request_attempts                    RANGE 1-100
#                                              DEFAULT 3]
#        [-request_holddown                    RANGE 10-1000
#                                              DEFAULT 60]
#        [-request_interval                    RANGE 1-100
#                                              DEFAULT 1]
#        [-residence_time                      RANGE 0-1000000000
#                                              DEFAULT 0]
#        [-rx_calibration                      RANGE 0-10000
#                                              DEFAULT 0]
#        [-send_announce_multicast             CHOICES 0 1]
#        [-send_announce_tlv                   CHOICES 0 1]
#        [-send_cancel_tlv                     CHOICES 0 1]
#        [-signal_interval                     RANGE 3-1200
#                                              DEFAULT 64]
#        [-signal_unicast_handling             CHOICES individually
#                                              CHOICES allInOne
#                                              CHOICES doNotSend
#                                              DEFAULT individually]
#        [-step_mode                           CHOICES two-step single-step
#                                              DEFAULT two-step]
#        [-steps_removed                       RANGE 0-655535
#                                              DEFAULT 0]
#        [-strict_grant                        CHOICES 0 1]
#x       [-path_trace_tlv                      CHOICES 0 1]
#        [-sync_drop_rate                      RANGE 0-100
#                                              DEFAULT 0]
#        [-sync_receipt_timeout                RANGE 1-1000
#                                              DEFAULT 100]
#        [-time_source                         CHOICES 0X10
#                                              CHOICES 0X20
#                                              CHOICES 0X30
#                                              CHOICES 0X40
#                                              CHOICES 0X50
#                                              CHOICES 0X60
#                                              CHOICES 0X90
#                                              CHOICES 0XA0
#                                              DEFAULT 0X20]
#        [-timestamp_offset                    RANGE 0-9223372036854775807
#                                              DEFAULT 0]
#n       [-timestamp_offset_variation          ANY]
#        [-tx_calibration                      RANGE 0-1000000
#                                              DEFAULT 0]
#x       [-tx_two_step_calibration             RANGE 0-1000000
#x                                             DEFAULT 0]
#        [-use_alternate_master_flag           CHOICES 0 1]
#        [-use_clock_identity                  CHOICES 0 1]
#x       [-one_way                             CHOICES 0 1]
#x       [-simulate_boundary                   CHOICES 0 1
#x                                             DEFAULT 0]
#x       [-grandmaster_identity                ANY
#x                                             DEFAULT 00:00:00:00:00:00:00:01]
#x       [-simulate_transparent                CHOICES 0 1]
#x       [-sync_residence_time                 ANY]
#x       [-follow_up_residence_time            ANY]
#x       [-delay_req_residence_time            ANY]
#x       [-delay_resp_residence_time           ANY]
#x       [-p_delay_follow_up_residence_time    ANY]
#x       [-offset_scaled_log_variance          ANY]
#x       [-role                                CHOICES slave master]
#x       [-master_ipv6_address                 ANY]
#x       [-master_ipv6_increment_by            ANY]
#x       [-slave_ipv6_address                  ANY]
#x       [-slave_ipv6_increment_by             ANY]
#        [-mtu                                 RANGE 68-14000]
#x       [-mac_address_init                    MAC]
#x       [-mac_address_step                    MAC
#x                                             DEFAULT 0000.0000.0001]
#x       [-vlan                                CHOICES 0 1]
#        [-vlan_id_mode                        CHOICES fixed increment
#                                              DEFAULT increment]
#        [-vlan_id                             RANGE 0-4096]
#        [-vlan_id_step                        RANGE 0-4096
#                                              DEFAULT 1]
#        [-vlan_user_priority                  RANGE 0-7
#                                              DEFAULT 0]
#x       [-num_sessions                        RANGE 1-100000000
#x                                             DEFAULT 10]
#
# Arguments:
#    -mode
#        create - creates and configures a new object
#        add - not supported in case of ::ixiangpf::ptp_over_mac_config.
#        modify - modified attributes on the given object by the -handle param
#        delete - deletes the object given by the -handle param
#    -parent_handle
#        The parent handle used for creating this object. It can be a topology, or a device group, or an ethernet.
#    -handle
#        A handle returned via a ::ixiangpf::ptp_over_mac_config command. This is used for mode modify.
#n   -style
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -profile
#x       The profile used by this clock.
#    -announce_current_utc_offset_valid
#        Set Announce currentUtcOffsetValid bit.
#    -current_utc_offset
#        Set announced Current UTC Offset (seconds)
#    -announce_drop_rate
#        Percentage rate of the dropped Announce messages.
#    -announce_frequency_traceable
#        Set Announce frequency traceable bit.
#    -announce_leap59
#        Set Announce leap59 bit.
#    -announce_leap61
#        Set Announce leap61 bit.
#    -announce_ptp_timescale
#        Set Announce ptpTimescale bit.
#    -announce_receipt_timeout
#        The number of announceInterval that has to pass without receipt of an Announce message.
#    -announce_time_traceable
#        Set Announce time traceable bit.
#x   -sync_receipt_timeout_gptp
#x       The number of Sync Intervals that have to pass without receipt of an Sync message to trigger timeout.
#x   -bmca
#x       Run the Best Master Clock Algorithm for gPTP (if disabled can use a pre-defined Master or accept messages from any source)
#x   -reverse_sync
#x       As a slave, periodically send Reverse Sync messages with recovered clock.
#x       As a master, calculate the Offset of the Slave reported time to master time.
#x   -reverse_sync_interval_percent
#x       The percentage of incoming Sync interval to use for Reverse Sync interval.
#x   -cumulative_scaled_rate_offset
#x       Cumulative Scaled Rate Offset field set in the gPTP FollowUp TLV.
#x   -gm_time_base_indicator
#x       GM Time Base Indicator field set in the gPTP FollowUp TLV.
#x   -last_gm_phase_change
#x       Last GM Phase Change nanoseconds set in the gPTP FollowUp TLV.
#x   -scaled_last_gm_freq_change
#x       Scaled Last GM Freq Change field set in the gPTP FollowUp TLV.
#x   -update_time
#x       Clocks in Slave role will correct their time based on received Sync messages.
#x   -nanoseconds_per_second
#x       The number of nanoseconds the emulated clock should effectively count for one second of hardware ticks.
#    -slave_count
#        The total number of Unicast slaves to be used.
#    -slave_ip_address
#        Defines the base address to be used for enumerating all the addresses.
#    -slave_ip_increment_by
#        Defines the increment to be used for enumerating all the addresses.
#    -slave_mac_address
#        Defines the base address to be used for enumerating all the addresses.
#    -slave_mac_increment_by
#        Defines the increment to be used for enumerating all the addresses.
#    -clock_accuracy
#        Clock accuracy.
#        Valid choices are:
#        32 - {The time is accurate to within 25 ns}
#        33 - {The time is accurate to within 100 ns}
#        34 - {The time is accurate to within 250 ns}
#        35 - {The time is accurate to within 1 us}
#        36 - {The time is accurate to within 2.5 us}
#        37 - {The time is accurate to within 10 us}
#        38 - {The time is accurate to within 25 us}
#        39 - {The time is accurate to within 100 us}
#        40 - {The time is accurate to within 250 us}
#        41 - {The time is accurate to within 1 ms}
#        42 - {The time is accurate to within 2.5 ms}
#        43 - {The time is accurate to within 10 ms}
#        44 - {The time is accurate to within 25 ms}
#        45 - {The time is accurate to within 100 ms}
#        46 - {The time is accurate to within 250 ms}
#        47 - {The time is accurate to within 1 s}
#        48 - {The time is accurate to within 10 s}
#        49 - {The time is accurate to greater than 10 s}
#    -clock_class
#        Traceability of the time or frequency distributed by the grandmaster clock.
#n   -clock_increment
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -communication_mode
#        Communication mode (unicast/multicast/mixedmode).
#        Valid choices are:
#        multicast - Multicast
#        unicast - Unicast
#        mixedmode - MixedMode
#        g8265 - deprecated for ixngpf command
#    -delay_mechanism
#        Clock delay mechanism.
#        Valid choices are:
#        E2E - RequestResponse
#        P2P - PeerDelay
#        1WAY - deprecated for ixngpf command
#    -delay_resp_drop_rate
#        Percentage rate of the dropped Delay_Resp messages.
#    -delay_resp_receipt_timeout
#        DelayResponse Receipt Timeout in seconds.
#    -delay_response_delay
#        Additional delay introduced in the Delay_Resp message timestamp (nanoseconds).
#    -delay_response_delay_insertion_rate
#        Percentage rate of the Delay_Resp messages in which the delay is introduced.
#    -domain
#        PTP Domain.
#x   -drop_malformed
#x       Drop packets that for which fields like Domain, message rates, Clock Class, Clock Accuracy
#x       and Offset Scaled Log Variance are not respecting strict G8275.1 imposed intervals.
#    -drop_signal_req_announce
#        Select this check box to drop any Signal Request that contains Announce TLV.
#    -drop_signal_req_delay_resp
#        Select this check box to drop any Signal Request that contains DelayResp TLV.
#    -drop_signal_req_sync
#        Select this check box to drop any Signal Request that contains Sync TLV.
#n   -enabled
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -first_clock
#        Defines the ClockIdentity to be used by this device.
#    -follow_up_bad_crc_rate
#        Percentage rate of the bad crc Follow_Up messages.
#    -follow_up_delay
#        Additional delay introduced in the Follow_Up message timestamp (nanoseconds).
#    -follow_up_delay_insertion_rate
#        Percentage rate of the Follow_Up messages in which the delay is introduced.
#    -follow_up_drop_rate
#        Percentage rate of the dropped Follow_Up messages.
#x   -delay_req_drop_rate
#x       Percentage rate of the dropped (P)DelayReq messages.
#x   -delay_req_offset
#x       Percentage of the agreed (P)DelayReq Inter-arrival time to schedule between two subsequent DelayReq messages.
#x   -delay_req_spread
#x       Distribute (P)DelayReq messages in an interval around the targeted Inter-arrival mean time (expressed as a % of targeted mean).
#    -grant_delay_resp_duration_interval
#        Value of DurationField in REQUEST_UNICAST_TRANSMISSION_TLV for DelayResp messages.
#    -grant_sync_duration_interval
#        Value of DurationField in REQUEST_UNICAST_TRANSMISSION_TLV for Sync messages.
#    -grant_unicast_duration_interval
#        Value of DurationField in REQUEST_UNICAST_TRANSMISSION_TLV.
#    -ip_tos
#        DEPRECATED - Use per port option for setting IP TOS or DS.
#    -learn_port_id
#        Slave learns Master Port ID.
#    -log_announce_interval
#        The log mean time interval between successive Announce messages.
#        Valid choices are:
#        minus 9 - {-9 (512 per second)}
#        minus 8 - {-8 (256 per second)}
#        minus 7 - {-7 (128 per second)}
#        minus 6 - {-6 (64 per second)}
#        minus 5 - {-5 (32 per second)}
#        minus 4 - {-4 (16 per second)}
#        minus 3 - {-3 (8 per second)}
#        minus 2 - {-2 (4 per second)}
#        minus 1 - {-1 (2 per second)}
#        0 - {0 (1 per second)}
#        1 - {1 (1 per 2 seconds)}
#        2 - {2 (1 per 4 seconds)}
#        3 - {3 (1 per 8 seconds)}
#        4 - {4 (1 per 16 seconds)}
#        5 - {5 (1 per 32 seconds)}
#        6 - {6 (1 per 64 seconds)}
#        7 - {7 (1 per 128 seconds)}
#        8 - {8 (1 per 256 seconds)}
#        9 - {9 (1 per 512 seconds)}
#    -log_delay_req_interval
#        The log mean time interval between successive (P)Delay_Req messages.
#        Valid choices are:
#        minus 9 - {-9 (512 per second)}
#        minus 8 - {-8 (256 per second)}
#        minus 7 - {-7 (128 per second)}
#        minus 6 - {-6 (64 per second)}
#        minus 5 - {-5 (32 per second)}
#        minus 4 - {-4 (16 per second)}
#        minus 3 - {-3 (8 per second)}
#        minus 2 - {-2 (4 per second)}
#        minus 1 - {-1 (2 per second)}
#        0 - {0 (1 per second)}
#        1 - {1 (1 per 2 seconds)}
#        2 - {2 (1 per 4 seconds)}
#        3 - {3 (1 per 8 seconds)}
#        4 - {4 (1 per 16 seconds)}
#        5 - {5 (1 per 32 seconds)}
#        6 - {6 (1 per 64 seconds)}
#        7 - {7 (1 per 128 seconds)}
#        8 - {8 (1 per 256 seconds)}
#        9 - {9 (1 per 512 seconds)}
#    -log_sync_interval
#        The log mean time interval between successive Sync messages.
#        Valid choices are:
#        minus 9 - {-9 (512 per second)}
#        minus 8 - {-8 (256 per second)}
#        minus 7 - {-7 (128 per second)}
#        minus 6 - {-6 (64 per second)}
#        minus 5 - {-5 (32 per second)}
#        minus 4 - {-4 (16 per second)}
#        minus 3 - {-3 (8 per second)}
#        minus 2 - {-2 (4 per second)}
#        minus 1 - {-1 (2 per second)}
#        0 - {0 (1 per second)}
#        1 - {1 (1 per 2 seconds)}
#        2 - {2 (1 per 4 seconds)}
#        3 - {3 (1 per 8 seconds)}
#        4 - {4 (1 per 16 seconds)}
#        5 - {5 (1 per 32 seconds)}
#        6 - {6 (1 per 64 seconds)}
#        7 - {7 (1 per 128 seconds)}
#        8 - {8 (1 per 256 seconds)}
#        9 - {9 (1 per 512 seconds)}
#    -master_count
#        The total number of Unicast masters to be used.
#    -master_ip_address
#        Defines the base address to be used for enumerating all the addresses.
#    -master_ip_increment_by
#        Defines the increment to be used for enumerating all the addresses.
#n   -master_ip_increment_inter_entity
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -master_mac_address
#        Defines the base address to be used for enumerating all the addresses.
#    -master_mac_increment_by
#        Defines the increment to be used for enumerating all the addresses.
#n   -master_mac_increment_inter_entity
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -multicastAddress
#x       The destination multicast address for G8275.1:
#x       non-forwardable - 01:80:C2:00:00:0E (recommended)
#x       forwardable - 01:1B:19:00:00:00
#    -name
#        Name of protocol.
#x   -not_slave
#x       When enabled for Master clocks it prevents a G8275.1 port from going into Slave state, by ignoring Announce messages.
#    -port_number
#        Port number.
#n   -port_number_increment
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -priority1
#        PTP priority1.
#    -priority2
#        PTP priority2.
#    -renewal_invited
#        Set the Renewal Invited flag in Grant Unicast Transmission TLV.
#    -request_attempts
#        How many succesive requests a slave can request before entering into holddown.
#    -request_holddown
#        Time between succesive requests if denied/timeout for Signal Request.
#    -request_interval
#        Time between succesive requests if denied/timeout for Signal Request.
#    -residence_time
#        DEPRECATED - use per message setting of Residence Time.
#    -rx_calibration
#        The amount of time (in ns) that the Receive side timestamp needs to be offset to allow for error.
#    -send_announce_multicast
#        Send multicast Announce messages.
#    -send_announce_tlv
#        Send and respond to Announce TLV unicast requests in signal messages.
#    -send_cancel_tlv
#        Send and respond to Cancel TLV unicast requests in signal messages.
#    -signal_interval
#        Time between Signal Request messages, in seconds.
#    -signal_unicast_handling
#        Valid choices are:
#        individually - {Send Individually}
#        allInOne - {Send In One Message}
#        doNotSend - {Do Not Send}
#    -step_mode
#        Clock step mode.
#        Valid choices are:
#        two-step - TwoStep
#        single-step - SingleStep
#    -steps_removed
#        The number of hops between the Grandmaster Clock and the emulated clock. Valid values: 0 to 65,535.
#    -strict_grant
#        If selected, server will not grant values that are above maximum offered values.
#x   -path_trace_tlv
#x       If selected, the master will append a Path Trace TLV to Announce messages.
#    -sync_drop_rate
#        Percentage rate of the dropped Sync messages.
#    -sync_receipt_timeout
#        Sync Receipt Timeout in seconds.
#    -time_source
#        Time source for the PTP device.
#        Valid choices are:
#        0X10 - AtomicClock
#        0X20 - GPS
#        0X30 - TerrestrialRadio
#        0X40 - PTP
#        0X50 - NTP
#        0X60 - HandSet
#        0X90 - Other
#        0XA0 - InternalOscilator
#    -timestamp_offset
#        Timestamp offset.
#n   -timestamp_offset_variation
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -tx_calibration
#        The amount of time (in ns) that the transmit timestamp of one step messages (Sync, PDelayResp) needs to be adjusted for error.
#x   -tx_two_step_calibration
#x       The amount of time (in ns) that the read transmit timestamp of sent messages (two-step Sync, DelayReq, PDelayReq, two-step PDelayResp) needs to be adjusted for error.
#    -use_alternate_master_flag
#        Select this check box to set the Alternate Master flag in all Announce and Sync messages.
#    -use_clock_identity
#        Use the ClockIdentity configured in the next column instead of MAC based generated one.
#x   -one_way
#x       Do not send Delay Requests.
#x   -simulate_boundary
#x       Simulate a transparent clock in front of this master clock.
#x   -grandmaster_identity
#x       Defines the ClockIdentity of the Grandmaster behind this device.
#x   -simulate_transparent
#x       Simulate a transparent clock in front of this master clock.
#x   -sync_residence_time
#x       Master to slave residence time of Sync messages through an associated one-step
#x       transparent clock inserted in the correction field of Sync messages sent by this clock.
#x   -follow_up_residence_time
#x       Master to slave residence of Sync messages through an associated two-step transparent clock
#x       inserted in the correction field of FollowUp messages sent by this clock.
#x   -delay_req_residence_time
#x       Residence time of (P)DelayReq messages through an associated one-step end-to-end
#x       transparent clock inserted in the correction field of (P)DelayReq messages sent by this clock.
#x   -delay_resp_residence_time
#x       Residence time of DelayReq messages through an associated two-step end-to-end transparent clock inserted
#x       in the correction field of DelayResp messages sent by this clock, or the residence time of PdelayResp messages
#x       through an associated one-step end-to-end transparent clock inserted in the correction field
#x       of PdelayResp messages sent by this clock.
#x   -p_delay_follow_up_residence_time
#x       Total residence time of PdelayReq and PdelayResp messagews through an associated two-step end-to-end
#x       transparent clock inserted in the correction field of PdelayRespFollowUp messages sent by this clock
#x   -offset_scaled_log_variance
#x       Static Offset Scaled Log Variance of this clock.
#x   -role
#x       The desired role of this clock.
#x   -master_ipv6_address
#x       Defines the base address to be used for enumerating all the addresses.
#x   -master_ipv6_increment_by
#x       Defines the increment to be used for enumerating all the addresses.
#x   -slave_ipv6_address
#x       Defines the base address to be used for enumerating all the addresses.
#x   -slave_ipv6_increment_by
#x       Defines the increment to be used for enumerating all the addresses.
#    -mtu
#        The advertised MTU value in database entries sent to other routers create on the Ixia interface. RANGE 68-14000.
#x   -mac_address_init
#x       This option defines the MAC address that will be configured on
#x       the Ixia interface. This parameter is not valid on mode modify when
#x       IxTclProtocol is used.
#x   -mac_address_step
#x       This option defines the incrementing step for the MAC address that
#x       will be configured on the Ixia interface.
#x   -vlan
#x       Enables vlan.
#    -vlan_id_mode
#        If the user configures more than one interface on the Ixia with
#        VLAN, he can choose to automatically increment the VLAN tag or
#        leave it idle for each interface. CHOICES fixed increment.
#        This parameter is not valid on mode modify when IxTclProtocol is used.
#    -vlan_id
#        If VLAN is enable on the Ixia interface, this option will configure the VLAN number.
#    -vlan_id_step
#        If the -vlan_id_mode is increment, this will be the step value by
#        which the VLAN tags are incremented. RANGE 0-4095
#        When vlan_id_step causes the vlan_id value to exceed it's maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id = 4094; vlan_id_step = 2-> new vlan_id value = 0
#        vlan_id = 4095; vlan_id_step = 11 -> new vlan_id value = 10
#    -vlan_user_priority
#x   -num_sessions
#x       The number of PTP sessions to configure.
#
# Return Values:
#    A list containing the ptp protocol stack handles that were added by the command (if any).
#x   key:ptp_handle  value:A list containing the ptp protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:handle      value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS | $::FAILURE
#    key:status      value:$::SUCCESS | $::FAILURE
#    ptp_over_mac handles
#    key:handles     value:ptp_over_mac handles
#    When status is failure, contains more information
#    key:log         value:When status is failure, contains more information
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle
#
# See Also:
#    External documentation on Tclx keyed lists
#

proc ::ixiangpf::ptp_over_mac_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "ptp_over_mac_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
