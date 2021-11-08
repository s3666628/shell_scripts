#!/bin/bash
tease(){
	echo "echo no, you can't do that"
	echo "ha ha"

}
trap tease SEGV
trap tease USR1
while true ; do
	echo you cannot stop me
	sleep 1
done
