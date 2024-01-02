#!/bin/bash


# install
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest


# Usage
nuclei -u https://example.com

# UPDATE:
nuclei -up
nuclei -ut
