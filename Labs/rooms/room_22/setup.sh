#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "commit 1" >file.txt && git add . && git commit -m "First commit" 2>/dev/null
echo "commit 2" >>file.txt && git add . && git commit -m "Second commit" 2>/dev/null
echo "commit 3" >>file.txt && git add . && git commit -m "Third commit" 2>/dev/null
echo "commit 4" >>file.txt && git add . && git commit -m "Fourth commit" 2>/dev/null
echo "commit 5" >>file.txt && git add . && git commit -m "Fifth commit" 2>/dev/null

echo "Room 22: Setup complete"
