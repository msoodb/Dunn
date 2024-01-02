# key file
openssl enc -d -aes-128-cbc -base64 -nosalt -pbkdf2 -in ciphertext.enc -out recieve.txt -kfile secret

# key
openssl enc -d -aes-128-cbc -base64 -nosalt -pbkdf2 -in ciphertext.enc -out recieve.txt -K 902FB4FDD1BCE80EE854DC28ECFAB7D2 -iv 485659B27D05358B77C6A8FBAC259E21

# passphrase
openssl enc -d -aes-128-cbc -base64 -nosalt -pbkdf2 -in ciphertext.enc -out recieve.txt -k nbw1#lzQq21
