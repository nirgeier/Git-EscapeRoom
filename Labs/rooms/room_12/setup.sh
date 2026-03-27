#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "Original battle plan" >battle.txt
git add . && git commit -m "Initial battle plan" 2>/dev/null

git checkout -b conflict-branch 2>/dev/null
echo "Attack from the NORTH at dawn" >battle.txt
git add . && git commit -m "North strategy" 2>/dev/null

git checkout main 2>/dev/null
echo "Attack from the SOUTH at dusk" >battle.txt
git add . && git commit -m "South strategy" 2>/dev/null

echo "Room 12: Setup complete"
