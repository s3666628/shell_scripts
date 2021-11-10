#!/bin/bash
# Script to Check file status
echo "changing the directory to $1"
if [[ -d $1  ]]
then
	echo "The director $1 exists so can change to this directory"
	cd $1
	ls -lrt
else
	echo "Sorry, this directory $1 does not exist"
fi



