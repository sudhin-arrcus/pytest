# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_dhcp_control(self, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_dhcp_control
		
		 Description:
		    This procedure starts, stops, and restarts the DHCP emulation client on the specified port.
		
		 Synopsis:
		    emulation_dhcp_control
		        [-port_handle      ANY]
		        [-handle           ANY]
		n       [-no_write         ANY]
		n       [-request_rate     ANY]
		x       [-ping_destination IP]
		        [-action           CHOICES bind
		                           CHOICES release
		                           CHOICES renew
		                           CHOICES abort
		                           CHOICES abort_async
		                           CHOICES restart_down
		                           CHOICES rebind
		                           CHOICES send_ping
		                           CHOICES start_relay_agent
		                           CHOICES stop_relay_agent
		                           CHOICES send_arp
		                           DEFAULT bind]
		
		 Arguments:
		    -port_handle
		        Specifies the port handle upon which emulation is configured.
		        Emulation must have been previously enabled on the specified port
		        via a call to emulation_dhcp_group_config proc.
		    -handle
		        Allows the user to optionally select the groups to which the
		        specified action is to be applied.
		        If this parameter is not specified, then the specified action is
		        applied to all groups configured on the port specified by
		        the -port_handle command. The handle is obtained from the keyed list returned
		        in the call to emulation_dhcp_group_config proc.
		        The port handle parameter must have been initialized and dhcp group
		        emulation must have been configured prior to calling this function.
		n   -no_write
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -request_rate
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -ping_destination
		x       Specifies the ip destination for ping.
		    -action
		        Action to take on the specified handle.
		        The parameters specified in the emulation_dhcp_group_config proc
		        are used to control the bind/renew/release rates.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    When status is failure, contains more information
		    key:log     value:When status is failure, contains more information
		
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
				'emulation_dhcp_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
