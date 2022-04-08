##Procedure Header
# Name:
#    ::ixiangpf::emulation_isis_control
#
# Description:
#    This procedure is used to start, stop, and restart the ISIS protocol.
#
# Synopsis:
#    ::ixiangpf::emulation_isis_control
#        -mode                CHOICES start
#                             CHOICES stop
#                             CHOICES restart
#                             CHOICES abort
#                             CHOICES restart_down
#                             CHOICES stop_hello
#                             CHOICES resume_hello
#                             CHOICES age_out_routes
#                             CHOICES readvertise_routes
#                             CHOICES disconnect
#                             CHOICES reconnect
#x       [-age_out_percent    NUMERIC]
#n       [-port_handle        ANY]
#        [-handle             ANY]
#n       [-advertise          ANY]
#n       [-flap_count         ANY]
#n       [-flap_down_time     ANY]
#n       [-flap_interval_time ANY]
#n       [-flap_routes        ANY]
#n       [-withdraw           ANY]
#
# Arguments:
#    -mode
#x   -age_out_percent
#x       The percentage of addresses that will be aged out. This argument is ignored when mode is not age_out_routes and *must* be specified in such circumstances.
#n   -port_handle
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -handle
#        ISIS session handle where the ISIS control action is applied.
#n   -advertise
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -flap_count
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -flap_down_time
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -flap_interval_time
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -flap_routes
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -withdraw
#n       This argument defined by Cisco is not supported for NGPF implementation.
#
# Return Values:
#    $::SUCCESS | $::FAILURE
#    key:status  value:$::SUCCESS | $::FAILURE
#    If status is failure, detailed information provided.
#    key:log     value:If status is failure, detailed information provided.
#
# Examples:
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

proc ::ixiangpf::emulation_isis_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_isis_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
