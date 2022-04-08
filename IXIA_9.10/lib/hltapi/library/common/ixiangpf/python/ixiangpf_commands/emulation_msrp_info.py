# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_msrp_info(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_msrp_info
		
		 Description:
		    Retrieves information about the MSRP Talker/Listener protocol.
		
		 Synopsis:
		    emulation_msrp_info
		x       -mode         CHOICES stats
		x                     CHOICES clear_stats
		x                     CHOICES learned_database
		x                     CHOICES clear_learned_database
		        [-handle      ANY]
		        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		
		 Arguments:
		x   -mode
		    -handle
		    -port_handle
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status                                                       value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log                                                          value:If status is failure, detailed information provided.
		    Sessions Up
		x   key:sessions_up                                                  value:Sessions Up
		    Sessions Down
		x   key:sessions_down                                                value:Sessions Down
		    Sessions Total
		x   key:sessions_total                                               value:Sessions Total
		x   key:msrp_packet_tx                                               value:
		    Sessions Not Started
		x   key:sessions_not_started                                         value:Sessions Not Started
		x   key:msrp_packet_tx                                               value:
		x   key:msrp_packet_rx                                               value:
		x   key:msrp_listener_tx                                             value:
		x   key:msrp_talker_advertisement_rx                                 value:
		x   key:msrp_talker_failed_rx                                        value:
		x   key:msrp_listener_ready_tx                                       value:
		x   key:msrp_listener_ready_failed_tx                                value:
		x   key:msrp_listener_asking_failed_tx                               value:
		x   key:msrp_domain_tx                                               value:
		x   key:msrp_domain_rx                                               value:
		x   key:mvrp_packet_tx                                               value:
		x   key:mvrp_packet_rx                                               value:
		x   key:msrp_listener_new_tx                                         value:
		x   key:msrp_talker_advertisement_new_rx                             value:
		x   key:msrp_talker_advertisement_mt_tx                              value:
		x   key:msrp_listener_mt_tx                                          value:
		x   key:msrp_listener_joinmt_tx                                      value:
		x   key:msrp_talker_advertisement_joinmt_rx                          value:
		x   key:msrp_listener_joinin_tx                                      value:
		x   key:msrp_talker_advertisement_joinin_rx                          value:
		x   key:msrp_listener_lv_tx                                          value:
		x   key:msrp_talker_advertisement_lv_rx                              value:
		x   key:msrp_listener_in_tx                                          value:
		x   key:msrp_talker_advertisement_in_rx                              value:
		x   key:msrp_malformed_packet_rx                                     value:
		x   key:msrp_malformed_domain_rx                                     value:
		x   key:msrp_malformed_talker_advertisement_rx                       value:
		x   key:msrp_malformed_talker_failed_rx                              value:
		x   key:msrp_talker_failed_new_rx                                    value:
		x   key:msrp_talker_failed_mt_rx                                     value:
		x   key:msrp_talker_failed_joinmt_rx                                 value:
		x   key:msrp_talker_failed_joinin_rx                                 value:
		x   key:msrp_talker_failed_lv_rx                                     value:
		x   key:msrp_talker_failed_in_rx                                     value:
		x   key:msrp_listener_rx                                             value:
		x   key:msrp_talker_advertisement_tx                                 value:
		x   key:msrp_listener_ready_rx                                       value:
		x   key:msrp_listener_ready_failed_rx                                value:
		x   key:msrp_listener_asking_failed_rx                               value:
		x   key:msrp_listener_new_rx                                         value:
		x   key:msrp_talker_advertisement_new_tx                             value:
		x   key:msrp_listener_mt_rx                                          value:
		x   key:msrp_listener_joinmt_rx                                      value:
		x   key:msrp_talker_advertisement_joinmt_tx                          value:
		x   key:msrp_listener_joinin_rx                                      value:
		x   key:msrp_talker_advertisement_joinin_tx                          value:
		x   key:msrp_listener_lv_rx                                          value:
		x   key:msrp_talker_advertisement_lv_tx                              value:
		x   key:msrp_listener_in_rx                                          value:
		x   key:msrp_talker_advertisement_in_tx                              value:
		x   key:msrp_malformed_listener_rx                                   value:
		x   key:mvrp_malformed_packet_rx                                     value:
		x   key:<handle>.talker_stream_database.attribute_type               value:
		x   key:<handle>.talker_stream_database.stream_id                    value:
		x   key:<handle>.talker_stream_database.destination_mac              value:
		x   key:<handle>.talker_stream_database.vlan_id                      value:
		x   key:<handle>.talker_stream_database.max_frame_size               value:
		x   key:<handle>.talker_stream_database.max_interval_frame           value:
		x   key:<handle>.talker_stream_database.priority                     value:
		x   key:<handle>.talker_stream_database.rank                         value:
		x   key:<handle>.talker_stream_database.latency                      value:
		x   key:<handle>.talker_stream_database.declaration_type             value:
		x   key:<handle>.talker_stream_database.applicant_state              value:
		x   key:<handle>.talker_stream_database.registrar_state              value:
		x   key:<handle>.talker_stream_database.source_mac                   value:
		x   key:<handle>.talker_stream_database.talker_advertise_tx          value:
		x   key:<handle>.talker_stream_database.talker_joint_mt_tx           value:
		x   key:<handle>.talker_stream_database.talker_joinin_tx             value:
		x   key:<handle>.talker_stream_database.talker_new_tx                value:
		x   key:<handle>.talker_stream_database.talker_mt_tx                 value:
		x   key:<handle>.talker_stream_database.talker_lv_tx                 value:
		x   key:<handle>.talker_stream_database.listener_advertise_rx        value:
		x   key:<handle>.talker_stream_database.listener_ready_rx            value:
		x   key:<handle>.talker_stream_database.listener_ready_failed_rx     value:
		x   key:<handle>.talker_stream_database.listener_asking_failed_rx    value:
		x   key:<handle>.talker_stream_database.listener_new_rx              value:
		x   key:<handle>.talker_stream_database.listener_joinmt_rx           value:
		x   key:<handle>.talker_stream_database.listener_joinin_rx           value:
		x   key:<handle>.talker_stream_database.listener_in_rx               value:
		x   key:<handle>.talker_stream_database.listener_lv_rx               value:
		x   key:<handle>.talker_stream_database.listener_mt_rx               value:
		x   key:<handle>.talker_domain_database.sr_class_id                  value:
		x   key:<handle>.talker_domain_database.sr_class_priority            value:
		x   key:<handle>.talker_domain_database.sr_class_vid                 value:
		x   key:<handle>.talker_domain_database.applicant_state              value:
		x   key:<handle>.talker_domain_database.registrar_state              value:
		x   key:<handle>.talker_domain_database.domain_tx                    value:
		x   key:<handle>.talker_domain_database.domain_rx                    value:
		x   key:<handle>.talker_domain_database.source_mac                   value:
		x   key:<handle>.talker_vlan_database.vlan_id                        value:
		x   key:<handle>.talker_vlan_database.applicant_state                value:
		x   key:<handle>.talker_vlan_database.registrar_state                value:
		x   key:<handle>.talker_vlan_database.source_mac                     value:
		x   key:<handle>.listener_stream_database.attribute_type             value:
		x   key:<handle>.listener_stream_database.stream_id                  value:
		x   key:<handle>.listener_stream_database.destination_mac            value:
		x   key:<handle>.listener_stream_database.vlan_id                    value:
		x   key:<handle>.listener_stream_database.max_frame_size             value:
		x   key:<handle>.listener_stream_database.max_interval_frame         value:
		x   key:<handle>.listener_stream_database.priority                   value:
		x   key:<handle>.listener_stream_database.rank                       value:
		x   key:<handle>.listener_stream_database.latency                    value:
		x   key:<handle>.listener_stream_database.declaration_type           value:
		x   key:<handle>.listener_stream_database.applicant_state            value:
		x   key:<handle>.listener_stream_database.registrar_state            value:
		x   key:<handle>.listener_stream_database.source_mac                 value:
		x   key:<handle>.listener_stream_database.error_code                 value:
		x   key:<handle>.listener_stream_database.bridge_id                  value:
		x   key:<handle>.listener_stream_database.talker_advertise_rx        value:
		x   key:<handle>.listener_stream_database.talker_failed_rx           value:
		x   key:<handle>.listener_stream_database.talker_joint_mt_rx         value:
		x   key:<handle>.listener_stream_database.talker_joinin_rx           value:
		x   key:<handle>.listener_stream_database.talker_in_rx               value:
		x   key:<handle>.listener_stream_database.talker_new_rx              value:
		x   key:<handle>.listener_stream_database.talker_mt_rx               value:
		x   key:<handle>.listener_stream_database.talker_lv_rx               value:
		x   key:<handle>.listener_stream_database.talker_failed_new_rx       value:
		x   key:<handle>.listener_stream_database.talker_failed_joinmt_rx    value:
		x   key:<handle>.listener_stream_database.talker_failed_joinin_rx    value:
		x   key:<handle>.listener_stream_database.talker_failed_in_rx        value:
		x   key:<handle>.listener_stream_database.talker_failed_lv_rx        value:
		x   key:<handle>.listener_stream_database.talker_failed_mt_rx        value:
		x   key:<handle>.listener_stream_database.listener_advertise_tx      value:
		x   key:<handle>.listener_stream_database.listener_ready_tx          value:
		x   key:<handle>.listener_stream_database.listener_ready_failed_tx   value:
		x   key:<handle>.listener_stream_database.listener_asking_failed_tx  value:
		x   key:<handle>.listener_stream_database.listener_new_tx            value:
		x   key:<handle>.listener_stream_database.listener_joinmt_tx         value:
		x   key:<handle>.listener_stream_database.listener_joinin_tx         value:
		x   key:<handle>.listener_stream_database.listener_in_tx             value:
		x   key:<handle>.listener_stream_database.listener_lv_tx             value:
		x   key:<handle>.listener_stream_database.listener_mt_tx             value:
		x   key:<handle>.listener_domain_database.sr_class_id                value:
		x   key:<handle>.listener_domain_database.sr_class_priority          value:
		x   key:<handle>.listener_domain_database.sr_class_vid               value:
		x   key:<handle>.listener_domain_database.sr_class_priority          value:
		x   key:<handle>.listener_domain_database.applicant_state            value:
		x   key:<handle>.listener_domain_database.registrar_state            value:
		x   key:<handle>.listener_domain_database.domain_tx                  value:
		x   key:<handle>.listener_domain_database.domain_rx                  value:
		x   key:<handle>.listener_domain_database.source_mac                 value:
		x   key:<handle>.listener_vlan_database.vlan_id                      value:
		x   key:<handle>.listener_vlan_database.applicant_state              value:
		x   key:<handle>.listener_vlan_database.registrar_state              value:
		x   key:<handle>.listener_vlan_database.source_mac                   value:
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		
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
				'emulation_msrp_info', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
