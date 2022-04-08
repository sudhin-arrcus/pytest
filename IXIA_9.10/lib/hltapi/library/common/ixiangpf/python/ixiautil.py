#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import absolute_import, print_function, division

import getpass
import itertools
import platform
import re
import sys
import xml.etree.ElementTree as ElementTree
from datetime import datetime

from ixiaerror import IxiaError


class Logger(object):
    CAT_INFO = 'info'
    CAT_WARN = 'warn'
    CAT_DEBUG = 'debug'
    ENABLED = True

    def __init__(self, prefix, print_timestamp=True):
        self.prefix = prefix
        self.print_timestamp = print_timestamp

    def log(self, category, msg):
        parts = []
        if self.print_timestamp:
            parts.append(datetime.now().strftime('%H:%M:%S.%f'))
        parts.append(self.prefix)
        parts.append(category)
        parts.append(' ' + msg)

        if self.ENABLED:
            print(':'.join(parts))

    def info(self, msg):
        self.log(Logger.CAT_INFO, msg)

    def warn(self, msg):
        self.log(Logger.CAT_WARN, msg)

    def debug(self, msg):
        self.log(Logger.CAT_DEBUG, msg)


class _PartialMetaclass(type):
    '''
    Metaclass used for adding methods to existing classes.
    This is needed because of name mangling of __prefixed variabled and methods.
    '''

    def __new__(cls, name, bases, dict):
        if not bases:
            return type.__new__(cls, name, bases, dict)

        if len(bases) != 2:
            raise TypeError("Partial classes need to have exactly 2 bases")

        base = bases[1]
        # add the new methods to the existing base class
        for k, v in dict.items():
            if k == '__module__':
                continue
            setattr(base, k, v)

        return base

# compatibility for python2 and python3
def __metaclass(meta, *bases):
    class metaclass(meta):
        def __new__(cls, name, this_bases, d):
            return meta(name, bases, d)
    return type.__new__(metaclass, 'temporary_class', (), {})


class PartialClass(__metaclass(_PartialMetaclass)):
    pass


def version_sorted(version_list):
    ''' sort a dotted-style version list '''
    # split versions list and make each sublist item an int for sorting
    split_versions = [[int(y) for y in x.split('.')] for x in version_list]
    # sort by internal list integers and redo the string versions
    return ['.'.join([str(y) for y in x]) for x in sorted(split_versions)]


def get_hostname():
    '''
    This method returns the hostname of the client machine or a predefined 
    string if the hostname cannot be determined
    '''
    hostname = platform.node()
    
    if hostname:
        return hostname
    
    return "UNKNOWN MACHINE"


def get_username():
    '''
    This method returns the username of the client machine. A predified string
    ("UNKNOWN HLAPI USER") will be returned in case of failing to get the current username.
    '''
    username = "UNKNOWN HLAPI USER"
    try:
        username = getpass.getuser()
    except(Exception, ):
        return "UNKNOWN HLAPI USER"
    return username


def extract_specified_args(arguments_to_extract, hlpy_args):
    '''
    This method accepts a list as input and a dict. The method iterates through the elements of the dict and searches
    for the keys that have the same name. All the entries that are found are copied to a new dict which is returned. 
    '''
    return {key: hlpy_args[key] for key in arguments_to_extract if key in hlpy_args}


def merge_dicts(*dicts):
    '''
    This method accepts a list of dictionaries as input and returns a new dictionary with all the items 
    (all elements from the input dictionaries will be merged into the same dictionary)
    '''
    return dict(itertools.chain(*[iter(d.items()) for d in dicts]))


def get_ixnetwork_server_and_port(hlpy_args):
    '''
    This method parses the input arguments and looks for a key called ixnetwork_tcl_server. If the key is found, the
    value of the key is parsed in order to separate the hostname and port by ":" separator. The parsed information is
    returned as a dict with hostname and port keys. If no port is given 8009 will be used as default. If no hostname 
    is given it will default to loopback address. Valid input formats for ixnetwork_tcl_server value: 
        127.0.0.1:8009, hostname:8009, hostname, 127.0.0.1, 
        2005::1, [2005::1]:8009, 
        2005:0:0:0:0:0:0:1, [2005:0:0:0:0:0:0:1]:8009, 
        2005:0000:0000:0000:0000:0000:0000:001, [2005:0001::0001:001]:8009
    Not valid: 2005::1:8009 or 2005:0:0:0:0:0:0:1:8009
    Returns hostname, port and an invalid sessionId -1
    '''
    default_hostname = '127.0.0.1'
    default_port = '8009'
    try:
        ixnetwork_tcl_server = hlpy_args['ixnetwork_tcl_server']
        list = ixnetwork_tcl_server.split(":")
        if len(list) == 1:
            return {'hostname': ixnetwork_tcl_server, 'port': default_port,  'sessionId': -1}
        elif len(list) == 2:
            # does not contain ipv6 address
            return {'hostname':list[0], 'port': list[1],'sessionId': -1}
        else:
            # consider the hostname might be an ipv6 address in [ipv6]:port format (ex.: [2005::1]:8009)
            # we don't want to validate that the ipv6 is correct, just to know if port is included or not
            list = ixnetwork_tcl_server.split("]:")
            m = re.match('\[(?P<hostname>.*)\]', ixnetwork_tcl_server)
            if m:
                hostname = m.group('hostname')
            else:
                hostname = list[0]            
            if len(list) == 1:
                return {'hostname': hostname, 'port': default_port,'sessionId': -1}
            else:
                return {'hostname': hostname, 'port': list[1], 'sessionId': -1}
    except (Exception, ):
        return {'hostname': default_hostname, 'port': default_port, 'sessionId': -1}

from ixiahlt import IxiaHlt
def make_hltapi_fail(log):
    return {'status': IxiaHlt.FAIL, 'log': log}
