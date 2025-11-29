#!/bin/bash
# check if there are modifications
git diff-index --quiet HEAD
if [ $? -gt 0 ]; then
    echo "There are modifications to laci relevant files. Automatic update not possible:"
    git diff-index --name-only HEAD
    exit
fi

# check if we are in the right directory by checking laci version
if [ ! -f .laci-version ]; then
    echo "Not in a laci directory, .laci-version is not present. Automatic update not possible."
fi

git pull
chmod +x ./migrate.sh
./migrate.sh
cp docker-compose.caddy.yaml docker-compose.yaml
echo "docker-compose.yaml updated, pulling new images"
docker compose --env-file .env pull
echo "restarting deployment"
docker compose --env-file .env down
docker compose --env-file .env up -d
echo "Update successful!"