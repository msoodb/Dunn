#!/bin/bash

# Generate and RSA public/private key pair
openssl genrsa -aes256 -out private.pem 2048

# Extract the public key from the file
openssl rsa -in private.pem -pubout -out bob_public.pem

# Send public key to All include Alice
cp bob_public.pem ../alice

# Recieve secret.key file

# Decrypt the secret.key file
openssl rsautl -decrypt -inkey private.pem -in secret.enc -out secret

# Recieve message_from_alice.enc file

# Decrypt Alice’s sensitive information
openssl enc -aes256 -d -base64 -pbkdf2 -in ciphertext.enc -out plaintext.txt -kfile secret
