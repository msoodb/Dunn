
# Underestand Process
1. Sign up with one of your Gmail accounts, Analyze the request for:
    - API endpoint: URL, HTTP method.
    - Headers: Look for Content-Type, Authorization, etc.
    - Payload: Parameters sent in the body (email, password, etc.).
2. Observe Responses, Look for:
    - Success or error messages.
    - Status codes (200, 400, 500).
    - Server-side validation mechanisms.
    - Any sensitive data leakage in responses.
3. Verify Email Flow, Check the email received for:
    - Proper formatting.
    - Presence of confirmation links or tokens.
4. Analyze the confirmation link:
    - Intercept it to inspect any tokens or identifiers.
    - Attempt to reuse the token after confirmation to test expiry.



# Test Processes
1. Sign up with one of your Gmail accounts, Analyze the request for:
    - API endpoint: URL, HTTP method.
    - Headers: Look for Content-Type, Authorization, etc.
    - Payload: Parameters sent in the body (email, password, etc.).
2. Observe Responses, Look for:
    - Success or error messages.
    - Status codes (200, 400, 500).
    - Server-side validation mechanisms.
    - Any sensitive data leakage in responses.
4. Verify Email Flow
1. Duplicate registration / Overwrite existing user.
     - abc@gmail.com
     - Abc@gmail.com
2. No Rate Limit at Signup Page.
5. Insufficient Email Verification.
    - Check the email received for:
        - Proper formatting.
        - Presence of confirmation links or tokens.
    - Analyze the confirmation link:
        - Intercept it to inspect any tokens or identifiers.
        Attempt to reuse the token after confirmation to test expiry.


# Test Inputs
1. Invalid email formats:
    - Payload: test@example.com, test@@example.com, test@.com, etc.
2. Weak passwords:
    - Paylaod: 123456, password, abc.
3. DOS at Name/Password field in Signup Page. By sending a very long string (100000 characters).
4. Cross-Site Scripting (XSS) in username, account name for registration.
    - Payload for Username field : <img src=x onerror=alert(1)>
    - Payload for Email field : “><svg/onload=confirm(1)>”@x.y
5. SQL injection (sqli) in username, account name for registration.
    - Payload: ' OR 1=1 --



# Reference
https://medium.com/@albert.kim/understanding-user-authentication-in-your-web-app-and-how-to-implement-it-part-1-the-high-level-ab91336ab77c