#!/bin/bash
# Room 18 - git pull: room folder is a clone, remote has changes to pull

# Create bare remote
git init --bare remote.git 2>/dev/null

# Init as a clone
git clone remote.git _clone 2>/dev/null
cd _clone
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "line1" > file.txt && git add . && git commit -m "Initial commit" 2>/dev/null
git push 2>/dev/null
cd ..

# Simulate remote changes via tmp-clone
git clone remote.git _tmp 2>/dev/null
cd _tmp
git config user.name "Remote Dev"
git config user.email "remote@dev.com"
echo "remote change" >> file.txt && git add . && git commit -m "Remote update with password: push19" 2>/dev/null
git push 2>/dev/null
cd ..
rm -rf _tmp

# Move clone into room folder
cd _clone
echo "local change" >> local.txt && git add . && git commit -m "Local work" 2>/dev/null
cd ..
mv _clone/.git .git 2>/dev/null || true
mv _clone/* . 2>/dev/null || true
rm -rf _clone

echo "Room 18: Setup complete"
