#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
git checkout -b treasure 2>/dev/null
echo "decoy1" >d1.txt && git add . && git commit -m "Decoy 1" 2>/dev/null
echo "PASSWORD=reset22" >key.txt && git add . && git commit -m "KEY COMMIT" 2>/dev/null
echo "decoy2" >d2.txt && git add . && git commit -m "Decoy 2" 2>/dev/null
git checkout main 2>/dev/null

echo "Room 21: Setup complete"
