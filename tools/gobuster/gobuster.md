

gobuster dir -u http://target.ip  -w /usr/share/wordlists/dirb/common.txt > dir.80
gobuster dir --url http://target.ip -x php,txt,tar,zip,old,bak -t 100 --wordlist /usr/share/seclists/Discovery/Web-Content/big.txt > dir.80
