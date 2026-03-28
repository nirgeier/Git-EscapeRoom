#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "main content" >main.txt && git add . && git commit -m "Initial" 2>/dev/null
git branch feature-login
git branch feature-signup
git branch bugfix-header
git checkout -b hidden-treasure 2>/dev/null
echo "The key is: merged11" >secret_key.txt
git add . && git commit -m "Hide the treasure" 2>/dev/null
git checkout main 2>/dev/null

echo "Room 10: Setup complete"
