# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_bgp_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_bgp_control
		
		 Description:
		    This procedure starts, stops and restarts a BGP protocol for the specified port.
		
		 Synopsis:
		    emulation_bgp_control
		        -mode                   CHOICES restart
		                                CHOICES abort
		                                CHOICES restart_down
		                                CHOICES start
		                                CHOICES stop
		                                CHOICES statistic
		                                CHOICES break_tcp_session
		                                CHOICES resume_tcp_session
		                                CHOICES resume_keep_alive
		                                CHOICES stop_keep_alive
		                                CHOICES advertise_aliasing
		                                CHOICES withdraw_aliasing
		                                CHOICES flush_remote_cmac_forwarding_table
		                                CHOICES readvertise_cmac
		                                CHOICES readvertise_routes
		                                CHOICES age_out_routes
		                                CHOICES switch_to_spmsi
		        [-handle                ANY]
		x       [-notification_code     NUMERIC
		x                               DEFAULT 0]
		x       [-notification_sub_code NUMERIC
		x                               DEFAULT 0]
		n       [-port_handle           ANY]
		x       [-age_out_percent       NUMERIC]
		
		 Arguments:
		    -mode
		        What is being done to the protocol..
		    -handle
		        The BGP session handle.
		x   -notification_code
		x       The notification code for break_tcp_session and resume_tcp_session.
		x   -notification_sub_code
		x       The notification sub code for break_tcp_session and resume_tcp_session.
		n   -port_handle
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -age_out_percent
		x       The percentage of addresses that will be aged out. This argument is ignored when mode is not age_out_routes and *must* be specified in such circumstances.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    On status of failure, gives detailed information.
		    key:log     value:On status of failure, gives detailed information.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    Coded versus functional specification.
		
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
				'emulation_bgp_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
