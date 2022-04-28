import paramiko
import time
from scp import SCPClient
from netmiko import ConnectHandler
import os
import re
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
key = "10.27.201.1"
ssh.connect(hostname=key,
                username='admin',
                password='admin',
                look_for_keys=False)
value = "world.sh"
scp = SCPClient(ssh.get_transport())
    # Sending files to the server
print(" \n SCP --->  file {} to the switch ------> {}\n".format(value,key))
scp.put(value, '/home/admin/')
ssh.close()
device = ConnectHandler(device_type='linux', ip=key, username='admin', password='admin')
output = device.send_command("(chmod 777 *)")
output = device.send_command("(./world.sh)")
print(output)



