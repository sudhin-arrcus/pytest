# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_msrp_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_msrp_control
		
		 Description:
		    Control Operation on the MSRP Talker and Listener
		    The following operations are done:
		    1. Start
		    2. Stop
		    3. Restart
		    4. Restart Down
		    6. Abort
		
		 Synopsis:
		    emulation_msrp_control
		        -mode    CHOICES restart
		                 CHOICES start
		                 CHOICES restart_down
		                 CHOICES stop
		                 CHOICES abort
		        [-handle ANY]
		
		 Arguments:
		    -mode
		        What is being done to the protocol.Valid choices are:
		        restart - Restart the protocol.
		        start- Start the protocol.
		        stop- Stop the protocol.
		        restart_down- Restart the down sessions.
		        abort- Abort the protocol.
		    -handle
		        MSRP Talker or msrp listener handle where the msrp control action is applied.
		
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
				'emulation_msrp_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
