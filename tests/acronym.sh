#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

source scripts/lib/acronym.sh

assert_acronym() {
  local input=$1
  local expected=$2
  local actual

  actual=$(acronym "$input")
  if [[ $actual != "$expected" ]]; then
    printf 'acronym %q: expected %q, got %q\n' \
      "$input" "$expected" "$actual" >&2
    return 1
  fi
}

assert_acronym 'as soon as possible' 'ASAP'
assert_acronym 'hello world' 'HW'
assert_acronym '' ''
