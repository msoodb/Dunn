
# nmap
nmap --script http-vhosts -p 80,443 --script-args http-vhosts.domain=crapi.site,http-vhosts.filelist=/opt/SecLists/Discovery/DNS/subdomains-top1million-5000.txt www.crapi.site

# gobuster
gobuster vhost -k --append-domain -u crapi.site -w /opt/SecLists/Discovery/DNS/subdomains-top1million-20000.txt

# openssl
openssl s_client -connect www.crapi.site:443 2>&1 < /dev/null | openssl x509 -noout -text | grep -i dns