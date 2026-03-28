#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "DB_HOST=production.db.com" >config.local.txt
echo "DB_PORT=5432" >>config.local.txt
echo "app code" >app.txt
git add . && git commit -m "Initial with config" 2>/dev/null

echo "Room 35: Setup complete"
