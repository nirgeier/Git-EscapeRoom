#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "Hello World" >readme.txt
echo '#!/bin/bash' >script.sh
printf '\x89PNG\r\n' >image.png
echo "@echo off" >build.bat
echo "# Docs" >docs.md
git add . && git commit -m "Mixed file types - check .gitattributes for password: hook31" 2>/dev/null

echo "Room 30: Setup complete"
