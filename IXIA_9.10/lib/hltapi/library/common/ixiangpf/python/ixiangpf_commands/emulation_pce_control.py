# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_pce_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_pce_control
		
		 Description:
		    This procedure performs control actions like start, stop or restart on PCE and PCC Group and does some right click actions on different type of LSPs.
		    The following operations are done:
		    1. Start
		    2. Stop
		    3. Restart
		    4. Restart Down
		    5. Abort
		
		 Synopsis:
		    emulation_pce_control
		        -mode                 CHOICES restart
		                              CHOICES start
		                              CHOICES restart_down
		                              CHOICES stop
		                              CHOICES abort
		                              CHOICES take_control
		                              CHOICES return_delegation
		                              CHOICES send_pc_update
		        [-handle              ANY]
		x       [-pc_update_indexlist ALPHA]
		
		 Arguments:
		    -mode
		        What is being done to the protocol.Valid choices are:
		        restart- Restart the protocol.
		        start- Start the protocol.
		        stop- Stop the protocol.
		        restart_down- Restart the down sessions.
		        abort- Abort the protocol.
		        take_control- Take Control of PCE-Initiated LSPs.
		        return_delegation- Return Delegation of PCE-Initiated or PCE-Replied LSPs.
		        send_pc_update- SendPcUpdate for Learned Info Trigger Parameters.
		    -handle
		        This option represents the handle the user *must* pass to the
		        "emulation_pce_control" procedure. This option specifies
		        on which PCEP session to control.
		x   -pc_update_indexlist
		x       Index list for Send PCUpdate action.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log     value:If status is failure, detailed information provided.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    For mode choices restart, start, restart_down, stop and abort, PCE/PCC Group handle needs to be provided.
		    For take_control and return_delegation, node handle of corresponding LSP type needs to be provided.
		
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
				'emulation_pce_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
