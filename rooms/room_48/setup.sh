#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
for i in $(seq 1 50); do
  echo "content-$i" >"file-$i.txt"
  git add "file-$i.txt"
  git commit -m "Commit $i" 2>/dev/null
done
# Create some unreachable objects
git checkout -b temp 2>/dev/null
echo "temp" >temp.txt && git add . && git commit -m "Temp - password: plumb49" 2>/dev/null
git checkout main 2>/dev/null
git branch -D temp 2>/dev/null

echo "Room 48: Setup complete"
