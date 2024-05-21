#!/bin/bash

echo "************************"
echo "**** BUILDING A JAR ****"
echo "************************"

WORKSPACE=/var/jenkins_home/workspace/pipeline-maven-docker
#echo $WORKSPACE
#echo "pwd: $(pwd)"
# SCRIPT FOR BUILDING THE JAR FILE AND TESTING THE JAVA APPLICATION [mvn -B -DskipTests clean package ; mvn test]
docker run --rm -w /app -v $WORKSPACE/simple-java-maven-app:/app -v /root/.m2:/root/.m2 maven sh #mvn -B -DskipTests clean package