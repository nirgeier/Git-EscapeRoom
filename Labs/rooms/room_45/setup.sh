#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "app" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
echo "DB_PASSWORD=supersecret" >secrets.txt && git add . && git commit -m "Oops added secrets" 2>/dev/null
echo "more code" >>app.txt && git add . && git commit -m "More work" 2>/dev/null
echo "PASSWORD: rerere46" >password.txt && git add . && git commit -m "Clue" 2>/dev/null
rm secrets.txt && git add . && git commit -m "Removed secrets (but still in history!)" 2>/dev/null

echo "Room 45: Setup complete"
