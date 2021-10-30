#!/bin/bash
# Script Heading
while getopts ":abc:d" opt; do
case $ opt in
a) 
echo "-a was triggered!" >&2
b) 
echo "-b was triggered!" >&2
c) 
echo "-c was triggered!" >&2
d) 
echo "-d was triggered!" >&2
\?) 
echo "Invalid Option: -$OPTARG" >&2
;;
esac
done
