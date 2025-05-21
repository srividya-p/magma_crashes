#! /bin/bash

# https://www.cve.org/CVERecord?id=CVE-2018-10768

docker run --rm \
    $TAG \
    pdfimages $CRASHFILE /dev/null

# Segmentation fault: exit code 139 (SIGSEGV)
echo "Exit code: $?"
