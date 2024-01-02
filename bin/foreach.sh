#!/bin/bash

for Line in $(cat $FILE);do $(crtsh -d $Line -r >> "domains.dirty");done