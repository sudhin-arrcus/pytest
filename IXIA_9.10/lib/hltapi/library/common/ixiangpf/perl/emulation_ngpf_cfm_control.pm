##Procedure Header
# Name:
#    ixiangpf::emulation_ngpf_cfm_control
#
# Description:
#    This procedure will handle all the right click action(s) that can be carried out on CFM/Y.1731 protocol stack.
#
# Synopsis:
#    ixiangpf::emulation_ngpf_cfm_control
#        -mode    CHOICES start
#                 CHOICES stop
#                 CHOICES restartDown
#                 CHOICES abort
#                 CHOICES start_CCM_emulated
#                 CHOICES stop_CCM_emulated
#                 CHOICES start_CCM_simulated
#                 CHOICES stop_CCM_simulated
#        [-handle ANY]
#
# Arguments:
#    -mode
#        Operation that is been executed on the protocol. Valid choices are:
#        start- Start the protocol.
#        stop- Stop the protocol.
#        restart_down - Restarts the down sessions.
#        abort- Aborts the protocol.
#        start_CCM_emulated
#        stop_CCM_emulated
#        start_CCM_simulated
#        stop_CCM_simulated
#    -handle
#        CFM handle where the CFM Bridge/MP control action is applied.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status  value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log     value:If status is failure, detailed information provided.
#
# Examples:
#    See files starting with CFM_ in the Samples subdirectory.
#    See the CFM example in Appendix A, "Example APIs," for one specific example usage.
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    Coded versus functional specification.
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_ngpf_cfm_control {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_ngpf_cfm_control', $args);
	# ixiahlt::utrackerLog ('emulation_ngpf_cfm_control', $args);

	return ixiangpf::runExecuteCommand('emulation_ngpf_cfm_control', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
