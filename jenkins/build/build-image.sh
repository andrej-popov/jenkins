#!/bin/bash



#COPY NEW JAR TO THE BUILD DIRECTORY
cp -f $PWD/simple-java-maven-app/target/*jar jenkins/build/

docker build -t maven-project:15 $PWD/jenkins/build/

#BUILD THE IMAGE USING THE GENERATED JAR FILE
#docker-compose -f jenkins/build/docker-compose-build.yaml build
