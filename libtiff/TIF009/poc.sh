#! /bin/bash

docker run --rm \
    $TAG \
    tiffcp /test/crash /test/crash_out

echo "Exit code: $?"
