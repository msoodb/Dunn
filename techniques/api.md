


1. Endpoint/URL
2. Body
3. Query parameters
4. Headers


## Test Using Postman
- Import the YAML File
- Setup Variables
1. Functional Testing Workflow
    - Test Endpoint Functionality
    - Validate Response Codes
    - Test Request Headers
    - Test Required and Optional Parameters
2. Security Testing Workflow
    - Authentication Tests
    - Injection Testing
        - SQL Injection: ' OR 1=1 --
        - Command Injection: ; ls -la
        - Path Traversal: ../../etc/passwd
    - Rate Limiting
    - CORS Misconfiguration
3. Reliability testing
4. Performance testing
- Automated Testing with Postman Runner

https://chatgpt.com/share/677d6830-1fd4-8007-b7e1-a488c39c50f1







# Security Testing Checklist for Endpoint /api/vpn/229804/status

1. Input Validation
- Test for SQL Injection using payloads in query parameters, headers, and cookies 
    - 1' OR '1'='1
    - '; DROP TABLE users;--
- Test for Command Injection by injecting commands like 
    - ; ls 
    - && cat /etc/passwd
- Check for Cross-Site Scripting (XSS) by injecting payloads 
    - <script>alert(1)</script>.
- Test for JSON/Path Traversal vulnerabilities with paths 
- ../../../etc/passwd.
- Test for insecure deserialization by sending malicious serialized objects.

2. Authentication and Authorization
Verify the endpoint rejects requests with missing or incorrect cookies (e.g., X-Authorization).
Test for session fixation vulnerabilities by reusing old tokens.
Attempt unauthorized access by altering the resource ID (e.g., changing 229804 in the URL).

3. Session Management
Verify that cookies have Secure, HttpOnly, and SameSite flags set.
Test if intercepted session cookies can be reused from different devices or IPs.
Check if idle sessions are invalidated after a reasonable timeout.

4. Data Exposure
Ensure sensitive information (e.g., X-Authorization) is not exposed in logs, URLs, or responses.
Confirm the endpoint uses HTTPS with TLS 1.2 or higher.
Verify all data transmitted (cookies, headers) is encrypted.

5. Rate Limiting
Perform rapid requests to test for brute force and rate-limiting protections.

6. API Misconfiguration
Verify the CORS policy restricts access to trusted domains.
Check that only the intended HTTP methods (e.g., GET) are enabled.
Ensure error messages do not expose stack traces or sensitive information.

7. Third-Party Libraries
Identify server libraries and verify they are up-to-date and patched.

8. Business Logic
Confirm the GET endpoint is idempotent and does not have unintended side effects.
Verify responses remain consistent when parameters are manipulated.

9. Logging and Monitoring
Ensure sensitive data is not logged in any system logs.
Verify alerts are triggered for unusual access patterns or malicious activity.

10. Content Delivery
Test for vulnerabilities like BREACH in responses using compression (e.g., gzip).



https://apitracker.io/a/varonis
https://www.sqrsec.com/api-fuzzing-lists?subscriber=119fdf3e190eb8ddcecf458f6a65fb21e9303d0a0c1b8192fb4ae8f4327170d4