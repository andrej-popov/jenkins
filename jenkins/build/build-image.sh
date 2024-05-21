#!/bin/bash


WORKSPACE=/var/jenkins_home/workspace/pipeline-maven-docker
#COPY NEW JAR TO THE BUILD DIRECTORY
cp -f $WORKSPACE/simple-java-maven-app/target/*jar jenkins/build/

docker build -t maven-project:13 $WORKSPACE/jenkins/build/

#BUILD THE IMAGE USING THE GENERATED JAR FILE
#docker-compose -f jenkins/build/docker-compose-build.yaml build
