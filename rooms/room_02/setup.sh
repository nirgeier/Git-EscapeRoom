#!/bin/bash
# Room 02 setup - create a git repo with the password hidden in .git/config

# Create the repo inside the room directory
git init
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"

# Hide the password in a custom local config key
git config escaperoom.room_03.password "config42"

git commit --allow-empty -m "Room 02: Git Configuration"

echo "Room 02: Setup complete"
