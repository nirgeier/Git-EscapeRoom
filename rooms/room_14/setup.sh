#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null

# Create stashes
echo "decoy 1" >>app.txt
git stash push -m "debugging session"
echo "decoy 2" >>app.txt
git stash push -m "refactoring attempt"
echo "PASSWORD: remote15" >secret.txt && git add secret.txt
git stash push -m "password is in this stash"
echo "current work" >>app.txt

echo "Room 14: Setup complete"
