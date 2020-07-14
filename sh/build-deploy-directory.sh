#!/bin/bash

rm -rf deploy/configs
rm -rf deploy/elastic_migrations
rm -rf deploy/docker-compose.yml
rm -rf deploy/Dockerfile
rm -rf deploy/version-store

cp -R configs deploy/
cp -R elastic_migrations deploy/
cp -R docker-compose.yml deploy/
cp -R Dockerfile deploy/
cp -R version-store deploy/