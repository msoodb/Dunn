# Install
git clone git@github.com:tomnomnom/fff.git
cd fff
go build 
sudo cp fff /usr/bin

fff -h


# usage
cat hosts | fff -d 1 -S -o ./fffo