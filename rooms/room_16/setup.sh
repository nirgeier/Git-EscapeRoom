#!/bin/bash
# Room 16 - git clone: user clones from 'upstream' bare repo

# Create a temporary source repo
mkdir -p _source && cd _source
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "project" > main.txt && git add . && git commit -m "Start project" 2>/dev/null
echo "feature" > feature.txt && git add . && git commit -m "Add feature" 2>/dev/null
echo "The next room password is: fetch17" > hidden.txt && git add . && git commit -m "Hidden treasure" 2>/dev/null
git checkout -b feature 2>/dev/null
echo "branch work" > branch.txt && git add . && git commit -m "Branch work" 2>/dev/null
git checkout main 2>/dev/null
cd ..

# Create the bare upstream repo the user will clone from
git clone --bare _source/ upstream/ 2>/dev/null
rm -rf _source

echo "Room 16: Setup complete"
