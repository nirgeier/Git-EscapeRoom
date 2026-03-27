#!/bin/bash
git init 2>/dev/null

git config user.name "alice" && git config user.email "alice@dev.com"
for i in 1 2 3; do echo "a$i" >>f.txt && git add . && git commit -m "alice commit $i" 2>/dev/null; done

git config user.name "describe" && git config user.email "describe@dev.com"
for i in 1 2 3 4 5; do echo "d$i" >>f.txt && git add . && git commit -m "describe commit $i" 2>/dev/null; done

git config user.name "bob" && git config user.email "bob@dev.com"
for i in 1 2; do echo "b$i" >>f.txt && git add . && git commit -m "bob commit $i" 2>/dev/null; done

git config user.name "Escape Artist" && git config user.email "escape@git-escaperoom.dev"

echo "Room 41: Setup complete"
