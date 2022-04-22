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
vlans = {'800':['PortChannel1']}

#con.config_vlan(vlans)
#con.del_vlan(vlans)
#con.disable_span()
#con.shut_link('10.27.201.5','PortChannel1')
portlist = ['Ethernet2','Ethernet5','Ethernet30','Ethernet31']
ipr = '10.27.201.1'
#con.mac_detail_profile(ipr)
#con.lldp_status_check()
con.check_traffic()