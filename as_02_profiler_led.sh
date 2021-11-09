#!/bin/bash
# This is LED Script for Assignment 02 - Requirement 8

# References

# https://mathblog.com/floating-point-arithmetic-in-the-bourne-again-shell-bash/
# https://askubuntu.com/questions/88091/how-to-run-a-shell-script-in-background

# applications

ECHO=/usr/bin/echo
PRINTF=/usr/bin/printf
AWK=/usr/bin/awk


$ECHO "System Load for Last 1 Minute:"
average_load=$(cat /proc/loadavg)
current_load=$($ECHO $average_load | $AWK '{print $1}')
$ECHO $current_load
#cur_load_res=$($ECHO $current_load / 5 | bc -l)
cur_load_res=$($ECHO $current_load / 5 | bc -l)
echo $cur_load_res
printf "%.2f\n" $cur_load_res

#cur_load_res=$(printf "0")
#$PRINTF "0 %0.2f\n" 
#echo $cur_load_res | awk '{print int($2+0.5)}'
#echo 0 | sudo tee /sys/class/leds/led1/brightness
