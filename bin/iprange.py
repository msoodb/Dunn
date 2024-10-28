#!/usr/bin/python

# importing ipaddress module
import ipaddress
import sys

for line in sys.stdin:
   #sys.stdout.write(line)
   
   # getting the IP addresses from an input CIDR address(IPv4 network address)
   netIpv4Address = ipaddress.ip_network(line.replace('\n', ''))
   #print("The Following are the IPv4 Addresses in the given CIDR Address(123.45.66.64/27)")


   # traversing through the above IPv4 addresses list
   for i in netIpv4Address:
      # printing the current IPv4 address
      print(i)
