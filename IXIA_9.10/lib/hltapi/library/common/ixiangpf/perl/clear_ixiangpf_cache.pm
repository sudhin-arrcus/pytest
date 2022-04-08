##Procedure Header
# Name:
#    ixiangpf::clear_ixiangpf_cache
#
# Description:
#    this method will clean the multivalue_config cache
#
# Synopsis:
#    ixiangpf::clear_ixiangpf_cache
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

package ixiangpf;

use utils;
use ixiahlt;

sub clear_ixiangpf_cache {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('clear_ixiangpf_cache', $args);
	# ixiahlt::utrackerLog ('clear_ixiangpf_cache', $args);

	return ixiangpf::runExecuteCommand('clear_ixiangpf_cache', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
