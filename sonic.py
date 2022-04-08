import paramiko
import time
from scp import SCPClient
from netmiko import ConnectHandler
import os

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

        print("\n Restarting DHCP Server in Dump Switch\n")
        device = ConnectHandler(device_type='linux', ip='10.27.201.6', username='admin', password='admin')
        output = device.send_command('sudo systemctl restart isc-dhcp-server.service')
        print("\n Sleeping for 10s for restarting DHCP Service in Dump Switch\n")
        time.sleep(10)
        print("\n Sleeping Completed\n")
        output = device.send_command("sudo systemctl status isc-dhcp-server.service | grep \"Active\" | awk '/Active/ {print $2}'")

        if output != 'active':
            print("\n Attention DHCP Service needs to be checked in Dump Switch 10.27.201.6 \n")
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
                flag == 1
            else:
                print("\n[0]+--------------Test Case Passed Dockers containers are up in {}-----[0]+\n".format(key))

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
                flag1 =1
            else:
                print("\n[0]+--------------Test Case Passed Port channels are up in MCLAG Peer {}-----[0]+\n".format(lsta[i]))
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
                flag2 =1
            else:
                print("\n[0]+--------------Test Case Passed MCLAG Session is up in {}-----[0]+\n".format(lsta[i]))

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
                flag3 = 1
            else:
                print("\n[0]+--------------Test Case Passed MCLAG Port Channels are up in {}-----[0]+\n".format(lsta[i]))

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
                flag4 = 1
            else:
                print("\n[0]+--------------Test Case Passed MCLAG Session Syn is Done in peer {}-----[0]+\n".format(lsta[i]))

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
                flag5 = 1
            else:
                print("\n[0]+--TEST CASE PASSED SPANNING TREE PORTS ARE FORWARDING IN PEER --> {}-----[0]+\n".format(lsta[i]))
        print("\n---------Checking Spanning Root Bridge in Both PEERS----------\n")
        for i in range(2):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            output = device.send_command("show span vlan 1001 | awk '/Root/{print $4}' | grep \"Root\" | tail -1")
            if output != 'Root':
                print("Spanning Tree is not Root Bridge in ------>{}".format(lsta[i]))
                output = device.send_command("show span  vlan 1001")
                print(output)

                flag6 = 1
            else:
                print("\n[0]+--------------Test Case Passed PEER --> {} is ROOT-----[0]+\n".format(lsta[i]))
        
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
            if int(conmac)<1410 and int(datmac)<1410 and int(mcmac) < 1410:
                print(" Test Case Failed MAC Sync ISSUE ------>{}".format(lsta[i]))
                output = device.send_command("show mac |wc -l")
                print(output)
                output = device.send_command("show mclag mac 1 |wc -l")
                print(output)
                output = device.send_command("bcmcmd \"l2 show\" |wc -l")
                print(output)
                flag = 1
            else:
                print(" Test Case PASSED MAC Sync between Control and Data plane ------>{}".format(lsta[i]))

        if flag == 0:
            return True
        else:
            return False

    def check_macflush(self):
        lsta = self.iplist
        flag = 0
        for i in range(len(lsta)):
            device = ConnectHandler(device_type='linux', ip=lsta[i], username='admin', password='admin')
            print("\n Clearing the mac database after stopping the traffic and protocols")
            output = device.send_command("sonic-clear fdb all")
        time.sleep(10)

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
                flag = 1
            else:
                print(" Test Case PASSED MAC Flush worked in ------>{}".format(lsta[i]))

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

                flag = 1
            else:
                print(" Test Case PASSED Vlan configured on all interface in ------>{}".format(lsta[i]))

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

                flag = 1
            else:
                print(" Test Case PASSED DHCP Clients are getting IP ------>{}".format(lsta[i]))

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

                flag = 1
            else:
                print(" Test Case PASSED DHCP MAC-IP Bindings are clearing ------>{}".format(lsta[i]))

        if flag == 0:
            return True
        else:
            return False







