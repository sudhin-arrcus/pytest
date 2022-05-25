import paramiko
import time
from scp import SCPClient
from netmiko import ConnectHandler
import os
import re
import sonic

ipfile = {'10.27.201.1': 'MLAG271.json', '10.27.201.2': 'MCLAG272.json',
          '10.27.201.5': 'MCLAG275.json', '10.27.201.42': 'MCLAG42.json',
          '10.27.201.6': 'MLAG276.json'
          }

iplist = ['10.27.201.1','10.27.201.2','10.27.201.5','10.27.201.42','10.27.201.6']
con = sonic.sonic(ipfile,iplist)
#vlans = {'800':['PortChannel1']}

#con.config_vlan(vlans)
#con.del_vlan(vlans)
#con.disable_span()
#con.shut_link('10.27.201.5','PortChannel1')
#portlist = ['Ethernet2','Ethernet5','Ethernet30','Ethernet31']
#ipr = '10.27.201.1'
#con.mac_detail_profile(ipr)
#con.lldp_status_check()
#con.check_traffic()
#router = '10.27.201.1'
#port = 'PortChannel1'
#c = con.shut_link(router,port)
#print(c)

#c = con.port_sec_static(ip, port,limit,smac)
#print(c)
#router = '10.27.201.6'
#ip = '20.0.0.2'
#c = con.ping_ip(router,ip)
#print(c)
#ip = '20.0.0.4'
#c = con.ping_ip(router,ip)
#print(c)
#container = "stp"
#router = '10.27.201.1'
#timer = 140
#c =con.restart_container(router,container,timer)
''''
ip = '10.27.201.2'
port = "Ethernet1"
vlan = 1001
con.path_cost_change(ip,port)
ip="10.27.201.1"
con.stp_vlan_disable(ip,vlan)

con.mclag_tcpmss(4000)
router = '10.27.201.1'
port = 'Ethernet1'
con.shut_link(router, port)

vlan = 1001
ip = '10.27.201.1'
port = ['Ethernet1','Ethernet46','Ethernet52','PortChannel1','PortChannel2','PortChannel3']
con.vlan_delete(ip,vlan,port)

router = '10.27.201.1'
port = 'Ethernet46'
con.shut_link(router, port)
vlan = 1001
ip = '10.27.201.1'
port = ['Ethernet1', 'Ethernet46', 'Ethernet52', 'PortChannel1', 'PortChannel2', 'PortChannel3']
con.vlan_port_delete(ip, vlan, port)
'''

router = "10.27.201.5"
print(con.tcp_dump(router))