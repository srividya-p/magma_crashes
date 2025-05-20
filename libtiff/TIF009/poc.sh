#! /bin/bash

# https://www.cve.org/CVERecord?id=CVE-2019-7663

docker run --rm \
    $TAG \
    tiffcp /test/crash /test/crash_out

# Segmentation fault: exit code 139 (SIGSEGV)
echo "Exit code: $?"
