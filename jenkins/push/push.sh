#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"
USER="aswinmkolathur"
PASS="aswin@219"

echo "** Logging in ***"
docker login -u $USER -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG $USER/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push $USER/$IMAGE:$BUILD_TAG
