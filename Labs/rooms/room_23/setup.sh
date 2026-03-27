#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "good" >app.txt && git add . && git commit -m "Good commit 1" 2>/dev/null
echo "good2" >>app.txt && git add . && git commit -m "Good commit 2" 2>/dev/null
echo "BUG INTRODUCED" >>app.txt && git add . && git commit -m "BUGGY COMMIT" 2>/dev/null
echo "good3" >>app.txt && git add . && git commit -m "Good commit 3" 2>/dev/null

echo "Room 23: Setup complete"
