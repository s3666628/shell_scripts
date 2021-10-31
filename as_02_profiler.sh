#!/bin/bash

# This is Profiler Script for Unix Admin Assigment 02

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

check_process_running $1

# if process is running then collect data

free
