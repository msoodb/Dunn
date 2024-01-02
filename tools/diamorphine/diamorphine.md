
- git clone git@github.com:m0nad/Diamorphine.git
- make
- insmod diamorphine.ko
- kill -31 <PID>
- tail -f /var/log/kern.log
- rm /var/log/kern.log