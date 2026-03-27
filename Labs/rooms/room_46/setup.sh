#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
git config rerere.enabled true
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
git checkout -b feature 2>/dev/null
echo "feature version - password: fsck47" >app.txt && git add . && git commit -m "Feature change" 2>/dev/null
git checkout main 2>/dev/null
echo "main version" >app.txt && git add . && git commit -m "Main change" 2>/dev/null

echo "Room 46: Setup complete"
