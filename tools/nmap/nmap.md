[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# nmap
Nmap, Network Mapper is a network scanner created by Gordon Lyon used to discover hosts and services on a computer network by sending packets and analyzing the responses. 

<hr/>

## install nmap in Linux
```sh
dnf install nmap
nmap -V
```

## nmap command usage
```sh
nmap [Scan Type(s)] [Options] {target specification}
```


## Practical Approach
```sh
export IP=88.99.66.243
nmap -p- --min-rate 10000 -v -oN nmap.full target.ip
sudo nmap -sV -sC -Pn -p 21,53,80,110,143,442,587,993,995 -oN nmap.details target.ip
```
[-sV]: Version Detector
[-sC]: Default Script
[-Pn]: Ping is not allowed

# Knowledge

TCP Flags
- ACK (Acknowledgment)
- SYN (Synchronization)
- FIN (Finish)
- URG (Urgent)
- PSH (Push)
- RST (Reset)

TCP 3-Way Handshake
- SYN
- SYN/ACK
- ACK

Nmap considers the following six PORT states:
- Open
- Closed
- Filtered
- Unfiltered
- Open|Filtered
- Closed|Filtered

Types of port scans
- Null Scan <sudo nmap -sN  MACHINE_IP>
- FIN Scan  <sudo nmap -sF  MACHINE_IP>
- Xmas Scan <sudo nmap -sX  MACHINE_IP>
- Maimon Scan <sudo nmap -sM  MACHINE_IP>
- ACK Scan  <sudo nmap -sA  MACHINE_IP>
- Window Scan <sudo nmap -sW  MACHINE_IP>
- Custom Scan <sudo nmap --scanflags RSTSYNFIN MACHINE_IP>





Nmap
| Scan Type 	          |  Example Command                            |
|--                       | --                                          | 
| ARP Scan 	              |  sudo nmap -PR -sn MACHINE_IP/24            |
| ICMP Echo Scan 	      |  sudo nmap -PE -sn MACHINE_IP/24            |
| ICMP Timestamp Scan 	  |  sudo nmap -PP -sn MACHINE_IP/24            |
| ICMP Address Mask Scan  |	 sudo nmap -PM -sn MACHINE_IP/24            |
| TCP SYN Ping Scan       |	 sudo nmap -PS22,80,443 -sn MACHINE_IP/30   |
| TCP ACK Ping Scan 	  |  sudo nmap -PA22,80,443 -sn MACHINE_IP/30   |
| UDP Ping Scan 	      |  sudo nmap -PU53,161,162 -sn MACHINE_IP/30  |
| TCP Connect Scan 	      |  nmap -sT 10.10.168.112                     |
| TCP SYN Scan 	          |  sudo nmap -sS 10.10.168.112                |
| UDP Scan 	              |  sudo nmap -sU 10.10.168.112                |

| Option                 |	Purpose                                     |
|--                      | --                                           | 
| -n 	                 |   no DNS lookup                              |
| -R 	                 |   reverse-DNS lookup for all hosts           |
| -sn 	                 |   host discovery only                        |
| -p- 	                 |   all ports                                  |
| -p1-1023               |	 scan ports 1 to 1023                       |
| -F                     |   100 most common ports                      |
| -r 	                 |   scan ports in consecutive order            |
| -T<0-5>                | 	 -T0 being the slowest and T5 the fastest   |
| --max-rate 50          |	 rate <= 50 packets/sec                     |
| --min-rate 15          |	 rate >= 15 packets/sec                     |
| --min-parallelism 100  |	 at least 100 probes in parallel            |

## nmap scenario -network
- Scan using Hostname
- Scan using IP Address
- Scan Multiple Hosts
- Scan a whole Subnet <nmap -sn 192.168.0.0/24>
- Scan Multiple Servers using last octet of IP address
- Scan list of Hosts from a File
- Scan an IP Address Range
- Scan Network Excluding Remote Hosts
- Find out Live hosts in a Network


## nmap scenario -host
- Scan OS information and Traceroute
- Enable OS Detection with Nmap
- Scan a Host to Detect Firewall
- Scan a Host to check its protected by Firewall
- Perform a Fast Scan
- Print Host interfaces and Routes

## nmap scenario -port
- Scan for specific Port
- Scan a TCP Port
- Scan a UDP Port
- Scan Multiple Ports
- Scan Ports Consecutively
- Scan Ports by Network Range
- Find Host Services version Numbers
- Scan remote hosts using TCP ACK (PA) and TCP Syn (PS)
- Scan Remote host for specific ports with TCP ACK
- Scan Remote host for specific ports with TCP Syn
- Perform a stealthy Scan
- Check most commonly used Ports with TCP Syn
- Perform a tcp null scan to fool a firewall

[https://www.tecmint.com/nmap-command-examples]

```sh
nmap scanme.nmap.org
nmap 45.33.32.156
nmap -v scanme.nmap.org
```

```sh
nmap [ip]
nmap -p0-65535 [ip]
nmap -p22,21,80,9999 -sV -sC -T4 -Pn -oA 10.10.254.138 10.10.254.138
/usr/share/nmap/scripts/acarsd-info.nse
/usr/share/nmap/scripts/address-info.nse
/usr/share/nmap/scripts/afp-brute.nse
nmap --script=default [ip]
nmap --script-help http-headers
nmap --script-help smb-vuln*
nmap -sC -sV -p445 10.10.254.138 --script=smb-vuln*
Nmap vulscan: https://github.com/scipag/vulscan -> /usr/share/nmap/scripts
Nmap-vulners:https://github.com/vulnersCom/nmap-vulners.git -> /usr/share/nmap/scripts
```

Decoy(s)
Using the -D option, you can add decoy source IP addresses to confuse the target. Consider the following command, 
nmap -sS -Pn -D 10.10.10.1,10.10.10.2,ME -F target.ip
nmap -sS -Pn -D RND,RND,ME -F target.ip

Proxy
nmap -sS -Pn --proxies PROXY_URL -F target.ip


# This is a quick summary of the Nmap options discussed in this task.
Evasion Approach 	                               Nmap Argument
Hide a scan with decoys 	                        -D DECOY1_IP1,DECOY_IP2,ME
Hide a scan with random decoys 	                    -D RND,RND,ME
Use an HTTP/SOCKS4 proxy to relay connections 	    --proxies PROXY_URL
Spoof source MAC address 	                        --spoof-mac MAC_ADDRESS
Spoof source IP address 	                        -S IP_ADDRESS
Use a specific source port number 	                -g PORT_NUM or --source-port PORT_NUM