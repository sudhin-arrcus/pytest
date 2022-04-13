import os
import re
import sys
import time

class ixia:

    def __init__(self,path,dep,chassis_ip,server_ip,configFile,port_list,dhcphandle):
        self.path = path
        self.dep = dep
        self.chassis_ip = chassis_ip
        self.server_ip = server_ip
        self.configFile = configFile
        self.portlist =port_list
        self.user_name = 'test'
        self.ixiatcl = None
        self.ixiahlt = None
        self.ixiangpf = None
        sys.path.append(self.path+'/IXIA_9.10/lib/PythonApi')
        sys.path.append(self.path+'/IXIA_9.10/lib/hltapi/library/common/ixiangpf/python') 
        tcl_dependencies = self.dep
        from ixiatcl import IxiaTcl
        from  ixiahlt import IxiaHlt
        from ixiangpf import IxiaNgpf
        from ixiaerror import IxiaError
        self.ixiatcl = IxiaTcl(tcl_autopath=tcl_dependencies)
        self.ixiahlt = IxiaHlt(self.ixiatcl)
        self.ixiangpf = IxiaNgpf(self.ixiahlt)
        self.dhcphandle = dhcphandle

    def init_ixia(self):
        
        chassis_ip = self.chassis_ip
        ixnetwork_tcl_server =self.server_ip
        tcl_server = chassis_ip
        #user_name = 'test'
        port_list = self.portlist
        confile = self.configFile

        #self.ixiatcl = IxiaTcl(tcl_autopath=tcl_dependencies)
        #self.ixiahlt = IxiaHlt(ixiatcl)
        #self.ixiangpf = IxiaNgpf(ixiahlt)

        connect_result = self.ixiangpf.connect(
            ixnetwork_tcl_server=ixnetwork_tcl_server,
            tcl_server=tcl_server,
            device=chassis_ip,
            port_list=port_list,
            username=self.user_name,
            break_locks=1,
            config_file=confile,)
        
       # print(connect_result)
      #return ixiangpf

    def start_protocols(self):
        
        print("\n Starting all protocols ... \n ")
        start = self.ixiangpf.test_control(action='start_all_protocols')
        #if start['status'] != self.ixiahlt.IxiaHlt.SUCCESS:
        print("\nSleeping for 30 seconds ... ")
        time.sleep(30)
        


    def start_traffic(self):
        traffic_control_status = self.ixiangpf.traffic_control(
                    
                        action='run',
                        )
        #if traffic_control_status['status'] != '1':
                # ErrorHandler('traffic_control', traffic_control_status)

        time.sleep(30)



    def stop_traffic(self):
       traffic_control_status = self.ixiangpf.traffic_control(
                       action      = 'stop',
                           )
        
       time.sleep(30)
   
    def stop_protocols(self):

       self.ixiangpf.test_control(action='stop_all_protocols')

   
    def traffic_measure(self,stream_id):

       print('\n\nCollecting traffic stats...\n\n')
       traffic_stats = self.ixiangpf.traffic_stats(
              mode='traffic_item',
                    )
       print('\n\nIPv4 traffic item stats:\n')
       txpck = traffic_stats['traffic_item'][stream_id]['tx']['total_pkt_rate']
       rxpck = traffic_stats['traffic_item'][stream_id]['rx']['total_pkt_rate']
       print("txpck = %s " % txpck)
       print("Rxpck = %s " % rxpck)
       print('\n\nTraffic Item Stats\n')
       return txpck,rxpck
      
    def dhcp_start(self):
        print("Starting dhcp client....")
        
        control_status = self.ixiangpf.test_control(
            handle  =   self.dhcphandle ,
                        action = 'start_protocol' ,
                              )
         
        time.sleep(30)

    def dhcp_stop(self):
        print("Stopping client....")
         
        control_status = self.ixiangpf.test_control(
               handle   =  self.dhcphandle ,
               action = 'stop_protocol' ,
                               )
   
    def dhcp_stat(self,han):
       dhcp_stats_0 = self.ixiangpf.emulation_dhcp_stats(
           handle = han    ,
           mode     =     'aggregate_stats',                                 
           dhcp_version =    'dhcp4' ,                                       
           execution_timeout = '60' ,                                          
                    )
       
       print ("\n\nDHCP Client aggregate statistics:\n\n")
       print(dhcp_stats_0)
       print(dhcp_stats_0['Ethernet - 005']['aggregate']['addr_discovered'])
       val = dhcp_stats_0['Ethernet - 005']['aggregate']['addr_discovered']
       return int(val)

    def igmp_start(self,han):
        print("Starting IGMP client....")

        control_status = self.ixiangpf.test_control(
            handle=han,
            action='start_protocol',
        )

        time.sleep(30)

    def igmp_stop(self,han):
        print("Stopping IGMP client....")

        control_status = self.ixiangpf.test_control(
            handle=han,
            action='stop_protocol',
        )










