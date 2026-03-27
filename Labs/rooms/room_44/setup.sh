#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "good" >app.txt && git add . && git commit -m "Good commit" 2>/dev/null
echo "broken" >>app.txt && git add . && git commit -m "BROKEN commit with typo" 2>/dev/null
echo "more" >>app.txt && git add . && git commit -m "Third commit - password: filter45" 2>/dev/null

echo "Room 44: Setup complete"
