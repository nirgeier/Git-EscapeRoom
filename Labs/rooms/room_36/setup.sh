#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "keep this" >important.txt
echo "tracked" >tracked.txt
git add . && git commit -m "Initial" 2>/dev/null
# Create junk
for i in $(seq 1 20); do echo "junk $i" >"junk_$i.tmp"; done
mkdir -p build && echo "output" >build/output.bin
echo "debug" >debug.log

echo "Room 36: Setup complete"
