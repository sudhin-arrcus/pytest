##Procedure Header
# Name:
#    ::ixiangpf::clear_ixiangpf_cache
#
# Description:
#    this method will clean the multivalue_config cache
#
# Synopsis:
#    ::ixiangpf::clear_ixiangpf_cache
#
# Arguments:
#
# Return Values:
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#
# See Also:
#

proc ::ixiangpf::clear_ixiangpf_cache { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "clear_ixiangpf_cache" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
