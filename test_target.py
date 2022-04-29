
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

def test_vlan():
    print("!!!!----Testing the Vlan Database!!!!! \n")
    c = con.vlan_check()
    assert c == True, "Vlan is not configured on all interfaces properly!!!"

def test_dhcpclients():
    print("!!!!----Testing the DHCP MAC IP bindings in PEERS!!!!! \n")
    c = con.dhcp_host_check()
    assert c == True, "DHCP MAC Bindings are not there check DHCP server is running or check switch!!!"

def test_restartdhcp():
    print("!!!!----Testing the DHCP Client restarts!!!!! \n")
    conixia.stop_protocols()
    time.sleep(30)
    print("\n Sleeping is over for 30s \n")
    conixia.start_protocols()
    time.sleep(40)
    print("\n Sleeping is over for 40s after starting protocols\n")
    c = conixia.dhcp_stat(han)
    assert c >=9,"Restarting Clients didnt get ip check IXIA"

def test_cleardhcpbind():
    print("!!!!----Testing the clearing of DHCP MAC IP bindings!!!!! \n")
    conixia.stop_protocols()
    time.sleep(20)
    print("\n Sleeping is over for 20s after stopping dhcp\n")
    c = con.dhcp_bind_check()
    conixia.start_protocols()
    time.sleep(40)
    print("\n Sleeping is over for 40s after starting protocols\n")

    assert c == True,"Stopping Clients didnt clear the mac bindings"

def test_igmptraffic():
    print(" Testing IGMP traffic is going to the intrested hosts\n")
    tx,rx = conixia.traffic_measure("MUL-232")
    tx1 = float(tx)
    rx1 = float(rx)
    assert rx1 >= tx1-threshold ," Traffic for the Multicast Stream stream there is packet drop"

def test_router_traffic():
    print(" Testing Router traffic is going while snooping enabled\n")
    tx,rx = conixia.traffic_measure("Router Traffic")
    tx1 = float(tx)
    rx1 = float(rx)
    assert rx1 >= tx1-threshold ," Router traffic is affected check the ixia and DUT....."

def test_igmp_nohost():
    print(" Testing Multicast Traffic is not going to the Unitrested hosts\n")
    conixia.igmp_stop(igmp_handle)
    print("Sleeping for 15s after stopping igmp hosts")
    time.sleep(15)
    print("\n Sleeping over for 15s......\n")
    tx,rx = conixia.traffic_measure("MUL-232")
    tx1 = float(tx)
    rx1 = float(rx)
    conixia.igmp_start(igmp_handle)
    print("Sleeping for 15s after starting igmp hosts")
    time.sleep(15)
    print("\n Sleeping over for 15s......\n")
    assert rx1 == 0 ," Traffic for the Multicast Stream stream there is packet drop"

def test_igmp_clear():
    print(" Testing IGMP snooping Entries are Cleared in PEERS\n")
    conixia.igmp_stop(igmp_handle)
    print("Sleeping for 15s after stopping igmp hosts")
    time.sleep(15)
    print("\n Sleeping over for 15s......\n")
    c = con.igmp_entry_check()
    conixia.igmp_start(igmp_handle)
    print("Sleeping for 15s after starting igmp hosts")
    time.sleep(15)
    print("\n Sleeping over for 15s......\n")
    assert c == True,"Stopping Clients didnt clear the Snooping Entries"

def test_broadcast_traffic():
    print(" Testing Broadcast traffic is going through...\n")
    tx,rx = conixia.traffic_measure("Broadcastpeer11toallSH-site")
    tx1 = float(tx)
    rx1 = float(rx)
    assert rx1 >= tx1-threshold ," Broadcast traffic is affected check the ixia and DUT....."

def test_vrrp_traffic():
    print(" Testing VRRP Passthrough traffic is going through...\n")
    tx,rx = conixia.traffic_measure("VRRPPACKET")
    tx1 = float(tx)
    rx1 = float(rx)
    assert rx1 >= tx1-threshold ," VRRP Pass through traffic is affected check the ixia and DUT....."

def test_interface():
    print("!!!!----Testing the Interface Status!!!!! \n")
    c = con.interface_check()
    assert c == True,"Check the interfaces are up and running !!!!"

def test_lldp_interface():
    print("!!!!----Testing LLDP Messages using LLDP NEI CLI!!!!! \n")
    c = con.lldp_check()
    assert c == True,"Check the LLDP Messages..... !!!!"

