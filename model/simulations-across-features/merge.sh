#!/bin/bash

# Cleanup previous file

if [ -f simulations-across-features.txt ]; then
    rm simulations-across-features.txt
fi

# Add every file to the merged file 
for f in simulations*.txt; do
    if [ ! -f simulations-across-features.txt ]; then
	head -1 $f > simulations-across-features.txt
    fi
    tail -28800 $f >> simulations-across-features.txt
done

# Zip the main file. This reduces it to a GitHub-manageable size.
zip simulations-across-features.zip simulations-across-features.txt
rm simulations-across-features.txt
