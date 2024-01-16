[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## Exploit-DB in Linux/Fedora
```sh
sudo snap install searchsploit
```

- command
```sh
searchsploit joomla
searchsploit joomla -w
searchsploit joomla --exclude="plugin"
searchsploit joomla | grep facebook
searchsploit metasploit joomla
searchsploit 38797
searchsploit -p 38797
searchsploit 38797 --examine
```

- Examining nmap result
```sh
nmap -sV scanme.nmap.org -oX nmap.xml
searchsploit --nmap nmap.xml
```

# download file with searchsploit
$ searchsploit ajp
    ---------------------------------------------------------------------------------------------------------------------------
    Exploit Title                                                                                    |  Path
    ---------------------------------------------------------------------------------------------------------------------------
    AjPortal2Php - 'PagePrefix' Remote File                                                           | php/webapps/3752.txt
    Apache Tomcat - AJP 'Ghostcat File Read/Inclusion                                                 | multiple/webapps/48143.py
    Apache Tomcat - AJP 'Ghostcat' File Read/Inclusion                                                | multiple/webapps/49039.rb
    ---------------------------------------------------------------------------------------------------------------------------
    Shellcodes: No Results
$ searchsploit -m multiple/webapps/48143.py
