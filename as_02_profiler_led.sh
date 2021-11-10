#!/bin/bash
# This is LED Script for Assignment 02 - Requirement 8

# References

# https://mathblog.com/floating-point-arithmetic-in-the-bourne-again-shell-bash/
# https://askubuntu.com/questions/88091/how-to-run-a-shell-script-in-background

# applications

ECHO=/usr/bin/echo
PRINTF=/usr/bin/printf
AWK=/usr/bin/awk
SLEEP=/usr/bin/sleep

# Configuration

END_SCRIPT=0
cur_load_res=0
DIVIDING_NUM=5

check_sys_load(){
# function to check the average load on system
# capturing the average load over last 1 minute
$ECHO "System Load for Last 1 Minute:"
average_load=$(cat /proc/loadavg)
current_load=$($ECHO $average_load | $AWK '{print $1}')
# $ECHO $current_load
cur_load_res=$($ECHO $current_load / $DIVIDING_NUM | bc -l)
$ECHO $cur_load_res
cur_load_res=$(printf "%.2f\n" $cur_load_res)

}

switch_green_light_on(){
# function to turn on the light
$ECHO "turning on green light"
# turn on light for fraction of second as determined by 
# check_sys_load calculation

$ECHO 0 | tee /sys/class/leds/led0/brightness # turn light on
$SLEEP $cur_load_res
$ECHO "turning off green light"
$ECHO 1 | tee /sys/class/leds/led0/brightness # turn light on


}
end_script(){
$ECHO "Ending Script"
$ECHO "Restting everything back to normal"
$ECHO mmc0 | tee /sys/class/leds/led0/trigger
END_SCRIPT=1

}

while [[ $END_SCRIPT -eq 0 ]]; do
# $ECHO "Process ID $$"
# call the system load function - get the current load and do the 
check_sys_load
# $ECHO $cur_load_res
switch_green_light_on
trap end_script USR2
done
$ECHO "Script has been terminated by USR2 Signal"
