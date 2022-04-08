# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_ospf_info(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_ospf_info
		
		 Description:
		    This procedure retrieves information about the OSPF sessions and returns statistical information about the configuration.
		
		 Synopsis:
		    emulation_ospf_info
		        [-port_handle       REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		        [-handle            ANY]
		        -mode               CHOICES aggregate_stats
		                            CHOICES learned_info
		                            CHOICES detailed_learned_info
		                            CHOICES clear_stats
		                            CHOICES session
		x       [-execution_timeout NUMERIC
		x                           DEFAULT 1800]
		x       [-session_type      CHOICES ospfv2 ospfv3
		x                           DEFAULT ospfv2]
		
		 Arguments:
		    -port_handle
		        The port from which to extract OSPF data.
		        One of the two parameters is required: port_handle/handle.
		    -handle
		        The routers from which to extract OSPF data.
		        One of the two parameters is required: port_handle/handle.
		    -mode
		        The action that should be taken.
		x   -execution_timeout
		x       This is the timeout for the function.
		x       The setting is in seconds.
		x       Setting this setting to 60 it will mean that the command must complete in under 60 seconds.
		x       If the command will last more than 60 seconds the command will be terminated by force.
		x       This flag can be used to prevent dead locks occuring in IxNetwork.
		x   -session_type
		x       The Type of OSPF Router - OSPFv2 or OSPFv3.
		
		 Return Values:
		    A list containing the  protocol stack handles that were added by the command (if any).
		x   key:handle                                                  value:A list containing the  protocol stack handles that were added by the command (if any).
		    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		x   key:handles                                                 value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    $::SUCCESS | $::FAILURE
		    key:status                                                  value:$::SUCCESS | $::FAILURE
		    On status of failure, gives detailed information.
		    key:log                                                     value:On status of failure, gives detailed information.
		    key:Learned info:                                           value:
		    the advertising router ID
		    key:<interface_handle>.<learned_info>.adv_router_id         value:the advertising router ID
		    the age of the learned LSA
		    key:<interface_handle>.<learned_info>.age                   value:the age of the learned LSA
		    the LinkState ID
		    key:<interface_handle>.<learned_info>.link_state_id         value:the LinkState ID
		    the LSA type
		    key:<interface_handle>.<learned_info>.lsa_type              value:the LSA type
		    the sequence number of the LSA
		    key:<interface_handle>.<learned_info>.seq_number            value:the sequence number of the LSA
		    the advertising router ID
		    key:<interface_handle>.<learned_info>.adv_router_id         value:the advertising router ID
		    the age of the learned LSA
		    key:<interface_handle>.<learned_info>.age                   value:the age of the learned LSA
		    the LinkState ID
		    key:<interface_handle>.<learned_info>.link_state_id         value:the LinkState ID
		    the LSA type
		    key:<interface_handle>.<learned_info>.lsa_type              value:the LSA type
		    the sequence number of the LSA
		    key:<interface_handle>.<learned_info>.seq_number            value:the sequence number of the LSA
		    the ipv4 address prefix learned
		    key:<interface_handle>.<learned_info>.prefix_v4_address     value:the ipv4 address prefix learned
		    the ipv6 address prefix learned
		    key:<interface_handle>.<learned_info>.prefix_v6_address     value:the ipv6 address prefix learned
		    prefix length of learned ipv4/ipv6 address
		    key:<interface_handle>.<learned_info>.prefix_length         value:prefix length of learned ipv4/ipv6 address
		    key:Aggregate stats:                                        value:
		    key:<handle>.aggregate.port_name                            value:
		    key:<handle>.aggregate.sessions_configured                  value:
		    key:<handle>.aggregate.full_neighbors                       value:
		    key:<handle>.aggregate.session_flap_count                   value:
		    key:<handle>.aggregate.neighbor_down_count                  value:
		    key:<handle>.aggregate.neighbor_attempt_count               value:
		    key:<handle>.aggregate.neighbor_init_count                  value:
		    key:<handle>.aggregate.neighbor_2way_count                  value:
		    key:<handle>.aggregate.neighbor_exstart_count               value:
		    key:<handle>.aggregate.neighbor_exchange_count              value:
		    key:<handle>.aggregate.neighbor_loading_count               value:
		    key:<handle>.aggregate.neighbor_full_count                  value:
		    key:<handle>.aggregate.hellos_tx                            value:
		    key:<handle>.aggregate.hellos_rx                            value:
		    key:<handle>.aggregate.database_description_tx              value:
		    key:<handle>.aggregate.database_description_rx              value:
		    key:<handle>.aggregate.linkstate_request_tx                 value:
		    key:<handle>.aggregate.linkstate_request_rx                 value:
		    key:<handle>.aggregate.linkstate_update_tx                  value:
		    key:<handle>.aggregate.linkstate_update_rx                  value:
		    key:<handle>.aggregate.linkstate_ack_tx                     value:
		    key:<handle>.aggregate.linkstate_ack_rx                     value:
		    key:<handle>.aggregate.linkstate_advertisement_tx           value:
		    key:<handle>.aggregate.linkstate_advertisement_rx           value:
		    key:<handle>.aggregate.router_lsa_tx                        value:
		    key:<handle>.aggregate.router_lsa_rx                        value:
		    key:<handle>.aggregate.network_lsa_tx                       value:
		    key:<handle>.aggregate.network_lsa_rx                       value:
		    key:<handle>.aggregate.external_lsa_tx                      value:
		    key:<handle>.aggregate.external_lsa_rx                      value:
		    key:<handle>.aggregate.summary_iplsa_tx                     value:
		    key:<handle>.aggregate.summary_iplsa_rx                     value:
		    key:<handle>.aggregate.summary_aslsa_tx                     value:
		    key:<handle>.aggregate.summary_aslsa_rx                     value:
		    key:<handle>.aggregate.nssa_lsa_tx                          value:
		    key:<handle>.aggregate.nssa_lsa_rx                          value:
		    key:<handle>.aggregate.opaque_local_lsa_tx                  value:
		    key:<handle>.aggregate.opaque_local_lsa_rx                  value:
		    key:<handle>.aggregate.opaque_area_lsa_tx                   value:
		    key:<handle>.aggregate.opaque_area_lsa_rx                   value:
		    key:<handle>.aggregate.opaque_domain_lsa_tx                 value:
		    key:<handle>.aggregate.opaque_domain_lsa_rx                 value:
		    key:<handle>.aggregate.grace_lsa_rx                         value:
		    key:<handle>.aggregate.helpermode_attempted                 value:
		    key:<handle>.aggregate.helpermode_failed                    value:
		    key:<handle>.aggregate.rate_control_blocked_flood_lsupdate  value:
		    key:<handle>.aggregate.lsa_acknowledged                     value:
		    key:<handle>.aggregate.lsa_acknowledge_rx                   value:
		    key:<handle>.aggregate.link_lsa_tx                          value:
		    key:<handle>.aggregate.link_lsa_rx                          value:
		    key:<handle>.aggregate.intraarea_prefix_lsa_tx              value:
		    key:<handle>.aggregate.intraarea_prefix_lsa_rx              value:
		    key:<handle>.aggregate.interarea_prefix_lsa_tx              value:
		    key:<handle>.aggregate.interarea_prefix_lsa_rx              value:
		    key:<handle>.aggregate.interarea_router_lsa_tx              value:
		    key:<handle>.aggregate.interarea_router_lsa_rx              value:
		    key:<handle>.aggregate.retrasmitted_lsa                     value:
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handles
		
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
				'emulation_ospf_info', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
