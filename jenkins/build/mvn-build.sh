#!/bin/bash

echo "************************"
echo "**** BUILDING A JAR ****"
echo "************************"

WORKSPACE=/mnt/workspace/pipeline-mvn-1
#echo $WORKSPACE
#echo "pwd: $(pwd)"


ls -l $PWD/simple-java-mvn-1
#docker run --rm -w /app -v $WORKSPACE/simple-java-mvn-app:/app -v /root/.m2:/root/.m2 arm64v8/maven ls -l /app

# SCRIPT FOR BUILDING THE JAR FILE AND TESTING THE JAVA APPLICATION [mvn -B -DskipTests clean package ; mvn test]
docker run --rm -w /app -v $WORKSPACE/simple-java-maven-app:/app -v /root/.m2:/root/.m2 arm64v8/maven "$@"