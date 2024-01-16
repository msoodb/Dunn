
Linux forensics refers to performing forensic investigation on a Linux operated device.

# Basic Information
```sh
date                    #Date and time (Clock may be skewed, Might be at a different timezone)
uname -a                #OS info
ifconfig -a || ip a     #Network interfaces (promiscuous mode?)
ps -ef                  #Running processes
netstat -anp            #Proccess and ports
lsof -V                 #Open files
netstat -rn; route      #Routing table
df; mount               #Free space and mounted devices
free                    #Meam and swap space
w                       #Who is connected
last -Faiwx             #Logins
lsmod                   #What is loaded
cat /etc/passwd         #Unexpected data?
cat /etc/shadow         #Unexpected data?
find /directory -type f -mtime -1 -print #Find modified files during the last minute in the directory
```


# Shell Commands
- dmesg || journalctl --dmesg
- fsck
- stat
- history
- mount
- journalctl

# Log Files
- In Linux, logs come from different sources, mainly:
    - Systemd journal
    - Syslog
    - The Linux kernel
        - Audit logs
    - Non-system Application
- Some log file
    - /var/log
    - /var/log/syslog
    - /var/log/messages
    - /var/log/kern.log         journalctl -k
    - /var/log/dmesg
    - /var/log/auth.log
    - /var/log/secure
    - /var/log/cron.log
    - /var/log/mail.log 
    - /var/log/maillog
    - /var/log/redis/

# Collecting Volatile Data
- clipboard Contents
- .bash_history
- /proc
- Ps
- Swap Space

# Disk Imaging
```sh
#Create a raw copy of the disk
dd if=<subject device> of=<image file> bs=512

#Raw copy with hashes along the way (more secure as it checks hashes while it's copying the data)
dcfldd if=<subject device> of=<image file> bs=512 hash=<algorithm> hashwindow=<chunk size> hashlog=<hash file>
dcfldd if=/dev/sdc of=/media/usb/pc.image hash=sha256 hashwindow=1M hashlog=/media/usb/pc.hashes
```
