#!/bin/bash
# Script Heading
VALUE=1
(VALUE=4; echo $VALUE; exit 0)

echo "$VALUE, $? "


