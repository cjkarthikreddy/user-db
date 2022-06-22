#!/bin/sh
docker stop user_db
docker rm -f user_db
docker run --name user_db -e POSTGRES_DB=postgres -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin@2022 -p 5432:5432 -d postgres