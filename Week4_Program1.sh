#!/usr/bin/env bash
set -euo pipefail
num="${1-}"
if [[ -z "${num}" ]]; then
  read -rp "Enter a number: " num
fi
if ! [[ "${num}" =~ ^-?[0-9]+$ ]]; then
  echo "Error: '${num}' is not an integer." >&2
  exit 1
fi
if (( num % 2 == 0 )); then
  echo "${num} is EVEN"
else
  echo "${num} is ODD"
fi
