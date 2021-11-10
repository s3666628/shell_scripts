#!/bin/bash
# Script Heading
while getopts ":a" opt; do case $opt in
           a)
                echo "-a was triggered!" >&2
                ;;
           \?)
                echo "Invalid option: -$OPTARG" >&2
                ;;
esac
done
