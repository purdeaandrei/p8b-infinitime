#!/usr/bin/env bash

ADDR=${1:-"D5:DF:61:E5:8F:CE"}
echo "Using address $ADDR"
cd "${0%/*}"

source ./infinitime_version.sh

cd ../InfiniTime
