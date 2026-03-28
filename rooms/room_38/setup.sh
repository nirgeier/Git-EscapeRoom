#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" >app.txt && git add . && git commit -m "Version 1" 2>/dev/null
echo "v2" >>app.txt && git add . && git commit -m "Version 2" 2>/dev/null
echo "v3" >>app.txt && git add . && git commit -m "Version 3" 2>/dev/null
echo "password=patch39" >key.txt && git add . && git commit -m "Bundle this" 2>/dev/null
echo "v4" >>app.txt && git add . && git commit -m "Version 4" 2>/dev/null

echo "Room 38: Setup complete"
