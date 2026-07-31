#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="$HOME/devops-portfolio/project-1-nginx"
APP_URL="http://localhost:8080"

echo "=== Starting deployment ==="

cd "$PROJECT_DIR"

if [[ ! -f .env ]]; then
    echo "ERROR: .env file is missing."
    exit 1
fi

echo "Pulling latest Git changes..."
git pull --ff-only

echo "Building and starting containers..."
docker compose up -d --build

echo "Waiting for services..."
sleep 10

echo "Checking containers..."
docker compose ps

echo "Testing health endpoint..."
if curl --fail --silent "$APP_URL/health" > /dev/null; then
    echo "Health check passed."
else
    echo "ERROR: Health check failed."
    docker compose logs --tail=50
    exit 1
fi

echo "Testing database connection..."
if curl --fail --silent "$APP_URL/db" | grep -q '"status":"success"'; then
    echo "Database check passed."
else
    echo "ERROR: Database check failed."
    docker compose logs --tail=50
    exit 1
fi

echo "=== Deployment completed successfully ==="
