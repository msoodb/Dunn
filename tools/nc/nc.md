
# Reverse Shell Listener
nc -vlnp 4444


## Transferring file using Netcat:
Sender           nc 10.8.56.2 443 < file
Reciever         sudo nc -lvnp 443 > file