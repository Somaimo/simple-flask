#!/bin/bash

# Helper script to bootstrap nginx, letsencrypt, docker-gen and app containers.
# The script requires two subfolders "reverse-proxy" and "app" to each contain one docker-compose.yaml
# file that is executed.

# This script then creates the necessary docker network(s) and executes docker-compose with the
# docker-compose.yaml files from each subfolder.


# Create network
docker network create nginx-proxy > /dev/null 2>&1

# Run docker-compose up with both yaml files
echo "Building Docker compose-config based on subdirectories"
docker-compose -f ./reverse-proxy/docker-compose.yaml -f ./app/docker-compose.yaml config > ./docker-compose.yaml

echo "Executing docker-compose with new config"
docker-compose up -d


