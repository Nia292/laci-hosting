#!/bin/bash
# check if there are modifications
git diff-index --quiet HEAD
if [ $? -gt 0 ]; then
    echo "There are modifications to laci relevant files. Automatic update not possible:"
    git diff-index --name-only HEAD
    exit 1
fi

git pull
./migrate.sh
cp docker-compose.nginx.yaml docker-compose.yaml
echo "docker-compose.yaml updated, pulling new images"
docker compose --env-file .env pull
echo "Restarting deployment"
docker compose --env-file .env down
docker compose --env-file .env up -d
echo "Update successful!"