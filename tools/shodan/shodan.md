
shodan init $SHODAN_API

# Original IP
shodan search Ssl.cert.subject.CN:”hackerone.com” 200 — fields ip_str | httpx