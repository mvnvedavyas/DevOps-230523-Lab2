#!/bin/bash

docker-compose up -d
docker-compose ps

read -p "Do you want to stop the container? (y/n): " confirm
if [[ $confirm =~ ^[Yy]$ ]]; then
    docker-compose down
fi