#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"

# Create a test script
cat >test.sh <<'SCRIPT'
#!/bin/bash
# Test if the value in config.txt is valid
val=$(cat config.txt 2>/dev/null)
if [ "$val" = "GOOD" ]; then exit 0; else exit 1; fi
SCRIPT
chmod +x test.sh

echo "GOOD" >config.txt
git add . && git commit -m "Commit 1 - initial" 2>/dev/null
for i in $(seq 2 8); do
  echo "update $i" >>log.txt && git add . && git commit -m "Commit $i" 2>/dev/null
done
# Introduce the bug at commit 9
echo "BAD" >config.txt
git add . && git commit -m "Commit 9 - refactor config" 2>/dev/null
for i in $(seq 10 20); do
  echo "update $i" >>log.txt && git add . && git commit -m "Commit $i" 2>/dev/null
done

echo "Room 26: Setup complete"
