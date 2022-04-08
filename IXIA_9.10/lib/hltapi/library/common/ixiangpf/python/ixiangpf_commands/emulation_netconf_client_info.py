# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_netconf_client_info(self, mode, handle, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_netconf_client_info
		
		 Description:
		    This procedure retrieves information about the Netconf Client sessions.
		    This procedure is also used to fetch stats, learned information and configured properties of Netconf Client, depending on the given mode and handle.
		
		 Synopsis:
		    emulation_netconf_client_info
		x       -mode         CHOICES per_port_stats
		x                     CHOICES per_session_stats
		x                     CHOICES per_device_group_stats
		x                     CHOICES per_command_snippet_stats
		x                     CHOICES clear_stats
		x                     CHOICES get_learned_schema_info
		x                     CHOICES clear_all_learned_schema_info
		        -handle       ANY
		        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		
		 Arguments:
		x   -mode
		x       For fetching per_port_stats provide any Netconf Client handle, for per_session_stats, per_device_group_stats and per_command_snippet_stats provide a Netconf Client handle which is on the corresponding port.
		    -handle
		        The Netconf Client handle to act upon.
		    -port_handle
		        Port handle.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log     value:If status is failure, detailed information provided.
		
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
				'emulation_netconf_client_info', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
