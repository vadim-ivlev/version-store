#!/bin/bash



echo "Starting stopped containers..."

docker-compose start

if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
# поясняем
sh/greetings.sh
