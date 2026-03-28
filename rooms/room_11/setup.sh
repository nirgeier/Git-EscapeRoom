#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null

git checkout -b feature 2>/dev/null
echo "feature work" >feature.txt && git add . && git commit -m "Add feature" 2>/dev/null
echo "more feature" >>feature.txt && git add . && git commit -m "Extend feature" 2>/dev/null

git checkout main 2>/dev/null
echo "main work" >>app.txt && git add . && git commit -m "Main progress" 2>/dev/null

git checkout -b bugfix 2>/dev/null
echo "fix" >bugfix.txt && git add . && git commit -m "Quick bugfix" 2>/dev/null
git checkout main 2>/dev/null

echo "Room 11: Setup complete"
