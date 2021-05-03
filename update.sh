#!/bin/bash

docker-compose down
docker-compose pull
docker-compose --compatibility up -d
