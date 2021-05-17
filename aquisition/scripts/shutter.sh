#!/bin/bash
SHUTTERSTATE=$1

ADDRESSES=("10.0.1.11" "10.0.1.12" "10.0.1.13")
for ADDR in ${ADDRESSES[@]}
do
	echo "(shu$SHUTTERSTATE)" | nc  -c  $ADDR 3002 
done

