
cat /etc/passwd > passwd.txt
cat /etc/shadow > shadow.txt
unshadow passwd.txt shadow.txt > unshadowed.txt
hashcat -m 1800 unshadowed.txt rockyou.txt -O



[hash-with-salt]            hashcat -m 1710 -a 0 hash:salt /usr/share/wordlists/rockyou.txt
                            hashcat -a 0 -m 0 f806fc5a2a0d5ba2471600758452799c /usr/share/wordlists/rockyou.txt



 hashcat -a 0 -m 16500 <YOUR-JWT> /path/to/jwt.secrets.list 

 hashcat -a 0 -m 16500 eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJuYXNoZXItcGlzaGtoYW4tYWNjZXNzIiwiaWF0IjoxNzA3NzM2Mzc0LCJleHAiOjE3MDc4MjI3NzQsInVzZXJfaW5mb19lbWFpbCI6Im1zb29kYnJlYWxAZ21haWwuY29tIiwicHVibGlzaGVyX2lzX2tleV9hY2NvdW50IjpmYWxzZX0.sfGTPRkG24dTU5O0RPPPDSJKJyC4uPYJpMC6KvNtNK8 ~/wordlist/jwt.secrets.list


 ## Simple md5 hash
 hashes.txt list of md5 hash
 hashcat -m 0 hashes.txt ~/wordlist/rockyou.txt
 hashcat -m 0 --show hashes.txt


 17800