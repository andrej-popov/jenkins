#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)

echo $IMAGE
echo $TAG
echo $PASS

docker login -u andrejpopov -p $PASS

cd /tmp && docker-compose up -d
