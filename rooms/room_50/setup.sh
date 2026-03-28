#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
mkdir -p src
echo "Hello World" >src/hello.sh
echo "Goodbye" >src/bye.sh
echo "Root file" >root.txt
git add . && git commit -m "Explore the four objects" 2>/dev/null
git tag -a v1.0 -m "Password: escaped - you conquered Git!"

echo "Room 50: Setup complete"
