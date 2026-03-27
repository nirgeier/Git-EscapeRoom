#!/bin/bash
# Room 01 setup - create a git repo with the password hidden in a commit message

# Create the repo inside the room directory
git init
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
git commit --allow-empty -m "The password for room#02 is: installed"

echo "Room 01: Setup complete"
