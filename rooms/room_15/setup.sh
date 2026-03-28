#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "base" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
git remote add origin https://github.com/example/project.git
git remote add backup https://gitlab.com/example/project.git
git remote add secret https://git.escaperoom.dev/password-is-clone16.git

echo "Room 15: Setup complete"
