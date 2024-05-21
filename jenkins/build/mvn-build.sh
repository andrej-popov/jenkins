#!/bin/bash

echo "************************"
echo "**** BUILDING A JAR ****"
echo "************************"

WORKSPACE=/var/jenkins_home/workspace/pipeline-maven-docker
# SCRIPT FOR BUILDING THE JAR FILE AND TESTING THE JAVA APPLICATION [mvn -B -DskipTests clean package ; mvn test]
docker run --rm -v $WORKSPACE/simple-java-maven-app:/app -v /root/.m2:/root/.m2 -w /app maven mvn -B -DskipTests clean package