#!/bin/sh

while true; do
	BATTPERC=`apm -l`
	BATTMIN=`apm -m`
	DATEFORMAT=`date +"%H:%M %d-%m"`
	LOAD=`sysctl -n vm.loadavg`

	echo "Load: ${LOAD}    Batt: ${BATTPERC}% (${BATTMIN}min)    [${DATEFORMAT}]"
	sleep 5;
done
