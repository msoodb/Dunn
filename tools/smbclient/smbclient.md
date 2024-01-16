export IP=10.10.141.249

smbclient -L \\\\target.ip
smbclient \\\\target.ip\\anonymous
smbclient  -U  milesdyson //target.ip/milesdyson
