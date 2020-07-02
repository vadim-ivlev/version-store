#!/bin/bash


echo "поднимаем" 
docker-compose up -d

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi

echo "поясняем"
sh/greetings.sh