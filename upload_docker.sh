#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
export DOCKERPATH=bitelds/demos
export TAG=fancy_app

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $DOCKERPATH"
docker tag $TAG $DOCKERPATH:$TAG

# Step 3:
# Push image to a docker repository
docker push $DOCKERPATH:$TAG
