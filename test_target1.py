
import pytest
import logging
import ixia_con
import sonic
logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger()
import time
from datetime import datetime
ipfile = {'10.27.201.1': 'MLAG271.json', '10.27.201.2': 'MCLAG272.json',
          '10.27.201.5': 'MCLAG275.json', '10.27.201.42': 'MCLAG42.json',
          '10.27.201.6': 'MLAG276.json'
          }

iplist = ['10.27.201.1','10.27.201.2','10.27.201.5','10.27.201.42','10.27.201.6']
con = sonic.sonic(ipfile,iplist)

path = '/root/IXIA'
tcl_dependencies = [
                    path+'/IXIA_9.10/lib',
                    path+'/IXIA_9.10/lib/IxTclProtocol',
                    path+'/IXIA_9.10/lib/IxTclNetwork'
                     ]

chassis_ip = '10.27.201.28'
ixnetwork_tcl_server = '10.9.101.253'
port_list = '1/6 1/21 1/22 1/23 1/24'
configFile = '/root/sudhin/MCLAG6.ixncfg'

handler = ["/topology:5/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:5/deviceGroup:2/ethernet:1/dhcpv4client:1","/topology:5/deviceGroup:4/ethernet:2/dhcpv4client:1","/topology:7/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:7/deviceGroup:3/ethernet:1/dhcpv4client:1","/topology:7/deviceGroup:4/ethernet:1/dhcpv4client:1","/topology:9/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:9/deviceGroup:2/ethernet:1/dhcpv4client:1","/topology:10/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:10/deviceGroup:2/ethernet:2/dhcpv4client:1"]
han = "/topology:5/deviceGroup:1/ethernet:1/dhcpv4client:1/item:1"
igmp_handle = "/topology:9/deviceGroup:3/ethernet:1/ipv4:1/igmpHost:1"
traffic_profile = ["unknownunicastfrom5toall","unicast-traffic-1","unicast-Traffic","VRRPPACKET",
                   "Router Traffic","Broadcast-40toall","Broadcastpeer11toallSH-site",
                   "ARP","Unkownunicast-CE42","UNICAST-FROM1to42","Unicast-fromCe242to40",
                   "MUL-232"]
threshold =10
conixia = ixia_con.ixia(path,tcl_dependencies,chassis_ip,ixnetwork_tcl_server,configFile,port_list,handler)
@pytest.fixture(scope='module')
def init_cases():
    print("[+]----------------------------------------------------------------[+]")



    now = datetime.now()
    dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    print("[0]--------------------STARTING THE TEST AT  {}-------------------------[0]".format(dt_string))
    print("\n Starting the connection \n")
    con.con_switch()
    print("[0]+-----------------------CONNECTING IXIA AND STARTING TRAFFIC------[0]++\n")

    conixia.init_ixia()

    conixia.start_protocols()
    conixia.start_traffic()
    print("[0]+-----------------------IXIA Connection Completed------[0]++\n")
    print("Intialization completed")
    yield
    con.final_check()
    print("\n[0]-----------------------------Tear Down After the Test Execution---------------[0]\n")
    now = datetime.now()
    dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    print("[0]--------------------ENDING THE TEST AT  {}-------------------------[0]".format(dt_string))
# Calling the intial setup


@pytest.mark.usefixtures("init_cases")
def test_check():
    print("!!!!----SANITY TEST on PEERS Before Test Cases checking MCLAG sync, portchannel status!!!!! \n")
    c = con.check_switch()
    assert c == True, "One of the base checks of the solution Test Failed, please check Log file"

def test_mac():
    print("!!!!----Testing the MAC Sync in PEERS!!!!! \n")
    c = con.check_traffic()
    assert c == True, "MAC Sync ISSUE,check log for more data!!!"

def test_traffic():
    print("\n Measuring the input and output of a steam \n")
    tx,rx = conixia.traffic_measure("unicast-traffic-1")
    tx1 = float(tx)
    rx1 = float(rx)

    assert rx1 >= tx1-threshold, " Traffic for the unicast stream there is packet drop"

def test_full_traffic():
    print("!!!!----Testing the MAC Sync in PEERS!!!!! \n")
    c = conixia.traffic_measure_full(traffic_profile,threshold)
    assert c == True, "Traffic Issue Check Logs!!!"

def test_port_prio():
    print("!!!!----Testing Port Priority Changes!!!!! \n")
    ip = '10.27.201.2'
    port = "Ethernet1"
    c = con.port_prio_change(ip,port)
    assert c == True, "Port Priority Change is affecting the port states check ASX-737 fix which changes the port id mappings in standby!!!"

def test_path_cost():
    print("!!!!----Testing Port Priority Changes!!!!! \n")
    ip = '10.27.201.2'
    port = "Ethernet1"
    c = con.path_cost_change(ip,port)
    assert c == True, "Path Cost Change is not working as Expected!!!"

