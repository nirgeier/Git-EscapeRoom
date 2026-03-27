#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "app code" >app.js && git add . && git commit -m "Initial" 2>/dev/null
echo "debug log" >debug.log
echo "error log" >error.log
mkdir -p node_modules && echo "pkg" >node_modules/pkg.js
echo "SECRET=12345" >.env
echo "bytecode" >cache.pyc

echo "Room 29: Setup complete"
