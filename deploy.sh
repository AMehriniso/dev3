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
  echo "Error: Directory 'dist' does not exist. Please build the project before deploying. Exiting..."
  exit 1
fi

echo "Starting deployment..."

# Создание директории, если она не существует
echo "Ensuring deployment directory exists..."
mkdir -p "$DEPLOY_PATH"

# Копирование сгенерированных файлов в директорию деплоя
echo "Copying files to $DEPLOY_PATH..."
cp -r dist/* "$DEPLOY_PATH"

echo "Deployment completed successfully."
