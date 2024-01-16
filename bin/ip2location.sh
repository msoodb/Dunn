#!/bin/bash

IP=$1
curl https://api.ip2location.com/v2/?ip=$IP&addon=continent&lang=zh-cn&key=$IP2LOCATION_API_KEY

