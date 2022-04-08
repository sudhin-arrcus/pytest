package ixiangpf;

use utils;
use tcl_utils;
use ixiahlt;
use IxNetwork;

sub ::ixiangpf::connect {

	# Get the command arguments as a hash reference
	my $args = shift(@_);

	# Call the legacy connect
	my $ixiaConnect =  ixiahlt::connect($args);
	$ixiangpf::checkIxiaResult = 1;

	if ($ixiaConnect == $ixiangpf::SUCCESS) {

		# Define some local vars that will be used further on
		my $newArgs = {};
		my $connectArgs = {};
		my $ixiangpfResult = undef;

		# Get the port mapping that will be forwarded to HLAPI
		my $portMapping = ixiangpf::GetPortMapping();
		my $argsToValidate = ixiangpf::GetArgsToValidate($args);

		# Try to use the current session, if any
		my $newConnectionRequired = 1;
		if (defined $ixiangpf::ixNet) {
			if (defined $ixiangpf::sessionId) {

				$newArgs = {
					'HLApiPortMapping'	=>	$portMapping,
					'args_to_validate'	=>	$argsToValidate,
				};
				$connectArgs = ixiangpf::MergeHashes($newArgs, $args);

				my $setParamsResult = ixiangpf::SetCommandParameters($ixiangpf::ixNet, $ixiangpf::sessionId, $connectArgs);
				if ($setParamsResult == $ixiangpf::FAIL) {
					return $ixiangpf::FAIL;
				}
				$newConnectionRequired = 0;
			}
		}

		# Check if we may need to create a new session
		my $hlapiConnectNeeded = ixiangpf::RequiresHlapiConnect($args);

		if (defined($args->{'interactive'})) {
				$ixiangpf::interactiveSession = $args->{'interactive'};
		} else {
				$ixiangpf::interactiveSession = 1
		}

		if ($newConnectionRequired && $hlapiConnectNeeded) {

			# Create the IxNetwork connection object
			$ixiangpf::ixNet = new IxNetwork();

			# Get the IxNetwork connection information
			my $ixNetData = GetIxNetworkServerAndPort($args);

			$api_key_name = "";
			@status_keys = ixiahlt::status_item_keys('connection');
			foreach $status_key (@status_keys) {
				if ($status_key eq 'api_key') {
					$api_key_name = '-apiKey';
					$ixNetData->{'apiKeyValue'} = ixiahlt::status_item('connection.api_key');
				} elsif ($status_key eq 'api_key_file') {
					$api_key_name = '-apiKeyFile';
					$ixNetData->{'apiKeyValue'} = ixiahlt::status_item('connection.api_key_file');
				}
			}
			if ($api_key_name ne "") {
				if ($ixiangpf::ixNet->{'_transportType'} eq 'TclSocket') {
					print "\nPlease install Perl missing dependencies to use user_name and user_password or api_key or api_key_file.\n";
					return $ixiangpf::FAIL;
				}
			}
			
			if (defined($ixNetData->{'hostname'})) {

				# Connect to IxNetwork using the specified information
				if ($api_key_name eq "") {
					if  ($ixiangpf::ixNet->{'_transportType'} eq 'TclSocket') {
						$ixNetData->{'port'} = ixiahlt::status_item('connection.tcl_port');
					} else {
						$ixNetData->{'port'} = ixiahlt::status_item('connection.port');
					}
					if (ixiahlt::status_item('connection.using_tcl_proxy') == 1) {
						$ixNetData->{'port'} = ixiahlt::status_item('connection.port');
						$ixNetData->{'sessionid'} = ixiahlt::status_item('connection.session_id');
					}
					$ixiangpf::ixNet->connect($ixNetData->{'hostname'}, '-port', $ixNetData->{'port'}, '-sessionId', $ixNetData->{'sessionid'}, '-clientId', 'HLAPI-Perl');
				} else {
					my $closeServerOnDisconnect = 1;
					if (defined($args->{'close_server_on_disconnect'})) {
						$closeServerOnDisconnect = $args->{'close_server_on_disconnect'}
					}
					$ixNetData->{'sessionid'} = ixiahlt::status_item('connection.session_id');
					$ixNetData->{'port'} = ixiahlt::status_item('connection.port');
					$ixiangpf::ixNet->connect($ixNetData->{'hostname'}, '-port', $ixNetData->{'port'}, '-sessionId', $ixNetData->{'sessionid'}, $api_key_name, $ixNetData->{'apiKeyValue'},  '-clientId', 'HLAPI-Perl', '-closeServerOnDisconnect', $closeServerOnDisconnect);
				}
				
				# Get the values of internal arguments
				my $machineName = ixiangpf::GetHostName();
				my $userName = ixiangpf::GetUserName();

				# Create the new session
				my $tmpSessionId = $ixiangpf::ixNet->add('/hlapi', 'session', '-HLApiClientMachineName', $machineName, '-HLApiClientUserName', $userName, '-HLApiOutputLanguageName', 'perl');
				my $ixNetCommitResult = CommitChangesAndHandlePublisherErrors($ixiangpf::ixNet);
				if ($ixNetCommitResult == $ixiangpf::FAIL) {
					return $ixiangpf::FAIL;
				}

				my @remappedIds = $ixiangpf::ixNet->remapIds(($tmpSessionId));
				$ixiangpf::sessionId = @remappedIds[0];

				my $newArgs = {
					'HLApiPortMapping'			=>	$portMapping,
					'args_to_validate'			=>	$argsToValidate,
				};
				my $connectArgs = ixiangpf::MergeHashes($args, $newArgs);

				# Update the new session with the full list of arguments				
				my $setParamsResult = ixiangpf::SetCommandParameters($ixiangpf::ixNet, $ixiangpf::sessionId, $connectArgs);
				if ($setParamsResult == $ixiangpf::FAIL) {
					return $ixiangpf::FAIL;
				}
			}
		}

		# At this point, if the sessionId contains an object reference we need to trigger the
		# executeCommand exec on it to ensure that the values are corectly propagated
		if (defined($ixiangpf::sessionId)) {

			$ixiangpf::ixNet->execute('executeCommand', $ixiangpf::sessionId);
			$ixiangpfResult = ixiangpf::runGetSessionStatus();

			# TODO: Merge the results of the 2 connect commands (if possible)
		}
	}
	else {
		print "\nError in ixiahlt::connect call\n\n";
	}

	# Return the result generated by the ::ixia::connect call.
	return $ixiaConnect
}

# Return value for the package
return 1;
