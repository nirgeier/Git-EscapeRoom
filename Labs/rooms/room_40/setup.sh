#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "function hello() { return 'world'; }" >app.js
echo "// TODO: fix this later" >>app.js
echo "import os" >utils.py
echo "def test_something(): assert True" >>utils.py
git add . && git commit -m "Initial code" 2>/dev/null
echo "PASSWORD=shortlog" >secret.txt
git add . && git commit -m "Add secret" 2>/dev/null
git rm secret.txt && git commit -m "Remove secret (but it's in history!)" 2>/dev/null
echo "more code" >>app.js && git add . && git commit -m "More work" 2>/dev/null

echo "Room 40: Setup complete"
