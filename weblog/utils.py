#!/usr/bin/env python3

import os
import datetime
import pygeoip
import socket

def get_app_base_path():
    return os.path.dirname(os.path.realpath(__file__))


def lookupCountry(ip):
    # lookup the country name by ip address
    g = pygeoip.GeoIP(get_app_base_path()+'/lookup/GeoLiteCity.dat')
    return g.record_by_addr(ip)['time_zone']


def getGeoCountry(hostname):
    try:
        ip = socket.gethostbyname(hostname)
        country = lookupCountry(ip)
        return country
    except socket.gaierror:
        return

def get_app_base_path():
    return os.path.dirname(os.path.realpath(__file__))


def datetime_parser(dateString):
    d_date = datetime.datetime.strptime(dateString, "%d/%b/%Y")
    return d_date


