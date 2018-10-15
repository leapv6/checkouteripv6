#!/bin/bash

CHECK_FLAG=0
while read IPstr
do
	echo $IPstr
	ping6 -w3 -c3 -i0.01 $IPstr > /dev/null; AA=$?
	echo '__________________________';
	#正常能ping通
	echo $AA
	if [ $AA -eq 0 ];then
		CHECK_FLAG=1
		break
	fi
done < ip.txt2
echo $CHECK_FLAG
STEP=600
ts=`date +%s`	
jsonData="[{\"metric\": \"leap6-checkouteripv6-mainswitch\", \"endpoint\": \"checkouteripv6\", \"timestamp\": $ts,\"step\": $STEP,\"value\": $CHECK_FLAG,\"counterType\": \"GAUGE\",\"tags\": \"\"}]"		
curl -X POST -d "$jsonData" http://127.0.0.1:1988/v1/push



