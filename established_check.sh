#!/bin/bash
#
# Author	:	labunix
# Last Update	:	2012/11/04
# Licence	:	GPL v2
#
# Format
#                : CPEC = Check Port Established Count
#                : APEC = All Port Established Count
#
# yyyy/mm/dd,HH:MM:SS,[Port Number],[CPEC],[APEC]


cd $(dirname $0)

if [ "`id -u`" -ne "0" ];then
  MYOPT='-an'
else
  MYOPT='-anp'
fi

if [ "$#" -lt 1 ] ;then
  CHKPORT=8080
else
  CHKPORT=`echo $1 | awk '{print $1%65536}'`
fi

if [ "$CHKPORT" -eq "0" ];then
  echo 'Usage: ./'$0' [1-65535]'
  exit 1
fi

TEMP=$0.`date '+%s'`
test -f $TEMP || touch $TEMP
test -f $TEMP || exit 1

MYDATE=`date '+%Y/%m/%d,%H:%M:%S'`
netstat $MYOPT | \
  grep "ESTABLISHED" > "$TEMP"
PORTCNT=`grep "$CHKPORT" "$TEMP" | wc -l`
ALLCNT=`wc -l < "$TEMP"`
echo "${MYDATE},${CHKPORT},${PORTCNT},${ALLCNT}"
test -f "$TEMP" && rm "$TEMP"
unset MYDATE CHKPORT MYOPT TEMP ALLCNT PORTCNT
exit 0
