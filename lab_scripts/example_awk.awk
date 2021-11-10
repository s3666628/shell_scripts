#!/bin/awk -f
# awk basic

BEGIN {print "START Processsing AWK"}

	{print $2, $3, $4/NF}

END {print "STOP Awk"}

