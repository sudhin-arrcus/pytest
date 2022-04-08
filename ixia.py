import os
import re
import sys
import time

sys.path.append('/root/IXIA/IXIA_9.10/lib/PythonApi')
sys.path.append('/root/IXIA/IXIA_9.10/lib/hltapi/library/common/ixiangpf/python')
tcl_dependencies = [
    '/root/IXIA/IXIA_9.10/lib',
    '/root/IXIA/IXIA_9.10/lib/IxTclProtocol',
    '/root/IXIA/IXIA_9.10/lib/IxTclNetwork'
]

from ixiatcl import IxiaTcl
from ixiahlt import IxiaHlt
from ixiangpf import IxiaNgpf
from ixiaerror import IxiaError

# ixiatcl = IxiaTcl()
# ixiahlt = IxiaHlt(ixiatcl, use_legacy_api = 1)
# ixiangpf = IxiaNgpf(ixiahlt)
ixiatcl = IxiaTcl(tcl_autopath=tcl_dependencies)
ixiahlt = IxiaHlt(ixiatcl)
ixiangpf = IxiaNgpf(ixiahlt)

chassis_ip = '10.27.201.28'
ixnetwork_tcl_server = '10.9.101.253'
tcl_server = chassis_ip
user_name = 'test'
port_list = '1/6 1/21 1/22 1/23 1/24'

configFile = '/root/sudhin/MCLAG5.ixncfg'

connect_result = ixiangpf.connect(
    ixnetwork_tcl_server=ixnetwork_tcl_server,
    tcl_server=tcl_server,
    device=chassis_ip,
    port_list=port_list,
    username=user_name,
    break_locks=1,
    config_file=configFile, )

#############################
##  STARTING ALL PROTOCOLS ##
#############################

print
"\nStarting all protocols ... "
start = ixiangpf.test_control(action='start_all_protocols')
if start['status'] != IxiaHlt.SUCCESS:
    # ErrorHandler('test_control', start)

    print
    "\nSleeping for 30 seconds ... "
    time.sleep(30)

#########################
# Start traffic on port #
#########################

traffic_control_status = ixiangpf.traffic_control(
    mode=all,
    action='run',
)
if traffic_control_status['status'] != '1':
    # ErrorHandler('traffic_control', traffic_control_status)

    time.sleep(30)

