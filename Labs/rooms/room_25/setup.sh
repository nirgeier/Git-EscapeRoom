#!/bin/bash
git init 2>/dev/null

git config user.name "Alice" && git config user.email "alice@dev.com"
echo "Line 1: Module initialization" >codebase.txt
git add . && git commit -m "Init module" 2>/dev/null

git config user.name "Bob" && git config user.email "bob@dev.com"
echo "Line 2: Database connection" >>codebase.txt
git add . && git commit -m "Add DB" 2>/dev/null

git config user.name "Spy" && git config user.email "spy@dev.com"
echo "Line 3: PASSWORD=bisect26" >>codebase.txt
git add . && git commit -m "Add secret" 2>/dev/null

git config user.name "Charlie" && git config user.email "charlie@dev.com"
echo "Line 4: Error handling" >>codebase.txt
git add . && git commit -m "Add error handling" 2>/dev/null

git config user.name "Alice" && git config user.email "alice@dev.com"
echo "Line 5: Logging framework" >>codebase.txt
git add . && git commit -m "Add logging" 2>/dev/null

git config user.name "Escape Artist" && git config user.email "escape@git-escaperoom.dev"

echo "Room 25: Setup complete"
