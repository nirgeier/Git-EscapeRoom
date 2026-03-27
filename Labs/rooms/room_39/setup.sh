#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
git checkout -b feature 2>/dev/null
echo "feat1" >feat1.txt && git add . && git commit -m "Feature part 1" 2>/dev/null
echo "feat2" >feat2.txt && git add . && git commit -m "Feature part 2" 2>/dev/null
echo "password: grep40" >key.txt && git add . && git commit -m "Feature part 3 - key" 2>/dev/null
git checkout main 2>/dev/null

echo "Room 39: Setup complete"
