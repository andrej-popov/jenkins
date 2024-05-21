#!/bin/bash

#COPY NEW JAR TO THE BUILD DIRECTORY
cp -f $PWD/simple-java-maven-app/target/*jar jenkins/build/

#BUILD THE IMAGE USING THE GENERATED JAR FILE
docker-compose -f jenkins/build/docker-compose-build.yaml build
