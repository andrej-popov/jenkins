#!/bin/bash
#THIS IS ALL DONE ON THE JENKINS SERVER !!!!!!!

#SCP THE FILE CONTAINING THE VARIABLES TO THE REMOTE SERVER
echo maven-project > /tmp/.auth
echo $TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

echo "******************"
echo "*****Env vars*****"
echo "******************"

cat /tmp/.auth

#IF I HAVE THIS SCRIPT ON JENKINS SERVER DO BELOW
scp -i /tmp/logiranje.pem /tmp.auth ec2-user@ec2-3-68-29-229.eu-central-1.compute.amazonaws.com:/tmp/.auth 'ls -l /tmp/.auth'
scp -i /tmp/logiranje.pem publish.sh ec2-user@ec2-3-68-29-229.eu-central-1.compute.amazonaws.com:/tmp/

ssh -i /tmp/logiranje.pem ec2-user@ec2-3-68-29-229.eu-central-1.compute.amazonaws.com '/tmp/publish.sh'

