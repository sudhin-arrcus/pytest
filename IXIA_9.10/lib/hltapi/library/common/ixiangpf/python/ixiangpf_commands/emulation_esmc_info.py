# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_esmc_info(self, mode, handle, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_esmc_info
		
		 Description:
		    This procedure will fetch Statistics and Learned Information for ESMC protocol.
		
		 Synopsis:
		    emulation_esmc_info
		        -mode         CHOICES stats clear_stats
		        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		        -handle       ANY
		
		 Arguments:
		    -mode
		        Operation that is been executed on the protocol. Valid options are:
		        stats
		        clear_stats
		    -port_handle
		        The port from which to extract ISISdata.
		        One of the two parameters is required: port_handle/handle.
		    -handle
		        The ESMC session handle to act upon.
		
		 Return Values:
		
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
				'emulation_esmc_info', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
