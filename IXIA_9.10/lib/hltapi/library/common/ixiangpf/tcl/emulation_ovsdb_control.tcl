##Procedure Header
# Name:
#    ::ixiangpf::emulation_ovsdb_control
#
# Description:
#    This procedure will we be used to execute all actions for ovsdb controller protocol.
#
# Synopsis:
#    ::ixiangpf::emulation_ovsdb_control
#        [-port_handle REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle      ANY]
#x       [-index       NUMERIC
#x                     DEFAULT 1]
#        [-values      RANGE 1-10000]
#        -mode         CHOICES stop
#                      CHOICES start
#                      CHOICES restart
#                      CHOICES dumpDB
#                      CHOICES controllerDumpDB
#                      CHOICES addServer
#                      CHOICES deleteServer
#                      CHOICES getServerAddDeleteStatus
#                      CHOICES clearLastErrors
#                      CHOICES attach
#                      CHOICES detach
#
# Arguments:
#    -port_handle
#        A list of ports on which to control the ovsdb controller protocol. If this option
#        is not present, the port in the handle option will be applied.
#    -handle
#        Ovsdb controller / Clusterdata handle.It is returned by emulation_ovsdb_config call.
#x   -index
#x       index on which the action defined by the –mode parameter will be applied
#    -values
#        The values for action to trigger on Ixia interface.
#    -mode
#        This option defines the action to be taken.Note: Valid options are:
#        stop
#        start
#        restart
#        abort
#        dumpDB
#        controllerDumpDB
#        addServer
#        deleteServer
#        getServerAddDeleteStatus
#        clearLastErrors
#        attach
#        detach.
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

proc ::ixiangpf::emulation_ovsdb_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_ovsdb_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
