
# AS
Autonomous System (AS) number registered to an organization or entity

```sh
whois -h whois.ripe.net AS50810
frefox https://bgp.he.net
firefox https://ipinfo.io/AS50810
```

```python
from ipwhois.net import Net
from ipwhois.asn import IPASN

net = Net("AS50810")
asn_data = IPASN(net)
print(asn_data.lookup())
```