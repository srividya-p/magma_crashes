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

pushd $TARGET

docker build -t $TAG .\
    --build-arg BUG=$BUG

TAG=$TAG $BUG/poc.sh

popd
