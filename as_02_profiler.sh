#!/bin/bash

# This is Profiler Script for Unix Admin Assigment 02

# References
# https://www.cyberciti.biz/faq/linux-find-out-raspberry-pi-gpu-and-arm-cpu-temperature-command/

# configuration paths
CPU_TEMP_PATH=/sys/class/thermal/thermal_zone0/temp

echo "Running Profiler Script"

# check whether the proces is running
# if the process is not running then no point in going further

check_process_running(){
echo "Checking the process is running"
process=$(pgrep $1)
if [[ -n $process ]]
then
	echo "The process for the program: $1 is running, the process_id: $process"
	
	return 0
else
	echo "cannot find a process running for $1"
	echo "Exiting Script"
	exit 0
	fi
	
}

check_temp_infor(){
# if process is running then collect data
echo "Outputting CPU / GPU Temp information"
cpu=$(<$CPU_TEMP_PATH)
echo "CPU TEMP: $((cpu/1000)) c"
gpu=$(vcgencmd measure_temp)
echo "GPU TEMP: $gpu"
freq=$(vcgencmd measure_clock arm)
echo "CPU Freq: $freq"

}

check_memory_info(){
# outputs information on memory useage
echo "Outputing memory information"
free
echo
}

# Execution Starts Here
check_process_running $1
check_memory_info
check_temp_infor



