#!/bin/bash


#WORKSPACE=/var/jenkins_home/workspace/pipeline-maven-docker
WORKSPACE=/mnt/workspace/pipeline-mvn-app
#COPY NEW JAR TO THE BUILD DIRECTORY
cp -f $WORKSPACE/simple-java-maven-app/target/*jar jenkins/build/

docker build -t maven-project:14 $WORKSPACE/jenkins/build/

#BUILD THE IMAGE USING THE GENERATED JAR FILE
#docker-compose -f jenkins/build/docker-compose-build.yaml build
