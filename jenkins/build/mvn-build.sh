#!/bin/bash

echo "************************"
echo "**** BUILDING A JAR ****"
echo "************************"

#WORKSPACE=/mnt/jenkins/workspace/jenkins-mvn-1
#echo $WORKSPACE
#echo "pwd: $(pwd)"

# SCRIPT FOR BUILDING THE JAR FILE AND TESTING THE JAVA APPLICATION [mvn -B -DskipTests clean package ; mvn test]
docker run --rm -w /app -v $PWD/simple-java-maven-app:/app -v /root/.m2:/root/.m2 arm64v8/maven "$@"

echo "************************"
echo "********* DONE *********"
echo "************************"
