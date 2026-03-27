#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
echo "important" >important.txt
echo "forgot this" >forgotten-file.txt
git add important.txt
git commit -m "Add importnat file (typo!)" 2>/dev/null

echo "Room 24: Setup complete"
