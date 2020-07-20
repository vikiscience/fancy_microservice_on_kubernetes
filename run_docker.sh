#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
export PORT=8080
export TAG=fancy_app

# Step 1:
# Build image and add a descriptive tag
docker build --no-cache --rm -t $TAG .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker run -i -t --rm -p $PORT:$PORT $TAG
