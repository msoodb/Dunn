
shodan init $SHODAN_API

# Original IP
shodan search Ssl.cert.subject.CN:”hackerone.com” 200 — fields ip_str | httpx

## Most popular Shodan dorks

1. Databases
- "MongoDB Server Information" port:27017 -authentication
- "Set-Cookie: mongo-express=" "200 OK"
- mysql port:"3306"
- port:"9200" all:"elastic indices"
- port:5432 PostgreSQL

2. Exposed ports
- proftpd port:21
- "220" "230 Login successful." port:21
- openssh port:22
- port:"23"
- port:"25" product:"exim"
- port:"11211" product:"Memcached"
- "X-Jenkins" "Set-Cookie: JSESSIONID" http.title:"Dashboard"

3. DNS servers
- "port: 53" Recursion: Enabled

4. Network infrastructure
- port:8291 os:"MikroTik RouterOS 6.45.9"

5. Web servers
- product:"Apache httpd" port:"80"
- product:"Microsoft IIS httpd"
- product:"nginx"
- "port: 8080" product:"nginx"

6. Operating systems
- os:"windows 7"
- os:"Windows 10 Home 19041"
- os:"Linux"

7. Filtering by country, city or location
- country:"UK"
- "city: London"
- geo:"51.5074, 0.1278"
- os:"windows 7" country:"UK"

8. SSL certificates
- ssl.cert.issuer.cn:example.com ssl.cert.subject.cn:example.com
- ssl.cert.expired:true

9. Webcams
- Server: SQ-WEBCAM
- "Server: yawcam" "Mime-Type: text/html"

10. Industrial control systems
- title:"xzeres wind"
- port:5006,5007 product:mitsubishi
- "Server: gSOAP/2.8" "Content-Length: 583"

11. Remote Desktop
- remote desktop "port:3389"
- "authentication disabled" "RFB 003.008"

12. NAS accesses
- "Authentication: disabled" port:445
- "X-Plex-Protocol" "200 OK" port:32400
- "220" "230 Login successful." port:21

13. Printers and copiers
- "Serial Number:" "Built:" "Server: HP HTTP"
- "SERVER: EPSON_Linux UPnP" "200 OK"
- ssl:"Xerox Generic Root"
