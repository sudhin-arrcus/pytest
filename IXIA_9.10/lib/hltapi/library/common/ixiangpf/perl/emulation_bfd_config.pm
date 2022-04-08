##Procedure Header
# Name:
#    ixiangpf::emulation_bfd_config
#
# Description:
#    This command is used to create/modify/delete/enable/disable a BFD router.
#    Each BFD router can have multiple BFD router interfaces.
#    Each router interface is associated with a protocol interface.
#    By specifying the intf_... parameters there will be created a number of
#    interfaces equal to count of directly connected interfaces per BFD router.
#    By specifying the loopback_... parameters there will be created a number
#    of interfaces equal to loopback_count of unconnected interfaces per
#    connected interface.
#    At the end the number of BFD router interfaces per BFD router will be:
#    count * loopback_count.
#    Each BFD router interface will be associated to:
#    - a directly connected interface, if the user specifies only
#    the intf_... parameters
#    - an unconnected/loopback interface, if the user specifies the intf_...
#    and the loopback_... parameters
#
# Synopsis:
#    ixiangpf::emulation_bfd_config
#n       [-atm_encapsulation           ANY]
#n       [-control_interval            ANY]
#        [-count                       NUMERIC
#                                      DEFAULT 1]
#        [-echo_rx_interval            RANGE 0-4294967295
#                                      DEFAULT 0]
#        [-echo_timeout                RANGE 0-4294967295
#                                      DEFAULT 1500]
#        [-echo_tx_interval            RANGE 0-4294967295
#                                      DEFAULT 0]
#        [-control_plane_independent   CHOICES 0 1
#                                      DEFAULT 0]
#        [-enable_demand_mode          CHOICES 0 1
#                                      DEFAULT 0]
#        [-flap_tx_interval            RANGE 0-4294967295
#                                      DEFAULT 0]
#n       [-gre_count                   ANY]
#n       [-gre_ip_addr                 ANY]
#n       [-gre_ip_addr_step            ANY]
#n       [-gre_ip_addr_lstep           ANY]
#n       [-gre_ip_addr_cstep           ANY]
#n       [-gre_ip_prefix_length        ANY]
#n       [-gre_ipv6_addr               ANY]
#n       [-gre_ipv6_addr_step          ANY]
#n       [-gre_ipv6_addr_lstep         ANY]
#n       [-gre_ipv6_addr_cstep         ANY]
#n       [-gre_ipv6_prefix_length      ANY]
#n       [-gre_dst_ip_addr             ANY]
#n       [-gre_dst_ip_addr_step        ANY]
#n       [-gre_dst_ip_addr_lstep       ANY]
#n       [-gre_dst_ip_addr_cstep       ANY]
#n       [-gre_checksum_enable         ANY]
#n       [-gre_key_enable              ANY]
#n       [-gre_key_in                  ANY]
#n       [-gre_key_in_step             ANY]
#n       [-gre_key_out                 ANY]
#n       [-gre_key_out_step            ANY]
#n       [-gre_seq_enable              ANY]
#n       [-gre_src_ip_addr_mode        ANY]
#        [-handle                      ANY]
#n       [-intf_count                  ANY]
#        [-gateway_ip_addr             IPV4
#                                      DEFAULT 0.0.0.0]
#        [-gateway_ipv6_addr           IPV6
#                                      DEFAULT 0:0:0:0:0:0:0:0]
#        [-gateway_ip_addr_step        IPV4
#                                      DEFAULT 0.0.1.0]
#        [-gateway_ipv6_addr_step      IPV6
#                                      DEFAULT 0:0:0:1::0]
#        [-intf_ip_addr                IPV4]
#        [-intf_ip_addr_step           IPV4
#                                      DEFAULT 0.0.1.0]
#        [-intf_ip_prefix_length       RANGE 1-32
#                                      DEFAULT 24]
#        [-intf_ipv6_addr              IPV6]
#        [-intf_ipv6_addr_step         IPV6
#                                      DEFAULT 0:0:0:1::0]
#        [-intf_ipv6_prefix_length     RANGE 1-128
#                                      DEFAULT 64]
#n       [-loopback_count              ANY]
#        [-loopback_ip_addr            IPV4
#                                      DEFAULT 0.0.0.0]
#        [-loopback_ip_addr_step       IPV4
#                                      DEFAULT 0.0.0.1]
#n       [-loopback_ip_addr_cstep      ANY]
#        [-loopback_ip_prefix_length   RANGE 0-128
#                                      DEFAULT 24]
#        [-loopback_ipv6_addr          IPV6]
#        [-loopback_ipv6_addr_step     IPV6
#                                      DEFAULT 0:0:0:1::0]
#n       [-loopback_ipv6_addr_cstep    ANY]
#        [-loopback_ipv6_prefix_length RANGE 0-128
#                                      DEFAULT 64]
#        [-local_mac_addr              MAC
#                                      DEFAULT 0000.0000.0001]
#        [-local_mac_addr_step         MAC
#                                      DEFAULT 0000.0000.0001]
#        [-min_rx_interval             RANGE 0-4294967295
#                                      DEFAULT 1000]
#        -mode                         CHOICES create
#                                      CHOICES modify
#                                      CHOICES delete
#                                      CHOICES enable
#                                      CHOICES disable
#                                      DEFAULT create
#        [-mtu                         NUMERIC
#                                      DEFAULT 1500]
#        [-detect_multiplier           RANGE 1-255
#                                      DEFAULT 3]
#n       [-override_existence_check    ANY]
#n       [-override_tracking           ANY]
#n       [-pkts_per_control_interval   ANY]
#        [-poll_interval               RANGE 0-4294967295
#                                      DEFAULT 0]
#n       [-port_handle                 ANY]
#x       [-reset                       ANY]
#        [-router_id                   IPV4
#                                      DEFAULT 100.0.0.1]
#        [-router_id_step              IPV4
#                                      DEFAULT 0.0.0.1]
#        [-tx_interval                 RANGE 50-4294967295
#                                      DEFAULT 1000]
#        [-vlan                        CHOICES 0 1
#                                      DEFAULT 0]
#        [-vlan_id1                    RANGE 0-4095
#                                      DEFAULT 1]
#        [-vlan_id2                    RANGE 0-4095
#                                      DEFAULT 1]
#        [-vlan_id_step1               RANGE 0-4096
#                                      DEFAULT 0]
#        [-vlan_id_step2               RANGE 0-4096
#                                      DEFAULT 0]
#        [-vlan_user_priority1         RANGE 0-7
#                                      DEFAULT 0]
#        [-vlan_user_priority2         RANGE 0-7
#                                      DEFAULT 0]
#        [-vlan_ether_type1            CHOICES 0x8100
#                                      CHOICES 0x88a8
#                                      CHOICES 0x88A8
#                                      CHOICES 0x9100
#                                      CHOICES 0x9200
#                                      CHOICES 0x9300
#                                      DEFAULT 0x8100]
#        [-vlan_ether_type2            CHOICES 0x8100
#                                      CHOICES 0x88a8
#                                      CHOICES 0x88A8
#                                      CHOICES 0x9100
#                                      CHOICES 0x9200
#                                      CHOICES 0x9300
#                                      DEFAULT 0x8100]
#        [-vlan_id_mode1               CHOICES fixed increment
#                                      DEFAULT increment]
#        [-vlan_id_mode2               CHOICES fixed increment
#                                      DEFAULT increment]
#x       [-configure_echo_source_ip    CHOICES 0 1
#x                                     DEFAULT 0]
#x       [-echo_source_ip4             IPV4
#x                                     DEFAULT 0.0.0.0]
#x       [-echo_source_ip6             IPV6
#x                                     DEFAULT 0:0:0:0:0:0:0:0]
#x       [-ip_diff_serv                RANGE 0-4294967295
#x                                     DEFAULT 0]
#x       [-interface_active            CHOICES 0 1
#x                                     DEFAULT 1]
#x       [-interface_name              ALPHA]
#x       [-router_active               CHOICES 0 1
#x                                     DEFAULT 1]
#x       [-router_name                 ALPHA]
#n       [-vpi                         ANY]
#n       [-vci                         ANY]
#n       [-vpi_step                    ANY]
#n       [-vci_step                    ANY]
#        [-session_count               NUMERIC
#                                      DEFAULT 1]
#        [-enable_auto_choose_source   CHOICES 0 1
#                                      DEFAULT 1]
#        [-enable_learned_remote_disc  CHOICES 0 1
#                                      DEFAULT 1]
#        -ip_version                   CHOICES 4 6
#                                      DEFAULT 4
#        [-session_discriminator       RANGE 1-4294967295
#                                      DEFAULT 1]
#        [-session_discriminator_step  RANGE 0-4294967294
#                                      DEFAULT 1]
#        [-remote_discriminator        RANGE 1-4294967295
#                                      DEFAULT 1]
#        [-remote_discriminator_step   RANGE 0-4294967294
#                                      DEFAULT 1]
#x       [-source_ip_addr              ANY
#x                                     DEFAULT 0.0.0.0]
#x       [-source_ip_addr_step         ANY
#x                                     DEFAULT 0.0.0.1]
#        [-remote_ip_addr              IPV4
#                                      DEFAULT 0.0.0.0]
#        [-remote_ip_addr_step         IPV4
#                                      DEFAULT 0.0.0.1]
#x       [-source_ipv6_addr            ANY
#x                                     DEFAULT 0:0:0:0:0:0:0:0]
#x       [-source_ipv6_addr_step       ANY
#x                                     DEFAULT 0:0:0:1:0:0:0:0]
#        [-remote_ipv6_addr            IPV6
#                                      DEFAULT 0:0:0:0:0:0:0:0]
#        [-remote_ipv6_addr_step       IPV6
#                                      DEFAULT 0:0:0:1:0:0:0:0]
#x       [-session_handle              ANY]
#        [-hop_mode                    CHOICES singlehop multiplehop
#                                      DEFAULT singlehop]
#x       [-session_active              CHOICES 0 1
#x                                     DEFAULT 1]
#x       [-session_name                ALPHA]
#x       [-ip_ttl                      ANY]
#x       [-enable_ovsdb_communication  ANY]
#x       [-remote_mac                  ANY]
#x       [-aggregate_bfd_session       CHOICES 0 1
#x                                     DEFAULT 0]
#
# Arguments:
#n   -atm_encapsulation
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -control_interval
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -count
#        The number of BFD routers that need to be created.
#        This option is valid only when -mode is create.
#        (DEFAULT = 1)
#    -echo_rx_interval
#        This is the minimum interval, in microseconds, between received BFD
#        Echo packets that this system is capable of supporting. If this value
#        is zero, the transmitting system does not support the receipt of BFD
#        Echo packets. The supported range is 0-4,294,967,295, and the enable
#        range is 50-4,294,967,295. All values between 1-49 will be considered
#        as the minimum timer of 50.
#        When the Echo function is active, a stream of BFD Echo packets is
#        transmitted in such a way as to have the other system loop them back
#        through its forwarding path( same source and destination IP in the Echo
#        packet sent on a specific UDP Port No ). If a number of packets of the
#        echoed data streamare not received, the session is declared to be
#        down.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 0)
#    -echo_timeout
#        The value must be chosen in such a way so that the session liveliness
#        should be verified by Echo conveniently. Remember, since Echo Time Out
#        is configurable, it is possible that the session may have a higher Echo
#        Time Out than BFD Control Time Out. On expiry of Echo Time Out the
#        session will be deleted and the entire process of BFD session
#        establishment will happen from the DOWN state. The supported range
#        is 0-4,294,967,295, and the enable range is 50-4,294,967,295. All
#        values between 1-49 will be considered as the minimum timer of 50.
#        When the Echo function is active, a stream of BFD Echo packets is
#        transmitted in such a way as to have the other system loop them back
#        through its forwarding path( same source and destination IP in the Echo
#        packet sent on a specific UDP Port No ). If a number of packets of the
#        echoed data streamare not received, the session is declared to be
#        down.
#        This option is valid only when -echo_tx_interval is present and has a
#        value greater than or equal to 50 and -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 1500)
#    -echo_tx_interval
#        If Echo Tx interval is configured, Echo packets will be sent at an
#        interval of Echo Tx interval. If the configurable Echo Tx interval is
#        not set to a value greater than 50, the transmitter will use the Echo
#        Rx interval of the connected device to send its Echo Packets. The
#        supported range is 0-4,294,967,295, and the enable range
#        is 50-4,294,967,295. All values between 1-49 will be considered as the
#        minimum timer of 50.
#        When the Echo function is active, a stream of BFD Echo packets is
#        transmitted in such a way as to have the other system loop them back
#        through its forwarding path( same source and destination IP in the Echo
#        packet sent on a specific UDP Port No ). If a number of packets of the
#        echoed data streamare not received, the session is declared to be
#        down.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 0)
#    -control_plane_independent
#        If set, the transmitting system's BFD implementation does not share
#        fate with its control plane (in other words, BFD is implemented in the
#        forwarding plane and can continue to function through disruptions in
#        the control plane). If clear, the transmitting system's BFD
#        implementation shares fate with its control plane. The use of this bit
#        is application dependent and is outside the scope of this specification.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 0)
#    -enable_demand_mode
#        BFD has two operating modes which may be selected, as well as an
#        additional function that can be used in combination with the two modes,
#        the echo function.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 0) Valid choices are:
#        0, Asynchronous mode - In this mode, thesystems periodically send
#        BFD Control packets to one another, and if a number of those
#        packets in a row are not received by the other system, the session is
#        declared to be down. If -enable_demand_mode is set to 0, the system
#        will be in asynchronous mode.
#        1, Demand mode - In this mode, once a BFD session is established, the
#        systems stop sending BFD Control packets, except when either system
#        feels the need to verify connectivity explicitly, in whichcase a
#        short sequence of BFD Control packets is sent, and then the
#        protocol again stops sending Control packets. If enable_demand_mode
#        is set to 1, the system will be in demand mode.
#    -flap_tx_interval
#        BFD sessions will flap every flap_tx_interval (ms).
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 0)
#n   -gre_count
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ip_addr
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ip_addr_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ip_addr_lstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ip_addr_cstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ip_prefix_length
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ipv6_addr
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ipv6_addr_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ipv6_addr_lstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ipv6_addr_cstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_ipv6_prefix_length
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_dst_ip_addr
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_dst_ip_addr_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_dst_ip_addr_lstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_dst_ip_addr_cstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_checksum_enable
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_key_enable
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_key_in
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_key_in_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_key_out
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_key_out_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_seq_enable
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -gre_src_ip_addr_mode
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -handle
#        The BFD router handle returned by a previous call to
#        emulation_bfd_config with -mode create. This option is mandatory
#        when -mode is modify/enable/disable/delete.
#n   -intf_count
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -gateway_ip_addr
#        The gateway IP address for the router interface that is going to be
#        created.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0.0.0.0)
#    -gateway_ipv6_addr
#        The gateway IPv6 address for the router interface that is going to be created.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0:0:0:0:0:0:0:0)
#    -gateway_ip_addr_step
#        The gateway IP address incrementing step for the router interface that
#        is going to be created.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0.0.1.0)
#    -gateway_ipv6_addr_step
#        The gateway IP address incrementing step for the router interface that
#        is going to be created.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0:0:0:1::0)
#    -intf_ip_addr
#        The first IPv4 address of the first BFD router interface that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#    -intf_ip_addr_step
#        The IPv4 address incrementing step of the BFD router interfaces that
#        will be configured.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0.0.1.0)
#    -intf_ip_prefix_length
#        The IPv4 address prefix of the BFD router interfaces that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 24)
#    -intf_ipv6_addr
#        The first IPv6 address of the first BFD router interface that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#    -intf_ipv6_addr_step
#        The IPv6 address incrementing step of the BFD router interfaces that
#        will be configured.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0:0:0:1::0)
#    -intf_ipv6_prefix_length
#        The IPv6 address prefix of the BFD router interfaces that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 64)
#n   -loopback_count
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -loopback_ip_addr
#        The first loopback IPv4 address of the first BFD router that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#    -loopback_ip_addr_step
#        The IPv4 address incrementing step of the loopback interfaces that will
#        be configured.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0.0.0.1)
#n   -loopback_ip_addr_cstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -loopback_ip_prefix_length
#        The IPv4 address prefix of the loopbackinterfaces that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 24)
#    -loopback_ipv6_addr
#        The first loopback IPv6 address of the first BFD router that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#    -loopback_ipv6_addr_step
#        The IPv6 address incrementing step of the loopback interfaces that will
#        be configured.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0:0:0:1::0)
#n   -loopback_ipv6_addr_cstep
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -loopback_ipv6_prefix_length
#        The IPv6 address prefix of the loopbackinterfaces that will be
#        configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 64)
#    -local_mac_addr
#        The first MAC address of the first directly connected interface that
#        will be configured.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0000.0000.0001)
#    -local_mac_addr_step
#        The incrementing step of the directly connected interface that
#        will be configured. This option is valid only when -mode is create.
#        (DEFAULT = 0000.0000.0001)
#    -min_rx_interval
#        This is the minimum interval, in microseconds, between received BFD
#        Control packets that this system is capable of supporting. If this
#        value is zero, the transmitting system does not want the remote system
#        to send any periodic BFD Control packets. Any value between 1 and 49
#        will be set to the minimum value of 50. The range is 0-4,294,967,295.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 1000)
#    -mode
#        The operation that will be executed. This option has the following dependencies:
#        when mode is create, -port_handle is required
#        when mode is modify/enable/disable/delete, -handle is required
#        (DEFAULT = create) Valid choices are:
#        create - create BFD router(s)
#        modify - modify BFD router(s)
#        enable - enable BFD router(s)
#        disable - disable BFD router(s)
#        delete - delete BFD router(s)
#    -mtu
#        The MTU value for the directly connected interfaces.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 1500)
#    -detect_multiplier
#        Detection time multiplier. The negotiated transmit interval, multiplied
#        by this value, provides the detection time for the transmitting system
#        in Asynchronous mode. Range 1-255.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 3)
#n   -override_existence_check
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -override_tracking
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -pkts_per_control_interval
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -poll_interval
#        If in Demand Mode, polling will take place every poll_interval
#        interval. Range 0-4,294,967,295.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0)
#n   -port_handle
#n       This argument defined by Cisco is not supported for NGPF implementation.
#x   -reset
#x       If this flag is present all the BFD configuration on that specific port
#x       is erased. This option is requires -mode create and -port_handle to be
#x       provided.
#    -router_id
#        The router ID in IPv4 format for the BFD router.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is provided.
#        (DEFAULT = 100.0.0.1)
#    -router_id_step
#        The router ID step in IPv4 format for the BFD router.
#        This option is valid only when -mode is create.
#        (DEFAULT = 0.0.0.1)
#    -tx_interval
#        This is the minimum interval, in microseconds, that the local system
#        would like to use when transmitting BFD Control packets.
#        Range 50 - 4,294,967,295.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 1000)
#    -vlan
#        Enables vlan on the directly connected BFD router interface.
#        Valid options are: 0 - disable, 1 - enable.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0)
#    -vlan_id1
#        Sets the vlan ID on the directly connected BFD router interface.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 1)
#    -vlan_id2
#        Sets the outer vlan ID on the directly connected BFD router interface.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 1)
#    -vlan_id_step1
#        The incrementing step for vlan ID when creating directly connected
#        protocol interfaces. This option is valid only when -mode is create.
#        When vlan_id_step1 causes the vlan_id value to exceed its maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id1 = 4094; vlan_id_step1 = 2-> new vlan_id1 value = 0
#        vlan_id1 = 4095; vlan_id_step1 = 11 -> new vlan_id1 value = 10
#        (DEFAULT = 1)
#    -vlan_id_step2
#        The incrementing step for outer vlan ID when creating directly connected
#        protocol interfaces. This option is valid only when -mode is create.
#        When vlan_id_step2 causes the vlan_id2 value to exceed its maximum value the
#        increment will be done modulo <number of possible vlan ids>.
#        Examples: vlan_id2 = 4094; vlan_id_step2 = 2-> new vlan_id2 value = 0
#        vlan_id2 = 4095; vlan_id_step2 = 11 -> new vlan_id2 value = 10
#        (DEFAULT = 1)
#    -vlan_user_priority1
#        Sets the vlan ID1 user priority on the directly connected BFD router
#        interfaces.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0)
#    -vlan_user_priority2
#        Sets the vlan ID2 user priority on the directly connected BFD router
#        interfaces.
#        This option is valid only when -mode is create or -mode is modify
#        and -handle is a BFD router interface.
#        (DEFAULT = 0)
#    -vlan_ether_type1
#        Sets the vlan ID1 ethertype
#    -vlan_ether_type2
#        Sets the vlan ID2 ethertype
#    -vlan_id_mode1
#        If the user configures more than one interface on the Ixia with
#        VLAN, he can choose to automatically increment the VLAN tag or
#        leave it idle for each interface.
#        (DEFAULT = increment)
#    -vlan_id_mode2
#        If the user configures more than one interface on the Ixia with
#        VLAN, he can choose to automatically increment the VLAN tag or
#        leave it idle for each interface.
#        (DEFAULT = increment)
#x   -configure_echo_source_ip
#x       ability to configure the source address IP of echo message
#x   -echo_source_ip4
#x       If configure Echo source IP is selected, the IPv4 source address of the Echo Message.
#x   -echo_source_ip6
#x       If configure Echo source IP is selected, the IPv6 source address of the Echo Message.
#x   -ip_diff_serv
#x       If configure ip diff value
#x   -interface_active
#x       Activate or Deactivate Configuration
#x   -interface_name
#x       Longer, more descriptive name for element it is not guaranteed to be unique like –interface_name-, but maybe offers more context
#x   -router_active
#x       Activate or Deactivate Configuration
#x   -router_name
#x       Name of Bfd Router stack in the scenario.
#n   -vpi
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vci
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vpi_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#n   -vci_step
#n       This argument defined by Cisco is not supported for NGPF implementation.
#    -session_count
#        No of Sessions per interface
#    -enable_auto_choose_source
#        Setting this parameter to 1,
#        enables the session to automatically choose the source IP address for the BFD session.
#        In this case, the local_ip_addr parameter is ignored. Setting this parameter to 0,
#        enables the local_ip_addr parameter.This option is valid only when -mode is create
#        and -handle is provided or -mode is modify and -session_handle is provided.
#    -enable_learned_remote_disc
#        Enables the ability of this BFD session to learn the value
#        of the discriminator of the far end of the BFD session. If
#        this option is set to 1, the remote_disc option will be ignored.
#    -ip_version
#        The IP version of the interface.Choices are:4, 6
#        (DEFAULT = 4)
#    -session_discriminator
#        A unique, nonzero discriminator value generated by the interface,
#        used to de-multiplex multiple BFD sessions between the same pair of systems.
#    -session_discriminator_step
#        The local session discriminator step. Used when creating multiple BFD sessions.
#    -remote_discriminator
#        The discriminator received from the corresponding remote system.
#        This field reflects back the received value of local_disc, or is zero if that value is unknown.
#    -remote_discriminator_step
#        The step for the remote discriminator, when creating multiple sessions.
#x   -source_ip_addr
#x       The IPv4 address of the source in the BFD session.
#x   -source_ip_addr_step
#x       The IPv4 address step of the source ip in the BFD session, when creating multiple BFD sessions.
#    -remote_ip_addr
#        The IPv4 address of the remote router in the BFD session.
#    -remote_ip_addr_step
#        The IPv4 address step of the remote router in the BFD session, when creating multiple BFD sessions.
#x   -source_ipv6_addr
#x       The IPv6 address of the source in the BFD session.
#x   -source_ipv6_addr_step
#x       The IPv6 address step of the source in the BFD session, when creating multiple BFD sessions.
#    -remote_ipv6_addr
#        The IPv6 address of the remote router in the BFD session.
#    -remote_ipv6_addr_step
#        The IPv6 address step of the remote router in the BFD session, when creating multiple BFD sessions.
#x   -session_handle
#x       session handle value
#    -hop_mode
#        BGFD hop mode, defines the type of BFD session. Can be single or multi hop.
#x   -session_active
#x       Activate or Deactivate Session Configuration
#x   -session_name
#x       Longer, more descriptive name for element it is not guaranteed to be unique like –session_name-, but maybe offers more context
#x   -ip_ttl
#x       TTL value of inner ip of BFDoVXLAN packet
#x   -enable_ovsdb_communication
#x       Selecting this check box enables the ability to communicate the remote IP and MAC address of BFD Session
#x   -remote_mac
#x       Remote MAC Address of Peer
#x   -aggregate_bfd_session
#x       If Enabled , all interfaces except on VNI 0 will be disabled and grayed -out
#
# Return Values:
#    A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#x   key:ipv4_loopback_handle       value:A list containing the ipv4 loopback protocol stack handles that were added by the command (if any).
#    A list containing the ipv6 loopback protocol stack handles that were added by the command (if any).
#x   key:ipv6_loopback_handle       value:A list containing the ipv6 loopback protocol stack handles that were added by the command (if any).
#    A list containing the ipv4 protocol stack handles that were added by the command (if any).
#x   key:ipv4_handle                value:A list containing the ipv4 protocol stack handles that were added by the command (if any).
#    A list containing the ipv6 protocol stack handles that were added by the command (if any).
#x   key:ipv6_handle                value:A list containing the ipv6 protocol stack handles that were added by the command (if any).
#    A list containing the ethernet protocol stack handles that were added by the command (if any).
#x   key:ethernet_handle            value:A list containing the ethernet protocol stack handles that were added by the command (if any).
#    A list containing the bfd router protocol stack handles that were added by the command (if any).
#x   key:bfd_router_handle          value:A list containing the bfd router protocol stack handles that were added by the command (if any).
#    A list containing the bfd v4 interface protocol stack handles that were added by the command (if any).
#x   key:bfd_v4_interface_handle    value:A list containing the bfd v4 interface protocol stack handles that were added by the command (if any).
#    A list containing the bfd v6 interface protocol stack handles that were added by the command (if any).
#x   key:bfd_v6_interface_handle    value:A list containing the bfd v6 interface protocol stack handles that were added by the command (if any).
#    A list containing the bfd v4 session protocol stack handles that were added by the command (if any).
#x   key:bfd_v4_session_handle      value:A list containing the bfd v4 session protocol stack handles that were added by the command (if any).
#    A list containing the bfd v6 session protocol stack handles that were added by the command (if any).
#x   key:bfd_v6_session_handle      value:A list containing the bfd v6 session protocol stack handles that were added by the command (if any).
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:handle                     value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#x   key:interfaces                 value:A list containing individual interface, session and/or router handles that were added by the command (if any). Please note that this key will be omitted if the current session or command were run with -return_detailed_handles 0.
#    $::SUCCESS | $::FAILURE
#    key:status                     value:$::SUCCESS | $::FAILURE
#    On status of failure, gives detailed information.
#    key:log                        value:On status of failure, gives detailed information.
#    On mode create, list of router handles
#    key:router_handles             value:On mode create, list of router handles
#    On mode create, list of router interface handles for a specific <router_handle>
#    key:router_interface_handles.  value:On mode create, list of router interface handles for a specific <router_handle>
#    On mode create, list of protocol interface handles for a specific <router_handle>
#    key:interface_handles.         value:On mode create, list of protocol interface handles for a specific <router_handle>
#
# Examples:
#
# Sample Input:
#
# Sample Output:
#
# Notes:
#    1) This protocol is available only when using IxNetwork Tcl API. If the current session or command was run with -return_detailed_handles 0 the following keys will be omitted from the command response:  handle, interfaces
#
# See Also:
#

package ixiangpf;

use utils;
use ixiahlt;

sub emulation_bfd_config {

	my $args = shift(@_);

	my @notImplementedParams = ();
	my @mandatoryParams = ();
	my @fileParams = ();

	# ixiahlt::logHltapiCommand('emulation_bfd_config', $args);
	# ixiahlt::utrackerLog ('emulation_bfd_config', $args);

	return ixiangpf::runExecuteCommand('emulation_bfd_config', \@notImplementedParams, \@mandatoryParams, \@fileParams, $args);
}

# Return value for the package
return 1;
