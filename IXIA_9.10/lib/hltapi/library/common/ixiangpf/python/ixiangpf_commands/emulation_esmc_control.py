# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_esmc_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_esmc_control
		
		 Description:
		    This procedure will handle all the right click action(s) that can be carried out on ESMC protocol stack.
		
		 Synopsis:
		    emulation_esmc_control
		        -mode    CHOICES start stop restartDown abort
		        [-handle ANY]
		
		 Arguments:
		    -mode
		        Operation that is been executed on the protocol. Valid choices are:
		        start- Start the protocol.
		        stop- Stop the protocol.
		        restart_down - Restarts the down sessions.
		        abort- Aborts the protocol.
		    -handle
		        ESMC handle where the ESMC control action is applied.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log     value:If status is failure, detailed information provided.
		
		 Examples:
		    See files starting with ESMC in the Samples subdirectory.
		    See the CFM example in Appendix A, "Example APIs," for one specific example usage.
		
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
				'emulation_esmc_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
