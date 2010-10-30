#!/bin/sh
#
# $scrotwm: baraction.sh,v 1.17 2010/07/01 19:49:37 marco Exp $

print_date() {
	# The date is printed to the status bar by default.
	# To print the date through this script, set clock_enabled to 0
	# in scrotwm.conf.  Uncomment "print_date" below.
	FORMAT="%d-%m-%Y %k:%M"
	DATE=`date "+${FORMAT}"`
	echo -n "${DATE}"
}

print_mem() {
	MEM=`/usr/bin/top | grep Free: | cut -d " " -f7`
	echo -n "Mem: $MEM  "
}

#_print_cpu() {
print_sysload() {
	SYSLOAD=`sysctl -n vm.loadavg|awk '{print "[" $1 ", " $2 ", " $3 "]"}'`
	echo -n "${SYSLOAD}"
	#typeset -R4 _1=${1} _2=${2} _3=${3} _4=${4} _5=${5}
	#echo -n "CPU:${_1}% User${_2}% Nice${_3}% Sys${_4}% Int${_5}% Idle  "
}

print_cpu() {
	OUT=""
	# iostat prints each column justified to 3 chars, so if one counter
	# is 100, it jams up agains the preceeding one. sort this out.
	while [ "${1}x" != "x" ]; do
		if [ ${1} -gt 99 ]; then
			OUT="$OUT ${1%100} 100"
		else
			OUT="$OUT ${1}"
		fi
		shift;
	done
	_print_cpu $OUT
}

print_apm() {
	BAT_STATUS=$1
	BAT_LEVEL=$2
	AC_STATUS=$3

	if [ $AC_STATUS -ne 255 -o $BAT_STATUS -lt 4 ]; then
		if [ $AC_STATUS -eq 0 ]; then
			echo -n "on battery (${BAT_LEVEL} min)"
		else
			case $AC_STATUS in
			1)
				AC_STRING="AC: "
				;;
			2)
				AC_STRING="Backup AC: "
				;;
			*)
				AC_STRING=""
				;;
			esac;
			case $BAT_STATUS in
			4)
				BAT_STRING="(No battery)"
				;;
			[0-3])
		 		BAT_STRING="(Battery ${BAT_LEVEL})"
				;;
			*)
				BAT_STRING="(Battery unknown)"
				;;
			esac;
		
			FULL="${AC_STRING}${BAT_STRING}"
			if [ "$FULL" != "" ]; then
				echo -n "$FULL"
			fi
		fi
	fi
}

print_cpuspeed() {
	CPU_SPEED=`/sbin/sysctl hw.cpuspeed | cut -d "=" -f2`
	echo -n "CPU: $CPU_SPEED MHz  "
}

print_temp() {
	echo -n "`sysctl -n hw.sensors.acpitz0.temp0|awk '{print $1}'`C"
}

while :; do
	# instead of sleeping, use iostat as the update timer.
	# cache the output of apm(8), no need to call that every second.
	/usr/sbin/iostat -C -c 3600 |&	# wish infinity was an option
	PID="$!"
	APM_DATA=""
	I=0
	trap "kill $PID; exit" TERM
	while read -p; do
		if [ $(( ${I} % 1 )) -eq 0 ]; then
			APM_DATA=`/usr/sbin/apm -amb`
		fi
		if [ $I -gt 2 ]; then
			echo -n "[  "
			print_mem $MEM
			echo -n " /  "
			#print_cpu $REPLY
			print_temp
			echo -n " /  "
			print_cpuspeed
			echo -n " /  "
			print_sysload
			echo -n " /  "
			print_apm $APM_DATA
			echo -n " /  "
			print_date
			echo -n "   ]"
			echo ""
		fi
		I=$(( ${I} + 1 ));
	done
done
