#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
cat >puzzle.txt <<'EOF'
Line 1: The journey begins
Line 2: Through corridors of code
Line 3: Each diff tells a story
Line 4: Of changes made and paths explored
EOF
cat >file1.txt <<'EOF'
original content
second line
third line
EOF
git add . && git commit -m "Initial state" 2>/dev/null
cat >>puzzle.txt <<'EOF'
Line 5: PASSWORD=branch10
EOF
echo "modified content" >>file1.txt
echo "new file" >file2.txt
git add puzzle.txt

echo "Room 09: Setup complete"
