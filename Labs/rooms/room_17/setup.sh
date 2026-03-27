#!/bin/bash
# Room 17 - git fetch: room folder is a clone, remote.git has new commits

# Create a temporary source
mkdir -p _source && cd _source
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" > app.txt && git add . && git commit -m "v1" 2>/dev/null
cd ..

# Create bare remote
git clone --bare _source/ remote.git 2>/dev/null

# Init room folder as a clone of remote.git
git clone remote.git/ _clone 2>/dev/null

# Add more commits to the bare remote (simulating someone else pushing)
cd _source
echo "v2" >> app.txt && git add . && git commit -m "v2 - remote update" 2>/dev/null
echo "v3" >> app.txt && git add . && git commit -m "v3 - password is pull18" 2>/dev/null
git push "$(cd .. && pwd)/remote.git" main 2>/dev/null
cd ..

# Move clone contents into room folder
mv _clone/.git .git 2>/dev/null || true
mv _clone/* . 2>/dev/null || true
rm -rf _clone _source

echo "Room 17: Setup complete"
