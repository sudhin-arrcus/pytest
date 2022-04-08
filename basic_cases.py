
import ipaddress
from netaddr import *


def ip_to_int(ip_address):
    addr2 = ipaddress.ip_address(ip_address)
    return int(addr2)


def int_to_ip(integer):
    addr1 = ipaddress.ip_address(integer)
    return addr1


def print_hosts(network):
    ip = network.split('/')
    host = IPNetwork(network)

    print(host)
    ip_host = host.hostmask
    print(ip_host)
    host_int = ipaddress.ip_address(ip_host)
    start_range = ip_to_int(ip[0])
    mask_int = ip_to_int(host_int)

    for i in range(start_range, start_range + mask_int - 1):
        hos = i + 1
        hos_1 = int_to_ip(hos)
        print(hos_1)
print_hosts("192.168.1.128/25")