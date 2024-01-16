# source
https://github.com/tomnomnom/waybackurls

# install
git clone git@github.com:tomnomnom/waybackurls.git
cd waybackurls
go build 
sudo cp waybackurlsfff /usr/bin


# usage
waybackurls www.example.com | tee -a urls.wayback

cat urls.wayback | sort -u > urls.wayback.su
cat urls.wayback.su | grep -E "^http.?://www\.example\.com" > urls.wayback.su.inscope