#!/bin/bash
# Room 32 - git submodule: room folder is main repo with a submodule

# Create a "library" repo
mkdir -p _lib && cd _lib
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "module code" > lib.js && git add . && git commit -m "Library v1" 2>/dev/null
cd ..

# Init main repo in room folder
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "main app" > app.txt && git add . && git commit -m "Initial" 2>/dev/null
git submodule add "$(pwd)/_lib" libs/mylib 2>/dev/null
git commit -m "Add submodule" 2>/dev/null

echo "Room 32: Setup complete"
