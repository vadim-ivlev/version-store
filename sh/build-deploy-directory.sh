#!/bin/bash

rm -rf deploy/configs
rm -rf deploy/elastic_migrations
rm -rf deploy/docker-compose.yml

cp -R configs deploy/
cp -R elastic_migrations deploy/
cp -R docker-compose.yml deploy/