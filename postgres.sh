#!/bin/bash

CONTAINER_POSTGRES_NAME=postgres-db
NETWORK_NAME=postgres-net
DB_PASSWORD=userpass

CONTAINER_PGADMIN_NAME=pgadmin
PGADMIN_DEFAULT_EMAIL=postgres
PGADMIN_DEFAULT_PASSWORD=userpass


docker network create $NETWORK_NAME --driver bridge

docker run --rm \
    --name $CONTAINER_POSTGRES_NAME \
    --network $NETWORK_NAME \
    -v "$(pwd)/db":/var/lib/postgresql/data \
    -e POSTGRES_PASSWORD=$DB_PASSWORD \
    -d postgres:latest
    
docker run --rm \
    --name $CONTAINER_PGADMIN_NAME \
    --network $NETWORK_NAME \
    -e 'PGADMIN_DEFAULT_EMAIL=postgres' \
    -e 'PGADMIN_DEFAULT_PASSWORD=userpass' \
    -v "$(pwd)/pgadmin_data/servers.json":/pgadming4/servers.json \
    -v "$(pwd)/pgadmin_data/pgadmin":/var/lib/pgadmin \
    -p 5050:80 \
    -d dpage/pgadmin4:latest
