# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def multivalue_config(self, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    multivalue_config
		
		 Description:
		    This procedure is used to create and modify multivalue operations. Multivalue is a very powerful represetation in NGPF. This is useful to generate various patterns like increment, decrement, custom pattern from file, repeatable random, overlay and etc. This command returns a handle for the configured multivalue. This handle can be used in interface and protocol configuration command to set patterns/multivalue against various fields.
		
		 Synopsis:
		    multivalue_config
		x       [-mode                            CHOICES create modify destroy]
		x       [-multivalue_handle               ANY]
		x       [-custom_handle                   ANY]
		x       [-increment_handle                ANY]
		x       [-pattern                         CHOICES none
		x                                         CHOICES single_value
		x                                         CHOICES counter
		x                                         CHOICES custom
		x                                         CHOICES repeatable_random
		x                                         CHOICES random
		x                                         CHOICES repeatable_random_range
		x                                         CHOICES custom_distributed
		x                                         CHOICES distributed
		x                                         CHOICES string
		x                                         CHOICES alternate
		x                                         CHOICES value_list
		x                                         CHOICES subset]
		x       [-single_value                    ALPHA]
		x       [-counter_start                   ANY]
		x       [-counter_step                    ANY]
		x       [-counter_direction               CHOICES increment decrement]
		x       [-nest_step                       ALPHA]
		x       [-nest_owner                      ALPHA]
		x       [-nest_enabled                    CHOICES 0 1]
		x       [-disable_all_nests               CHOICES 0 1
		x                                         DEFAULT 1]
		x       [-overlay_value                   ALPHA]
		x       [-overlay_value_step              ALPHA]
		x       [-overlay_index                   NUMERIC]
		x       [-overlay_index_step              NUMERIC]
		x       [-overlay_count                   NUMERIC]
		x       [-clear_existing_overlays         CHOICES 0 1
		x                                         DEFAULT 1]
		x       [-custom_start                    ANY]
		x       [-custom_step                     ANY]
		x       [-custom_increment_value          ANY]
		x       [-custom_increment_count          NUMERIC]
		x       [-repeatable_random_seed          NUMERIC]
		x       [-repeatable_random_count         NUMERIC]
		x       [-repeatable_random_fixed         ANY]
		x       [-repeatable_random_mask          ANY]
		x       [-repeatable_random_range_min     ANY]
		x       [-repeatable_random_range_max     ANY]
		x       [-repeatable_random_range_step    ANY]
		x       [-repeatable_random_range_seed    NUMERIC]
		x       [-custom_distribution_values      ALPHA]
		x       [-custom_distribution_percentages ALPHA]
		x       [-custom_distribution_weights     ALPHA]
		x       [-custom_distribution_algorithm   CHOICES auto_even
		x                                         CHOICES auto_geometric
		x                                         CHOICES percentage
		x                                         CHOICES weighted
		x                                         DEFAULT percentage]
		x       [-custom_distribution_mode        CHOICES topology device port
		x                                         DEFAULT topology]
		x       [-distributed_value               NUMERIC]
		x       [-string_pattern                  ALPHA]
		x       [-alternate_value                 CHOICES 0 1]
		x       [-values_list                     ALPHA]
		x       [-values_file                     ANY]
		x       [-values_file_type                CHOICES cisco csv juniper unsupported
		x                                         DEFAULT csv]
		x       [-values_file_column_index        NUMERIC
		x                                         DEFAULT 0]
		x       [-subset_source                   ANY]
		x       [-subset_source_attribute         ANY]
		x       [-subset_round_robin_mode         CHOICES none port device manual
		x                                         DEFAULT port]
		
		 Arguments:
		x   -mode
		x       The mode parameter is only needed when specifying values for
		x       custom_handle or increment_handle.
		x       When a custom_handle is specified the only valid mode values are
		x       - create
		x       - modify
		x       When a increment_handle is specified all choices are valid.
		x   -multivalue_handle
		x       The handle of a multivalue that was generated by a previous
		x       multivalue_config command.
		x   -custom_handle
		x       The handle of a custom pattern that was generated by a previous
		x       multivalue_config command.
		x   -increment_handle
		x       The handle of a custom increment that was generated by a previous
		x       multivalue_config command.
		x   -pattern
		x       The pattern that we want the multivalue to have.
		x   -single_value
		x       The value that will be used when the pattern is single_value.
		x       This argument is valid only if the configured pattern is single_value.
		x   -counter_start
		x       The start value that will be used when the pattern is a counter.
		x       This argument is valid only if the configured pattern is counter.
		x   -counter_step
		x       The step value that will be used when the pattern is a counter.
		x       This argument is valid only if the configured pattern is counter.
		x   -counter_direction
		x       The type of counter pattern that we want to configure.
		x       This argument is valid only if the configured pattern is counter.
		x   -nest_step
		x       The step of the configured nest(s) for the current multivalue.
		x       If multiple nests are configured the value of this argument must
		x       be a comma separated list of step values which correspond to the
		x       specified nest owners.
		x   -nest_owner
		x       The owner of the configured nest(s) for the current multivalue.
		x       If multiple nests are configured the value of this argument must
		x       be a comma separated list of owner handles.
		x   -nest_enabled
		x       This argument can be used to selectively enable/disable the nests configured
		x       in a multivalue.
		x       If multiple nests are configured the value of this argument must
		x       be a comma separated list of step values which correspond to the
		x       specified nest owners.
		x   -disable_all_nests
		x       This flag can be used to disable all nests in a multivalue.
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
		x   -custom_start
		x       The start value for the custom pattern.
		x       This argument is valid only if the configured pattern is custom.
		x   -custom_step
		x       The step value for the custom pattern.
		x       This argument is valid only if the configured pattern is custom.
		x   -custom_increment_value
		x       The value of the custom increment being configured by the current command.
		x       This argument is valid only if the configured pattern is custom.
		x   -custom_increment_count
		x       The count of the custom increment being configured by the current command.
		x       This argument is valid only if the configured pattern is custom.
		x   -repeatable_random_seed
		x       The seed that will be used by the repeatable random pattern configured by the current command.
		x       This argument is valid only if the configured pattern is repeatable_random.
		x   -repeatable_random_count
		x       The number of random values that will be generated by the repeatable random
		x       pattern configured by the current command.
		x       This argument is valid only if the configured pattern is repeatable_random.
		x   -repeatable_random_fixed
		x       A template that can be used to configure a static part of the values
		x       that will be generated.
		x       This argument is valid only if the configured pattern is repeatable_random.
		x   -repeatable_random_mask
		x       A mask that can be used to select which parts of the fixed value will
		x       not be changed when a new value is generated.
		x       This argument is valid only if the configured pattern is repeatable_random.
		x   -repeatable_random_range_min
		x       This is the minimum value of the range generated by the repeatable random range
		x       This argument is valid only if the configured pattern is repeatable_random_range.
		x   -repeatable_random_range_max
		x       This is the maximum value of the range generated by the repeatable random range
		x       This argument is valid only if the configured pattern is repeatable_random_range.
		x   -repeatable_random_range_step
		x       This is the minimum difference between generated value by the repeatable random range
		x       This argument is valid only if the configured pattern is repeatable_random_range.
		x   -repeatable_random_range_seed
		x       The seed that will be used by the repeatable random range pattern configured by the current command.
		x       This argument is valid only if the configured pattern is repeatable_random_range.
		x   -custom_distribution_values
		x       The values that will be used by the custom distributed multivalue configured by this command.
		x       This argument is valid only if the configured pattern is custom_distributed.
		x   -custom_distribution_percentages
		x       The distribution percentages that will be used.
		x       This argument is valid only if the configured pattern is custom_distributed.
		x   -custom_distribution_weights
		x       The distribution weights that will be used.
		x       This argument is valid only if the configured pattern is custom_distributed.
		x   -custom_distribution_algorithm
		x       The algorithm that will be used to distribute the values specified in custom_distribution_values.
		x   -custom_distribution_mode
		x       The mode in which the distribution algorithm specified by custom_distribution_algorithm will be applied.
		x   -distributed_value
		x       The value that will be distributed among the individual items configured with
		x       the current multivalue.
		x       This argument is valid only if the configured pattern is distributed.
		x   -string_pattern
		x       The string pattern that will be used by the multivalue configured by the current command.
		x       This argument is valid only if the configured pattern is string.
		x   -alternate_value
		x       The start value for the alternate pattern.
		x   -values_list
		x       A list of values that will be used to populate the corresponding attribute.
		x       If not enough values are supplied, the existing values will be reused as many times as necessary.
		x   -values_file
		x       The full path of a local file that will be used to import the list of values for the value_list pattern.
		x       The file should be in either CSV, CISCO or Juniper format. This argument's value will be used only if th values_list argument was not manually specified.
		x   -values_file_type
		x       The type of file that will be used to import the list of values for the value_list pattern.
		x       This argument is used only when values_file is specified and used as well and it has a default value of csv.
		x   -values_file_column_index
		x       The0-based index of the column that will be used to import the values.
		x       This argument is used only when values_file is specified and used as well and it has a default value of 0.
		x   -subset_source
		x       The handle of the protocol stack that will be used as a source of values for the corresponding attribute.
		x   -subset_source_attribute
		x       The name of the attribute that will be used as a source of values.
		x       The value of this argument will be ignored if no value was specified for subset_source.
		x       This argument can be omitted if the destination protocol stack is of the same type as the source protocol stack. In this case the name of the destination attribute will be used as the name of the source attribute.
		x   -subset_round_robin_mode
		x       The type of round robin distribution tat will be used to populate the values of the target attribute using the source values.
		
		 Return Values:
		    A list containing the multivalue protocol stack handles that were added by the command (if any).
		x   key:multivalue_handle  value:A list containing the multivalue protocol stack handles that were added by the command (if any).
		    A list containing the custom protocol stack handles that were added by the command (if any).
		x   key:custom_handle      value:A list containing the custom protocol stack handles that were added by the command (if any).
		    A list containing the increment protocol stack handles that were added by the command (if any).
		x   key:increment_handle   value:A list containing the increment protocol stack handles that were added by the command (if any).
		
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
		file_params = ['values_file']

		try:
			return self.__execute_command(
				'multivalue_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
