#! /bin/bash
set -e

source config

if [ -z "$TARGET" ]; then
    echo "TARGET is not set. Exiting."
    exit 1
fi

if [ -z "$BUG" ]; then
    echo "BUG is not set. Exiting."
    exit 1
fi

TAG="${TARGET,,}-${BUG,,}:latest"
CRASHFILE=/test/crash

pushd $TARGET

docker build -t $TAG .\
    --build-arg BUG=$BUG \
    --build-arg CRASHFILE=$CRASHFILE

TAG=$TAG CRASHFILE=$CRASHFILE $BUG/poc.sh

popd
