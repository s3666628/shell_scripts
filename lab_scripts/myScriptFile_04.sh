#!/bin/bash
#printf "What is your name? "
#read name
#echo "Hello $name ! "
echo "System Set Variables"

echo "\$0 is the name of the bash script : $0"
echo "\$1 is the name of argument 1: $1"
echo "\$2 is the name of argument 2: $2"
echo "\$3 is the name of argument 3: $3"
echo "\$4 is the name of argument 4: $4"
echo "\$5 is the name of arguemnt 5: $5"
echo "\$6 is the name of argument 6: $6"
echo "\$7 is the name of argument 7: $7"
echo "\$8 is the name of argument 8: $8"
echo "\$9 is the name of argument 9: $9"
echo "\$\# is the number of arguments pushed to the script: $#"
echo "\$? is the exit status of most recently run script: $?"
echo "\$$ is the Process ID of the current script: $$"
echo "\$USER is the name of the user running the script: $USER"
echo "\$HOSTNAME is the Machine the Script is Running on : $HOSTNAME"
echo "\$SECONDS is the number of seconds since script was started: $SECONDS"
echo "\$RANDOM is a different random number each time it is refered to: $RANDOM"
echo "\$LINENO is a Returns the line number in the bash script: $LINENO"