#!/bin/bash

#cd ~/.working-time-counter

case $1 in
	start)
		python3 start.py $2 $3
		;;
	stop)
		python3 stop.py $2
		;;
	help)
		cat ../help.txt
		;;
	*)
		cat ../help.txt
		;;
esac