##Procedure Header
# Name:
#    ixiangpf::emulation_esmc_config
#
# Description:
#    This procedure configures ESMC protocol stack.
#
# Synopsis:
#    ixiangpf::emulation_esmc_config
#        -handle                              ANY
#        -mode                                CHOICES create modify delete
#x       [-protocol_name                      ALPHA]
#        [-esmc_multiplier                    NUMERIC]
#x       [-quality_level                      CHOICES ql_stu_unk
#x                                            CHOICES ql_prs
#x                                            CHOICES ql_prc
#x                                            CHOICES ql_inv3
#x                                            CHOICES ql_ssu_a_tnc
#x                                            CHOICES ql_inv5
#x                                            CHOICES ql_inv6
#x                                            CHOICES ql_st2
#x                                            CHOICES ql_ssu_b
#x                                            CHOICES ql_inv9
#x                                            CHOICES ql_eec2_st3
#x                                            CHOICES ql_eec1_sec
#x                                            CHOICES ql_smc
#x                                            CHOICES ql_st3e
#x                                            CHOICES ql_prov
#x                                            CHOICES ql_dnu_dus
#x                                            CHOICES ql_random
#x                                            CHOICES ql_prtc_op1
#x                                            CHOICES ql_eprtc_op1
#x                                            CHOICES ql_eeec_op1
#x                                            CHOICES ql_eprc_op1
#x                                            CHOICES ql_prtc_op2
#x                                            CHOICES ql_eprtc_op2
#x                                            CHOICES ql_eeec_op2
#x                                            CHOICES ql_eprc_op2
#x                                            CHOICES ql_custom]
#x       [-custom_ssm_code                    NUMERIC]
#x       [-custom_enhanced_ssm_code           HEX]
#x       [-flag_mode                          CHOICES auto alwayson alwaysoff]
#x       [-enable_extended_ql_tlv             CHOICES 0 1]
#x       [-enable_custom_sync_eclock_identity CHOICES 0 1]
#x       [-custom_sync_eclock_identity        HEX]
#x       [-mixed_eecs                         CHOICES 0 1]
#x       [-partial_chain                      CHOICES 0 1]
#x       [-number_of_cascaded_eeecs           NUMERIC]
#x       [-number_of_cascaded_eecs            NUMERIC]
#x       [-send_dnu_if_better_ql_received     CHOICES 0 1]
#x       [-esmc_timeout                       NUMERIC]
#x       [-transmission_rate                  NUMERIC]
#
# Arguments:
#    -handle
#        Valid values are:
#        create, modify and delete.
#        For create and modify -mode, handle should be its parent Ethernet node handle.
#        For delete -mode, -handle should be its own handle i.e ESMC node handle.
#    -mode
#        This option defines the action to be taken on the ESMC.
#x   -protocol_name
#x       This is the name of the protocol stack as it appears in the GUI.
#x       Name of NGPF element, guaranteed to be unique in Scenario.
#    -esmc_multiplier
#        Number of ESMC to be created.
#x   -quality_level
#x       The SSM clock quality level(QL) code.
#x   -custom_ssm_code
#x       Denotes the custom SSM code entered by user.
#x   -custom_enhanced_ssm_code
#x       Denotes the custom enhanced SSM code entered by User.
#x   -flag_mode
#x       Sets the event transmition.
#x   -enable_extended_ql_tlv
#x       Enables addition of extended QL tlv in ESMC PDU.
#x   -enable_custom_sync_eclock_identity
#x       Enables user to provide the Sync E clock identity.
#x   -custom_sync_eclock_identity
#x       This denotes the Sync E clock identity of the originator of the extended QL TLV. By default it is the MAC address of the underlying ethernet stack.
#x   -mixed_eecs
#x       This denotes that whether at least one clock is not eEEC in the chain.
#x   -partial_chain
#x       This denotes whether the TLV is generated in the middle of the Chain.
#x   -number_of_cascaded_eeecs
#x       Denotes the number of cascaded eEECs from the nearest SSU/PRC.
#x   -number_of_cascaded_eecs
#x       Denotes the number of cascaded EECs from the nearest SSU/PRC.
#x   -send_dnu_if_better_ql_received
#x       Changes transmitted QL to DNU when better QL received.
#x   -esmc_timeout
#x       Transmits old QL after not receiving better QL for Timeout seconds.
#x   -transmission_rate
#x       Sets transmission rate in seconds. Default rate is 1 seconds.
#
# Return Values:
#    A list containing the network group protocol stack handles that were added by the command (if any).
#x   key:network_group_handle  value:A list containing the network group protocol stack handles that were added by the command (if any).
#    A list containing the mac pools protocol stack handles that were added by the command (if any).
#x   key:mac_pools             value:A list containing the mac pools protocol stack handles that were added by the command (if any).
#    A list containing the esmc protocol stack handles that were added by the command (if any).
#x   key:esmc                  value:A list containing the esmc protocol stack handles that were added by the command (if any).
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    Coded versus functional specification.
#    1) You can configure multiple ESMC on each Ixia interface.
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_esmc_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_esmc_config', $args);
	# ixiahlt::utrackerLog ('emulation_esmc_config', $args);

	return ixiangpf::runExecuteCommand('emulation_esmc_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
