#!/usr/bin/env bash

set -ue ${DEBUG:+-x}

[ -x "$(command -v jq)" ]
[ -x "$(command -v vault)" ]

recursive_walk() {
  local command="${1}"
  local path="${2}"
  for item in $(vault list -format=json "${path}" | jq -r '.[]'); do
    if [ "${item%/}" == "${item}" ]; then
      vault "${command}" "${path}/${item}"
    else
      recursive_walk "${command}" "${path}/${item%/}"
    fi
  done
}

recursive_walk "${1%/}" "${2}"
