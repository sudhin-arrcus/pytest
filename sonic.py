import paramiko
import time
from scp import SCPClient
from netmiko import ConnectHandler
import os
import re
class sonic:
    def __init__(self,ipfile,iplist):

        self.ipfile = ipfile
        self.iplist = iplist

    def con_switch(self):
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        for key,value in self.ipfile.items():
            ssh.connect(hostname=key,
                    username='admin',
                    password='admin',
                    look_for_keys=False)
            scp = SCPClient(ssh.get_transport())
            # Sending files to the server
            print(" \n SCP --->  file {} to the switch ----> {}\n".format(value,key))
            scp.put(value, '/home/admin/')

            # Downloading files to the server
            #    scp.get('test2.txt')
        ssh.close()
        for key,value in self.ipfile.items():
            device = ConnectHandler(device_type='linux', ip=key, username='admin', password='admin')
            print("\n Loading the configuration to the switch ---->{}\n".format(key))
            output = device.send_command('sudo config load {} -y'.format(value))
            print("\n Saving the configuration to the switch ---->{}\n".format(key))
            output = device.send_command('sudo config save -y')
        print(" Loaded all the solution configurations !!!! \n")
        print("\n !!! Sleeping for 70 seconds for stablity!!!!\n")
        time.sleep(70)
        print("\n----------Sleeping completed--------------------\n")
        dhcp_server = self.iplist[len(self.iplist)-1]
        print("\n Restarting DHCP Server in Dump Switch\n")
        device = ConnectHandler(device_type='linux', ip=dhcp_server, username='admin', password='admin')
        output = device.send_command('sudo systemctl restart isc-dhcp-server.service')
        print("\n Sleeping for 10s for restarting DHCP Service in Dump Switch\n")
        time.sleep(10)
        print("\n Sleeping Completed\n")
        output = device.send_command("sudo systemctl status isc-dhcp-server.service | grep \"Active\" | awk '/Active/ {print $2}'")

        if output != 'active':
            print("\n Attention DHCP Service needs to be checked in Dump Switch {} \n".format(dhcp_server))
    def check_switch(self):


        flag = 0
        flag1 = 0
        flag2 = 0
        flag3 =0
        flag4 =0
        flag5 =0
        flag6 = 0
        lsta = self.iplist
        for key,value in self.ipfile.items():
            device = ConnectHandler(device_type='linux', ip=key, username='admin', password='admin')

            print("\n Validating the Switches ---->{}\n".format(key))
            output = device.send_command("docker ps -a | awk '/docker/' | awk '/Up/' | wc -l")
            if int(output)< 16:
                print("Docker is down in switch ------>{}".format(key))
                output = device.send_command("docker ps -a ")
                print(output)
                output = device.send_command("systemctl status docker | awk '/Active/' ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print("\n[0]+--------------Test Case Passed Dockers containers are up in {}-----[0]+\n".format(key))
                print("[0]----------Expected Value is >=16 Observed Value after the test:{}".format(output))

            output = device.send_command("show ver | grep \"SONiC Software Version\"")
            print(output)
            output = device.send_command("show ver | grep \"Build date\"")
            print(output)


        #for key in self.ipfile:
         #   lsta.append(key)
        print("\n---------Checking Port Channel Status in PEERS----------\n")
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show int po | grep \"LACP\" | awk '/Up/' | wc -l")
            if int(output)<5:
                print("Port channel is Down ------>{}".format(lsta[i]))
                output = device.send_command("show int po ")
                print(output)
                output = device.send_command("show int status ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag1 =1
            else:
                print("\n[0]+--------------Test Case Passed Port channels are up in MCLAG Peer {}-----[0]+\n".format(lsta[i]))
                print("[0]----------Expected Value is >=5 Observed Value after the test:{}".format(output))
        print("\n---------Checking MCLAG Session Status----------\n")
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show mclag br 1 | awk '/Session Status/' | awk '/Up/ {print $4}'")
            print(output)
            if output != 'Up':
                print("MCLAG SESSION Status is Down ------>{}".format(lsta[i]))
                output = device.send_command("show mclag br 1 ")
                print(output)
                output = device.send_command("show ip int ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag2 =1
            else:
                print("\n[0]+--------------Test Case Passed MCLAG Session is up in {}-----[0]+\n".format(lsta[i]))
                print("[0]----------Expected Value is: UP Observed Value after the test:{}".format(output))

        print("\n-------Checking the Port Channel status of MCLAG on peers ------\n")

        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show mclag br 1 | awk '/PortChannel/' | awk '/Up/' | grep \"Up / Up\" | wc -l")
            if int(output) < 4:
                print("MCLAG PORTCHANNEL IS DOWN ------>{}".format(lsta[i]))
                output = device.send_command("show mclag br 1 ")
                print(output)
                output = device.send_command("show int po ")
                print(output)
                output = device.send_command("show int status ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag3 = 1
            else:
                print("\n[0]+--------------Test Case Passed MCLAG Port Channels are up in {}-----[0]+\n".format(lsta[i]))
                print("[0]----------Expected Value is: >=4 Observed Value after the test:{}".format(output))

        print("\n---------Checking MCLAG Session Sync Status----------\n")
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show mclag br 1 | awk '/Session Sync/ {print $4}'")
            #print(output)
            if output != 'Done':
                print("MCLAG SESSION SYN is Down ------>{}".format(lsta[i]))
                output = device.send_command("show mclag br 1 ")
                print(output)
                output = device.send_command("show ip int ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag4 = 1
            else:
                print("\n[0]+--------------Test Case Passed MCLAG Session Syn is Done in peer {}-----[0]+\n".format(lsta[i]))
                print("[0]----------Expected Value is: Done Observed Value after the test:{}".format(output))
        print("\n---------Checking Spanning Tree Ports are forwarding in PEERS----------\n")
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show span vlan 1001 | awk '/FORWARDING/' | wc -l")
            if int(output) < 4:
                print("Spanning Tree ports are not forwarding ------>{}".format(lsta[i]))
                output = device.send_command("show span ")
                print(output)
                output = device.send_command("show vlan br ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag5 = 1
            else:
                print("\n[0]+--TEST CASE PASSED SPANNING TREE PORTS ARE FORWARDING IN PEER --> {}-----[0]+\n".format(lsta[i]))
                print("[0]----------Expected Value is: >=4 Observed Value after the test:{}".format(output))
        print("\n---------Checking Spanning Tree Root Bridge in Both PEERS----------\n")
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show span vlan 1001 | awk '/Root/{print $4}' | grep \"Root\" | tail -1")
            if output != 'Root':
                print("Spanning Tree is not Root Bridge in ------>{}".format(lsta[i]))
                output = device.send_command("show span  vlan 1001")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag6 = 1
            else:
                print("\n[0]+--------------Test Case Passed PEER --> {} is ROOT-----[0]+\n".format(lsta[i]))
                print("[0]----------Expected Value is: Root Observed Value after the test:{}".format(output))
        
        if flag == 0 and flag1 == 0 and flag2 == 0 and flag3 == 0 and flag4 == 0 and flag5 == 0 and flag6 == 0:
            return True
        else:
            return False

    def check_traffic(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            conmac = device.send_command("show mac |wc -l")
            datmac = device.send_command("bcmcmd \"l2 show\" |wc -l")
            mcmac = device.send_command("show mclag mac 1 |wc -l")
            if int(conmac)<1410 or int(datmac)<1410 or int(mcmac) < 1410:
                print(" Test Case Failed MAC Sync ISSUE ------>{}".format(lsta[i]))
                output = device.send_command("show mac |wc -l")
                print(output)
                output = device.send_command("show mclag mac 1 |wc -l")
                print(output)
                output = device.send_command("bcmcmd \"l2 show\" |wc -l")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                self.mac_detail_profile(lsta[i])
                flag = 1
            else:
                print(" Test Case PASSED MAC Sync between Control and Data plane ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >=1410 Observed Value after the test:{} {} {}".format(conmac,datmac,mcmac))

        if flag == 0:
            return True
        else:
            return False

    def check_macflush(self):
        lsta = self.iplist
        flag = 0
        for i in range(len(lsta)):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Clearing the mac database after stopping the traffic and protocols in {}".format(lsta[i]))
            output = device.send_command("sonic-clear fdb all")
        time.sleep(20)

        for i in range(len(lsta)):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show mac |wc -l")


            if int(output) > 40:
                print(" Test Case Failed MAC Clearing is not happening ------>{}".format(lsta[i]))
                output = device.send_command("show mac ")
                print(output)
                output = device.send_command("show mclag mac 1 ")
                print(output)
                output = device.send_command("bcmcmd \"l2 show\" ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED MAC Flush worked in ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: <40 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False

    def vlan_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the Vlan Database")
            output = device.send_command("show vlan br |  awk '/tagged/' | wc -l")


            if int(output) < 60:
                print(" Test Case Failed Not all Vlans are not configured properly in ------>{}".format(lsta[i]))
                output = device.send_command("show vlan br ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)

                flag = 1
            else:
                print(" Test Case PASSED Vlan configured on all interface in ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >=60 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False

    def dhcp_host_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the DHCP HOST MAC-IP Bindings")
            output = device.send_command("show dhcp sno mac-binding vlan 1001 | wc -l")


            if int(output) < 2:
                print(" Test Case Failed DHCP Clients are not getting IP Check clients properly in ------>{}".format(lsta[i]))
                output = device.send_command("show dhcp sno mac-binding all ")
                print(output)
                output = device.send_command("show run dhcp ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)

                flag = 1
            else:
                print(" Test Case PASSED DHCP Clients are getting IP ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >8 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False

    def dhcp_bind_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the DHCP HOST MAC-IP Bindings")
            output = device.send_command("show dhcp sno mac-binding vlan 1001 | wc -l")


            if int(output) > 2:
                print(" Test Case Failed DHCP MAC IP Bindings are not Clearing when hosts are turned off ------>{}".format(lsta[i]))
                output = device.send_command("show dhcp sno mac-binding all ")
                print(output)
                output = device.send_command("show run dhcp ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)

                flag = 1
            else:
                print(" Test Case PASSED DHCP MAC-IP Bindings are clearing ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: <2 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False

    def igmp_entry_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the IGMP Snooping Entries in the peers")
            output = device.send_command("show igmp snooping entries")
            pattern = "Error"
            match = re.search(pattern, output)

            if match.group() != 'Error':
                print(" Test Case Failed IGMP Snooping Entries are not cleared ------>{}".format(lsta[i]))
                output = device.send_command("show igmp snooping entries ")
                print(output)
                output = device.send_command("show run igmp ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)

                flag = 1
            else:
                print(" Test Case PASSED IGMP Snooping Entries are clearing ------>{}".format(lsta[i]))


        if flag == 0:
            return True
        else:
            return False

    def interface_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the Interface Status")
            output = device.send_command("show int stat | grep \"up\" | wc -l")


            if int(output) < 50:
                print(" Test Case Failed Interfaces are not Up ------>{}".format(lsta[i]))
                output = device.send_command("show int status ")
                print(output)
                output = device.send_command("show log | grep \"interface\" ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED Interfaces are up ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >=50 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False

    def lldp_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the Interface Status in LLDP Message")
            output = device.send_command("show lldp nei | grep \"Interface\" | wc -l")


            if int(output) < 18:
                print(" Test Case Failed LLDP messages are not showing interface properly ------>{}".format(lsta[i]))
                output = device.send_command("show llpd nei ")
                print(output)
                output = device.send_command("show log | grep \"LLDP\" ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED LLDP Interfaces are up in LLDP message ------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >=18 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False

    def lldp_table_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the LLDP Table")
            output = device.send_command("show lldp table | awk '/Total entries displayed/{print $4}'")


            if int(output) < 18:
                print(" Test Case Failed LLDP table is not displaying properly properly ------>{}".format(lsta[i]))
                output = device.send_command("show llpd table ")
                print(output)
                output = device.send_command("show log | grep \"LLDP\" ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED LLDP Table check is fine------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >=18 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False


    def lldp_status_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the Interface Status true")
            output = device.send_command("show lldp int | grep \"true\" | wc -l")


            if int(output) < 53:
                print(" Test Case Failed LLDP Interface status is not displaying properly properly ------>{}".format(lsta[i]))
                output = device.send_command("show llpd int ")
                print(output)
                output = device.send_command("show log | grep \"LLDP\" ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED LLDP Interface check is fine------>{}".format(lsta[i]))
                print("[0]----------Expected Value is: >=53 Observed Value after the test:{}".format(output))

        if flag == 0:
            return True
        else:
            return False


    def envr_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the Environment")
            output = device.send_command("show environment | grep \"Adapter\" | wc -l")


            if int(output) < 9:
                print(" Test Case Failed Enviornment issue show env command is not showing any ------>{}".format(lsta[i]))
                output = device.send_command("show environment")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED Enviorment works fine------>{}".format(lsta[i]))

        if flag == 0:
            return True
        else:
            return False

    def pcie_check(self):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Checking the Pcieinfo")
            output = device.send_command("show platform pcieinfo | grep \"PCI bridge\" | wc -l")


            if int(output) < 7:
                print(" Test Case Failed PCI INFO MISSING show platform pcieinfo is not showing any data ------>{}".format(lsta[i]))
                output = device.send_command("show platform pcieinfo")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED PCIENFO works fine----->{}".format(lsta[i]))

        if flag == 0:
            return True
        else:
            return False


    def config_vlan(self,vlans):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Configuring Vlan \n")
            for key,value in vlans.items():
                print("\n Configuring Vlan {} on device ---->{}\n".format(key,lsta[i]))
                output = device.send_command("sudo config vlan add {}".format(int(key)))
                for value in vlans[key]:
                    print("\n Configuring Vlan {} on interface {} \n".format(key,value))
                    output = device.send_command("sudo config vlan mem add {}  {}".format(int(key),value))
                print("\n Enabling Spanning tree on Vlan {}  \n".format(key))
                output = device.send_command("sudo config spanning-tree vlan enable {}".format(int(key)))
            print("\n!!!! Saving the configuration \n")
            output = device.send_command("sudo config save -y")
            time.sleep(30)
            for key in vlans:
                cmd = "show span vlan " + key + "| awk '/FORWARDING/{print $1}'"
                print(cmd)
                output = device.send_command(cmd)
                print(output)
                if output != "PortChannel1":
                    print(" Test Case Failed Spanning Tree is not there in new vlan ------>{}".format(lsta[i]))
                    output = device.send_command("show vlan br")
                    print(output)
                    output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                    print(output)
                    flag = 1
                else:
                    print(" Test Case PASSED Vlan is created and spanning tree is running on new vlans----->{}".format(lsta[i]))
                    print("[0]----------Expected Value is: PortChannel1 Observed Value after the test:{}".format(output))
        if flag == 0:
            return True
        else:
            return False

    def del_vlan(self,vlans):
        lsta = self.iplist
        flag = 0
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Deleting Vlan \n")
            for key,value in vlans.items():

                for value in vlans[key]:
                    print("\n Deleting Vlan {} on interface {} \n".format(key,value))
                    output = device.send_command("sudo config vlan mem del {}  {}".format(int(key),value))
                print("\n Disabling Spanning tree on Vlan {}  \n".format(key))
                output = device.send_command("sudo config spanning-tree vlan disable {}".format(int(key)))
                print("\n Deleting Vlan {} on device ---->{}\n".format(key, lsta[i]))
                output = device.send_command("sudo config vlan del {}".format(int(key)))
            print("\n!!!! Saving the configuration \n")
            output = device.send_command("sudo config save -y")
            time.sleep(10)
            for key in vlans:
                output = device.send_command("show span vlan {} | wc -l".format(key))
                print(output)
                if int(output) != 0:
                    print(" Test Case Failed Spanning Tree is not removed in new vlan ------>{}".format(lsta[i]))
                    output = device.send_command("show span")
                    print(output)
                    output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                    print(output)
                    flag = 1
                else:
                    print(" Test Case PASSED Vlan is deleted and spanning tree is disabled on new vlans----->{}".format(lsta[i]))
                    print("[0]----------Expected Value is: 0 Observed Value after the test:{}".format(output))
        if flag == 0:
            return True
        else:
            return False


    def disable_span(self):
        lsta = self.iplist
        flag = 0
        traffic_status = None
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n---------- Disabling Spanning Tree -------- \n")
            output = device.send_command("sudo config spanning-tree disable pvst")
            time.sleep(5)
            print("[=]------------Sleeping over for 5s after disabling spanning tree")
            output = device.send_command("sudo config spanning-tree enable pvst")
            output = device.send_command("sudo config spanning-tree priority 0")
            output = device.send_command("sudo config spanning-tree interface cost PortChannel1 1")
            output = device.send_command("sudo config spanning-tree interface bpdu_guard enable PortChannel1")
            output = device.send_command("sudo config save -y")
            print("\n[+]-------------Sleeping for 75 seconds for Stablity-------------[+]\n")
            time.sleep(75)
            output = device.send_command("show span vlan 1001 | awk '/FORWARDING/' | wc -l")
            if int(output) < 4:
                print(" Test Cased Failed Spanning Tree ports are not forwarding ------>{}".format(lsta[i]))
                output = device.send_command("show span ")
                print(output)
                output = device.send_command("show vlan br ")
                print(output)
                output = device.send_command("show log | grep \"ERR\" | tail -20 ")
                print(output)
                flag = 1
            else:
                print("\n[=+---------TEST CASE PASSED AFTER BOUNCING SPANNING TREE ports are forwarding  in ----> {}".format(lsta[i]))
                print("[0]----------Expected Value is: >=4 Observed Value after the test:{}".format(output))
        print("\n\n[+]---------------Sleeping for 50s for checking mac table entries-------[+]")
        time.sleep(50)
        print("\n\n[+]---------------Checking MAC Data Plane and Control Plane-------[+]")
        traffic_status = self.check_traffic()

        if flag == 0 and traffic_status == True:
            print("\n[=+---------TEST CASE PASSED AFTER BOUNCING SPANNING TREE  Traffic is fine\n")

            return True
        else:
            return False


    def shut_link(self,router,port):

        traffic_status = None
        device = ConnectHandler(device_type='linux', ip=router, username='admin', password='admin')
        print("\n---------- Shutting {} on {} ------------\n".format(router,port))
        output = device.send_command("sudo config interface shutdown {}".format(port))
        time.sleep(5)
        print("[=]------------Sleeping over for 5s after shutting link")
        output = device.send_command("sudo config interface startup {}".format(port))
        time.sleep(50)


        print("\n\n[+]---------------Checking MAC Data Plane and Control Plane-------[+]")
        traffic_status = self.check_traffic()

        if traffic_status == True:
            print("\n[=+---------TEST CASE PASSED AFTER BOUNCING LINK {}  in ----> {}".format(port,router))
            return True
        else:
            return False


    def disable_dhcp_options(self):
        lsta = self.iplist

        for i in range(len(lsta)-1):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n---------- Disabling DHCP OPTION 82 -------->>>>{} \n".format(lsta[i]))
            output = device.send_command("sudo config dhcp snooping information option-82 disabled")
            output = device.send_command("sudo config save -y")

    def enable_dhcp_options(self):
        lsta = self.iplist

        for i in range(len(lsta)-1):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n---------- Enabling DHCP OPTION 82 -------->>>{} \n".format(lsta[i]))
            output = device.send_command("sudo config dhcp snooping information option-82 enabled")
            output = device.send_command("sudo config save -y")


    def lldp_poe_conf(self,ip,portlist,pc,dot3,req,alloc):
        flag =0
        flag1 = 0

        device = ConnectHandler(device_type='linux', ip=ip, username='admin', password='admin')
        print("\n---------- Enabling LLDP POE with Power Class  {}-------->>>{} \n".format(pc,ip))
        for j in portlist:
            output = device.send_command(
                "sudo config lldp dot3 power --port {} --dev-type pd --supported --enabled --pair-control --power-pairs signal --power-class {} --dot3at-type {} --source pse --priority high --requested {} --allocated {}".format(
                    j,pc,dot3,req,alloc))

        output = device.send_command("sudo config save -y")
        time.sleep(45)
        print("\n<-------Configured Port with Power Class {} \n---------------->".format(pc))
        output = device.send_command("show lldp nei | grep \"Class\" | head -1 | awk '/Class/{print $3}'")
        print(output)
        if int(output) != pc:
            print(" <-------Test Case Failed LLDP POE Power Class is wrong in show lldp nei {}------>{}".format(pc,ip))
            output = device.send_command("show lldp nei ")
            print(output)
            flag = 1
        output = device.send_command("show lldp dot3 | grep \"{}\" | wc -l".format(req))
        print(output)

        if int(output) < 4:
            print(" <-------Test case Failed LLDP POE Power level is wrong in show lldp dot3 {}------>{}".format(req,ip))
            output = device.send_command("show lldp dot3 ")
            print(output)
            flag1 = 1
        if flag == 0 and flag1 == 0:
            print("\n<----------TEST CASE Expected value is: >4  and observed Value is for Power Class {}  {}----->\n".format(pc,output))
            print("\n<----------TEST CASE PASSED IN {} for Power level  {}----->\n".format(ip,req))
            return True
        else:
            return False


    def port_sec(self, ip, port,limit,en,mode):
        flag = 0
        flag1 = 0

        device = ConnectHandler(device_type='linux', ip=ip, username='admin', password='admin')
        print("\n---------- Configuring Port Security {} on ---- {}-------->>>{} \n".format(mode,port, ip))
        device.send_command("sudo config port-security add {}  {}  {}  {}".format(port,limit,en,mode))
        output = device.send_command("sudo config save -y")
        time.sleep(5)
        print("\n<-------Configured Port Security on {}  of  {} \n---------------->".format(port,ip))
        output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
        print(output)
        if int(output) != limit:
            print(" <-------TEST CASE FAILED Port Security is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag = 1
        cmd = "show port-security stat | awk '/"+port+"/{print $8}'"
        print(cmd)
        output = device.send_command(cmd)
        print(output)
        ob = int(output)
        if int(output) != limit:
            print(" <-------TEST CASE FAILED show port security status is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag1 = 1

        print("\n------Deleting the Port Security configurations ---------------\n")
        output = device.send_command("sudo config port-sec del  {}".format(port))
        output = device.send_command("sudo config save -y")
        if flag == 0 and flag1 == 0:
            print("\n<----------TEST CASE Expected Value is : {} Observed Value is {} ----->\n".format(limit,ob))
            print("\n<----------TEST CASE PASSED IN {} for Port Security {} ----->\n".format(ip,mode))
            return True
        else:
            return False

    def port_sec_shut(self, ip, port,limit,en,mode):
        flag = 0
        flag1 = 0

        device = ConnectHandler(device_type='linux', ip=ip, username='admin', password='admin')
        print("\n---------- Configuring Port Security {} on ---- {}-------->>>{} \n".format(mode,port, ip))
        device.send_command("sudo config port-security add {}  {}  {}  {}".format(port,limit,en,mode))
        output = device.send_command("sudo config save -y")
        time.sleep(5)
        print("\n<-------Configured Port Security on {}  of  {} \n---------------->".format(port,ip))
        output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
        print(output)
        if int(output) != 0:
            print(" <-------TEST CASE FAILED Port Security is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag = 1
        cmd = "show port-security stat | awk '/"+port+"/{print $8}'"
        print(cmd)
        output = device.send_command(cmd)
        ob = int(output)
        print(output)
        if int(output) != 0:
            print(" <-------TEST CASE FAILED show port security status is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag1 = 1

        print("\n------Deleting the Port Security configurations ---------------\n")
        output = device.send_command("sudo config port-sec del  {}".format(port))
        output = device.send_command("sudo config interface startup  {}".format(port))
        output = device.send_command("sudo config save -y")
        if flag == 0 and flag1 == 0:
            print("\n<----------TEST CASE Expected Value is : {} Observed Value is {} ----->\n".format(0, ob))
            print("\n<----------TEST CASE PASSED IN {} for Port Security {} ----->\n".format(ip,mode))
            return True
        else:
            return False

    def mac_detail_profile(self,ip):
        device = ConnectHandler(device_type='linux', ip=ip, username='admin', password='admin')
        lstmac = ["00:00:60","00:00:40","00:00:50","00:00:5E","00:00:90","00:00:11","00:00:99","00:00:33",
                     "00:00:B0","00:1B:0B","00:1A:0A","00:11:67"]
        print("!!!!!!!-------------MAC Table Range From IXIA Expected Values to be present in DUT {}--------------!!!!!\n".format(ip))
        print("00:00:60 ----> 10 macs \n")
        print(" 00:00:40 ----> 300 macs \n")
        print("00:00:50 ----> 300 macs \n")
        print("00:00:5E ----> 10 macs \n")
        print("00:00:90 ----> 254 macs \n")
        print("00:00:11 ----> 10 macs \n")
        print("00:00:99 ----> 10 macs \n")
        print("00:00:33 ----> 200 macs \n")
        print("00:00:b0 ----> 10 macs \n")
        print("00:1A:0A ----> 100 macs \n")
        print("00:1B:0B ----> 100 macs \n")
        print("00:11:67 ----> 10 macs \n")
        for i in lstmac:

            print("MAC Observed Value {} check in  Control Plane \n".format(i))
            conmac = device.send_command("show mac | grep \"{}\" | wc -l".format(i))
            print(conmac)
            print("MAC Observed Value {} check in  Data Plane \n".format(i))
            datmac = device.send_command("bcmcmd \"l2 show\" | grep  \"{}\" | wc -l".format(i.lower()))
            print(datmac)
            print("MAC Observed Value {} check in  MCLAG \n".format(i))
            mcmac = device.send_command("show mclag mac 1 |grep  \"{}\" | wc -l".format(i.lower()))
            print(mcmac)

    def port_sec_static(self, ip, port,limit,staticmac):
        flag = 0
        flag1 = 0


        device = ConnectHandler(device_type='linux', ip=ip, username='admin', password='admin')
        print("\n---------- Configuring Port Security static  restrict {} on ---- {}-------->>>{} \n".format("static",port, ip))
        device.send_command("sudo config port-security add {}  {}  disable restrict {}".format(port,limit,staticmac))
        output = device.send_command("sudo config save -y")
        time.sleep(5)

        print("\n<-------Configured Port Security on {}  of  {} \n---------------->".format(port,ip))
        output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
        print(output)
        if int(output) != limit:
            print(" <-------TEST CASE FAILED Port Security static is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" ".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag = 1
        cmd = "show port-security stat | awk '/"+port+"/{print $6}'"
        print(cmd)
        output = device.send_command(cmd)
        print(output)
        ob = int(output)
        if int(output) != limit:
            print(" <-------TEST CASE FAILED show port security status is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" ".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag1 = 1

        print("\n------Deleting the Port Security configurations ---------------\n")
        output = device.send_command("sudo config port-sec del  {}".format(port))
        output = device.send_command("sudo config save -y")
        if flag == 0 and flag1 == 0:
            print("\n<----------TEST CASE Expected Value is : {} Observed Value is {} ----->\n".format(limit,ob))
            print("\n<----------TEST CASE PASSED IN {} for Port Security {} ----->\n".format(ip,"static"))
            return True
        else:
            return False

    def port_sec_shut_static(self, ip, port,limit,staticmac):
        flag = 0
        flag1 = 0

        device = ConnectHandler(device_type='linux', ip=ip, username='admin', password='admin')
        print("\n---------- Configuring Port Security {} on ---- {}-------->>>{} \n".format("Static",port, ip))
        device.send_command("sudo config port-security add {}  {}  disable port_shut {}".format(port,limit,staticmac))
        output = device.send_command("sudo config save -y")
        time.sleep(5)
        print("\n<-------Configured Port Security Static port shut on {}  of  {} \n---------------->".format(port,ip))
        output = device.send_command("show mac | grep \"{}\" | wc -l".format(port))
        print(output)
        if int(output) != 0:
            print(" <-------TEST CASE FAILED Port Security is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" ".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag = 1
        cmd = "show port-security stat | awk '/"+port+"/{print $8}'"
        print(cmd)
        output = device.send_command(cmd)
        ob = int(output)
        print(output)
        if int(output) != 0:
            print(" <-------TEST CASE FAILED show port security status is not working on {} --- of ---{}".format(port, ip))
            output = device.send_command("show port-security stat ")
            print(output)
            output = device.send_command("show run port-security ")
            print(output)
            output = device.send_command("show mac | grep \"{}\" ".format(port))
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag1 = 1

        print("\n------Deleting the Port Security configurations ---------------\n")
        output = device.send_command("sudo config port-sec del  {}".format(port))
        output = device.send_command("sudo config interface startup  {}".format(port))
        output = device.send_command("sudo config save -y")
        if flag == 0 and flag1 == 0:
            print("\n<----------TEST CASE Expected Value is : {} Observed Value is {} ----->\n".format(0, ob))
            print("\n<----------TEST CASE PASSED IN {} for Port Security {} ----->\n".format(ip,"static"))
            return True
        else:
            return False

    def ping_ip(self, router,ip):
        flag = 0
        flag1 = 0

        device = ConnectHandler(device_type='linux', ip=router, username='admin', password='admin')
        print("\n---------- Pinging The in band MGMT IP {} from Dump Switch {} -------- \n".format(ip,router))
        output = device.send_command("ping 20.0.0.2 -c 7")
        cmd = "ping "+ip+ " -c 1 | awk '/packets/{print $6}' | cut -d '%' -f 1"
        output = device.send_command(cmd)
        ob = int(output)

        if int(output) != 0:
            print(" <-------TEST CASE FAILED Ping to  {}  Failed in ---{}".format(ip, router))
            output = device.send_command("show ip int ")
            print(output)
            output = device.send_command("show arp")
            print(output)
            output = device.send_command("show log | grep \"ERR\" | tail -20 ")
            print(output)
            flag = 1


        if flag == 0:
            print("\n<----------TEST CASE Expected Value is : {} Observed Value is {} ----->\n".format(0, ob))
            print("\n<----------TEST CASE PASSED  PING Successful in {} to MGMT IP {} ----->\n".format(router,ip))
            return True
        else:
            return False
    def restart_container(self, router,container,timer):


        device = ConnectHandler(device_type='linux', ip=router, username='admin', password='admin')
        print("\n---------- Restarting Container {}  in {} ------------- \n".format(container,router))
        output = device.send_command("sudo systemctl restart {}".format(container))
        time.sleep(timer)
        traffic_status = self.check_traffic()
        print("\n[0]----------Finished sleep for {}-------------[0]\n".format(timer))

        if traffic_status == True:
            print(" <-------TEST CASE Passed after restarting Container {}  in ---{}".format(container,router))
            return True
        else:
            return False

    def final_check(self):

        lsta = self.iplist

        for i in range(len(lsta)):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n---------- Final Checking in  Device :{} ------------- \n".format(lsta[i]))
            print("\n#######################################################################\n")
            print("\n[0]----------------CORE FILE CHECKS in {}---------------[0]\n".format(lsta[i]))
            output = device.send_command("(cd /var/core; ls -ltr)")
            print(output)
            output = device.send_command("(cd /var/core; ls -ltr) | grep \"total\" | cut -d ' ' -f2")
            if int(output) > 0:
                print("\n------!!!!!ATTENTION CORE DETECTED !!!!!!!!!!!!!!!-------------------\n")
                print(output)
            output = device.send_command("(cd /var/crash; ls -ltr)")
            print(output)
            print("\n[0]----------------CPU And Memory Checks in {}---------------[0]\n".format(lsta[i]))
            output = device.send_command("show process cpu | head -15 | awk 'NR==7,NR==14 {print $9,$10,$12}'")
            print(output)
            output = device.send_command("show process cpu | head -15 | awk 'NR==8,NR==12 {print $9}'")
            cpu = output.split("\n")

            for c in cpu:
                if c != '':
                    if float(c) > 80:
                        print(c)
                        print("\n!!!!!!!!!! ATTENTION CPU Usage USAGE IS HIGH !!!!!!")
            output = device.send_command("show process memory | head -15")
            print(output)
            print("\n-----------FREE MEMORY------------------------\n")
            output = device.send_command("( free -mt | grep -E \"Total\" | awk '{print $4}')")
            print(output)
            print("\n-----------Disk Usage Output in Percentage------------------------\n")
            output = device.send_command("( df -H | awk '{print $5}' | tail -n+2 | cut -d '%' -f1)")

            du = output.split("\n")
            output = device.send_command("( df -H )")
            print(output)
            for d in du:
                if d != '':
                    if int(d) > 80:
                        print(int(d))
                        print("\n!!!!!!!!!!ATTENTION DISK USAGE IS HIGH !!!!!!")




            print("\n#######################################################################\n")
        print("\n[0]------------------------END of TESTING------------------[0]\n")




