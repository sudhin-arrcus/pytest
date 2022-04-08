##Procedure Header
# Name:
#    ixiangpf::emulation_dotonex_config
#
# Description:
#    This procedure will add Dotonex to a particular Ixia Interface.
#
# Synopsis:
#    ixiangpf::emulation_dotonex_config
#x       [-port_handle                    REGEXP ^[0-9]+/[0-9]+/[0-9]+$]
#x       [-reset                          FLAG]
#        [-handle                         ANY]
#x       [-return_detailed_handles        CHOICES 0 1
#x                                        DEFAULT 0]
#        [-mode                           CHOICES create
#                                         CHOICES modify
#                                         CHOICES delete
#                                         CHOICES getAttribute
#                                         DEFAULT create]
#x       [-attribute_name                 CHOICES sessionInfo]
#        [-count                          RANGE 1-8000
#                                         DEFAULT 1]
#x       [-tls_version                    CHOICES tls1_0 tls1_1 tls1_2]
#x       [-user_name                      ANY]
#x       [-user_pwd                       ANY]
#x       [-host_auth_mode                 CHOICES none
#x                                        CHOICES hostonly
#x                                        CHOICES hostuserreauth
#x                                        CHOICES hostuserboth]
#x       [-host_name                      ANY]
#x       [-host_pwd                       ANY]
#x       [-wait_id                        ANY]
#x       [-fast_provision_mode            CHOICES authenticated
#x                                        CHOICES unauthenticated
#x                                        CHOICES load_from_file
#x                                        CHOICES authenticated_save_to_file
#x                                        CHOICES unauthenticated_save_to_file]
#x       [-fast_inner_method              CHOICES mschapv2]
#x       [-runtime_certificate_generation ANY]
#x       [-fast_stateless_resume          CHOICES yes no]
#x       [-send_ca_cert_only              ANY]
#x       [-certificate_directory          ANY]
#x       [-private_key_file               ANY]
#x       [-peer_certificate_file          ANY]
#x       [-host_key_file                  ANY]
#x       [-host_certificate_file          ANY]
#x       [-verify_peer_certificate        ANY]
#x       [-ca_certificate_file            ANY]
#x       [-certificate_key_in_same_file   ANY]
#x       [-active                         ANY]
#x       [-dut_test_mode                  CHOICES singlehost
#x                                        CHOICES multihost
#x                                        CHOICES multiauth]
#x       [-machine_auth_prefix            ANY]
#x       [-disable_logoff                 CHOICES 0 1]
#x       [-multicast                      CHOICES 0 1]
#x       [-identify_using_VLAN            CHOICES 0 1]
#x       [-authorized_on_no_response      CHOICES 0 1]
#x       [-wait_before_run                RANGE 0-500
#x                                        DEFAULT 0]
#x       [-certificate_server_url         ANY]
#x       [-get_ca_certificate_only        ANY]
#x       [-company                        ANY]
#x       [-department                     ANY]
#x       [-city                           ANY]
#x       [-state                          ANY]
#x       [-country                        CHOICES ax
#x                                        CHOICES ad
#x                                        CHOICES ae
#x                                        CHOICES af
#x                                        CHOICES ag
#x                                        CHOICES ai
#x                                        CHOICES al
#x                                        CHOICES am
#x                                        CHOICES an
#x                                        CHOICES ao
#x                                        CHOICES aq
#x                                        CHOICES ar
#x                                        CHOICES as
#x                                        CHOICES at
#x                                        CHOICES au
#x                                        CHOICES aw
#x                                        CHOICES az
#x                                        CHOICES ba
#x                                        CHOICES bb
#x                                        CHOICES bd
#x                                        CHOICES be
#x                                        CHOICES bf
#x                                        CHOICES bg
#x                                        CHOICES bh
#x                                        CHOICES bi
#x                                        CHOICES bj
#x                                        CHOICES bm
#x                                        CHOICES bn
#x                                        CHOICES bo
#x                                        CHOICES br
#x                                        CHOICES bs
#x                                        CHOICES bt
#x                                        CHOICES bv
#x                                        CHOICES bw
#x                                        CHOICES by
#x                                        CHOICES bz
#x                                        CHOICES ca
#x                                        CHOICES cc
#x                                        CHOICES cf
#x                                        CHOICES cg
#x                                        CHOICES cd
#x                                        CHOICES ch
#x                                        CHOICES ci
#x                                        CHOICES ck
#x                                        CHOICES cl
#x                                        CHOICES cm
#x                                        CHOICES cn
#x                                        CHOICES co
#x                                        CHOICES cr
#x                                        CHOICES cs
#x                                        CHOICES cu
#x                                        CHOICES cv
#x                                        CHOICES cx
#x                                        CHOICES cy
#x                                        CHOICES cz
#x                                        CHOICES de
#x                                        CHOICES dj
#x                                        CHOICES dk
#x                                        CHOICES dm
#x                                        CHOICES do
#x                                        CHOICES dz
#x                                        CHOICES ec
#x                                        CHOICES ee
#x                                        CHOICES eg
#x                                        CHOICES eh
#x                                        CHOICES er
#x                                        CHOICES es
#x                                        CHOICES et
#x                                        CHOICES fi
#x                                        CHOICES fj
#x                                        CHOICES fk
#x                                        CHOICES fm
#x                                        CHOICES fo
#x                                        CHOICES fr
#x                                        CHOICES fx
#x                                        CHOICES ga
#x                                        CHOICES gb
#x                                        CHOICES gd
#x                                        CHOICES ge
#x                                        CHOICES gf
#x                                        CHOICES gg
#x                                        CHOICES gi
#x                                        CHOICES gl
#x                                        CHOICES gm
#x                                        CHOICES gn
#x                                        CHOICES gp
#x                                        CHOICES gq
#x                                        CHOICES gr
#x                                        CHOICES gs
#x                                        CHOICES gt
#x                                        CHOICES gu
#x                                        CHOICES gw
#x                                        CHOICES gy
#x                                        CHOICES hk
#x                                        CHOICES hm
#x                                        CHOICES hn
#x                                        CHOICES hr
#x                                        CHOICES ht
#x                                        CHOICES hu
#x                                        CHOICES id
#x                                        CHOICES ie
#x                                        CHOICES il
#x                                        CHOICES im
#x                                        CHOICES in
#x                                        CHOICES io
#x                                        CHOICES iq
#x                                        CHOICES ir
#x                                        CHOICES is
#x                                        CHOICES it
#x                                        CHOICES je
#x                                        CHOICES jm
#x                                        CHOICES jo
#x                                        CHOICES jp
#x                                        CHOICES ke
#x                                        CHOICES kg
#x                                        CHOICES kh
#x                                        CHOICES ki
#x                                        CHOICES km
#x                                        CHOICES kn
#x                                        CHOICES kp
#x                                        CHOICES kr
#x                                        CHOICES kw
#x                                        CHOICES ky
#x                                        CHOICES kz
#x                                        CHOICES la
#x                                        CHOICES lb
#x                                        CHOICES lc
#x                                        CHOICES li
#x                                        CHOICES lk
#x                                        CHOICES lr
#x                                        CHOICES ls
#x                                        CHOICES lt
#x                                        CHOICES lu
#x                                        CHOICES lv
#x                                        CHOICES ly
#x                                        CHOICES ma
#x                                        CHOICES mc
#x                                        CHOICES md
#x                                        CHOICES me
#x                                        CHOICES mg
#x                                        CHOICES mh
#x                                        CHOICES mk
#x                                        CHOICES ml
#x                                        CHOICES mm
#x                                        CHOICES mn
#x                                        CHOICES mo
#x                                        CHOICES mp
#x                                        CHOICES mq
#x                                        CHOICES mr
#x                                        CHOICES ms
#x                                        CHOICES mt
#x                                        CHOICES mu
#x                                        CHOICES mv
#x                                        CHOICES mw
#x                                        CHOICES mx
#x                                        CHOICES my
#x                                        CHOICES mz
#x                                        CHOICES na
#x                                        CHOICES nc
#x                                        CHOICES ne
#x                                        CHOICES nf
#x                                        CHOICES ng
#x                                        CHOICES ni
#x                                        CHOICES nl
#x                                        CHOICES no
#x                                        CHOICES np
#x                                        CHOICES nr
#x                                        CHOICES nt
#x                                        CHOICES nu
#x                                        CHOICES nz
#x                                        CHOICES om
#x                                        CHOICES pa
#x                                        CHOICES pe
#x                                        CHOICES pf
#x                                        CHOICES pg
#x                                        CHOICES ph
#x                                        CHOICES pk
#x                                        CHOICES pl
#x                                        CHOICES pm
#x                                        CHOICES pn
#x                                        CHOICES pr
#x                                        CHOICES ps
#x                                        CHOICES pt
#x                                        CHOICES pw
#x                                        CHOICES py
#x                                        CHOICES qa
#x                                        CHOICES re
#x                                        CHOICES ro
#x                                        CHOICES rs
#x                                        CHOICES rw
#x                                        CHOICES sa
#x                                        CHOICES sb
#x                                        CHOICES sc
#x                                        CHOICES sd
#x                                        CHOICES se
#x                                        CHOICES sg
#x                                        CHOICES sh
#x                                        CHOICES si
#x                                        CHOICES sj
#x                                        CHOICES sk
#x                                        CHOICES sl
#x                                        CHOICES sm
#x                                        CHOICES sn
#x                                        CHOICES so
#x                                        CHOICES sr
#x                                        CHOICES st
#x                                        CHOICES su
#x                                        CHOICES sv
#x                                        CHOICES sy
#x                                        CHOICES sz
#x                                        CHOICES tc
#x                                        CHOICES td
#x                                        CHOICES tf
#x                                        CHOICES tg
#x                                        CHOICES th
#x                                        CHOICES tj
#x                                        CHOICES tk
#x                                        CHOICES tm
#x                                        CHOICES tn
#x                                        CHOICES to
#x                                        CHOICES tp
#x                                        CHOICES tr
#x                                        CHOICES tt
#x                                        CHOICES tv
#x                                        CHOICES tw
#x                                        CHOICES tz
#x                                        CHOICES ua
#x                                        CHOICES ug
#x                                        CHOICES um
#x                                        CHOICES us
#x                                        CHOICES uy
#x                                        CHOICES uz
#x                                        CHOICES va
#x                                        CHOICES vc
#x                                        CHOICES ve
#x                                        CHOICES vg
#x                                        CHOICES vi
#x                                        CHOICES vn
#x                                        CHOICES vu
#x                                        CHOICES wf
#x                                        CHOICES ws
#x                                        CHOICES ye
#x                                        CHOICES yt
#x                                        CHOICES za
#x                                        CHOICES zm
#x                                        CHOICES zw]
#x       [-key_usage_extensions           CHOICES critical
#x                                        CHOICES digitalsignature
#x                                        CHOICES nonrepudiation
#x                                        CHOICES keyencipherment
#x                                        CHOICES dataencipherment
#x                                        CHOICES keyagreement
#x                                        CHOICES keycertsign
#x                                        CHOICES crlsign
#x                                        CHOICES encipheronly
#x                                        CHOICES decipheronly]
#x       [-key_size                       CHOICES 512 1024 2048]
#x       [-authentication_wait_period     RANGE 1-3600
#x                                        DEFAULT 30]
#x       [-organization_name              ANY]
#x       [-start_period                   RANGE 1-3600
#x                                        DEFAULT 30]
#x       [-max_start                      RANGE 1-100
#x                                        DEFAULT 3]
#x       [-successive_start               RANGE 1-100
#x                                        DEFAULT 1]
#x       [-fragment_size                  RANGE 500-1400
#x                                        DEFAULT 1400]
#x       [-max_outstanding_requests       RANGE 1-1024
#x                                        DEFAULT 10]
#x       [-max_teardown_rate              RANGE 1-1024
#x                                        DEFAULT 10]
#x       [-protocol_type                  CHOICES tls
#x                                        CHOICES md5
#x                                        CHOICES peapv0
#x                                        CHOICES peapv1
#x                                        CHOICES ttls
#x                                        CHOICES fast]
#x       [-max_setup_rate                 RANGE 1-1024
#x                                        DEFAULT 10]
#
# Arguments:
#x   -port_handle
#x       Ixia interface upon which to act.
#x   -reset
#x       If this option is selected, this will clear any 802.1x device.
#    -handle
#        802.1x device handle for using the modes delete, modify, enable, and disable.
#x   -return_detailed_handles
#x       This argument determines if individual interface, session or router handles are returned by the current command.
#x       This applies only to the command on which it is specified.
#x       Setting this to 0 means that only NGPF-specific protocol stack handles will be returned. This will significantly
#x       decrease the size of command results and speed up script execution.
#x       The default is 0, meaning only protocol stack handles will be returned.
#    -mode
#        Action to take on the port specified the handle argument.
#x   -attribute_name
#x       attribute name for fetching value.
#    -count
#        Defines the number of dotonex devices to configure on the -port_handle.
#x   -tls_version
#x       TLS version selecction
#x   -user_name
#x       Credential of the user for authentication
#x   -user_pwd
#x       Password of the user for authentication
#x   -host_auth_mode
#x       Host Authentication Mode
#x   -host_name
#x       Credential of the host for authentication
#x   -host_pwd
#x       Password of the host for authentication
#x   -wait_id
#x       When enabled, the supplicant does not send the initial EAPOL Start message. Instead, it waits for the authenticator (the DUT) to send an EAPOL Request / Identity message.
#x   -fast_provision_mode
#x       FAST Provision Mode
#x   -fast_inner_method
#x       FAST Inner Method
#x   -runtime_certificate_generation
#x       Generate Certificate during Run time. Configure details in Global parameters. Common Name will be User Name. Certificate and Key file names will be generated based on corresponding Client User name. Eg: If Client User name is IxiaUser1 then Certificate File will be IxiaUser1.pem, Key File will be IxiaUser1_key.pem, CA certificate File will be root.pem
#x   -fast_stateless_resume
#x       FAST Stateless Resume
#x   -send_ca_cert_only
#x       Use this option to send CA Certificate only to Port. Eg: For PEAPv0/v1 case there is no need to send User Certificate to port.
#x   -certificate_directory
#x       The location to the saved certificates
#x   -private_key_file
#x       The private key certificate to be used
#x   -peer_certificate_file
#x       The Peer certificate to be used
#x   -host_key_file
#x       The private key certificate to be used by the host
#x   -host_certificate_file
#x       The Peer certificate to be used by the host
#x   -verify_peer_certificate
#x       Verifies the provided peer certificate
#x   -ca_certificate_file
#x       The CA certificate to be used
#x   -certificate_key_in_same_file
#x       flag to determine whether to use same Certificate file for both Private Key and User Certificate
#x   -active
#x       Activate/Deactivate Configuration
#x   -dut_test_mode
#x       Specify what is the dut port mode
#x   -machine_auth_prefix
#x       When using machine authentication,
#x       a prefix is needed to differentiate between users and machines.
#x   -disable_logoff
#x       Do not send Logoff message when closing a session.
#x   -multicast
#x       Specify if destination MAC address can be multicast.
#x   -identify_using_VLAN
#x       Specify if VLAN is to be used to identify the supplicants
#x   -authorized_on_no_response
#x       If the DUT is not responding to EAPoL Start after configured
#x       number of retries, declare the session a success
#x   -wait_before_run
#x       The number of secs to wait before running the protocol.Maximum wait is 500
#x   -certificate_server_url
#x       Certificate Server URL
#x   -get_ca_certificate_only
#x       Use this option to get CA Certificate Only. Eg: For PEAPv0/v1 case there is no need to get User Certificate.
#x   -company
#x       Identification Info - Company
#x   -department
#x       Identification Info - Department
#x   -city
#x       Identification Info - City
#x   -state
#x       Identification Info - State
#x   -country
#x       Identification Info - Country
#x   -key_usage_extensions
#x       Select key usage extensions
#x   -key_size
#x       Key Options - Key Size
#x   -authentication_wait_period
#x       The maximum time interval, measured in seconds, that a Supplicant will wait for an Authenticator response.Maximum value is 3600
#x   -organization_name
#x       Other Options - Alternative Subject Name
#x   -start_period
#x       The time interval between successive EAPOL Start messages sent by a Supplicant.Maxium value is 3600
#x   -max_start
#x       The number of times to send EAPOL Start frames for which no response is received before declaring that the sessions have timed out.
#x       Max value is 100
#x   -successive_start
#x       The number of EAPOL Start messages sent when the supplicant starts the process of authentication.
#x       Max value is 100
#x   -fragment_size
#x       The maximum size of a fragment that can be sent on the wire for TLS fragments that comprise the phase 1 conversation (tunnel establishment).
#x       Max value is 1400
#x   -max_outstanding_requests
#x       The maximum number of sessions that can be negotiated at one moment. Max value is 1024
#x   -max_teardown_rate
#x       The number of interfaces to tear down per second. Max value is 1024
#x   -protocol_type
#x       protocol for authentication
#x   -max_setup_rate
#x       The number of interfaces to setup per second. Max rate is 1024
#
# Return Values:
#    A list containing the dotonex device protocol stack handles that were added by the command (if any).
#x   key:dotonex_device_handle  value:A list containing the dotonex device protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 device protocol stack handles that were added by the command (if any).
#x   key:ipv4_device_handle     value:A list containing the ipv4 device protocol stack handles that were added by the command (if any).
#    A list containing the ipv6 device protocol stack handles that were added by the command (if any).
#x   key:ipv6_device_handle     value:A list containing the ipv6 device protocol stack handles that were added by the command (if any).
#    A list containing the dhcpv4 device protocol stack handles that were added by the command (if any).
#x   key:dhcpv4_device_handle   value:A list containing the dhcpv4 device protocol stack handles that were added by the command (if any).
#    A list containing the dhcpv6 device protocol stack handles that were added by the command (if any).
#x   key:dhcpv6_device_handle   value:A list containing the dhcpv6 device protocol stack handles that were added by the command (if any).
#    A list containing the pppox client protocol stack handles that were added by the command (if any).
#x   key:pppox_client_handle    value:A list containing the pppox client protocol stack handles that were added by the command (if any).
#    A list containing the pppox server protocol stack handles that were added by the command (if any).
#x   key:pppox_server_handle    value:A list containing the pppox server protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:interface_handle       value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS or $::FAILURE
#    key:status                 value:$::SUCCESS or $::FAILURE
#    If failure, will contain more information
#    key:log                    value:If failure, will contain more information
#    802.1x device Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    key:handle                 value:802.1x device Handles Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) Coded versus functional specification.
#    If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle, interface_handle
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_dotonex_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_dotonex_config', $args);
	# ixiahlt::utrackerLog ('emulation_dotonex_config', $args);

	return ixiangpf::runExecuteCommand('emulation_dotonex_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
