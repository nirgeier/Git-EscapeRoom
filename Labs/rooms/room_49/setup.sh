#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
mkdir -p src docs
echo "main app" >src/main.sh
echo "README" >docs/readme.txt
echo "password: objects" >.secret
git add . && git commit -m "Project structure" 2>/dev/null

echo "Room 49: Setup complete"
