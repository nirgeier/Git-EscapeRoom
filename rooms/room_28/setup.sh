#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
git config alias.reveal "!echo 'The password is: ignore29'"

echo "Room 28: Setup complete"
