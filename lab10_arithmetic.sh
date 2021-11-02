#!/bin/bash
# Script Heading

# basic arithmetic using let
let a=5+4
echo $a
let "b = 5 + 4"
echo $b
echo "b ++"
let b++
echo $b


let "a = 4 * 5"
echo $a # 20

let "a = $1 + 30"

echo $a# 30 + first command line argument

# basic arithmetic using expr

expr 5 + 4
expr "5 + 4"

expr 5+4

expr 5 \* $1

expr 11 % 2

a=$( expr 10 - 3 ) 

echo $a

# another way using $((expression))
# basic arithmetic using double parentheses

a=$(( 4 + 5 ))
echo $a

# works the same without the spacing

a=$((4+5))
echo $a

# including variables without the dollar sign

b=$(( a + 7 ))
echo $b


# including variables WITH the dollar sign

b=$(( $a + 55 ))
echo $b # 12

(( b++ ))
echo $b # 13


