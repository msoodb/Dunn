
# Installation

git clone https://github.com/YashGoti/crtsh.py.git
cd crtsh.py
python3 crtsh.py -h

## if you want to use crtsh from anywhere try below installation guide

git clone https://github.com/YashGoti/crtsh.py.git
cd crtsh.py
mv crtsh.py crtsh
chmod +x crtsh
cp crtsh /usr/bin/


# Usage
```sh
for Line in $(cat wildcards);do;$(crtsh -d $Line -r >> domains);done
```