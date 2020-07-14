#!/bin/bash

# Если под Windows, добавляем команду sudo
# if [[ "$OSTYPE" == "msys" ]]; then alias sudo=""; fi


# компилируем. линкуем статически под линукс. Работает на Linux и Mac.
# env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a  .


# echo "Кросскомпиляция в докере в том числе и под windows. "
docker run --rm -it -v "$PWD":/usr/src/myapp -w /usr/src/myapp -e CGO_ENABLED=0 -e GOOS=linux golang:1.14.2 go build -a 


# echo "build a docker image"
# docker build -t rgru/auth-proxy:latest -f Dockerfile-frontend . 

# echo "push the docker image" 
# docker login
# docker push rgru/auth-proxy:latest

