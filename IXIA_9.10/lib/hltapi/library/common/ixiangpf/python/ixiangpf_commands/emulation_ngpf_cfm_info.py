# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_ngpf_cfm_info(self, mode, handle, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_ngpf_cfm_info
		
		 Description:
		    This procedure will fetch Statistics and Learned Information for CFM/Y.1731 protocol.
		
		 Synopsis:
		    emulation_ngpf_cfm_info
		        -mode    CHOICES stats
		                 CHOICES clear_stats
		                 CHOICES learned_info
		        -handle  ANY
		
		 Arguments:
		    -mode
		        Operation that is been executed on the protocol. Valid options are:
		        stats
		        clear_stats
		        learned_info
		    -handle
		        The CFM session handle to act upon.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status                   value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log                      value:If status is failure, detailed information provided.
		    Ixia only
		x   key:bridges_up               value:Ixia only
		    Ixia only
		x   key:bridges_down             value:Ixia only
		    Ixia only
		x   key:bridges_not_started      value:Ixia only
		    Cisco only
		x   key:bridges_total            value:Cisco only
		    Ixia only
		x   key:session_flap_count       value:Ixia only
		    Cisco only
		x   key:meps_configured          value:Cisco only
		    Ixia only
		x   key:meps_running             value:Ixia only
		    Cisco only
		x   key:mas_configured           value:Cisco only
		    Ixia only
		x   key:mas_running              value:Ixia only
		    Cisco only
		x   key:remote_meps              value:Cisco only
		    Ixia only
		x   key:rmep_ok                  value:Ixia only
		    Cisco only
		x   key:defective_rmep           value:Cisco only
		    Ixia only
		x   key:rmep_error_defect        value:Ixia only
		    Cisco only
		x   key:rmep_error_non_defect    value:Cisco only
		    Ixia only
		x   key:ccm_tx                   value:Ixia only
		    Cisco only
		x   key:ccm_rx                   value:Cisco only
		    Ixia only
		x   key:ltm_tx                   value:Ixia only
		    Cisco only
		x   key:ltm_rx                   value:Cisco only
		    Ixia only
		x   key:ltr_tx                   value:Ixia only
		    Cisco only
		x   key:ltr_rx                   value:Cisco only
		    Ixia only
		x   key:lbm_tx                   value:Ixia only
		    Cisco only
		x   key:lbm_rx                   value:Cisco only
		    Ixia only
		x   key:lbr_tx                   value:Ixia only
		    Cisco only
		x   key:lbr_rx                   value:Cisco only
		    Ixia only
		x   key:rdi_tx                   value:Ixia only
		    Cisco only
		x   key:rdi_rx                   value:Cisco only
		    Ixia only
		x   key:invalid_ccm_rx           value:Ixia only
		    Cisco only
		x   key:invalid_lbm_rx           value:Cisco only
		    Ixia only
		x   key:invalid_lbr_rx           value:Ixia only
		    Cisco only
		x   key:invalid_ltm_rx           value:Cisco only
		    Ixia only
		x   key:invalid_ltr_rx           value:Ixia only
		    Ixia only
		x   key:invalid_lmr_rx           value:Ixia only
		    Cisco only
		x   key:out_of_sequence_ccm_rx   value:Cisco only
		    Cisco only
		x   key:ccm_unexpected_period    value:Cisco only
		    Cisco only
		x   key:packet_tx                value:Cisco only
		    Cisco only
		x   key:packet_rx                value:Cisco only
		    Cisco only
		x   key:mep_fng_reset            value:Cisco only
		    Cisco only
		x   key:mep_fng_defect           value:Cisco only
		    Cisco only
		x   key:mep_fng_defect_reported  value:Cisco only
		    Cisco only
		x   key:mep_fng_defect_clearing  value:Cisco only
		    Cisco only
		x   key:lr_respond               value:Cisco only
		
		 Examples:
		    See files starting with CFM in the Samples subdirectory.
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
				'emulation_ngpf_cfm_info', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
