#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
echo "v2" >>app.txt && git add . && git commit -m "Update" 2>/dev/null
HASH=$(git rev-parse HEAD~1)
git notes add -m "PASSWORD: replace" "$HASH"
echo "v3" >>app.txt && git add . && git commit -m "More updates" 2>/dev/null

echo "Room 43: Setup complete"
