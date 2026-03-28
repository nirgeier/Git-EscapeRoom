#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "app content" >app.txt
echo "secret: bundle38" >secret.txt
echo "test data" >test.txt
mkdir -p src
echo "code" >src/main.sh
echo "secret.txt export-ignore" >.gitattributes
echo "test.txt export-ignore" >>.gitattributes
git add . && git commit -m "Project with export-ignore" 2>/dev/null
git tag -a v1.0 -m "First release"

echo "Room 37: Setup complete"
