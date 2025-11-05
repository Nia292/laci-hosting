#!/bin/bash

if command -v docker; then
  CONTAINER_ID=$(docker ps --format "{{.ID}}" --filter name="postgres")
  docker exec -it "$CONTAINER_ID" /bin/bash -c "psql --user mare"
elif command -v podman; then
  CONTAINER_ID=$(podman ps --format "{{.ID}}" --filter name="postgres")
  podman exec -it "$CONTAINER_ID" /bin/bash -c "psql --user mare"
fi