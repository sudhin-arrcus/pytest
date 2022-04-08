proc ::ixiangpf::ixnetwork_traffic_control { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{-disable_latency_bins -disable_jitter_bins}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "ixnetwork_traffic_control" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
