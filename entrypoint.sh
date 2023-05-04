#!/bin/bash

echo "inside entrypoint.sh"
echo ${1}
echo ${2}
echo "inside entrypoint.sh 2"

set -e

if [[ -z "${TOKEN_KEY}" ]]; then
  echo "Error: missing TOKEN_KEY env variable"
  exit 1
fi

if [[ -z "${API_URL}" ]]; then
  echo "Error: missing API_URL env variable"
  exit 1
fi

echo "$(pwd)"
echo "$(ls -la)"

npx bluemachinecli snapshot create-analyze --repo-id ${1} --file ${2}