def test_lldp_table():
    print("!!!!----Testing LLDP Table Status!!!!! \n")
    c = con.lldp_table_check()
    assert c == True,"Check the LLDP table displaying interfaces properly !!!!"

def test_lldp_status():
    print("!!!!----Testing LLDP Interface Status!!!!! \n")
    c = con.lldp_status_check()
    assert c == True,"Check the LLDP Interface status true !!!!"


def test_env():
    print("!!!!----Testing show env CLI!!!!! \n")
    c = con.envr_check()
    assert c == True,"Check the Environment  !!!!"

def test_pci():
    print("!!!!----Testing Hardware Information!!!!! \n")
    c = con.pcie_check()
    assert c == True,"Check the PCIE INFO  !!!!"

def test_add_vlan():
    print("!!!!----Testing Adding Vlan!!!!! \n")
    vlans = {'800':['PortChannel1']}
    c = con.config_vlan(vlans)
    assert c == True,"Spanning Tree is not enabled on the newly configured Vlan  !!!!"

def test_del_vlan():
    print("!!!!----Testing Deleting Vlan!!!!! \n")
    vlans = {'800':['PortChannel1']}
    c = con.del_vlan(vlans)
    assert c == True,"Spanning Tree is not able to remove from vlan  !!!!"

def test_disable_span():
    print("!!!!----Testing Peer STP FLAP in PEERS!!!!! \n")
    c = con.disable_span()
    assert c == True,"Spanning Tree Boucing in peers cause issues  !!!!"

def test_link_down():
    print("!!!!----Testing MCLAG CE Link FLAP!!!!! \n")
    router = '10.27.201.5'
    port = 'PortChannel1'
    c = con.shut_link(router,port)
    assert c == True,"After Bouncing the link the macs are not syncing  !!!!"

def test_peerlink_down():
    print("!!!!----Testing Peer Link FLAP!!!!! \n")
    router = '10.27.201.1'
    port = 'PortChannel1'
    c = con.shut_link(router,port)
    assert c == True,"After Bouncing the  peer link the macs are not syncing  !!!!"


def test_dhcp_option_bounce():
    print("!!!!----Testing DHCP Clients with option 82 Disable/Enable on switches!!!!! \n")
    con.disable_dhcp_options()
    conixia.stop_protocols()
    time.sleep(20)
    con.enable_dhcp_options()
    conixia.start_protocols()
    time.sleep(25)
    c = conixia.dhcp_stat(han)
    assert c >=9,"Restarting Clients didnt get ip check IXIA after bouncing option 82"

def test_dhcp_option_disable():
    print("!!!!----Testing DHCP Clients with option 82 disable on switches!!!!! \n")
    con.disable_dhcp_options()
    conixia.dhcp_stop()
    time.sleep(10)
    conixia.dhcp_start()
    time.sleep(10)
    con.enable_dhcp_options()
    c = conixia.dhcp_stat(han)
    #con.enable_dhcp_options()
    conixia.dhcp_stop()
    time.sleep(5)
    conixia.dhcp_start()
    time.sleep(5)
    assert c <=3,"Disabling option 82 is not working properly"


def test_macflush():
    print("!!!!----Testing MAC FLush by stopping traffic and clearing FDB!!!!! \n")
    conixia.stop_protocols()
    conixia.stop_traffic()
    time.sleep(10)
    c = con.check_macflush()
    assert c == True," Mac Flush is nor working properly  !!!!"


def test_lldp_poe():
    print("!!!!----Testing LLDP POE with Power Class 1!!!!! \n")
    portlist = ['Ethernet2', 'Ethernet5', 'Ethernet30', 'Ethernet31']
    ipr = '10.27.201.5'
    pc = 1
    dot3 = 1
    req = 3800
    alloc = 3800
    c = con.lldp_poe_conf(ipr, portlist, pc, dot3, req, alloc)
    assert c == True, " LLDP POE is not working properly  !!!!"  




def test_lldp_poe_2():
    print("!!!!----Testing LLDP POE with Power Class 2!!!!! \n")
    portlist = ['Ethernet2', 'Ethernet5', 'Ethernet30', 'Ethernet31']
    ipr = '10.27.201.5'
    pc = 2
    dot3 = 1
    req = 6400
    alloc = 6400
    c = con.lldp_poe_conf(ipr, portlist, pc, dot3, req, alloc)
    assert c == True, " LLDP POE is not working properly  !!!!" 




