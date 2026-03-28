#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "main" >app.txt && git add . && git commit -m "Main commit" 2>/dev/null
git checkout -b hotfix-branch 2>/dev/null
echo "hotfix password=sparse34" >hotfix.txt && git add . && git commit -m "Hotfix" 2>/dev/null
git checkout -b feature-x 2>/dev/null
echo "feature" >feature.txt && git add . && git commit -m "Feature X" 2>/dev/null
git checkout main 2>/dev/null

echo "Room 33: Setup complete"
