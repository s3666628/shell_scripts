#!/bin/bash

# This is Profiler Script for Unix Admin Assigment 02

# References
# https://www.cyberciti.biz/faq/linux-find-out-raspberry-pi-gpu-and-arm-cpu-temperature-command/

# configuration
CPU_TEMP_PATH=/sys/class/thermal/thermal_zone0/temp
HZ_GHZ=100000000
TEMP_CONVERT=1000
SECOND=0
CPU_MAX_USE=100
ZERO=0
echo "Running Profiler Script"

# check whether the proces is running
# if the process is not running then no point in going further

check_process_running(){
echo "Checking the process is running"
process=$(pgrep $1)
if [[ -n $process ]]
then
	echo "The process for the program: $1 is running, the process_id: $process"
	echo
	
	return 0
else
	echo "cannot find a process running for $1"
	echo "Exiting Script"
	exit 0
	fi
	
}

check_temp_infor(){
# if process is running then collect data
#echo "Outputting CPU / GPU Temp information"
cpu=$(<$CPU_TEMP_PATH)
printf "CPU TEMP: %0.2f\n" $((cpu/$TEMP_CONVERT))
gpu=$(vcgencmd measure_temp)
trim_gpu=${gpu:5:8}
echo "GPU TEMP: $trim_gpu$ZERO" | tr -d "temp=C'"
freq=$(vcgencmd measure_clock arm)
trim_freq=${freq:14}
printf "CPU FREQ: %0.2f\n" $(($trim_freq/$HZ_GHZ))
}

check_memory_info(){
# outputs information on memory useage
#echo "Outputing memory information"
free -ght > output_free.txt
echo
}
check_mpstat_info(){
# outputs information on CPU useage
#echo "Outputing CPU information"
mpstat -u > output_mpstat.txt
}

# Execution Starts Here
check_process_running $1
echo SECOND: $SECOND
check_memory_info
check_temp_infor
check_mpstat_info
#echo "CPU OUTPUT"
#awk < output_mpstat.txt '{ if (NR>3) {print $13 }}'
awk '{if(length($13) > 0 && (NR==4)) {printf "CPU USE: %.2f percent\n", 100-$13 }}' output_mpstat.txt
#echo "MEMORY OUTPUT"
#awk < output_free.txt '{print $2, $3, $4}'
awk '{if(length($7) > 0) {printf "MEM FREE: %.2f GBs\n", $7}}' output_free.txt | sed s/Gi//



