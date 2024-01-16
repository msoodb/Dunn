

httprobe which is a tool for quickly probing for active http and https servers. If you have a list with subdomains you can quickly check which are active by using this tool.

# How to install: 
sudo apt install httprobe

cat subdomains | httprobe -c 50 > subdomains.http
