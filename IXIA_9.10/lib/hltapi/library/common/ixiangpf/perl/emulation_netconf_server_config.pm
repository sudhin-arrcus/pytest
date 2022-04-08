##Procedure Header
# Name:
#    ixiangpf::emulation_netconf_server_config
#
# Description:
#    This procedure will add and configure Netconf Server to a particular Ixia Interface.
#
# Synopsis:
#    ixiangpf::emulation_netconf_server_config
#        -mode                               CHOICES create
#                                            CHOICES delete
#                                            CHOICES modify
#                                            CHOICES enable
#                                            CHOICES disable
#        [-port_handle                       REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                            ANY]
#x       [-netconf_server_active             ANY]
#x       [-netconf_server_name               ALPHA]
#x       [-multiplier                        NUMERIC]
#x       [-client_ipv4_address               ANY]
#x       [-client_ipv4_address_step          ANY]
#x       [-port_number                       ANY]
#x       [-include_rx_timestamp_in_reply_msg ANY]
#x       [-capabilities_base1_dot0           ANY]
#x       [-capabilities_base1_dot1           ANY]
#x       [-capabilities_writable_running     ANY]
#x       [-capabilities_candidate            ANY]
#x       [-capabilities_rollback_on_error    ANY]
#x       [-capabilities_startup              ANY]
#x       [-capabilities_url                  ANY]
#x       [-capabilities_xpath                ANY]
#x       [-capabilities_confirmed_commit     ANY]
#x       [-capabilities_validate             ANY]
#x       [-capabilities_notification         ANY]
#x       [-capabilities_interleave           ANY]
#x       [-ssh_authentication_mechanism      CHOICES noauthentication
#x                                           CHOICES usernamepassword
#x                                           CHOICES keybased]
#x       [-user_name                         ALPHA]
#x       [-password                          ALPHA]
#x       [-public_key_directory              ALPHA]
#x       [-public_key_file_name              ALPHA]
#x       [-output_directory                  ALPHA]
#x       [-decrypted_capture                 ANY]
#x       [-error_percentage                  ANY]
#x       [-error_type                        CHOICES transport
#x                                           CHOICES rpc
#x                                           CHOICES protocol
#x                                           CHOICES application]
#x       [-error_tag                         CHOICES inuse
#x                                           CHOICES invalidvalue
#x                                           CHOICES toobig
#x                                           CHOICES missingattribute
#x                                           CHOICES badattribute
#x                                           CHOICES unknownattribute
#x                                           CHOICES missingelement
#x                                           CHOICES badelement
#x                                           CHOICES unknownelement
#x                                           CHOICES unknownnamespace
#x                                           CHOICES accessdenied
#x                                           CHOICES lockdenied
#x                                           CHOICES resourcedenied
#x                                           CHOICES rollbackfailed
#x                                           CHOICES dataexists
#x                                           CHOICES datamissing
#x                                           CHOICES operationnotsupported
#x                                           CHOICES operationfailed
#x                                           CHOICES partialoperation
#x                                           CHOICES malformedmessage]
#x       [-error_severity                    CHOICES error warning]
#x       [-include_error_info                ANY]
#x       [-error_info                        ALPHA]
#x       [-send_ok_response                  ANY]
#x       [-response_xml_directory            ALPHA]
#x       [-get_config_reply_xml              ALPHA]
#
# Arguments:
#    -mode
#        This option defines whether to Create/Modify/Delete/Enable/Disable Netconf Server.
#    -port_handle
#        Port handle.
#    -handle
#        Specifies the parent node handle ( For ex : IP stack output of interface_config) on which the Netconf server is configured with create -mode.
#        The Netconf server handle(s) are returned by the procedure "emulation_netconf_server_config" when configuring Netconf server on the Ixia interface.
#        For modify/delete -mode, -handle can be Netconf Server's node handle.
#        For enable/disable -mode, -handle can be Netconf Server's node handle or session(item) handle of the node.
#x   -netconf_server_active
#x       Activate/Deactivate Configuration
#x   -netconf_server_name
#x       Name of NGPF element, guaranteed to be unique in Scenario
#x   -multiplier
#x       Number of layer instances per parent instance (multiplier)
#x   -client_ipv4_address
#x       Specify the IPv4 address of the Netconf Client which will connect with this Server.
#x   -client_ipv4_address_step
#x       Step argument of Client IPv4 address
#x   -port_number
#x       The TCP Port Number the Netconf Server is listening on to which to connect.
#x   -include_rx_timestamp_in_reply_msg
#x       This specifies whether timestamp of received request messages will be included in the replies.
#x   -capabilities_base1_dot0
#x       Whether base1.0 support should be advertised in Capabilities.
#x   -capabilities_base1_dot1
#x       Whether base1.1 support should be advertised in Capabilities.
#x   -capabilities_writable_running
#x       Whether supports capability writable-running to directly modify running config.
#x   -capabilities_candidate
#x       Whether supports capability candidate to make changes into an intermediate candidate database. Normally this is preferred over writable-running.
#x   -capabilities_rollback_on_error
#x       Whether supports capability rollback to rollback partial changes make changes on detection of error during validate or commit.
#x   -capabilities_startup
#x       Whether supports capability startup to make changes in config persistent on device restart.
#x   -capabilities_url
#x       Whether supports capability url to specify netconf commands using url.
#x   -capabilities_xpath
#x       Whether supports capability xpath to specify netconf commands and filters using xpath extensions.
#x   -capabilities_confirmed_commit
#x       Whether supports capability confirmed-commit to specify ability to commit a group of commands or none as a batch.
#x   -capabilities_validate
#x       Whether supports capability validate to specify ability to validate a netconf command prior to commit.
#x   -capabilities_notification
#x       Whether supports capability notification to aynchronously send notifications to Netconf client.
#x   -capabilities_interleave
#x       Whether supports capability interleave to interleave notifications and responses.
#x   -ssh_authentication_mechanism
#x       The authentication mechanism for connecting to Netconf Client.
#x   -user_name
#x       Username for Username/Password mode and Username for Key-Based authentication mode if applicable.
#x   -password
#x       Password for Username/Password mode.
#x   -public_key_directory
#x       Directory containing public key file for this session
#x   -public_key_file_name
#x       File containing public key (e.g. generated using ssh_keygen). For multiple server rows and assymetric public key filenames
#x       ( which cannot be expressed easily as a pattern) please explore "File" option in Master Row Pattern Editor by putting the file names
#x       in a .csv and pulling those values into the column cells.
#x   -output_directory
#x       Location of Directory in Client where the decrypted capture, if enabled, and server replies, if enabled,will be stored.
#x   -decrypted_capture
#x       Whether SSH packets for this session will be captured and stored on client in decrypted form.
#x       Note that this is not linked to IxNetwork control or data capture which will capture the packets in encrypted format only.
#x       The Decrypted Capture can be viewed by either doing right-click on a client where this option is enabled and doing "Get Decrypted Capture"
#x       ( allowed on 5 clients at a time ; each of the captures will be opened in a new Wireshark pop-up) OR by stopping the client and then directly
#x       opening it from the configured Output Directory from inside the current run folder/capture.
#x       This option can be enabled even when a session is already up in which case the capture will be started from that point of time.
#x   -error_percentage
#x       The percentage of requests whose response will be errors.
#x   -error_type
#x       Defines the conceptual layer on which the error occurred.
#x   -error_tag
#x       Contains a string identifying the error condition.
#x   -error_severity
#x       Contains a string identifying the error severity, as determined by the device.
#x   -include_error_info
#x       This specifies whether 'error-info' element should be included in rpc error messages.
#x   -error_info
#x       Contains protocol or data-model-specific error content.
#x   -send_ok_response
#x       This specifies whether <ok> element should be sent in <rpc-reply> in response to <get-config> requests. If this is unchecked, custom reply based on <get-config> response xml will be sent out.
#x   -response_xml_directory
#x       Directory where Reply XMLs for <get-config> operations are present.
#x   -get_config_reply_xml
#x       File containing the response to a <get-config> request.
#
# Return Values:
#    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#x   key:ipv4_loopback_handle   value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle            value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    $::SUCCESS | $::FAILURE
#    key:status                 value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, log shows the detailed information of failure.
#    key:log                    value:When status is $::FAILURE, log shows the detailed information of failure.
#    Handle of Netconf Server configured
#    key:netconf_server_handle  value:Handle of Netconf Server configured
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

sub emulation_netconf_server_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_netconf_server_config', $args);
	# ixiahlt::utrackerLog ('emulation_netconf_server_config', $args);

	return ixiangpf::runExecuteCommand('emulation_netconf_server_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
