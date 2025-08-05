#!/bin/bash

REPO="Yaraa-Maher/ToDoApp"
USERNAME="yaramaher21"
DOCKER_REPO="todoapp"
BRANCH="main"

APP_DIR="/home/ansible/todo-app"
COMPOSE_FILE="$APP_DIR/docker-compose.yaml"
ENV_FILE="$APP_DIR/.env"

if [[ -z "$TAG" ]]; then
  TAG=""
fi

while true; do
  LATEST_TAG=$(curl -s https://api.github.com/repos/$REPO/commits/$BRANCH | jq -r '.commit.message' | grep -oE '[a-f0-9]{40}')

  if [[ -z "$LATEST_TAG" || "$LATEST_TAG" == "null" ]]; then
    echo "Failed to fetch latest SHA"
    sleep 300
    continue
  fi

  if [[ "$LATEST_TAG" != "$TAG" ]]; then
    echo "New tag found: $LATEST_TAG"
    TAG=$LATEST_TAG

    if grep -q '^TAG=' "$ENV_FILE"; then
      sed -i "s/^TAG=.*/TAG=$TAG/" "$ENV_FILE"
    else
      echo "TAG=$TAG" >> "$ENV_FILE"
    fi

    cd "$APP_DIR"
    /usr/bin/docker compose -f "$COMPOSE_FILE" pull
    /usr/bin/docker compose -f "$COMPOSE_FILE" down
    /usr/bin/docker compose -f "$COMPOSE_FILE" up -d
  else
    echo "No update needed."
  fi

  sleep 300
done

