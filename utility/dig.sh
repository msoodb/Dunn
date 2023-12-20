#!/bin/bash

# ----------------------------------
#   Domain Validation
# ----------------------------------

TARGET=$1

# Domain Validation
dig $TARGET > dig
dig +short $TARGET > dig.short
dig +short ns $TARGET > dig.short.ns
dig +trace $TARGET > dig.trace
host $TARGET > host
