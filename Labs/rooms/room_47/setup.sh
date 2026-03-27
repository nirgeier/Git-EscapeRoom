#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
echo "v2" >>app.txt && git add . && git commit -m "Update" 2>/dev/null
# Create an orphan commit
TREE=$(git write-tree)
ORPHAN=$(echo "PASSWORD: gc48" | git commit-tree "$TREE" -m "Lost treasure: gc48")
echo "v3" >>app.txt && git add . && git commit -m "Latest" 2>/dev/null

echo "Room 47: Setup complete"
