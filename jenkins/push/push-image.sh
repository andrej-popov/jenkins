#!/bin/bash

IMAGE="maven-project"
BUILD_TAG="12"
echo "*****************************"
echo "** Logging into Docker Hub **"
echo "*****************************"

docker login -u andrejpopov -p $PASS

echo "*****************************"
echo "**  Tagging Docker image  **"
echo "*****************************"

docker tag $IMAGE:$BUILD_TAG andrejpopov/$IMAGE:$BUILD_TAG

echo "*****************************"
echo "**  Pushing to Docker Hub  **"
echo "*****************************"

docker push andrejpopov/$IMAGE:$BUILD_TAG
