#!/bin/bash

# Count from 0 to 1,000,000 with a delay
for ((i=0; i<=1000000; i++))
do
  # Print the counter on the same line
  printf "\rCounter: %d" "$i"
  # Introduce a small delay
  sleep 0.01
done

# Print a newline after the loop ends
echo
