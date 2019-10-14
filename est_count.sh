#!/bin/bash

# at 1st
#sudo mkdir /var/log/custom ; sudo chown labunix:labunix /var/log/custom

ss -tn | \
  awk -v now=$(date '+%Y/%m/%d,%H:%M:%S') \
    'BEGIN{p=0;a=0}{if(/:8080/&&/ESTAB/){p++}else{if(/EST/){a++}}}END{OFS=",";print now,p,a}' \
  >> /var/log/custom/$(date '+%Y%m').log

