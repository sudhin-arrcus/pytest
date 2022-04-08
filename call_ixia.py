import ixia_con

path = '/root/IXIA'
tcl_dependencies = [
            path+'/IXIA_9.10/lib',
                path+'/IXIA_9.10/lib/IxTclProtocol',
                    path+'/IXIA_9.10/lib/IxTclNetwork'
                    ]

chassis_ip = '10.27.201.28'
ixnetwork_tcl_server = '10.9.101.253'

user_name = 'test'
port_list = '1/6 1/21 1/22 1/23 1/24'

configFile = '/root/sudhin/MCLAG5.ixncfg'




con = ixia_con.ixia(path,tcl_dependencies,chassis_ip,ixnetwork_tcl_server,configFile,port_list)


con.init_ixia()

con.start_protocols()
con.start_traffic()
con.stop_traffic()
con.stop_protocols()