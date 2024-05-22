#!/bin/bash

IMAGE="maven-project"


echo "*****************************"
echo "** Logging into Docker Hub **"
echo "*****************************"

docker login -u andrejpopov -p $PASS

echo "*****************************"
echo "**  Tagging Docker image  **"
echo "*****************************"

docker tag $IMAGE:$TAG andrejpopov/$IMAGE:$TAG

echo "*****************************"
echo "**  Pushing to Docker Hub  **"
echo "*****************************"

docker push andrejpopov/$IMAGE:$TAG
