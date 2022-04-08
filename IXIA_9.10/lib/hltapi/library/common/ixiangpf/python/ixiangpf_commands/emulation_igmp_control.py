# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_igmp_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_igmp_control
		
		 Description:
		    This procedure starts, stops and restarts the IGMP protocol on specific Ixia ports with CPUs.
		
		 Synopsis:
		    emulation_igmp_control
		        -mode                   CHOICES stop
		                                CHOICES start
		                                CHOICES restart
		                                CHOICES join
		                                CHOICES leave
		                                CHOICES rejoin
		                                CHOICES releave
		                                CHOICES igmpSendSpecificQuery
		                                CHOICES igmpResumePeriodicGenQuery
		                                CHOICES igmpStopPeriodicGenQuery
		        [-group_member_handle   ANY]
		x       [-source_member_handle  ANY]
		        [-handle                ANY]
		        [-port_handle           REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
		x       [-start_group_address   IPV4
		x                               DEFAULT 125.0.0.1]
		x       [-group_count           NUMERIC
		x                               DEFAULT 1]
		x       [-start_source_address  IPV4
		x                               DEFAULT 10.10.10.0]
		x       [-source_count          NUMERIC
		x                               DEFAULT 0]
		x       [-source_increment_step NUMERIC
		x                               DEFAULT 1]
		
		 Arguments:
		    -mode
		        The action that will be performed on the protocol instances.
		    -group_member_handle
		        The IGMP group range handle. This option is available when using IxTclProtocol or IxTclNetwork path.
		        When using IxTclNetwork, this parameter can be also given as an element or a list of elements in the following
		        format: (source IP)/(source IP step)/(source count). Eg: 50.0.1.2/0.0.0.1/3.
		x   -source_member_handle
		x       The IGMP source range handle. This option is available when using IxTclProtocol or IxTclNetwork path.
		x       When using IxTclNetwork, this parameter can be also given as an element or a list of elements in the following
		x       format: (group IP)/(group IP step)/(group count). Eg: 50.0.1.2/0.0.0.1/3.
		    -handle
		        The IGMP session handle (host or querier). When this parameter is used
		        with IxTclNetwork, it can also be provided as an IGMP host IP or a list
		        of IGMP host IPs.
		    -port_handle
		        The port where the IGMP is to be controlled. If IxTclNetwork path is used, and port_handle is used
		        with mode join/leave, the group members on each ports will be enabled/disabled.
		x   -start_group_address
		x       This attribute is used when -mode is "igmp_send_specific_query". The parameter represents the start group address.
		x   -group_count
		x       This attribute is used when -mode is "igmp_send_specific_query". The parameter represents the group count.
		x   -start_source_address
		x       This attribute is used when -mode is "igmp_send_specific_query". The parameter represents the start source address.
		x   -source_count
		x       This attribute is used when -mode is "igmp_send_specific_query". The parameter represents the source count.
		x   -source_increment_step
		x       This attribute is used when -mode is "igmp_send_specific_query". The parameter represents the source increment step.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log     value:If status is failure, detailed information provided.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    If neither -handle nor -port_handle is provided, the protocol will start on all ports that have IGMP configured. This is valid for IxTclNetwork path only.
		
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
				'emulation_igmp_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
