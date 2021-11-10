#!bin/bash
# LAB 08
# a simple copy script
cp $1 $2
# Let's verify that script worked - bad way
echo Details for $2
ls -lh $2
# verify - better way
if [["$?" -eq "0"]];then ... ;fi

