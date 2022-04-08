##Procedure Header
# Name:
#    ::ixiangpf::emulation_bondedgre_control
#
# Description:
#    This procedure is used to execute all actions for BondedGRE protocol.
#
# Synopsis:
#    ::ixiangpf::emulation_bondedgre_control
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle      ANY]
#x       [-index       NUMERIC
#x                     DEFAULT 1]
#        [-values      RANGE 1-10000]
#        -mode         CHOICES stop
#                      CHOICES start
#                      CHOICES restart
#                      CHOICES diagBondingTunnel
#                      CHOICES diagDslTunnel
#                      CHOICES diagLteTunnel
#                      CHOICES endDiag
#                      CHOICES switchDsl
#                      CHOICES overflowLte
#                      CHOICES dslLinkFailure
#                      CHOICES lteLinkFailure
#                      CHOICES tearDown
#                      CHOICES resumehello
#                      CHOICES stophello
#x       [-error_code  NUMERIC
#x                     DEFAULT 0]
#
# Arguments:
#    -port_handle
#        A list of ports on which to control the BondedGRE protocol. If this option
#        is not present, the port in the handle option will be applied.
#    -handle
#        BondedGRE device handle.It is returned by emulation_bondedgre_config call.
#x   -index
#x       Index on which the action defined by the –mode parameter will be applied.
#    -values
#        The values for action to trigger on Ixia interface.
#    -mode
#        This option defines the action to be taken on the BondedGRE Instance.
#        Note: Valid options are:
#        1)stop
#        2)start
#        3)restart
#        4)diagBondingTunnel
#        5)diagDslTunnel
#        6)diagLteTunnel
#        7)endDiag
#        8)switchDsl
#        9)overflowLte
#        10)dslLinkFailure
#        11)lteLinkFailure
#x   -error_code
#x       The error code for Tear down message
#
# Return Values:
#    $::SUCCESS or $::FAILURE
#    key:status  value:$::SUCCESS or $::FAILURE
#    If failure, will contain more information
#    key:log     value:If failure, will contain more information
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) Coded versus functional specification.
#
# See Also:
#

proc ::ixiangpf::emulation_bondedgre_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_bondedgre_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