def test_lldp_poe_3():
    print("!!!!----Testing LLDP POE with Power Class 3!!!!! \n")
    portlist = ['Ethernet2', 'Ethernet5', 'Ethernet30', 'Ethernet31']
    ipr = '10.27.201.5'
    pc = 3
    dot3 = 1
    req = 12500
    alloc = 12500
    c  = con.lldp_poe_conf(ipr, portlist, pc, dot3, req, alloc)
    assert c == True, " LLDP POE is not working properly  !!!!"

def test_lldp_poe_4():
    print("!!!!----Testing LLDP POE with Power Class 4!!!!! \n")
    portlist = ['Ethernet2', 'Ethernet5', 'Ethernet30', 'Ethernet31']
    ipr = '10.27.201.5'
    pc = 4
    dot3 = 2
    req = 25500
    alloc = 25500
    c  = con.lldp_poe_conf(ipr, portlist, pc, dot3, req, alloc)
    assert c == True, " LLDP POE is not working properly  !!!!"



def test_port_sec():

   # conixia.init_ixia()
    print("!!!!----Testing Port Security Restrict with dynamic mode enabled!!!!! \n")
    conixia.start_protocols()
    conixia.start_traffic()
    time.sleep(20)
    print("!!!!----Started IXIA Protocols and Traffic!!!!! \n")
    ip = '10.27.201.5'
    port = 'Ethernet49'
    limit = 10
    en = 'disable'
    mode = 'restrict'
    c = con.port_sec(ip, port,limit,en,mode)
    assert c == True, " Port Security is not working properly  !!!!"

def test_port_sec1():

    print("!!!!----Testing Port Security Restrict with Sticky mode enabled!!!!! \n")
    ip = '10.27.201.5'
    port = 'Ethernet49'
    limit = 10
    en = 'enable'
    mode = 'restrict'
    c = con.port_sec(ip, port,limit,en,mode)
    assert c == True, " Port Security is not working properly  !!!!"

def test_port_sec2():

    print("!!!!----Testing Port Security dynamic with Port Shut mode enabled!!!!! \n")
    ip = '10.27.201.5'
    port = 'Ethernet49'
    limit = 10
    en = 'disable'
    mode = 'port_shut'
    c = con.port_sec_shut(ip, port,limit,en,mode)
    assert c == True, " Port Security is not working properly  !!!!"

def test_port_sec3():

    print("!!!!----Testing Port Security Sticky with Port Shut mode enabled!!!!! \n")
    ip = '10.27.201.5'
    port = 'Ethernet49'
    limit = 10
    en = 'enable'
    mode = 'port_shut'
    c = con.port_sec_shut(ip, port,limit,en,mode)
    assert c == True, " Port Security is not working properly  !!!!"

def test_port_sec4():

    print("!!!!----Testing Port Security Static with Port Restrict mode enabled!!!!! \n")
    ip = '10.27.201.5'
    port = 'Ethernet49'
    limit = 2
    smac = "00:00:50:00:00:00 00:00:50:00:00:01"

    c = con.port_sec_static(ip, port,limit,smac)
    assert c == True, " Port Security Static Restrict is not working properly  !!!!"

def test_port_sec5():

    print("!!!!----Testing Port Security Static with Port Shut mode enabled!!!!! \n")
    ip = '10.27.201.5'
    port = 'Ethernet49'
    limit = 2
    smac = "00:00:50:00:00:00 00:00:50:00:00:01"

    c = con.port_sec_shut_static(ip, port,limit,smac)
    assert c == True, " Port Security Static Port Shut is not working properly  !!!!"

def test_ping_mgmt():

    print("!!!!----Testing Ping works for In Bang Management network of Peer1 in dump Switch!!!!! \n")
    router = '10.27.201.6'
    ip = '20.0.0.2'
    c = con.ping_ip(router,ip)
    assert c == True, " Ping Failed in the Dump switch  !!!!"

def test_ping_mgmt1():

    print("!!!!----Testing Ping works for In Bang Management network of Peer2 in dump Switch!!!!! \n")
    router = '10.27.201.6'
    ip = '20.0.0.4'

    c = con.ping_ip(router,ip)
    assert c == True, " Ping Failed in the Dump Switch  !!!!"

def test_restart_container():

    print("!!!!----Testing Restarting Container STP in PEER1!!!!! \n")
    container = "stp"
    router = '10.27.201.1'
    timer = 140
    c = con.restart_container(router, container,timer)
    assert c == True, " Restart STP in Peer1 failed  !!!!"





