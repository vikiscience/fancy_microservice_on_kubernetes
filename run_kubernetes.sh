#!/usr/bin/env bash
# This file deploys the Docker image to Kubernetes Cluster

# Step 1:
# This is your Docker ID/path
export DOCKERPATH=bitelds/demos
export TAG=fancy_app
export DEPLOYMENT_NAME=my-deployment

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment $DEPLOYMENT_NAME --image=$DOCKERPATH:$TAG

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment $DEPLOYMENT_NAME --type=NodePort --port=8080
