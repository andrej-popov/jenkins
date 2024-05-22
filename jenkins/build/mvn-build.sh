#!/bin/bash

echo "************************"
echo "**** BUILDING A JAR ****"
echo "************************"

WORKSPACE=/var/jenkins_home/workspace/pipeline-maven-docker
#echo $WORKSPACE
#echo "pwd: $(pwd)"

ls -l $WORKSPACE/simple-java-maven-app
docker run --rm -w /app -v $WORKSPACE/simple-java-maven-app:/app -v /root/.m2:/root/.m2 arm64v8/maven ls -l /app
# SCRIPT FOR BUILDING THE JAR FILE AND TESTING THE JAVA APPLICATION [mvn -B -DskipTests clean package ; mvn test]
docker run --rm -w /app -v $WORKSPACE/simple-java-maven-app:/app -v /root/.m2:/root/.m2 arm64v8/maven mvn -B -DskipTests clean package