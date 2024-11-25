#!/bin/bash

set -e

if [ -z "$DEPLOY_PATH" ]; then
  echo "Error: DEPLOY_PATH is not set"
  exit 1
fi

echo "Starting deployment..."

# Ensure the deployment path exists
mkdir -p "$DEPLOY_PATH"

# Copy the build files to the deployment path
cp -r ./dist/* "$DEPLOY_PATH"

echo "Deployment completed successfully!"
