

1. Identify Bucket Accessibility
    curl -I https://conveyor-production-uploaded.s3.amazonaws.com
    aws s3 ls s3://conveyor-production-uploaded --no-sign-request

2. Test for Object Accessibility
    curl -I https://conveyor-production-uploaded.s3.amazonaws.com/index.html
    curl -I https://conveyor-production-uploaded.s3.amazonaws.com/README.md


3. Check for Website Configuration
    curl -I http://conveyor-production-uploaded.s3-website.amazonaws.com    //Replace the region (s3-website) with the appropriate endpoint if needed.

4. Use S3 Security Testing Tools
    s3scanner scan -b conveyor-production-uploaded
    s3scanner scan -f assault_alpha/aws-s3.txt
    AWSBucketDump:                                                          //Search for public objects in the bucket.

5. Search for Sensitive Data
    grep -ri "key" ./downloaded-files       //Download accessible files and analyze them for sensitive information (e.g., credentials, private keys, or PII).

6. DNS Enumeration
    dig conveyor-production-uploaded.s3.amazonaws.com //If the bucket is mapped to a custom domain, test the domain for security vulnerabilities.

7. Check for Cross-Origin Resource Sharing (CORS)
    curl -I -X OPTIONS https://conveyor-production-uploaded.s3.amazonaws.com    //Look for CORS headers in the response to understand cross-origin policies.

8. Monitor HTTP Responses
    200 OK: The bucket or object is publicly accessible.
    403 Forbidden: The bucket exists but is not public.
    404 Not Found: The bucket or object does not exist.
    
    x-amz-bucket-region: us-east-1
    x-amz-request-id: 011A1Q6B0S649PJS
    x-amz-id-2: QtaocIyvxGWylSbTs9gZnbymY654GxLmiUTj/QmWYuj4et1H4aZUVhxSewQPSjmm/Rxu53y2nSz1vEkl7rMpU2rfRc/+52gO


9. Check Subdomain Takeover
    nslookup conveyor-production-uploaded.s3.amazonaws.com  //If the bucket doesn’t exist, investigate further for takeover possibilities.

10. Document Findings
    Record all results, including response codes, accessible objects, and any vulnerabilities discovered. Report findings responsibly if you identify misconfigurations.

###
https://buckets.grayhatwarfare.com/files?keywords=production
https://www.intigriti.com/researchers/blog/hacking-tools/hacking-misconfigured-aws-s3-buckets-a-complete-guide