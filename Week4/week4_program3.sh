#!/usr/bin/env bash
set -euo pipefail
name="DevOps"
echo "Hello, $name!"
nums=(1 2 3 4 5 6 7 8 9 10)
even_count=0
odd_count=0
for n in "${nums[@]}"; do
  if (( n % 2 == 0 )); then ((even_count++)); else ((odd_count++)); fi
done
echo "Evens: $even_count, Odds: $odd_count"
i=3
while (( i > 0 )); do
  echo "Countdown: $i"
  ((i--))
done
echo "Blast off!"
