#!/bin/bash

set -e
if [ -z "$DEPLOY_PATH" ]; then
  echo "Error: DEPLOY_PATH is not set. Exiting..."
  exit 1
fi

echo "Starting deployment..."

echo "Ensuring deployment directory exists..."
mkdir -p "$DEPLOY_PATH"

echo "Copying files to $DEPLOY_PATH..."
cp -r dist/* "$DEPLOY_PATH"

# Проверка успешности копирования
if [ $? -eq 0 ]; then
  echo "Files successfully deployed to $DEPLOY_PATH."
else
  echo "Error during file deployment. Exiting..."
  exit 1
fi

echo "Deployment completed successfully."
