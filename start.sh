#!/bin/bash
export WLANDEV=`airmon-ng | grep rt2800 | awk '{print $2}'`
if [[ ! -z $WLANDEV ]]
then
	pkill -f ".*-i$WLANDEV"
	ip link set $WLANDEV down
	iw dev $WLANDEV set type monitor
	ip link set $WLANDEV up
	python3 probeSniffer.py $WLANDEV 
fi