def test_stpvlan_disable():
    print("!!!!----Testing STP Disable For a vlan!!!!! \n")
    ip = '10.27.201.1'
    vlan = 1001
    c = con.stp_vlan_disable(ip,vlan)
    assert c == True, "PORTS are not forwarding Please check STP enable is working!!!"


def test_mclag_tcpmss():
    print("!!!!----Testing TCP MSS Change in MCLAG PEERS!!!!! \n")

    mss = 4300
    c = con.mclag_tcpmss(mss)
    assert c == True, "TCP MSS Changes are not working!!!"

def test_uplink_shut():
    print("!!!!----Testing Flapping of Link Connected to upstream Switch!!!!! \n")
    router = '10.27.201.1'
    port = 'Ethernet1'
    c = con.shut_link(router, port)
    assert c == True, "After Bouncing the link connected to the upstream switch the macs are not syncing  !!!!"

def test_deladdvlan():
    print("!!!!----Testing Deleting and Adding Vlan back from Peer1!!!!! \n")
    vlan = 1001
    ip = '10.27.201.1'
    port = ['Ethernet1','Ethernet46','Ethernet52','PortChannel1','PortChannel2','PortChannel3']
    c = con.vlan_delete(ip,vlan,port)
    assert c == True, "After Deleting and Adding Vlan back there is an issue  !!!!"

def test_deladdvlan_1():
    print("!!!!----Testing Deleting and Adding Vlan back in Peer2!!!!! \n")
    vlan = 1001
    ip = '10.27.201.2'
    port = ['Ethernet1','Ethernet46','Ethernet60','PortChannel1','PortChannel2','PortChannel3']
    c = con.vlan_delete(ip,vlan,port)
    assert c == True, "After Deleting and Adding Vlan back there is an issue  !!!!"

def test_restart_container():

    print("!!!!----Testing Restarting SWSS Container  in PEER1!!!!! \n")
    container = "swss"
    router = '10.27.201.1'
    timer = 240
    c = con.docker_restart_container(router, container,timer)
    assert c == True, " Restart SWSS in Peer1 failed  !!!!"

def test_restart_container1():

    print("!!!!----Testing Restarting SWSS Container  in PEER2!!!!! \n")
    container = "swss"
    router = '10.27.201.2'
    timer = 240
    c = con.docker_restart_container(router, container,timer)
    assert c == True, " Restart SWSS in Peer2 failed  !!!!"

def test_restart_container2():

    print("!!!!----Testing Restarting STP Container  in PEER1!!!!! \n")
    container = "stp"
    router = '10.27.201.1'
    timer = 300
    c = con.docker_restart_container(router, container,timer)
    assert c == True, " Restart STP in Peer2 failed  !!!!"


def test_restart_container3():

    print("!!!!----Testing Restarting STP Container  in PEER2!!!!! \n")
    container = "stp"
    router = '10.27.201.2'
    timer = 300
    c = con.docker_restart_container(router, container,timer)
    assert c == True, " Restart STP in Peer2 failed  !!!!"

def test_link_down():
    print("!!!!----Testing IXIA Link Flap!!!!! \n")
    router = '10.27.201.1'
    port = 'Ethernet46'
    c = con.shut_link(router,port)
    assert c == True,"After Bouncing the link the macs are not syncing  !!!!"

def test_link_down1():
    print("!!!!----Testing IXIA Link Flap!!!!! \n")
    router = '10.27.201.2'
    port = 'Ethernet46'
    c = con.shut_link(router,port)
    assert c == True,"After Bouncing the link the macs are not syncing  !!!!"


def test_vlanport_del():
    print("!!!!----Testing Flapping of Link Connected to upstream Switch!!!!! \n")
    vlan = 1001
    ip = '10.27.201.1'
    port = ['Ethernet1','Ethernet46','Ethernet52','PortChannel1','PortChannel2','PortChannel3']
    c = con.vlan_port_delete(ip,vlan,port)
    conixia.dhcp_stop()
    time.sleep(10)
    conixia.dhcp_start()
    assert c == True, "After Deleting and Adding Ports for a Vlan back there is an issue  !!!!"

def test_vlanport_del1():
    print("!!!!----Testing Flapping of Link Connected to upstream Switch!!!!! \n")
    vlan = 1001
    ip = '10.27.201.2'
    port = ['Ethernet1','Ethernet46','Ethernet60','PortChannel1','PortChannel2','PortChannel3']
    c = con.vlan_port_delete(ip,vlan,port)
    conixia.dhcp_stop()
    time.sleep(10)
    conixia.dhcp_start()
    assert c == True, "After Deleting and Adding Ports for a Vlan back there is an issue  !!!!"

def test_asx688fix():
    print("!!!!----Testing TCN in MCLAG CE, checking fix for ASX-688!!!!! \n")
    router = "10.27.201.5"
    c = con.tcp_dump(router)
    assert c == True, "Fix for ASX-688 is not working properly  !!!!"



