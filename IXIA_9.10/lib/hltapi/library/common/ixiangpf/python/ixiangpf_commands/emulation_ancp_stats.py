# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_ancp_stats(self, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_ancp_stats
		
		 Description:
		    This procedure retrieves ANCP stats.
		
		 Synopsis:
		    emulation_ancp_stats
		        [-mode        CHOICES instance
		                      CHOICES device
		                      CHOICES per_dg
		                      CHOICES per_port
		                      DEFAULT per_port]
		        [-handle      ANY]
		x       [-port_handle ANY]
		        [-reset       FLAG]
		
		 Arguments:
		    -mode
		        Specify what level of statistics to poll
		    -handle
		        ANCP range for which to retrieve stats. The stats are retrived for the
		        port on which this ANCP handle belongs. This parameter is supported
		        using the following APIs: IxTclNetwork.
		x   -port_handle
		x       Parameter -port_handle specifies the port on which the ANCP stats are
		x       retrieved. This parameter is supported using the following APIs:
		x       IxTclNetwork.
		    -reset
		        Used to reset ANCP client device statistics. This parameter is
		        supported using the following APIs: IxTclNetwork.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE Status of procedure call.
		    key:status                                            value:$::SUCCESS | $::FAILURE Status of procedure call.
		    When status is failure, contains more information.
		    key:log                                               value:When status is failure, contains more information.
		    key:rx_total_pkts                                     value:
		    key:port_handle.rx_adj_syn_pkts                       value:
		    key:port_handle.rx_adj_syn_ack_pkts                   value:
		    key:rx_adj_ack_pkts                                   value:
		    key:rx_adj_rst_ack_pkts                               value:
		n   key:rx_top_disc_receipt_pkts                          value:
		n   key:rx_line_config_req                                value:
		    key:rx_dropped_sub_not_found                          value:
		n   key:rx_dropped_no_cap                                 value:
		n   key:rx_dropped_adj_not_stsab                          value:
		    key:rx_dropped_malformed                              value:
		    key:tx_total_pkts                                     value:
		    key:port_handle.tx_adj_syn_pkts                       value:
		    key:port_handle.tx_adj_syn_ack_pkts                   value:
		    key:tx_adj_ack_pkts                                   value:
		    key:tx_adj_rst_ack_pkts                               value:
		    key:port_handle.tx_top_disc_port_up_events            value:
		    key:tx_top_disc_port_down_events                      value:
		n   key:tx_line_config_receipts                           value:
		n   key:adj_estab_time_min                                value:
		n   key:adj_estab_time_avg                                value:
		n   key:adj_estab_time_max                                value:
		    key:adj_estab_count                                   value:
		n   key:adj_estab_percent                                 value:
		n   key:adj_estab_rate                                    value:
		    key:agg_sub_line_down_bw                              value:
		    key:agg_sub_line_up_bw                                value:
		    key:port_handle.ancp_adjacency.ans_established        value:
		    key:port_handle.ancp_adjacency.tx.pkts                value:
		    key:port_handle.ancp_adjacency.rx.pkts                value:
		    key:port_handle.ancp_adjacency.tx.bytes               value:
		    key:port_handle.ancp_adjacency.rx.bytes               value:
		    key:port_handle.ancp_adjacency.tx.syn                 value:
		    key:port_handle.ancp_adjacency.rx.syn                 value:
		    key:port_handle.ancp_adjacency.tx.ack                 value:
		    key:port_handle.ancp_adjacency.rx.ack                 value:
		    key:port_handle.ancp_adjacency.tx.synack              value:
		    key:port_handle.ancp_adjacency.rx.synack              value:
		    key:port_handle.ancp_adjacency.tx.rstack              value:
		    key:port_handle.ancp_adjacency.rx.rstack              value:
		    key:port_handle.ancp_general.ans_established          value:
		    key:port_handle.ancp_general.port_name                value:
		    key:port_handle.ancp_general.dsl_lines_up             value:
		    key:port_handle.ancp_general.tx.pkts                  value:
		    key:port_handle.ancp_general.rx.pkts                  value:
		    key:port_handle.ancp_general.tx.bytes                 value:
		    key:port_handle.ancp_general.rx.bytes                 value:
		    key:port_handle.ancp_port_event.dsl_lines_up          value:
		    key:port_handle.ancp_port_event.tx.port_up            value:
		    key:port_handle.ancp_port_event.tx.port_down          value:
		    key:port_handle.ancp_port_event.tx.event_pkts         value:
		    key:port_handle.ancp_port_event.tx.event_bytes        value:
		x   key:port_handle.adj_estab_rate_avg                    value:
		x   key:port_handle.adj_teardown_rate_avg                 value:
		x   key:port_handle.capability_not_supported              value:
		x   key:port_handle.dynamic_topology_discovery            value:
		x   key:port_handle.invalid_request_message               value:
		x   key:port_handle.invalid_tlv_contents                  value:
		x   key:port_handle.line_configuration                    value:
		x   key:port_handle.line_configuration_success_sent       value:
		x   key:port_handle.line_configuration_failed_sent        value:
		x   key:port_handle.rx_line_config_pkts                   value:
		x   key:port_handle.mandatory_tlv_missing                 value:
		x   key:port_handle.oam_success_sent                      value:
		x   key:port_handle.oam_failed_sent                       value:
		x   key:port_handle.oam_invalid_test_param                value:
		x   key:port_handle.oam_messages_received                 value:
		x   key:port_handle.partition_id_mismatch                 value:
		x   key:port_handle.receiver_instance_mismatch            value:
		x   key:port_handle.receiver_name_mismatch                value:
		x   key:port_handle.receiver_port_mismatch                value:
		x   key:port_handle.remote_loopback                       value:
		x   key:port_handle.request_message_type_not_implemented  value:
		x   key:port_handle.rx_adj_rstack_pkts                    value:
		x   key:port_handle.tx_adj_rstack_pkts                    value:
		x   key:port_handle.sender_instance_mismatch              value:
		x   key:port_handle.sender_name_mismatch                  value:
		x   key:port_handle.sender_port_mismatch                  value:
		x   key:port_handle.sessions_down                         value:
		x   key:port_handle.sessions_not_started                  value:
		x   key:port_handle.sessions_total                        value:
		x   key:port_handle.sessions_up                           value:
		x   key:port_handle.some_ports_down                       value:
		x   key:port_handle.syn_invalid_m_flag                    value:
		x   key:port_handle.version_mismatch                      value:
		x   key:port_handle.transactional_multicast               value:
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    1) Unsupported parameters or unsupported parameter options will be
		    silently ignored.
		
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
				'emulation_ancp_stats', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
