#!/bin/bash

# Generate a random secret key
openssl rand -base64 32 > secret

# Recieve Bob's public key

# Encrypt the password file using Bob's public key
openssl rsautl -encrypt -in secret -out secret.enc -pubin -inkey bob_public.pem

# Send secret.enc to Bob. Alice and Bob have secret

# Encrypt the traffic using a symmetric algorithm (i.e. ae256) with the secret key
# echo 'Dear Bob If you get this message, please let me know. This is just the beginning. Alice' > plaintext.txt
openssl enc -e -aes256 -base64 -pbkdf2 -in plaintext.txt -out ciphertext.enc -kfile secret

# Send ciphertext.enc to Bob
