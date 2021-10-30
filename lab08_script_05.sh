#!/bin/bash
# Script to Check file status
echo "checking if the file: $1 exists in the directory $PWD"
if [[ -r $1  ]]
then
	echo "The file $1 has been found in this directory and is readable by $USER"
else
	echo "The file $1 was not found in the dir: $PWD"
fi

if [[ -s $1 ]]
then 
	echo "The file is empty"
else
	echo "The file has data inside"
fi


