#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, division

import os
import os.path
import sys
from glob import glob

from ixiaerror import *
from ixiautil import *

try:
    from Tkinter import TclError
except ImportError:
    from tkinter import TclError


class IxiaHlt(object):
    '''
    Python wrapper class over the HLTAPI commands
    __init__ kwargs:
        ixia_version='specific HLTSET to use'
            The environment variable IXIA_VERSION has precedence.
        hltapi_path_override='path to a specific HLTAPI installation to use'
        tcl_packages_path='path to external TCL interp path from which to load additional packages'

        Defaults:
            ixia_version:
                on windows: latest HLTAPI set taken from Ixia TCL package
                on unix: latest HLTAPI set taken from Ixia TCL package
            hltapi_path_override:
                on windows: latest HLTAPI version installed in Ixia folder
                on unix: none
            tcl_packages_path:
                on windows: path of packages from the latest TCL version installed in Ixia folder
                on unix: none

        Examples:
            ixia_version='HLTSET165'
            hltapi_path_override='C:\Program Files (x86)\Ixia\hltapi\4.90.0.16'
            tcl_packages_path='C:\Program Files (x86)\Ixia\Tcl\8.5.12.0\lib\teapot\package\win32-ix86\lib'
    '''
    SUCCESS = '1'
    FAIL = '0'

    def __init__(self, ixiatcl, **kwargs):
        # overrides
        self.hltapi_path_override = kwargs.get('hltapi_path_override', None)
        self.tcl_packages_path = kwargs.get('tcl_packages_path', None)
        self.use_legacy_api = kwargs.get('use_legacy_api', None)

        self.__logger = Logger('ixiahlt', print_timestamp=False)

        self.ixiatcl = ixiatcl
        self.tcl_mejor_version = self.__get_tcl_mejor_version()
        self.__prepare_tcl_interp(self.ixiatcl)

        # check whether ixia_version param is passed
        # env variable takes precedence
        ixia_version = kwargs.get('ixia_version', None)
        if ixia_version:
            if 'IXIA_VERSION' not in os.environ:
                os.environ['IXIA_VERSION'] = ixia_version
            else:
                self.__logger.warn('IXIA_VERSION specified by env; ignoring parameter ixia_version')

        if os.name == 'nt':
            if os.getenv('IXIA_PY_DEV'):
                self.__logger.debug('!! IXIA_PY_DEV enabled => Dev mode')

                # dev access to hltapi version
                hlt_init_glob = 'C:/Program Files*/Ixia/hltapi/4.90.0.16/TclScripts/bin/hlt_init.tcl'
                hlt_init_files = glob(hlt_init_glob)
                if not len(hlt_init_files):
                    raise IxiaError(IxiaError.HLTAPI_NOT_FOUND, additional_info='Tried glob %s' % hlt_init_glob)

                hlt_init_path = hlt_init_files[0]
                self.__logger.debug('!! using %s' % hlt_init_path)
            else:
                tcl_scripts_path = self.__get_hltapi_path()
                # cut /lib/hltapi
                for i in range(2):
                    tcl_scripts_path = os.path.dirname(tcl_scripts_path)
                hlt_init_path = os.path.join(tcl_scripts_path, 'bin', 'hlt_init.tcl')

            try:
                # sourcing this might throw errors
                self.ixiatcl.source(self.ixiatcl.quote_tcl_string(hlt_init_path))
            except (TclError,):
                raise IxiaError(IxiaError.HLTAPI_NOT_PREPARED, additional_info=ixiatcl.tcl_error_info())
        else:
            # path to ixia package, dependecies should be specified in tcl ::auto_path
            self.ixiatcl.lappend('::auto_path', self.__get_hltapi_path())

        try:
            self.ixiatcl.package('require', 'Ixia')
        except (TclError,):
            raise IxiaError(IxiaError.HLTAPI_NOT_INITED, additional_info=ixiatcl.tcl_error_info())

        try:
            pythonIxNetworkLib = ixiatcl._eval("set env(IXTCLNETWORK_[ixNet getVersion])")
            if os.name == 'nt':
                #cut  /TclScripts/lib/IxTclNetwork
                for i in range(3):
                    pythonIxNetworkLib = os.path.dirname(pythonIxNetworkLib)
                pythonIxNetworkLib = os.path.join(pythonIxNetworkLib, 'api', 'python')
            else:
                pythonIxNetworkLib = os.path.dirname(pythonIxNetworkLib)
                pythonIxNetworkLib = os.path.join(pythonIxNetworkLib, 'PythonApi')
            sys.path.append(pythonIxNetworkLib)

        except (TclError,):
            raise IxiaError(IxiaError.IXNETWORK_API_NOT_FOUND, additional_info=ixiatcl.tcl_error_info())

        self.__build_hltapi_commands()

    def __get_bitness(self):
        machine = '32bit'
        if os.name == 'nt' and sys.version_info[:2] < (2, 7):
            machine = os.environ.get('PROCESSOR_ARCHITEW6432', os.environ.get('PROCESSOR_ARCHITECTURE', ''))
        else:
            import platform
            machine = platform.machine()

        mapping = {
            'AMD64': '64bit',
            'x86_64': '64bit',
            'i386': '32bit',
            'x86': '32bit'
        }
        return mapping[machine]

    def __get_reg_subkeys(self, regkey):
        try:
            from _winreg import EnumKey
        except ImportError:
            from winreg import EnumKey

        keys = []
        try:
            i = 0
            while True:
                matchObj = re.match(r'\d+\.\d+\.\d+\.\d+', EnumKey(regkey, i), re.M | re.I)
                if matchObj:
                    keys.append(EnumKey(regkey, i))
                i += 1
        except (WindowsError,):
            e = sys.exc_info()[1]
            # 259 is no more subkeys
            if e.winerror != 259:
                raise e

        return keys

    def __get_tcl_mejor_version(self):
        tkinter_tcl_version = [int(i) for i in self.ixiatcl._eval('info patchlevel').split('.')]
        if (tkinter_tcl_version[0], tkinter_tcl_version[1]) <= (8,5):
            return '8.5'
        else:
            return '8.6'

    def __get_tcl_version(self, version_keys):
        for version_key in version_keys:
            if version_key.split('.')[:2] == self.tcl_mejor_version.split('.'):
                return version_key
        return version_key

    def __get_reg_product_path(self, product, force_version=None):
        try:
            from _winreg import OpenKey, QueryValueEx
            from _winreg import HKEY_LOCAL_MACHINE, KEY_READ
        except ImportError:
            from winreg import OpenKey, QueryValueEx
            from winreg import HKEY_LOCAL_MACHINE, KEY_READ

        wowtype = ''
        if self.__get_bitness() == '64bit':
            wowtype = 'Wow6432Node'

        key_path = '\\'.join(['SOFTWARE', wowtype, 'Ixia Communications', product])
        try:
            with OpenKey(HKEY_LOCAL_MACHINE, key_path, KEY_READ) as key:
                version_keys = version_sorted(self.__get_reg_subkeys(key))
                if not len(version_keys):
                    return None

                version_key = self.__get_tcl_version(version_keys)
                if force_version:
                    if force_version in version_keys:
                        version_key = force_version
                    else:
                        return None

                info_key_path = '\\'.join([key_path, version_key, 'InstallInfo'])
                with OpenKey(HKEY_LOCAL_MACHINE, info_key_path, KEY_READ) as info_key:
                    return QueryValueEx(info_key, 'HOMEDIR')[0]
        except (WindowsError,):
            e = sys.exc_info()[1]
            # WindowsError: [Error 2] The system cannot find the file specified
            if e.winerror == 2:
                raise IxiaError(IxiaError.WINREG_NOT_FOUND, 'Product name: %s' % product)
            raise e

        return None

    def __get_tcl_packages_path(self):
        if self.tcl_packages_path:
            return self.tcl_packages_path

        if os.name == 'nt':
            tcl_path = self.__get_reg_product_path('Tcl')
            if not tcl_path:
                raise IxiaError(IxiaError.TCL_NOT_FOUND)

            if self.tcl_mejor_version == '8.5':
                return os.path.join(tcl_path, 'lib\\teapot\\package\\win32-ix86\\lib')
            else:
                return os.path.join(tcl_path, 'lib')
        else:
            # TODO
            raise NotImplementedError()

    def __get_hltapi_path(self):
        if self.hltapi_path_override:
            return self.hltapi_path_override

        hltapi_path = os.path.realpath(__file__)
        # cut /library/common/ixiangpf/python/ixiahlt.py
        for i in range(5):
            hltapi_path = os.path.dirname(hltapi_path)

        return hltapi_path

    def __prepare_tcl_interp(self, ixiatcl):
        '''
        Sets any TCL interp variables, commands or other items
        specifically needed by HLTAPI
        '''
        if os.name == 'nt':
            tcl_packages_path = self.__get_tcl_packages_path()
            ixiatcl.lappend('::auto_path', self.ixiatcl.quote_tcl_string(tcl_packages_path))

        # hltapi tries to use some wish console things; invalidate them -ae
        ixiatcl.proc('console', 'args', '{}')
        ixiatcl.proc('wm', 'args', '{}')
        ixiatcl.set('::tcl_interactive', '0')

        # this function generates unique variables names
        # they are needed when parsing hlt return values -ae
        ixiatcl.namespace('eval', '::tcl::tmp', '''{
            variable global_counter 0
            namespace export unique_name
        }''')
        ixiatcl.proc('tcl::tmp::unique_name', 'args', '''{
            variable global_counter
            set pattern "[namespace current]::unique%s"
            set result {}

            set num [llength $args]
            set num [expr {($num)? $num : 1}]

            for {set i 0} {$i < $num} {incr i} {
                set name [format $pattern [incr global_counter]]
                while {
                    [info exists $name] ||
                    [namespace exists $name] ||
                    [llength [info commands $name]]
                } {
                    set name [format $pattern [incr global_counter]]
                }
                lappend result $name
            }

            if { [llength $args] } {
                foreach varname $args name $result {
                    uplevel set $varname $name
                }
            }
            return [lindex $result 0]
        }''')

    def __build_hltapi_commands(self):
        ''' Adds all supported HLTAPI commands as methods to this class '''
        ixia_ns = '::ixia::'
        # List of legacy commands
        command_list = [
            {'name': 'connect', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'cleanup_session', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'reboot_port_cpu', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'convert_vport_to_porthandle', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'convert_porthandle_to_vport', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'convert_portname_to_vport', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'session_info', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'device_info', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'vport_info', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'interface_config', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'interface_control', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'interface_stats', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'traffic_config', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'traffic_control', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'traffic_stats', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'get_nodrop_rate', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'find_in_csv', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'test_control', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'test_stats', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'packet_config_buffers', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'packet_config_filter', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'packet_config_triggers', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'packet_control', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'packet_stats', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'uds_config', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'uds_filter_pallette_config', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'capture_packets', 'namespace': ixia_ns, 'parse_io': True},
            {'name': 'get_packet_content', 'namespace': ixia_ns, 'parse_io': True},

            {'name': 'increment_ipv4_address', 'namespace': ixia_ns, 'parse_io': False},
            {'name': 'increment_ipv6_address', 'namespace': ixia_ns, 'parse_io': False},
        ]

        if self.use_legacy_api == 1:
            # List of commands used by RobotFramework
            command_list = [{'name': 'connect', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'cleanup_session', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'reboot_port_cpu', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'reset_port', 'namespace': ixia_ns, 'parse_io': True},

                {'name': 'convert_vport_to_porthandle', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'convert_porthandle_to_vport', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'convert_portname_to_vport', 'namespace': ixia_ns, 'parse_io': True},

                {'name': 'session_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'device_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'vport_info', 'namespace': ixia_ns, 'parse_io': True},
                
                {'name': 'interface_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'interface_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'interface_stats', 'namespace': ixia_ns, 'parse_io': True},

                {'name': 'traffic_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'traffic_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'traffic_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'get_nodrop_rate', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'get_port_list_from_connect', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'find_in_csv', 'namespace': ixia_ns, 'parse_io': True},
                
                {'name': 'test_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'test_stats', 'namespace': ixia_ns, 'parse_io': True},

                {'name': 'packet_config_buffers', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'packet_config_filter', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'packet_config_triggers', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'packet_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'packet_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'uds_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'uds_filter_pallette_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'capture_packets', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'get_packet_content', 'namespace': ixia_ns, 'parse_io': True},

                {'name': 'increment_ipv4_address', 'namespace': ixia_ns, 'parse_io': False},
                {'name': 'increment_ipv6_address', 'namespace': ixia_ns, 'parse_io': False},

                {'name': 'dhcp_client_extension_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dhcp_extension_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dhcp_server_extension_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ancp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ancp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ancp_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ancp_subscriber_lines_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bfd_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bfd_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bfd_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bfd_session_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bgp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bgp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bgp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_bgp_route_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_custom_tlv_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_links_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_md_meg_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_mip_mep_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_cfm_vlan_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_group_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_server_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_server_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_server_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_dhcp_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_efm_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_efm_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_efm_org_var_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_efm_stat', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_eigrp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_eigrp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_eigrp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_eigrp_route_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_elmi_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_elmi_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_igmp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_igmp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_igmp_group_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_igmp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_igmp_querier_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_isis_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_isis_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_isis_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_isis_topology_route_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_lacp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_lacp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_lacp_link_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ldp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ldp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ldp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ldp_route_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mld_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mld_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mld_group_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mplstp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mplstp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mplstp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_mplstp_lsp_pw_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_multicast_group_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_multicast_source_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_oam_config_msg', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_oam_config_topology', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_oam_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_oam_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ospf_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ospf_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ospf_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ospf_lsa_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_ospf_topology_route_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pbb_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pbb_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pbb_custom_tlv_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pbb_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pbb_trunk_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pim_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pim_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pim_group_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_pim_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rip_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rip_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rip_route_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rsvp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rsvp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rsvp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rsvp_tunnel_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_rsvp_tunnel_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_stp_bridge_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_stp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_stp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_stp_lan_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_stp_msti_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_stp_vlan_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_twamp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_twamp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_twamp_control_range_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_twamp_info', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_twamp_server_range_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'emulation_twamp_test_range_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_client_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_client_global_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_client_options_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_client_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_fport_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_fport_global_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_fport_options_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_fport_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fc_fport_vnport_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'l2tp_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'l2tp_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'l2tp_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'l3vpn_generate_stream', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'pppox_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'pppox_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'pppox_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dcbxrange_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dcbxrange_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dcbxrange_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dcbxtlv_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'dcbxtlvqaz_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'esmc_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'esmc_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'esmc_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ethernetrange_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_client_globals_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_client_options_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_fwd_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_fwd_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_fwd_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_fwd_globals_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_fwd_options_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'fcoe_fwd_vnport_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_globals_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_options_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_over_ip_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_over_ip_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_over_ip_stats', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_over_mac_config', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_over_mac_control', 'namespace': ixia_ns, 'parse_io': True},
                {'name': 'ptp_over_mac_stats', 'namespace': ixia_ns, 'parse_io': True}
            ]

        def convert_in_kwargs(args, kwargs):
            return [self.ixiatcl._tcl_flatten(kwargs, '-')]

        def convert_out_list(tcl_string):
            if tcl_string == '':
                return None
            ret = self.ixiatcl.convert_tcl_list(tcl_string)
            if len(ret) == 1:
                return ret[0]
            return ret

        def convert_out_dict(tcl_string):
            # populate a tcl keyed list variable
            unique_list_name = self.ixiatcl._eval('::tcl::tmp::unique_name')
            unique_catch_name = self.ixiatcl._eval('::tcl::tmp::unique_name')
            self.ixiatcl.set(unique_list_name, self.ixiatcl.quote_tcl_string(tcl_string))

            ret = {}
            for key in self.ixiatcl.convert_tcl_list(self.ixiatcl._eval('keylkeys %s' % unique_list_name)):
                qualified_key = self.ixiatcl.quote_tcl_string(key)
                key_value = self.ixiatcl._eval('keylget %s %s' % (unique_list_name, qualified_key))

                catch_result = self.ixiatcl._eval(
                    'catch {{keylkeys {0} {1}}} {2}'.format(
                        unique_list_name,
                        qualified_key,
                        unique_catch_name
                    )
                )
                if catch_result == '1' or self.ixiatcl.llength('$' + unique_catch_name) == '0':
                    # no more subkeys
                    ret[key] = key_value
                else:
                    if '\\' in key_value and "{" not in key_value:
                        # Tcl BUG -> Whe value conains \ keylkeys will wronfully report that element is a keylist
                        # even when is not. A keylist always has a { and }, so if { is not present, but \ is assume
                        # the value is not a keylist
                        ret[key] = key_value
                    else:
                        ret[key] = convert_out_dict(key_value)

            self.ixiatcl.unset(unique_list_name)
            self.ixiatcl.unset(unique_catch_name)

            # clear any stale errorInfo from the above catches
            self.ixiatcl.set('::errorInfo', '{}')

            return ret

        for command in command_list:
            # note: this may change in the future if alternate conversions are needed -ae
            convert_in = None
            convert_out = convert_out_list
            if command['parse_io']:
                convert_in = convert_in_kwargs
                convert_out = convert_out_dict

            method = self.ixiatcl._make_tcl_method(
                command['namespace'] + command['name'],
                conversion_in=convert_in,
                conversion_out=convert_out,
                eval_getter=lambda self_hlt: self_hlt.ixiatcl._eval
            )
            setattr(self.__class__, command['name'], method)

    @property
    def INTERACTIVE(self):
        return self.__logger.ENABLED