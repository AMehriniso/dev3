#!/bin/bash

# Проверка переменной окружения
if [ -z "$DEPLOY_PATH" ]; then
  echo "Error: DEPLOY_PATH is not set."
  exit 1
fi

# Деплой содержимого папки dist
echo "Deploying application..."
rm -rf "$DEPLOY_PATH"/*  # Очистка текущего деплоя
cp -r dist/* "$DEPLOY_PATH/"  # Копирование новых файлов

# Вывод результата
if [ $? -eq 0 ]; then
  echo "Deployment successful!"
else
  echo "Deployment failed."
  exit 1
fi
