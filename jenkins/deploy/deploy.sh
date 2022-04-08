#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

ssh -o StrictHostKeyChecking=no
scp -i /opt/id_rsa /tmp/.auth prod-user@13.232.108.13:/tmp/.auth
scp -i /opt/id_rsa ./jenkins/deploy/publish prod-user@13.232.108.13:/tmp/publish
ssh -i /opt/id_rsa prod-user@13.232.108.13 "/tmp/publish"
