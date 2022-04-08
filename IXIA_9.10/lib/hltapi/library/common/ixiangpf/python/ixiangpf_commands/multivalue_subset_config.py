# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def multivalue_subset_config(self, source_protocol_handle, destination_protocol_handle, target_attribute, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    multivalue_subset_config
		
		 Description:
		    This is an internal method that is used to set multivalue attributes to a subset pattern directly.
		
		 Synopsis:
		    multivalue_subset_config
		x       -source_protocol_handle       ANY
		x       [-source_node_handle          ANY]
		x       [-source_attribute            ANY]
		x       -destination_protocol_handle  ANY
		x       [-destination_node_handle     ANY]
		x       -target_attribute             ANY
		x       [-round_robin_mode            CHOICES none port device manual
		x                                     DEFAULT port]
		x       [-overlay_value               ALPHA]
		x       [-overlay_value_step          ALPHA]
		x       [-overlay_index               NUMERIC]
		x       [-overlay_index_step          NUMERIC]
		x       [-overlay_count               NUMERIC]
		x       [-clear_existing_overlays     CHOICES 0 1
		x                                     DEFAULT 1]
		
		 Arguments:
		x   -source_protocol_handle
		x       An NGPF handle that was returned by a previous HLT command that identifies
		x       the protocol stack that will be used as a subset source.
		x   -source_node_handle
		x       An XPath expression that identifies the autogenerated node that will be used
		x       as a subset source.
		x   -source_attribute
		x       The name of an attribute of the source node that will be used as a source for the subset values.
		x   -destination_protocol_handle
		x       An NGPF handle that was returned by a previous HLT command that identifies
		x       the protocol stack that will be used as a subset destination.
		x   -destination_node_handle
		x       An XPath expression that identifies the autogenerated node that will be used
		x       as a subset destination.
		x   -target_attribute
		x       The name of the attribute that will be modified.
		x   -round_robin_mode
		x       The type of round robin distribution tat will be used to populate the values of the target attribute using the source values.
		x   -overlay_value
		x       The value of an overlay.
		x       This argument can be a comma separated list of values if we want to
		x       configure multiple overlays with a single command.
		x   -overlay_value_step
		x       The step used by an overlay.
		x       This argument should only be used if you want to create overlay patterns.
		x       This argument can be a comma separated list of values if we want to
		x       configure multiple overlays with a single command.
		x   -overlay_index
		x       The index at which the overlay will be created.
		x       This argument can be a comma separated list of values if we want to
		x       configure multiple overlays with a single command.
		x   -overlay_index_step
		x       The index step controls the inteval at which successive overlays will be created.
		x       This argument should only be used if you want to create overlay patterns.
		x       This argument can be a comma separated list of values if we want to
		x       configure multiple overlays with a single command.
		x   -overlay_count
		x       The number of overlays which will be generated by the corresponding overlay pattern.
		x       This argument should only be used if you want to create overlay patterns.
		x       This argument can be a comma separated list of values if we want to
		x       configure multiple overlays with a single command.
		x   -clear_existing_overlays
		x       This flag can be used to remove all overlays from a multivalue.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    On status of failure, gives detailed information.
		    key:log     value:On status of failure, gives detailed information.
		
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
				'multivalue_subset_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
