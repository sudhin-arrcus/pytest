# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_rsvpte_tunnel_control(self, mode, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_rsvpte_tunnel_control
		
		 Description:
		    Control Operation on the RSVP TE Tunnel
		    The following operations are done:
		    1. Start
		    2. Stop
		    3. Restart
		    4. Restart Down
		    5. Abort
		    6. Graft SubLSP
		    7. Prune SubLSP
		
		 Synopsis:
		    emulation_rsvpte_tunnel_control
		        -mode                        CHOICES restart
		                                     CHOICES start
		                                     CHOICES restart_down
		                                     CHOICES stop
		                                     CHOICES abort
		                                     CHOICES make_before_break
		                                     CHOICES initiate_path_reoptimization
		                                     CHOICES graft_sub_lsp
		                                     CHOICES prune_sub_lsp
		                                     CHOICES p2mp_make_before_break
		                                     CHOICES p2mp_initiate_path_reoptimization
		                                     CHOICES exclude_ero_or_sero
		                                     CHOICES include_ero_or_sero
		                                     CHOICES egress_graft_sub_lsp
		                                     CHOICES egress_prune_sub_lsp
		                                     CHOICES pcep_delegate
		                                     CHOICES pcep_revoke_delegation
		        [-handle                     ANY]
		x       [-graft_sub_lsp_id           NUMERIC]
		x       [-prune_sub_lsp_id           NUMERIC]
		x       [-egress_graft_sub_lsp_id    NUMERIC]
		x       [-egress_prune_sub_lsp_id    NUMERIC]
		x       [-include_ero_or_sero_lsp_id NUMERIC]
		x       [-exclude_ero_or_sero_lsp_id NUMERIC]
		
		 Arguments:
		    -mode
		        What is being done to the protocol.Valid choices are:
		        restart - Restart the protocol.
		        start- Start the protocol.
		        stop- Stop the protocol.
		        restart_down- Restart the down sessions.
		        abort- Abort the protocol.
		    -handle
		        RSVP TE Tunnel handle where the rsvp te tunnel control action is applied.
		x   -graft_sub_lsp_id
		x       The index of the Sub LSP which is to be grafted. This argument MUST be specified when grafting Sub LSPs.
		x   -prune_sub_lsp_id
		x       The index of the Sub LSP which is to be pruned. This argument MUST be specified when pruning Sub LSPs.
		x   -egress_graft_sub_lsp_id
		x       The index of the Sub LSP which is to be grafted. This argument MUST be specified when grafting Sub LSPs.
		x   -egress_prune_sub_lsp_id
		x       The index of the Sub LSP which is to be pruned. This argument MUST be specified when pruning Sub LSPs.
		x   -include_ero_or_sero_lsp_id
		x       The index of the Sub LSP whose ERO or SERO is to be included. This argument MUST be specified when trying to include ERO or SERO.
		x   -exclude_ero_or_sero_lsp_id
		x       The index of the Sub LSP whose ERO or SERO is to be excluded. This argument MUST be specified when trying to exclude ERO or SERO.
		
		 Return Values:
		    $::SUCCESS | $::FAILURE
		    key:status  value:$::SUCCESS | $::FAILURE
		    If status is failure, detailed information provided.
		    key:log     value:If status is failure, detailed information provided.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    For modes pcep_delegate and pcep_revoke_delegation, node handle of corresponding LSP type needs to be provided.
		
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
				'emulation_rsvpte_tunnel_control', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
