#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
mkdir -p src/frontend src/backend docs tests
echo "frontend code" >src/frontend/app.js
echo "backend code" >src/backend/server.js
echo "documentation" >docs/guide.md
echo "test code" >tests/test.js
echo "root file" >README.md
git add . && git commit -m "Monorepo structure" 2>/dev/null

echo "Room 34: Setup complete"
