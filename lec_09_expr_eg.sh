#!/bin/bash
# Script Heading
echo Addition
myAddvar=10
myAddvar=$(expr $myAddvar + 1)
echo "My Add Var: {$myAddvar}"
echo Mulitiplication
multi_var=11
multi_var=$(expr $multi_var \* $multi_var)
echo "My Mulitplication Var: $myAddvar"
echo $multi_var
echo Division
div_var=121
div_var=$(expr $div_var / 10)
echo "My Division Var: $div_var"
echo $div_var
