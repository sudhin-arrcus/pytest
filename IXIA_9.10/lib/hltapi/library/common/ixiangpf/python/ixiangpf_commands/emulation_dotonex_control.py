# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_dotonex_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_dotonex_control
		
		 Description:
		    This procedure will we be used to execute all actions for 802.1x protocol.
		
		 Synopsis:
		    emulation_dotonex_control
		        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		        [-handle      ANY]
		x       [-index       NUMERIC
		x                     DEFAULT 1]
		        [-values      RANGE 1-10000]
		        -mode         CHOICES stop start restart abort
		
		 Arguments:
		    -port_handle
		        A list of ports on which to control the 802.1x protocol. If this option
		        is not present, the port in the handle option will be applied.
		    -handle
		        802.1x device handle.It is returned by emulation_dotonex_config call.
		x   -index
		x       index on which the action defined by the  mode parameter will be applied
		    -values
		        The values for action to trigger on Ixia interface.
		    -mode
		        This option defines the action to be taken.Note: Valid options are:
		        stop
		        start
		        restart
		
		 Return Values:
		    $::SUCCESS or $::FAILURE
		    key:status  value:$::SUCCESS or $::FAILURE
		    If failure, will contain more information
		    key:log     value:If failure, will contain more information
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    1) Coded versus functional specification.
		
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
				'emulation_dotonex_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
