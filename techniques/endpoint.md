# Payloads for Endpoint Testing

## Authentication and Authorization
- Expired JWT: Replace $TOKEN with an expired token.
- Manipulated JWT: Alter the payload or signature of $TOKEN.
- Missing JWT claims: Generate a JWT without claims like iss, sub, or aud.
- Replayed JWT: Use a previously valid $TOKEN multiple times.
- Lower-privilege JWT: Use a token with restricted permissions.

## Input Validation
- SQL Injection: id=18838' OR '1'='1
- XSS: id=<script>alert('XSS')</script>
- Code Injection: id=__import__('os').system('ls')
- Excessively long payload: id= followed by a very long string (e.g., 10,000 characters).
- Invalid data type: id="invalid_string"

## Business Logic
- Parameter tampering: id=99999 (nonexistent ticket ID).
- Type manipulation: id=-18838 (negative ID value).
- Duplicate submission: Repeating the same request with id=18838.

## Data Protection
- Sensitive data exposure: Normal request and analyze response for sensitive information.
- Referer header bypass: Remove the Referer header.
- CORS misconfiguration: Add a forged Origin header like Origin: https://malicious.com.

## Rate Limiting
- Brute force: Send multiple requests with id values in quick succession.
- DoS attack: Send requests with an overly large id parameter (e.g., id= followed by a 1 MB payload).

## Security Headers
- Missing critical headers: Normal request and analyze response headers.
- Header injection: Add a malicious header value like X-Test: Test\r\nInjected-Header: injected_value.

## Error Handling
- Invalid payload: Use an empty or malformed id value (e.g., id= or id=[]).
- Unauthorized access: Omit the Authorization header.

## Third-Party Integration
- Dependency vulnerability: Not applicable for direct payloads; requires dependency analysis.

## Session Handling
- Session fixation: Reuse an old $COOKIE value from a prior session.
- Expired session: Use an expired $COOKIE value.
