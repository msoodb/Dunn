
# How to install: 
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest


httpx -l subdomains.http -sc -td -title -probe -ip -mc 200,301 -o subdomains.httpx
