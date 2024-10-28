
sudo vim /etc/tor/torsocks.conf

# Default Tor address and port. By default, Tor will listen on localhost for
# any SOCKS connection and relay the traffic on the Tor network.
TorAddress 127.0.0.1
TorPort 9050


on | off
    This  option  adds  or  removes  torsocks(8) from the LD_PRELOAD
    environment variable for the current shell. If you want  to  use
    this option, you HAVE to source torsocks from your shell.

    Add the torsocks library to LD_PRELOAD
    $ . torsocks on

    Remove the torsocks library from LD_PRELOAD
    $ . torsocks off


torsocks curl https://api.myip.com