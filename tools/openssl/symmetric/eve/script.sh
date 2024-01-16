#!/bin/bash

# Brute Force, Dictionary attack passphrase 
input="common.txt"
while IFS= read -r line
do
  echo "$line"
  openssl enc -d -aes-128-cbc -base64 -nosalt -pbkdf2 -in ciphertext.enc -out BFA/recieve$line.txt -k $line
done < "$input"
