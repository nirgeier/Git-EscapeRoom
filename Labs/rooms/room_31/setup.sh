#!/bin/bash
git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"
echo "app" >app.txt && git add . && git commit -m "Initial" 2>/dev/null
cat >.git/hooks/commit-msg <<'HOOK'
#!/bin/bash
# Commit message validator
# PASSWORD: submod32
# Ensures commit messages follow conventional format
msg=$(cat "$1")
if ! echo "$msg" | grep -qE "^(feat|fix|docs|style|refactor|test|chore):"; then
    echo "ERROR: Commit message must start with type: feat|fix|docs|..."
    exit 1
fi
exit 0
HOOK
chmod +x .git/hooks/commit-msg

echo "Room 31: Setup complete"
