[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## install
```sh
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.5.tgz
sudo tar -xzf apache-jmeter-5.5.tgz -C /opt/
sudo ln -s /opt/apache-jmeter-5.5/bin/jmeter /usr/local/bin/jmeter
```

## elements of jmeter
- test plan
- thread group
- sampler
- listener
- configuration
- assertion

<br/>

## running tests in terminal
```sh
jmeter -n -t ~/Projects-test/saashop/saashop-api-test-plan.jmx -l ~/Projects-test/saashop/saashop-api-test-result.csv
jmeter -n -t ~/Projects-test/saashop/saashop-api-test-plan.jmx -l ~/Projects-test/saashop/saashop-api-test-result.csv -e -o ~/Projects-test/saashop/HTMLreport/
```
