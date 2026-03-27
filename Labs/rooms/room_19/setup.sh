#!/bin/bash
# Room 19 - git push: room folder is a clone with unpushed commits

# Create bare remote
git init --bare remote.git 2>/dev/null

# Set up the room as a clone
git clone remote.git _clone 2>/dev/null
cd _clone
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "v1" > app.txt && git add . && git commit -m "First commit" 2>/dev/null
git push 2>/dev/null
echo "v2" >> app.txt && git add . && git commit -m "Local change 1" 2>/dev/null
echo "v3" >> app.txt && git add . && git commit -m "Local change 2 - password: tag20" 2>/dev/null
git checkout -b feature-branch 2>/dev/null
echo "feature" > feature.txt && git add . && git commit -m "Feature work" 2>/dev/null
git checkout main 2>/dev/null
cd ..

# Move clone into room folder
mv _clone/.git .git 2>/dev/null || true
mv _clone/* . 2>/dev/null || true
rm -rf _clone

echo "Room 19: Setup complete"
