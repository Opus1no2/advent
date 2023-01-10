#!/bin/bash

# Create an array of directories in the current directory
dirs=(*)

# Sort the array
dirs=( $(for dir in "${dirs[@]}"; do echo "$dir"; done | sort -n) )

# Get the last element of the array (which will be the maximum number)
max=${dirs[${#dirs[@]}-1]}

# Increment the maximum number by 1
((max++))

# Create a new directory with the incremented maximum number
mkdir "$max"
cd "$max"
touch input.txt sample.txt part_one.rb part_two.rb
