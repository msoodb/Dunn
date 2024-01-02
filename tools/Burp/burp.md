
Man in the middle proxy



# Topic
- Getting Burp Proxy
- Setting up Firefox to proxy through Burp
- UI overview
    - Target
    - Proxy
    - Spider
    - Intruder
    - Repeater
    - Sequencer
    - Decoder
    - Comparer
- Target deep dive
    - Using the site map
    - Setting up your scope
- Proxy deep dive
    - Using the HTTP history and filtering
    - Intercepting requests and responses
    - Match and replace
    - Unhiding hidden form fields
- Using Repeater
    - Sending requests from proxy history
    - Manipulating requests
        - Identifying XSS with ease
- Using Decoder
    - Decoding data from a request
    - Encoding and hashing data
- Using Intruder 

# Important
- scope
    - add/remove to scope
    - regex in scope for domain and all subdomains      
        - [*.example.com]  .*\.example\.com$
        - [*web-security-academy.net]  .*\.web-security-academy\.net$
    - remove Out of Scope subdomains then.



# Setup FoxyProxy
- Add FoxyProxy to Firefox
- Add a Burp Proxy
    - Burp > Proxy > Options
    - Add Burp Proxy
- Add the Burp CA
    - Browse http://127.0.0.1:8080/
    - Save Burp CA
    - Import CA to Firefox
- Fix SSL Errors (If Necessary)