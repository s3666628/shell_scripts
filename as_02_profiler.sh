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
END_SCRIPT=0
OUTPUT_FILE=output_results.txt

# applications

ECHO=/usr/bin/echo
MPSTAT=/usr/bin/mpstat
FREE=/usr/bin/free
PRINTF=/usr/bin/printf
AWK=/usr/bin/awk
# start of actual code
$ECHO
$ECHO "Running Profiler Script"



# check whether the proces is running
# if the process is not running then no point in going further

check_process_running(){
$ECHO "Checking the process is running"
process=$(pgrep $1)
if [[ -n $process ]]
then
	$ECHO "The process for the program: $1 is running, the process_id: $process"
	$ECHO
	
	return 0
else
	$ECHO "cannot find a process running for $1"
	$ECHO "Exiting Script"
	exit 0
	fi
	
}

check_temp_infor(){
# if process is running then collect data
cpu=$(<$CPU_TEMP_PATH)
$PRINTF "CPU TEMP: %0.2f\n" $((cpu/$TEMP_CONVERT))
$PRINTF "%0.2f, " $((cpu/$TEMP_CONVERT)) >> $OUTPUT_FILE 
gpu=$(vcgencmd measure_temp)
trim_gpu=${gpu:5:8}
$ECHO "GPU TEMP: $trim_gpu$ZERO" | tr -d "temp=C'"
$ECHO "$trim_gpu$ZERO, " | tr -d "temp=C'" >> $OUTPUT_FILE
freq=$(vcgencmd measure_clock arm)
trim_freq=${freq:14}
$PRINTF "CPU FREQ: %0.2f\n" $(($trim_freq/$HZ_GHZ))
$PRINTF "%0.2f, " $(($trim_freq/$HZ_GHZ)) >> $OUTPUT_FILE
}

check_memory_info(){
# outputs information on memory useage to text file
$FREE -ght > output_free.txt
}
check_mpstat_info(){
# outputs information on CPU useage to text file
$MPSTAT -u > output_mpstat.txt
}

end_script(){
$ECHO "Ending Script"
END_SCRIPT=1

}

ouput_files_headers(){
$ECHO "SECS, CPU_T, GPU_T, CPU_F, MEM_F" >> $OUTPUT_FILE

}



# Execution Starts Here
check_process_running $1

# start calling the functions
ouput_files_headers
while [[ $END_SCRIPT -eq 0 ]]; do
$ECHO SECOND: $SECOND
$ECHO $SECOND >> $OUTPUT_FILE
check_memory_info
check_temp_infor
check_mpstat_info
# format the output information of $MPSTAT and $FREE

$AWK '{if(length($13) > 0 && (NR==4)) {printf "%.2f,", 100-$13 }}' output_mpstat.txt >> $OUTPUT_FILE
$AWK '{if(length($7) > 0) {printf "%.2f, ", $7}}' output_free.txt | sed s/Gi// >> $OUTPUT_FILE
$AWK '{if(length($13) > 0 && (NR==4)) {printf "CPU USE: %.2f percent\n", 100-$13 }}' output_mpstat.txt
$AWK '{if(length($7) > 0) {printf "MEM FREE: %.2f GBs\n", $7}}' output_free.txt | sed s/Gi//
SECOND=$((SECOND+1))
$ECHO 
$ECHO "Process ID $$"
trap end_script USR1
sleep 3
done



