##Procedure Header
# Name:
#    ::ixiangpf::emulation_netconf_client_config
#
# Description:
#    This procedure will add and configure Netconf Client to a particular Ixia Interface.
#
# Synopsis:
#    ::ixiangpf::emulation_netconf_client_config
#        -mode                                   CHOICES create
#                                                CHOICES delete
#                                                CHOICES modify
#                                                CHOICES enable
#                                                CHOICES disable
#        [-port_handle                           REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#        [-handle                                ANY]
#x       [-netconf_client_active                 ANY]
#x       [-netconf_client_name                   ALPHA]
#x       [-multiplier                            NUMERIC]
#x       [-server_ipv4_address                   ANY]
#x       [-server_ipv4_address_step              ANY]
#x       [-number_of_command_snippets_per_client NUMERIC]
#x       [-port_number                           ANY]
#x       [-fetch_schema_info                     ANY]
#x       [-schema_output_directory               ALPHA]
#x       [-send_close_on_stop                    ANY]
#x       [-do_not_validate_server_response       ANY]
#x       [-capabilities_base1_dot0               ANY]
#x       [-capabilities_base1_dot1               ANY]
#x       [-capabilities_writable_running         ANY]
#x       [-capabilities_candidate                ANY]
#x       [-capabilities_rollback_on_error        ANY]
#x       [-capabilities_startup                  ANY]
#x       [-capabilities_url                      ANY]
#x       [-capabilities_xpath                    ANY]
#x       [-capabilities_confirmed_commit         ANY]
#x       [-capabilities_validate                 ANY]
#x       [-capabilities_notification             ANY]
#x       [-capabilities_interleave               ANY]
#x       [-ssh_authentication_mechanism          CHOICES noauthentication
#x                                               CHOICES usernamepassword
#x                                               CHOICES keybased]
#x       [-user_name                             ALPHA]
#x       [-password                              ALPHA]
#x       [-private_key_directory                 ALPHA]
#x       [-private_key_file_name                 ALPHA]
#x       [-enable_passphrase                     ANY]
#x       [-passphrase                            ALPHA]
#x       [-output_directory                      ALPHA]
#x       [-decrypted_capture                     ANY]
#x       [-save_reply_x_m_l                      ANY]
#x       [-log_clean_up_option                   CHOICES clean notClean]
#x       [-log_file_age                          NUMERIC]
#x       [-command_snippets_data_active          ANY]
#x       [-command_snippet_directory             ALPHA]
#x       [-command_snippet_file                  ALPHA]
#x       [-transmission_behaviour                CHOICES dontsend
#x                                               CHOICES once
#x                                               CHOICES periodiccontinuous
#x                                               CHOICES periodicfixedcount]
#x       [-periodic_transmission_interval        ANY]
#x       [-transmission_count                    ANY]
#
# Arguments:
#    -mode
#        This option defines whether to Create/Modify/Delete/Enable/Disable Netconf Client.
#    -port_handle
#        Port handle.
#    -handle
#        Specifies the parent node handle ( For ex : IP stack output of interface_config) on which the Netconf cleint is configured.
#        The Netconf client handle(s) are returned by the procedure "emulation_netconf_client_config" when configuring Netconf client on the Ixia interface.
#        For modify -mode, -handle can be Netconf Client's or Command Snippets' node handle.
#        For delete -mode, -handle is Netconf Client's node handle.
#        For enable/disable -mode, -handle can be Netconf Client's or Command Snippets' node handle or session(item) handle of these nodes.
#x   -netconf_client_active
#x       Activate/Deactivate Netconf Client Configuration.
#x   -netconf_client_name
#x       Name of NGPF element, guaranteed to be unique in Scenario
#x   -multiplier
#x       Number of layer instances per parent instance (multiplier)
#x   -server_ipv4_address
#x       Specify the IPv4 address of the DUT to which the Netconf Server should connect.
#x   -server_ipv4_address_step
#x       Step argument of Source IPv4 address
#x   -number_of_command_snippets_per_client
#x       Number of Command Snippets per client.Maximum 100 are allowed per client.
#x   -port_number
#x       The TCP Port Number the Netconf Server is listening on to which to connect.
#x   -fetch_schema_info
#x       Whether a get-schema operation will be performed after capability exchange
#x   -schema_output_directory
#x       Location of Directory in Client where the retrieved modules will be stored.
#x   -send_close_on_stop
#x       This specifies whether a close-session message will be sent on stopping this client.
#x   -do_not_validate_server_response
#x       If this option is enabled, the Netconf client will not parse server responses. Use this option to optimize memory usage in the client.
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
#x       Whether supports capability notification to aynchronously handle notifications from Netconf server device connected to.
#x   -capabilities_interleave
#x       Whether supports capability interleave to interleave notifications and responses.
#x   -ssh_authentication_mechanism
#x       The authentication mechanism for connecting to Netconf Server.
#x   -user_name
#x       Username for Username/Password mode and also used for Key-based Authentication as the username.
#x   -password
#x       Password for Username/Password mode.
#x   -private_key_directory
#x       File containing Private Key.(e.g. generated using ssh_keygen) . For multiple clients and assymetric key file names
#x       ( which cannot be expressed easily as a pattern) please explore "File" option in Master Row Pattern Editor by putting the file names
#x       in a .csv and pulling those values into the column cells.
#x   -private_key_file_name
#x       File containing Private Key.(e.g. generated using ssh_keygen) . For multiple clients and assymetric key file names
#x       ( which cannot be expressed easily as a pattern) please explore "File" option in Master Row Pattern Editor by putting the file names
#x       in a .csv and pulling those values into the column cells.
#x   -enable_passphrase
#x       If the Private Key was passphrase protected, this should be enabled to allow configuration of passphrase used.
#x   -passphrase
#x       The passphrase with which the Private Key was additionally protected during generation. For multiple clients and assymetric passphrases
#x       ( which cannot be expressed easily as a pattern) please explore "File" option in Master Row Pattern Editor by putting the file names
#x       in a .csv and pulling those values into the column cells.
#x   -output_directory
#x       Location of Directory in Client where the decrypted capture, if enabled, and server replies, if enabled,will be stored.
#x   -decrypted_capture
#x       Whether SSH packets for this session will be captured and stored on client in decrypted form.
#x       Note that this is not linked to IxNetwork control or data capture which will capture the packets in encrypted format only.
#x       Also note that this option should be avoided if Continuous Tranmission mode is enabled for any of the Command Snippets which can lead
#x       to huge capture files being generated which could in turn affect Stop time since during Stop, the captures are transferred to the client.
#x       The Decrypted Capture can be viewed by either doing right-click on a client where this option is enabled and doing "Get Decrypted Capture"
#x       ( allowed on 5 clients at a time ; each of the captures will be opened in a new Wireshark pop-up) OR by stopping the client and then directly
#x       opening it from the configured Output Directory from inside the current run folder/capture.
#x       This option can be enabled even when a session is already up in which case the capture will be started from that point of time.
#x   -save_reply_x_m_l
#x       If this is enabled, Hellos and replies to commands sent via Command Snippets or global command (such as 'get') by the Netconf Server will be stored in the Output Directory
#x       in current run folder/Replies. Any RPC errors recieved will be stored in a separate Error directory for convenience of debugging error scenarios.
#x       This option can be enabled even when a session is already up in which case the replies will be saved from that point of time.
#x   -log_clean_up_option
#x       Debug Log Clean Up
#x   -log_file_age
#x       This field determines how old logs to be deleted.
#x   -command_snippets_data_active
#x       Activate/Deactivate Command Snippets Data.
#x   -command_snippet_directory
#x       Directory containing XML based Netconf compliant command snippets.
#x   -command_snippet_file
#x       File containing XML based Netconf compliant command snippet. For multiple command snippets with assymetric file names
#x       ( which cannot be expressed easily as a pattern) please explore "File" option in Master Row Pattern Editor by putting the file names
#x       in a .csv and pulling those values into the column cells.
#x   -transmission_behaviour
#x       Transmission behaviour for command snippet.
#x       Don't Send : This means that command will not be automatically executed. This choice should be
#x       used if user wants to control the order or/and timing of sending the command snippet to the DUT
#x       using Test Composer or Automation Script.
#x       Once: The command will be sent only once to the DUT every time session comes up with the DUT.
#x       Periodic - Continuous: The command will be sent every Transmission Interval for the full lifetime of the session.Capture should be enabled with care if this option is selected.
#x       Periodic - Fixed Count: The command will be sent Transmission Count number of times, every Periodic Transmission Interval.
#x   -periodic_transmission_interval
#x       Minimum interval between scheduling of two transmits of the Command Snippet.
#x   -transmission_count
#x       Number of times to transmit the Command Snippet.
#
# Return Values:
#    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#x   key:ipv4_loopback_handle          value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle                   value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    $::SUCCESS | $::FAILURE
#    key:status                        value:$::SUCCESS | $::FAILURE
#    When status is $::FAILURE, log shows the detailed information of failure.
#    key:log                           value:When status is $::FAILURE, log shows the detailed information of failure.
#    Handle of Netconf Client configured
#    key:netconf_client_handle         value:Handle of Netconf Client configured
#    Handle of Command Snippets Data configured
#    key:command_snippets_data_handle  value:Handle of Command Snippets Data configured
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

proc ::ixiangpf::emulation_netconf_client_config { args } {

	set notImplementedParams "{}"
	set mandatoryParams "{}"
	set fileParams "{}"
	set flagParams "{}"
	set procName [lindex [info level [info level]] 0]
	::ixia::logHltapiCommand $procName $args
	::ixia::utrackerLog $procName $args
	return [eval runExecuteCommand "emulation_netconf_client_config" $notImplementedParams $mandatoryParams $fileParams $flagParams $args]
}
