#!/bin/bash

rm -rf deploy/configs
rm -rf deploy/www
rm -rf deploy/docker-compose.yml

cp -R configs deploy/
cp -R www deploy/
cp -R docker-compose.yml deploy/