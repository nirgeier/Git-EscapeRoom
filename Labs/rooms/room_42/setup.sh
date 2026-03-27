#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" >app.txt && git add . && git commit -m "First" 2>/dev/null
git tag -a v1.0 -m "Version 1.0"
for i in 2 3 4 5; do echo "v$i" >>app.txt && git add . && git commit -m "Update $i" 2>/dev/null; done
git tag -a v1.1 -m "Version 1.1"
for i in 6 7; do echo "v$i" >>app.txt && git add . && git commit -m "Post-release $i" 2>/dev/null; done

echo "Room 42: Setup complete"
