#!/bin/bash
# Call ./create-admin-account.sh <discord-id> <admin-uid>
# For example ./create-admin-account.sh 1235432342 nia_admin
# The second parameter can be omitted, and will default to just "admin"

if [ -z "$1" ]; then
    echo "No discord ID provided, please provide the discord ID of the admin users"
    read -r DISCORD_ID
else
  DISCORD_ID=$1
fi

if [ -z "$2" ]; then
  ADMIN_UID="admin"
else
  ADMIN_UID=$2
fi

echo "Creating admin account $ADMIN_UID for $DISCORD_ID"

# This assumes that there is a container named "postgres" running.
CONTAINER_ID=$(docker ps --format "{{.ID}}" --filter name="postgres")
if [ -z "$CONTAINER_ID" ]; then
    echo "Postgres container not found, aborting. Please verify that your Laci instance is running"
else
 docker exec -i "$CONTAINER_ID" psql --user laci <<EOF
  insert into users(uid, is_moderator, is_admin, last_logged_in) values ('$ADMIN_UID', true, true, current_timestamp);
  insert into lodestone_auth (discord_id, user_uid) values ($DISCORD_ID, '$ADMIN_UID');
EOF
fi