#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null

git checkout -b feature 2>/dev/null
echo "f1" >f1.txt && git add . && git commit -m "Feature part 1" 2>/dev/null
echo "f2" >f2.txt && git add . && git commit -m "Feature part 2" 2>/dev/null
echo "f3" >f3.txt && git add . && git commit -m "Feature part 3" 2>/dev/null

git checkout main 2>/dev/null
echo "main update" >>app.txt && git add . && git commit -m "Main update 1" 2>/dev/null
echo "main update 2" >>app.txt && git add . && git commit -m "Main update 2" 2>/dev/null

echo "Room 13: Setup complete"
