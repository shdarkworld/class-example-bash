#!/bin/bash

LED_3=/sys/class/leds/beaglebone:green:usr3

function removeTrigger
{
	# writes "none" in trigger
	echo "none" >> "$LED_3/trigger"
}

echo "LED Script running"
if [ $# != 1 ]; then 
	# Checks if number of arguments are right 
	echo "Number of arguments wrong"
	exit 2
fi
if [ "$1" == "on" ]; then
	# Turns on LED3
	echo "LED3 on"
	removeTrigger
	echo "1" >> "$LED_3/brightness"
elif [ "$1" == "off" ]; then
	# Turns off LED3
	echo "LED off"
	removeTrigger
	echo "0" >> "$LED_3/brightness"
elif [ "$1" == "flash" ]; then
	# LED3 starts flashing 50ms on, 50ms off (needs sudo)
	echo "LED flashing"
	removeTrigger
	echo "timer" >> "$LED_3/trigger"
	echo "50" >> "$LED_3/delay_on"
	echo "50" >> "$LED_3/delay_off"
else
	echo "Wrong arguments"
fi
echo "Script Done"
