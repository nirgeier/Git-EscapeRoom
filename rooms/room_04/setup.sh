#!/bin/bash
# Room 04 setup - create a repo demonstrating the three states

git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo '*.*' >.gitignore
echo '!.gitignore' >>.gitignore
echo '!*.txt' >>.gitignore
git add .gitignore
git commit -m "Initial commit with .gitignore" 2>/dev/null

# Create and commit a file (committed state)
echo "This file is COMMITTED" >committed.txt
echo "It lives in the repository (.git)" >>committed.txt
git add committed.txt
git commit -m "Initial commit with committed.txt" 2>/dev/null

# Create a staged file
echo "This file is STAGED" >staged.txt
echo "It lives in the staging area (index)" >>staged.txt
git add staged.txt

# Create a modified but unstaged file (untracked)
echo "This file is in WORKING directory" >working.txt
echo "It has NOT been staged yet" >>working.txt

# Also modify committed.txt in working dir without staging
echo "This line is a working directory change" >>committed.txt

echo "Room 04: Setup complete"
