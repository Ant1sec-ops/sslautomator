#Author: Subhash Paudel

#!/bin/bash

# Check if input file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Check if input file exists
if [ ! -f "$1" ]; then
    echo "Input file not found: $1"
    exit 1
fi

# Read each IP address from the input file and scan with sslscan
while IFS= read -r ip; do
    echo "Scanning SSL on $ip"
    sslscan "$ip"
    echo ""
done < "$1"
