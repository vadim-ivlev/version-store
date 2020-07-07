#!/bin/bash


echo "Запускаем контейнеры" 
docker-compose up -d

# Если предыдущая команда выполнилась удачно печатаем приглашение.
if [ $? -eq 0 ]; then
    sh/greetings.sh
else
    echo "Ошибка запуска контейнеров"
fi

