#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" >app.txt && git add . && git commit -m "First release" 2>/dev/null
git tag -a v1.0 -m "Version 1.0 - the beginning"
echo "v2" >>app.txt && git add . && git commit -m "Second release" 2>/dev/null
git tag -a v2.0 -m "Version 2.0 - password: cherry21"
echo "v3" >>app.txt && git add . && git commit -m "Third release" 2>/dev/null
git tag -a v3.0 -m "Version 3.0 - latest"
git tag lightweight-tag

echo "Room 20: Setup complete"
