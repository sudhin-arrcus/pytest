# -*- coding: utf-8 -*-

import sys
from ixiaerror import IxiaError
from ixiangpf import IxiaNgpf
from ixiautil import PartialClass, make_hltapi_fail

class IxiaNgpf(PartialClass, IxiaNgpf):
	def emulation_ancp_config(self, **kwargs):
		r'''
		#Procedure Header
		 Name:
		    emulation_ancp_config
		
		 Description:
		    This procedure will configure ANCP devices on an Ixia port.
		
		 Synopsis:
		    emulation_ancp_config
		n       [-access_aggregation                     ANY]
		n       [-access_aggregation_dsl_inner_vlan      ANY]
		n       [-access_aggregation_dsl_inner_vlan_type ANY]
		n       [-access_aggregation_dsl_outer_vlan      ANY]
		n       [-access_aggregation_dsl_outer_vlan_type ANY]
		n       [-access_aggregation_dsl_vci             ANY]
		n       [-access_aggregation_dsl_vpi             ANY]
		n       [-access_aggregation_dsl_vci_type        ANY]
		n       [-access_aggregation_dsl_vpi_type        ANY]
		        [-ancp_standard                          CHOICES ietf-ancp-protocol5 rfc6320
		                                                 DEFAULT rfc6320]
		n       [-circuit_id                             ANY]
		n       [-device_count                           ANY]
		n       [-distribution_alg_percentage            ANY]
		n       [-dsl_profile_capabilities               ANY]
		n       [-dsl_resync_profile_capabilities        ANY]
		n       [-encap_type                             ANY]
		n       [-events_per_interval                    ANY]
		        [-gateway_ip_addr                        IPV4
		                                                 DEFAULT 0.0.0.0]
		n       [-gateway_ip_prefix_len                  ANY]
		        [-gateway_ip_step                        IPV4
		                                                 DEFAULT 0.0.0.0]
		n       [-gateway_incr_mode                      ANY]
		x       [-global_port_down_rate_enabled          CHOICES 0 1]
		x       [-global_port_down_rate                  RANGE 1-10000
		x                                                DEFAULT 50]
		x       [-global_port_down_rate_interval         RANGE 1-65535
		x                                                DEFAULT 1000]
		x       [-global_port_down_rate_max_outstanding  RANGE 1-999999
		x                                                DEFAULT 400]
		x       [-global_port_down_rate_scale_mode       CHOICES port device_group
		x                                                DEFAULT port]
		x       [-global_port_up_rate_enabled            CHOICES 0 1]
		x       [-global_port_up_rate                    RANGE 1-10000
		x                                                DEFAULT 10]
		x       [-global_port_up_rate_interval           RANGE 1-65535
		x                                                DEFAULT 1000]
		x       [-global_port_up_rate_max_outstanding    RANGE 1-999999
		x                                                DEFAULT 400]
		x       [-global_port_up_rate_scale_mode         CHOICES port device_group
		x                                                DEFAULT port]
		x       [-global_start_rate_enabled              CHOICES 0 1]
		x       [-global_start_rate                      RANGE 1-10000
		x                                                DEFAULT 200]
		x       [-global_start_rate_interval             RANGE 1-65535
		x                                                DEFAULT 1000]
		x       [-global_start_rate_max_outstanding      RANGE 1-999999
		x                                                DEFAULT 400]
		x       [-global_start_rate_scale_mode           CHOICES port device_group
		x                                                DEFAULT port]
		x       [-global_stop_rate_enabled               CHOICES 0 1]
		x       [-global_stop_rate                       RANGE 1-10000
		x                                                DEFAULT 200]
		x       [-global_stop_rate_interval              RANGE 1-65535
		x                                                DEFAULT 1000]
		x       [-global_stop_rate_max_outstanding       RANGE 1-999999
		x                                                DEFAULT 400]
		x       [-global_stop_rate_scale_mode            CHOICES port device_group
		x                                                DEFAULT port]
		n       [-global_resync_rate                     ANY]
		n       [-gsmp_standard                          ANY]
		        [-handle                                 ANY]
		n       [-interval                               ANY]
		        [-intf_ip_addr                           IPV4
		                                                 DEFAULT 10.10.10.2]
		        [-intf_ip_prefix_len                     RANGE 0-32
		                                                 DEFAULT 16]
		        [-intf_ip_step                           IPV4
		                                                 DEFAULT 0.0.0.1]
		        [-keep_alive                             RANGE 1-255
		                                                 DEFAULT 250]
		x       [-keep_alive_retries                     RANGE 1-10
		x                                                DEFAULT 3]
		x       [-unlimited_redial                       CHOICES 0 1
		x                                                DEFAULT 1]
		x       [-max_redial_attempts                    RANGE 1-100
		x                                                DEFAULT 3]
		        [-line_config                            CHOICES 0 1
		                                                 DEFAULT 0]
		x       [-remote_loopback                        CHOICES 0 1
		x                                                DEFAULT 0]
		        [-local_mac_addr                         MAC
		                                                 DEFAULT 000a.0a00.0200]
		n       [-local_mac_addr_auto                    ANY]
		        [-local_mac_step                         MAC
		                                                 DEFAULT 0000.0000.0001]
		n       [-local_mss                              ANY]
		n       [-local_mtu                              ANY]
		        [-mode                                   CHOICES create
		                                                 CHOICES modify
		                                                 CHOICES delete
		                                                 CHOICES enable
		                                                 CHOICES disable
		                                                 CHOICES enable_all
		                                                 CHOICES disable_all
		                                                 DEFAULT create]
		n       [-port_down_rate                         ANY]
		n       [-port_resync_rate                       ANY]
		n       [-port_up_rate                           ANY]
		n       [-port_handle                            ANY]
		n       [-port_override_globals                  ANY]
		n       [-pvc_incr_mode                          ANY]
		n       [-qinq_incr_mode                         ANY]
		        [-sut_ip_addr                            IPV4
		                                                 DEFAULT 20.20.0.1]
		        [-sut_ip_step                            IPV4
		                                                 DEFAULT 0.0.0.0]
		x       [-sut_service_port                       RANGE 1-65535
		x                                                DEFAULT 6068]
		        [-topology_discovery                     CHOICES 0 1
		                                                 DEFAULT 1]
		x       [-transactional_multicast                CHOICES 0 1
		x                                                DEFAULT 0]
		n       [-vci                                    ANY]
		n       [-vci_count                              ANY]
		n       [-vci_repeat                             ANY]
		n       [-vci_step                               ANY]
		        [-vlan_id                                RANGE 0-4095]
		n       [-vlan_id_count                          ANY]
		n       [-vlan_id_count_inner                    ANY]
		        [-vlan_id_inner                          RANGE 0-4095]
		n       [-vlan_id_repeat                         ANY]
		n       [-vlan_id_repeat_inner                   ANY]
		        [-vlan_id_step                           RANGE 0-4095
		                                                 DEFAULT 1]
		        [-vlan_id_step_inner                     RANGE 0-4095
		                                                 DEFAULT 1]
		x       [-vlan_user_priority                     RANGE 0-7
		x                                                DEFAULT 0]
		x       [-vlan_user_priority_inner               RANGE 0-7
		x                                                DEFAULT 0]
		n       [-vpi                                    ANY]
		n       [-vpi_count                              ANY]
		n       [-vpi_repeat                             ANY]
		n       [-vpi_step                               ANY]
		n       [-gateway_ip_prefix                      ANY]
		n       [-gateway_ip_repeat                      ANY]
		n       [-gateway_ipv6_step                      ANY]
		n       [-gateway_ipv6_addr                      ANY]
		n       [-gateway_ipv6_prefix                    ANY]
		n       [-gateway_ipv6_prefix_len                ANY]
		n       [-gateway_ipv6_repeat                    ANY]
		n       [-intf_ip_prefix                         ANY]
		n       [-intf_ip_repeat                         ANY]
		n       [-local_mac_repeat                       ANY]
		n       [-remote_mac_addr                        ANY]
		n       [-remote_mac_repeat                      ANY]
		n       [-remote_mac_step                        ANY]
		n       [-return_receipt                         ANY]
		n       [-session_count                          ANY]
		n       [-sut_ip_prefix                          ANY]
		n       [-sut_ip_prefix_len                      ANY]
		n       [-sut_ip_repeat                          ANY]
		x       [-partition_id                           ANY]
		x       [-trigger_access_loop_events             CHOICES 0 1
		x                                                DEFAULT 0]
		
		 Arguments:
		n   -access_aggregation
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_inner_vlan
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_inner_vlan_type
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_outer_vlan
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_outer_vlan_type
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_vci
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_vpi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_vci_type
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -access_aggregation_dsl_vpi_type
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -ancp_standard
		        Access Node Control Protocol (ANCP) Standard followed by implementation. For Ixia this is either
		        ietf-ancp-protocol5 or rfc6320. This parameter is supported using the following
		        APIs: IxTclNetwork.
		        (DEFAULT = rfc6320)
		n   -circuit_id
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -device_count
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -distribution_alg_percentage
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -dsl_profile_capabilities
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -dsl_resync_profile_capabilities
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -encap_type
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -events_per_interval
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -gateway_ip_addr
		        The Gateway IP address of the Access Node. This parameter is supported
		        using the following APIs: IxTclNetwork.
		        (DEFAULT = 0.0.0.0)
		n   -gateway_ip_prefix_len
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -gateway_ip_step
		        The incrementing step for the Gateway IP address. This parameter is
		        supported using the following APIs: IxTclNetwork.
		        (DEFAULT = 0.0.0.0)
		n   -gateway_incr_mode
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -global_port_down_rate_enabled
		x       Enable Port Down rate settings
		x   -global_port_down_rate
		x       The number of Port Down event messages to send each second. This is a
		x       global level setting. When events_per_interval is present, then this
		x       option is ignored. This parameter is supported using the following
		x       APIs: IxTclNetwork.
		x       (DEFAULT = 50)
		x   -global_port_down_rate_interval
		x       Port down rate interval in milliseconds
		x   -global_port_down_rate_max_outstanding
		x       Port down rate max outstanding
		x   -global_port_down_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		x   -global_port_up_rate_enabled
		x       Enable Port Up rate settings
		x   -global_port_up_rate
		x       The number of Port Up event messages to send each second. This is a
		x       global level setting.When events_per_interval is present, then this
		x       option is ignored. This parameter is supported using the following
		x       APIs: IxTclNetwork.
		x       (DEFAULT = 10)
		x   -global_port_up_rate_interval
		x       Port Up rate interval in milliseconds
		x   -global_port_up_rate_max_outstanding
		x       Port Up rate max outstanding
		x   -global_port_up_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		x   -global_start_rate_enabled
		x       Enable ANCP Start rate settings
		x   -global_start_rate
		x       ANCP Start rate
		x   -global_start_rate_interval
		x       ANCP Start rate interval in milliseconds
		x   -global_start_rate_max_outstanding
		x       ANCP Start rate max outstanding
		x   -global_start_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		x   -global_stop_rate_enabled
		x       Enable ANCP Stop rate settings
		x   -global_stop_rate
		x       ANCP Stop rate
		x   -global_stop_rate_interval
		x       ANCP Stop rate interval in milliseconds
		x   -global_stop_rate_max_outstanding
		x       ANCP Start rate max outstanding
		x   -global_stop_rate_scale_mode
		x       Indicates whether the control is specified per port or per device group
		n   -global_resync_rate
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gsmp_standard
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -handle
		        When mode is create this is the parent handle used for creating this object.
		        It can be a topology, or a device group, or an ethernet or an ipv4.
		        Other modes require an ancp handle returned by ::ixngpf::emulation_ancp_config.
		n   -interval
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -intf_ip_addr
		        The IP address of the Access Node. It doesn't support a list of IP
		        Addresses. This parameter is supported using the following APIs:
		        IxTclNetwork.
		        (DEFAULT = 10.10.10.2)
		    -intf_ip_prefix_len
		        The prefix length for the IP address of the interface address (Access
		        Node address). This parameter is supported using the following APIs:
		        IxTclNetwork.
		        (DEFAULT = 16)
		    -intf_ip_step
		        Step value for incrementing interface address. This parameter is
		        supported using the following APIs: IxTclNetwork.
		        (DEFAULT = 0.0.0.1)
		    -keep_alive
		        The time period (in hundreads of milli seconds) between the sending two keep alive
		        messages. Specify the value in multiple of 1000. This parameter is
		        supported using the following APIs: IxTclNetwork.
		        (DEFAULT = 10000)
		x   -keep_alive_retries
		x       The number of NAS Keep-Alive retries. If a Keep-Alive times out, the
		x       emulated access node will re-send it the number of times specified by
		x       this parameter before determining that the connection to the NAS has
		x       gone down. This parameter is supported using the following APIs:
		x       IxTclNetwork.
		x       (DEFAULT = 3)
		x   -unlimited_redial
		x       Limit the Number of attempts to establish ANCP adjacency in case connection is lost
		x   -max_redial_attempts
		x       Number of attempts to establish ANCP adjacency in case connection is lost
		    -line_config
		        To enable/disable line configuration capabilities. For Ixia, this is
		        always 0. This parameter is supported using the following APIs:
		        IxTclNetwork.
		        (DEFAULT = 0)
		x   -remote_loopback
		x       Enable/Disable DSL Remote Line Conectivity Testing Capability
		    -local_mac_addr
		        Defines starting local MAC address (Access Node MAC address). This
		        parameter is supported using the following APIs: IxTclNetwork.
		        (DEFAULT = 000a.0a00.0200)
		n   -local_mac_addr_auto
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -local_mac_step
		        Incrementing step for local MAC address (Access Node MAC address). This
		        parameter is supported using the following APIs: IxTclNetwork.
		        (DEFAULT = 0000.0000.0001)
		n   -local_mss
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -local_mtu
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -mode
		        Action to perform. This parameter is supported using the following
		        APIs: IxTclNetwork.
		        (DEFAULT = create) Valid choices are:
		        create - Create new ANCP range on -port_handle or -handle(DHCP,
		        PPP, IP endpoint).Parameter -port_handle takes priority when both
		n   -port_down_rate
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -port_resync_rate
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -port_up_rate
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -port_handle
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -port_override_globals
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -pvc_incr_mode
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -qinq_incr_mode
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -sut_ip_addr
		        SUT address of the test interface/emulated ANCP. The IP address of the
		        NAS to which the emulated access node is connected. It cannot support
		        a list of IP addresses. This parameter is supported using the following
		        APIs: IxTclNetwork.
		        (DEFAULT = 20.20.0.1)
		    -sut_ip_step
		x   -sut_service_port
		x       The NAS ANCP TCP service port number. This parameter is supported using
		x       the following APIs: IxTclNetwork.
		x       (DEFAULT = 6068)
		    -topology_discovery
		        Enable/disable topology discovery functionality. For Ixia, this will
		        always be 1. This parameter is supported using the following APIs:
		        IxTclNetwork.
		        (DEFAULT = 1)
		x   -transactional_multicast
		x       Enable/Disable advertise Transactional Multicast capability
		n   -vci
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vci_count
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vci_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vci_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -vlan_id
		        Vlan ID for Access Node. Doesn't support a list of vlan IDs. This
		        parameter is supported using the following APIs: IxTclNetwork.
		n   -vlan_id_count
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vlan_id_count_inner
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -vlan_id_inner
		        Defines the Inner Vlan ID for Access Node. Doesn't support a list of
		        vlan IDs. This parameter is supported using the following APIs:
		        IxTclNetwork.
		n   -vlan_id_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vlan_id_repeat_inner
		n       This argument defined by Cisco is not supported for NGPF implementation.
		    -vlan_id_step
		        Defines the Vlan ID incrementing step. This parameter is supported
		        using the following APIs: IxTclNetwork.
		        (DEFAULT = 1)
		    -vlan_id_step_inner
		        Defines the Inner Vlan ID incrementing step. This parameter is
		        supported using the following APIs: IxTclNetwork.
		        (DEFAULT = 1)
		x   -vlan_user_priority
		x       Defines the Vlan user priority for Access Node. This parameter is
		x       supported using the following APIs: IxTclNetwork.
		x       (DEFAULT = 0)
		x   -vlan_user_priority_inner
		x       Defines the Inner Vlan user priority for Access Node. This parameter is
		x       supported using the following APIs: IxTclNetwork.
		x       (DEFAULT = 0)
		n   -vpi
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vpi_count
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vpi_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -vpi_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ip_prefix
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ip_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ipv6_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ipv6_addr
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ipv6_prefix
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ipv6_prefix_len
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -gateway_ipv6_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -intf_ip_prefix
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -intf_ip_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -local_mac_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -remote_mac_addr
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -remote_mac_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -remote_mac_step
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -return_receipt
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -session_count
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -sut_ip_prefix
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -sut_ip_prefix_len
		n       This argument defined by Cisco is not supported for NGPF implementation.
		n   -sut_ip_repeat
		n       This argument defined by Cisco is not supported for NGPF implementation.
		x   -partition_id
		x       Partition ID to be used in adjacency negotiation
		x   -trigger_access_loop_events
		x       Enable sending Port Up/Port Down events when AN is Started/Stopped.
		x       Does not apply if flapping is enabled on the Access Loop.
		x       This parameter is supported using the following APIs:
		x       IxTclNetwork.
		x       (DEFAULT = 0)
		
		 Return Values:
		    A list containing the ancp protocol stack handles that were added by the command (if any).
		x   key:ancp_handle  value:A list containing the ancp protocol stack handles that were added by the command (if any).
		    $::SUCCESS | $::FAILURE Status of procedure call.
		    key:status       value:$::SUCCESS | $::FAILURE Status of procedure call.
		    When status is failure, contains more information.
		    key:log          value:When status is failure, contains more information.
		    The list of ANCP handles configured. Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		    key:handle       value:The list of ANCP handles configured. Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
		
		 Examples:
		
		 Sample Input:
		
		 Sample Output:
		
		 Notes:
		    1) Unsupported parameters or unsupported parameter options will be
		    silently ignored. If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle
		
		 See Also:
		
		'''
		hlpy_args = locals().copy()
		hlpy_args.update(kwargs)
		del hlpy_args['self']
		del hlpy_args['kwargs']

		not_implemented_params = []
		mandatory_params = []
		file_params = []

		try:
			return self.__execute_command(
				'emulation_ancp_config', 
				not_implemented_params, mandatory_params, file_params, 
				hlpy_args
			)
		except (IxiaError, ):
			e = sys.exc_info()[1]
			return make_hltapi_fail(e.message)
