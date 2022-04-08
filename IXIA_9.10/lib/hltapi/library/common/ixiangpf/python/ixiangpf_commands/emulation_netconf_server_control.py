# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_netconf_server_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_netconf_server_control
		
		 Description:
		    This procedure performs control actions like start, stop or restart on Netconf Server and does some right click actions.
		    The following operations are done:
		    1. Start
		    2. Stop
		    3. Restart
		    4. Restart Down
		    5. Abort
		
		 Synopsis:
		    emulation_netconf_server_control
		        -mode             CHOICES restart
		                          CHOICES start
		                          CHOICES restart_down
		                          CHOICES stop
		                          CHOICES abort
		                          CHOICES get_decrypted_capture
		                          CHOICES stop_rpc_reply_store_outstanding_requests
		                          CHOICES stop_rpc_reply_drop_outstanding_requests
		                          CHOICES resume_rpc_reply
		                          CHOICES send_rpc_reply_with_wrong_message_id
		                          CHOICES send_rpc_reply_with_wrong_character_count
		        [-handle          ANY]
		x       [-tcp_port_number ANY]
		
		 Arguments:
		    -mode
		        What is being done to the protocol.Valid choices are:
		        restart- Restart the protocol.
		        start- Start the protocol.
		        stop- Stop the protocol.
		        restart_down- Restart the down sessions.
		        abort- Abort the protocol.
		    -handle
		        This option represents the handle the user *must* pass to the
		        "emulation_netconf_server_control" procedure. This option specifies
		        on which Netconf session to control.
		x   -tcp_port_number
		x       The TCP Port number of the server connection for which the capture file is to be fetched. Enter 0 for the first server connection.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log     value:If status is failure, detailed information provided.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    For mode choices restart, start, restart_down, stop and abort Netconf Server handle needs to be provided.
		
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
				'emulation_netconf_server_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
