# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_lag_config(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_lag_config
		
		 Description:
		    This procedure will configure LAG Ports, LACP and Static LAG
		
		 Synopsis:
		    emulation_lag_config
		        -mode                                    CHOICES create delete modify
		        [-port_handle                            REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		        [-handle                                 ANY]
		x       [-lag_handle                             ANY]
		x       [-ethernet_handle                        ANY]
		x       [-active                                 CHOICES 0 1]
		x       [-lag_name                               ALPHA]
		        [-protocol_type                          CHOICES lag_port_lacp
		                                                 CHOICES lag_port_staticlag
		                                                 DEFAULT lag_port_lacp]
		x       [-lag_id                                 RANGE 1-65535
		x                                                DEFAULT 1]
		x       [-reset                                  ANY]
		        [-lacp_actor_key                         RANGE 0-65535
		                                                 DEFAULT 1]
		        [-lacp_actor_port_num                    RANGE 0-65535
		                                                 DEFAULT 1]
		        [-lacp_actor_key_step                    RANGE 0-65535
		                                                 DEFAULT 1]
		        [-lacp_actor_port_num_step               RANGE 0-65535
		                                                 DEFAULT 1]
		        [-lacp_actor_port_priority               RANGE 0-65535
		                                                 DEFAULT 1]
		        [-lacp_actor_system_id                   HEX8WITHSPACES]
		        [-lacp_actor_system_id_step              HEX8WITHSPACES
		                                                 DEFAULT 0000.0000.0001]
		x       [-lacp_administrative_key                RANGE 1-65535
		x                                                DEFAULT 1]
		        [-actor_system_id_step                   HEX8WITHSPACES
		                                                 DEFAULT 0000.0000.0001]
		x       [-lacp_collecting_flag                   CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-lacp_distributing_flag                 CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-lacp_collector_max_delay               RANGE 0-65535
		x                                                DEFAULT 0]
		x       [-lacp_inter_marker_pdu_delay            RANGE 1-255
		x                                                DEFAULT 6]
		x       [-lacp_activity                          CHOICES active passive
		x                                                DEFAULT active]
		x       [-lacp_timeout                           RANGE 0-65535
		x                                                DEFAULT 0]
		x       [-lacp_du_periodic_time_interval         RANGE 0-65535
		x                                                DEFAULT 0]
		x       [-lacp_marker_req_mode                   CHOICES fixed random
		x                                                DEFAULT fixed]
		x       [-lacp_marker_res_wait_time              RANGE 1-255
		x                                                DEFAULT 5]
		x       [-lacp_send_marker_req_on_lag_change     CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-lacp_inter_marker_pdu_delay_random_min RANGE 1-255
		x                                                DEFAULT 1]
		x       [-lacp_inter_marker_pdu_delay_random_max RANGE 1-255
		x                                                DEFAULT 6]
		x       [-lacp_send_periodic_marker_req          CHOICES 0 1
		x                                                DEFAULT 0]
		x       [-lacp_support_responding_to_marker      CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-lacp_sync_flag                         CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-lacp_aggregation_flag                  CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-lacp_actor_system_priority             NUMERIC
		x                                                DEFAULT 1]
		x       [-mtu                                    RANGE 68-14000
		x                                                DEFAULT 1500]
		        [-src_mac_addr                           MAC]
		x       [-src_mac_addr_step                      MAC
		x                                                DEFAULT 0000.0000.0001]
		        [-vlan                                   CHOICES 0 1]
		x       [-vlan_id                                REGEXP ^[0-9]{1,4}(,[0-9]{1,4}){0,5}$
		x                                                RANGE 0-4096]
		x       [-vlan_id_step                           REGEXP ^[0-9]{1,4}(,[0-9]{1,4}){0,5}$
		x                                                RANGE 0-4096
		x                                                DEFAULT 1]
		x       [-vlan_id_count                          REGEXP ^[0-9]{1,4}(,[0-9]{1,4}){0,5}$
		x                                                RANGE 1-4094
		x                                                DEFAULT 4094]
		x       [-vlan_tpid                              CHOICES 0x8100
		x                                                CHOICES 0x88a8
		x                                                CHOICES 0x88A8
		x                                                CHOICES 0x9100
		x                                                CHOICES 0x9200
		x                                                CHOICES 0x9300
		x                                                DEFAULT 0x8100]
		x       [-vlan_user_priority                     REGEXP ^[0-7](,[0-7]){0,5}$
		x                                                RANGE 0-7
		x                                                DEFAULT 0]
		x       [-vlan_user_priority_step                REGEXP ^[0-7](,[0-7]){0,5}$
		x                                                RANGE 0-7
		x                                                DEFAULT 1]
		x       [-notify_mac_move                        CHOICES 0 1]
		
		 Arguments:
		    -mode
		    -port_handle
		    -handle
		        LAG, LACP and StaticLag protocol Handle
		x   -lag_handle
		x       Handle for the LAG that the user wants to modify or delete. This argument does not support lists.
		x   -ethernet_handle
		x       Handle for the ethernet of LAG that the user wants to modify. This argument does not support lists.
		x   -active
		x       Flag.
		x   -lag_name
		x       Name of the LAG port configured in HLAPI.
		    -protocol_type
		        The LACP to be emulated. CHOICES: lag_port_lacp lag_port_staticlag.
		x   -lag_id
		x       lag_id. RANGE 1-65535
		x   -reset
		x       Clears any LACP configuration on the targeted port before
		x       configuring further.
		    -lacp_actor_key
		        The operational Key value assigned to the port by the Actor on the fly.RANGE 0-65535
		    -lacp_actor_port_num
		        The port number assigned to the port by the Actor (the System sending the PDU). RANGE 0-65535
		    -lacp_actor_key_step
		        This argument specifies the step value of actor Key. RANGE 0-65535
		    -lacp_actor_port_num_step
		        This argument specifies the step value of actor port number. RANGE 0-65535
		    -lacp_actor_port_priority
		        This argument specifies the port priority of the link Actor. RANGE 0-65535
		    -lacp_actor_system_id
		        This argument specifies the system identifier for the link Actor.
		    -lacp_actor_system_id_step
		        Step value of the system identifier for the link Actor.
		x   -lacp_administrative_key
		x       Lacp administrative key
		    -actor_system_id_step
		        actor_system_id_step
		x   -lacp_collecting_flag
		x       If selected, the actor port state Collecting is set to true based on Tx and Rx state machines. Otherwise, the flag in LACPDU remains reset for all packets sent.
		x   -lacp_distributing_flag
		x       If selected, the actor port state Distributing is set to true based on Tx and Rx state machines. Otherwise, the flag in LACPDU remains reset for all packets sent.
		x   -lacp_collector_max_delay
		x       The maximum time in microseconds that the Frame Collector may delay the delivery of a frame received from an Aggregator to its MAC client. RANGE 0-65535
		x   -lacp_inter_marker_pdu_delay
		x       Indicates the fixed inter marker PDU interval. It is enable only when Marker Request Mode is set as Fixed. RANGE 1-255
		x   -lacp_activity
		x       Sets the value of LACPs Actor activity, either passive or active.
		x   -lacp_timeout
		x       This timer is used to detect whether received protocol information has expired. RANGE 0-65535
		x   -lacp_du_periodic_time_interval
		x       This field defines how frequently LACPDUs are sent to the link partner. RANGE 0-65535
		x   -lacp_marker_req_mode
		x       Sets the marker request mode for the Actor link, either random or fixed.
		x   -lacp_marker_res_wait_time
		x       The number of seconds to wait for Marker Response after sending a Marker Request. After this time, the Marker Response Timeout Count is incremented. If a marker response does arrive for the request after this timeout, it is not considered as a legitimate response. RANGE 1-255
		x   -lacp_send_marker_req_on_lag_change
		x       If selected, this argument causes LACP to send a Marker PDU in the following situations:
		x       - System Priority has been modified
		x       - System Id has been modified
		x       - Actor Key has been modified
		x       Port Number/Port Priority has been modified while we are in Individual mode.
		x   -lacp_inter_marker_pdu_delay_random_min
		x       Indicates random inter marker PDU interval range start value. RANGE 1-255
		x   -lacp_inter_marker_pdu_delay_random_max
		x       Indicates random inter marker PDU interval range end value. RANGE 1-255
		x   -lacp_send_periodic_marker_req
		x       send periodic marker req
		x   -lacp_support_responding_to_marker
		x       support responding to marker
		x   -lacp_sync_flag
		x       If selected, the actor port state is set to True based on Tx and Rx state machines. Otherwise, the flag in LACPDU remains reset for all packets sent.
		x   -lacp_aggregation_flag
		x       If selected, sets the port status to allow aggregation.
		x   -lacp_actor_system_priority
		x       If selected, sets the port status to allow aggregation.
		x   -mtu
		x       This option configure Maximum Trasmision Unit for created interfaces.
		x       This parameter can be an interfaces - one MTU value for each interface
		x       to be created.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		    -src_mac_addr
		        MAC address of the port.
		        This option takes a list of values when -port_handle is a list of
		        port handles.
		        Valid formats are:
		        {00 00 00 00 00 00}, 00:00:00:00:00:00, 0000.0000.0000,
		        00.00.00.00.00.00, {0000 0000 0000}
		x   -src_mac_addr_step
		x       The incrementing step for the MAC address of the connected interface,
		x       when connected_count is greater than 1.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		x       This is valid for the new API.
		    -vlan
		        Whether to enable VLAN on the traffic generation tool interfaces.
		        This option takes a list of values when -port_handle is a list of
		        port handles.
		        Valid options are:
		        1 - Enable
		        0 - Disable (DEFAULT)
		x   -vlan_id
		x       VLAN ID of each interface where VLAN is enabled. This parameter
		x       accepts a list of numbers separated by ',' - the vlan id for each
		x       encapsulation 802.1q. This is how stacked vlan is configured.
		x       Each value should be between 0 and 4095, inclusive, for l23_config_type protocol_interfaces.
		x       Each value should be between 0 and 4094, inclusive, for l23_config_type static_endpoint.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		x   -vlan_id_step
		x       The incrementing step for the VLAN ID of the interface, when
		x       connected_count is greater than 1.
		x       The vlan_id will be incremented modulo 4096, when the maximum value
		x       is reached, the counting starts again from 0.
		x       The vlan_id will be incremented modulo 4094 (by default), when the maximum value
		x       is reached, the counting starts again from 0, for l23_config_type static_endpoint,
		x       but the number of unique values can be modified by using vlan_id_count.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		x   -vlan_id_count
		x       The number of unique outer VLAN IDs that will be created. This parameter
		x       accepts a list of numbers separated by ',' - the vlan id count for each
		x       encapsulation 802.1q. This is how stacked vlan is configured.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		x       This option is valid only when l23_config_type is static_endpoint (new API).
		x   -vlan_tpid
		x       Tag Protocol Identifier / TPID (hex). The EtherType that identifies
		x       the protocol header that follows the VLAN header (tag).
		x       Available TPIDs: 0x8100 (the default), 0x88a8, 0x9100, 0x9200.
		x       If the VLAN Count is greater than 1 (for stacked VLANs),
		x       this field also accepts comma-separated values so that different TPID
		x       values can be assigned to different VLANs. For example, to assign TPID
		x       0x8100, 0x9100, 0x9200, and 0x9200 to the first four created VLANs,
		x       enter: 0x8100,0x9100,0x9200,0x9200.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		x       This option is valid only when l23_config_type is protocol_interface.
		x   -vlan_user_priority
		x       If VLAN is enabled on the interface, the priority of the VLAN. For each interface,
		x       the user priority list should be given as a list of integers separated by commas.
		x       This parameter accepts a list of user priority for each 802.1 encapsulation used.
		x       Valid choices for each element in the list are between 0 and 7, inclusive.
		x       This option takes a list of values when -port_handle is a list of port handles.
		x       For example, if we have 2 interfaces with 3 vlans each, the user priority could be: [list 1,2,7 1,3,4]
		x   -vlan_user_priority_step
		x       The incrementing step for the VLAN user priority of the interface, when
		x       connected_count is greater than 1. The vlan_user_priority will be
		x       incremented modulo 8, when the maximum value is reached, the counting
		x       starts again from 0.
		x       This option is valid only when l23_config_type is static_endpoint.
		x       This option takes a list of values when -port_handle is a list of
		x       port handles.
		x   -notify_mac_move
		x       Flag to determine if MAC move notifications should be sent
		
		 Return Values:
		    A list containing the protocol stack protocol stack handles that were added by the command (if any).
		x   key:protocol_stack_handle      value:A list containing the protocol stack protocol stack handles that were added by the command (if any).
		    A list containing the ethernet protocol stack handles that were added by the command (if any).
		x   key:ethernet_handle            value:A list containing the ethernet protocol stack handles that were added by the command (if any).
		    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		x   key:handle                     value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    $::SUCCESS | $::FAILURE
		    key:status                     value:$::SUCCESS | $::FAILURE
		    When status is $::FAILURE, contains more information
		    key:log                        value:When status is $::FAILURE, contains more information
		    Handle of lag configured
		    key:lag_handle                 value:Handle of lag configured
		    Handle of Lag port lacp configured
		    key:lag_port_lacp_handle       value:Handle of Lag port lacp configured
		    Handle of Lag port StaticLag configured
		    key:lag_port_staticLag_handle  value:Handle of Lag port StaticLag configured
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle
		
		 See Also:
		
		'''
		hlpy_args = locals().copy()
		hlpy_args.update(kwargs)
		del hlpy_args['self']
		del hlpy_args['kwargs']

		not_implemented_params = []
		mandatory_params = []
		file_params = []

		try:
			return self.__execute_command(
				'emulation_lag_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
