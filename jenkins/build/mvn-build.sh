#!/bin/bash

# SCRIPT FOR BUILDING THE JAR FILE AND TESTING THE JAVA APPLICATION [mvn -B -DskipTests clean package ; mvn test]
docker run --rm -v $PWD/simple-java-maven-app:/app -v /root/.m2:/root/.m2 -w /app maven mvn -B -DskipTests clean package