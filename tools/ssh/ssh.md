ssh jake@$target.ip
ssh -i id_rsa jake@target.ip
scp -i id_rsa jake@target.ip:~/file.txt .

# Allow Or Deny SSH Access To A Particular User Or Group In Linux 
- /etc/ssh/sshd_config
    - AllowUsers sk
    - AllowUsers user1 user2
    - AllowGroups root
    - DenyUsers sk
    - DenyGroups root
    - PermitRootLogin no
- sudo systemctl restart sshd