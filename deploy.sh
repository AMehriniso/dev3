#!/bin/bash

# Остановить выполнение скрипта при ошибке
set -e

# Проверка, что переменная окружения DEPLOY_PATH задана
if [ -z "$DEPLOY_PATH" ]; then
  echo "Error: DEPLOY_PATH is not set. Exiting..."
  exit 1
fi

# Проверка, что папка dist существует
if [ ! -d "dist" ]; then
  echo "Error: Directory 'dist' does not exist. Please run 'npm run build' before deploying. Exiting..."
  exit 1
fi

# Проверка, что папка dist содержит файлы
if [ -z "$(ls -A dist)" ]; then
  echo "Error: Directory 'dist' is empty. Build process did not generate any files. Exiting..."
  exit 1
fi

echo "Starting deployment to $DEPLOY_PATH..."

# Убедиться, что директория для деплоя существует
sudo mkdir -p "$DEPLOY_PATH"

# Копировать файлы в директорию деплоя
sudo cp -r dist/* "$DEPLOY_PATH"

echo "Deployment completed successfully."
