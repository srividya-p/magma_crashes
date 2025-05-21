#! /bin/bash

# https://www.cve.org/CVERecord?id=CVE-2016-10270

docker run --rm \
    $TAG \
    tiffinfo -D $CRASHFILE

# OOM Error: Memory allocation attempt 4449586117620 over memory limit (268435456)
echo "Exit code: $?"
