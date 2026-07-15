#!/usr/bin/env bash

acronym() {
  local value=${1-}
  local word
  local result=''
  local -a words=()

  IFS=$' \t\n' read -r -d '' -a words < <(printf '%s\0' "$value")
  for word in "${words[@]}"; do
    result+=${word:0:1}
  done

  printf '%s\n' "$result" | LC_ALL=C tr 'a-z' 'A-Z'
}
