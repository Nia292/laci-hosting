#!/bin/bash

if [ -z "$1" ]; then
  echo -n Please enter the Redis password:
  read -r -s redisPassword
else
  redisPassword=$1
fi

if command -v docker; then
  CONTAINER_ID=$(docker ps --format "{{.ID}}" --filter name="redis")
  docker exec -it "$CONTAINER_ID" /bin/bash -c "redis-cli -h localhost -a $redisPassword"
elif command -v podman; then
  CONTAINER_ID=$(podman ps --format "{{.ID}}" --filter name="redis")
  podman exec -it "$CONTAINER_ID" /bin/bash -c "redis-cli -h localhost -a $redisPassword"
fi