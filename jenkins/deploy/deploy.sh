#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /opt/id_rsa /tmp/.auth prod-user@3.111.245.210:/tmp/.auth
scp -i /opt/id_rsa ./jenkins/deploy/publish prod-user@3.111.245.210:/tmp/publish
ssh -i /opt/id_rsa prod-user@3.111.245.210 "/tmp/publish"
