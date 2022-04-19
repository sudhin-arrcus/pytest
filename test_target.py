
import pytest
import logging
import ixia_con
import sonic
logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger()
import time

ipfile = {'10.27.201.1': 'MLAG271.json', '10.27.201.2': 'MCLAG272.json',
          '10.27.201.5': 'MCLAG275.json', '10.27.201.42': 'MCLAG42.json',
          '10.27.201.6': 'MLAG276.json'
          }

iplist = ['10.27.201.1','10.27.201.2','10.27.201.5','10.27.201.42','10.27.201.6']
con = sonic.sonic(ipfile,iplist)

path = '/home/user/'
tcl_dependencies = [
                    path+'/IXIA_9.10/lib',
                    path+'/IXIA_9.10/lib/IxTclProtocol',
                    path+'/IXIA_9.10/lib/IxTclNetwork'
                     ]

chassis_ip = '10.27.201.28'
ixnetwork_tcl_server = '10.9.101.253'

user_name = 'test'
port_list = '1/6 1/21 1/22 1/23 1/24'

configFile = path+'/sudhin/MCLAG6.ixncfg'

handler = ["/topology:5/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:5/deviceGroup:2/ethernet:1/dhcpv4client:1","/topology:5/deviceGroup:4/ethernet:2/dhcpv4client:1","/topology:7/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:7/deviceGroup:3/ethernet:1/dhcpv4client:1","/topology:7/deviceGroup:4/ethernet:1/dhcpv4client:1","/topology:9/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:9/deviceGroup:2/ethernet:1/dhcpv4client:1","/topology:10/deviceGroup:1/ethernet:1/dhcpv4client:1","/topology:10/deviceGroup:2/ethernet:2/dhcpv4client:1"]
han = "/topology:5/deviceGroup:1/ethernet:1/dhcpv4client:1/item:1"
igmp_handle = "/topology:9/deviceGroup:3/ethernet:1/ipv4:1/igmpHost:1"
conixia = ixia_con.ixia(path,tcl_dependencies,chassis_ip,ixnetwork_tcl_server,configFile,port_list,handler)
@pytest.fixture(scope='module')
def init_cases():
    print("[+]----------------------------------------------------------------[+]")

    print("[0]--------------------STARTING--------------------------[0]")
    print("\n Starting the connection \n")
    con.con_switch()
    print("[0]+-----------------------CONNCETING IXIA AND STARTING TRAFFIC------[0]++\n")

    conixia.init_ixia()

    conixia.start_protocols()
    conixia.start_traffic()
    print("[0]+-----------------------IXIA Conncetion Completed------[0]++\n")
    print("Intialization completed")
    yield
    print("Tear Down After the cases")
# Calling the intial setup


@pytest.mark.usefixtures("init_cases")
def test_check():
    c = con.check_switch()
    assert c == True, "One of the base checks of the solution Test Failed, please check Log file"

def test_mac():
    c = con.check_traffic()
    assert c == True, "MAC Sync ISSUE,check log for more data!!!"

def test_traffic():
    print("\n Measuring the input and output of a steam \n")
    tx,rx = conixia.traffic_measure("unicast-traffic-1")
    tx1 = float(tx)
    rx1 = float(rx)

    assert rx1 >= tx1-10, " Traffic for the unicast stream there is packet drop"

def test_vlan():
    c = con.vlan_check()
    assert c == True, "Vlan is not configured on all interfaces properly!!!"

def test_dhcpclients():
    c = con.dhcp_host_check()
    assert c == True, "DHCP MAC Bindings are not there check DHCP server is running or check switch!!!"

def test_restartdhcp():
    conixia.stop_protocols()
    time.sleep(30)
    print("\n Sleeping is over for 30s \n")
    conixia.start_protocols()
    time.sleep(40)
    print("\n Sleeping is over for 40s after starting protocols\n")
    c = conixia.dhcp_stat(han)
    assert c >=9,"Restarting Clients didnt get ip check IXIA"

def test_cleardhcpbind():
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
    assert rx1 >= tx1-10 ," Traffic for the Multicast Stream stream there is packet drop"

def test_router_traffic():
    print(" Testing Router traffic is going while snooping enabled\n")
    tx,rx = conixia.traffic_measure("Router Traffic")
    tx1 = float(tx)
    rx1 = float(rx)
    assert rx1 >= tx1-10 ," Router traffic is affected check the ixia and DUT....."

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
    assert rx1 >= tx1-10 ," Broadcast traffic is affected check the ixia and DUT....."

def test_vrrp_traffic():
    print(" Testing VRRP Passthrough traffic is going through...\n")
    tx,rx = conixia.traffic_measure("VRRPPACKET")
    tx1 = float(tx)
    rx1 = float(rx)
    assert rx1 >= tx1-10 ," VRRP Pass through traffic is affected check the ixia and DUT....."

def test_interface():

    c = con.interface_check()
    assert c == True,"Check the interfaces are up and running !!!!"

def test_lldp_interface():

    c = con.lldp_check()
    assert c == True,"Check the LLDP Messages..... !!!!"

def test_lldp_table():

    c = con.lldp_table_check()
    assert c == True,"Check the LLDP table displaying interfaces properly !!!!"

def test_lldp_status():

    c = con.lldp_status_check()
    assert c == True,"Check the LLDP Interface status true !!!!"


def test_env():

    c = con.envr_check()
    assert c == True,"Check the Environment  !!!!"

def test_pci():

    c = con.pcie_check()
    assert c == True,"Check the PCIE INFO  !!!!"

def test_add_vlan():
    vlans = {'800':['PortChannel1']}
    c = con.config_vlan(vlans)
    assert c == True,"Spanning Tree is not enabled on the newly configured Vlan  !!!!"

def test_del_vlan():
    vlans = {'800':['PortChannel1']}
    c = con.del_vlan(vlans)
    assert c == True,"Spanning Tree is not able to remove from vlan  !!!!"

def test_disable_span():
    c = con.disable_span()
    assert c == True,"Spanning Tree Boucing in peers cause issues  !!!!"

def test_link_down():
    router = '10.27.201.5'
    port = 'PortChannel1'
    c = con.shut_link(router,port)
    assert c == True,"After Bouncing the link the macs are not syncing  !!!!"

def test_peerlink_down():
    router = '10.27.201.1'
    port = 'PortChannel1'
    c = con.shut_link(router,port)
    assert c == True,"After Bouncing the  peer link the macs are not syncing  !!!!"

def test_dhcp_option_bounce():
    con.disable_dhcp_options()
    conixia.stop_protocols()
    time.sleep(20)
    con.enable_dhcp_options()
    conixia.start_protocols()
    time.sleep(25)
    c = conixia.dhcp_stat(han)
    assert c >=9,"Restarting Clients didnt get ip check IXIA after bouncing option 82"

def test_dhcp_option_disable():
    con.disable_dhcp_options()
    conixia.dhcp_stop()
    time.sleep(10)
    conixia.dhcp_start()
    time.sleep(10)
    c = conixia.dhcp_stat(han)
    con.enable_dhcp_options()
    conixia.dhcp_stop()
    time.sleep(5)
    conixia.dhcp_start()
    time.sleep(5)

    assert c <=3,"Disabling option 82 is not working properly"

def test_macflush():
    conixia.stop_protocols()
    conixia.stop_traffic()
    time.sleep(10)
    c = con.check_macflush()
    assert c == True," Mac Flush is nor working properly  !!!!"

