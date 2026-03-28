#!/bin/bash
# Room 06 setup - git status: reading deletions and renames
# The password hidden in this room: commit7
# How: user runs git status, finds all DELETED files, longest name = commit7

git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"

# --- Commit 1: create all project files ---
cat >README.md <<'EOF'
# Project Alpha
A demo project for the Git Escape Room.
Tracks a small web service and its tooling.
EOF

cat >server.py <<'EOF'
"""HTTP server entry point."""
import http.server
import socketserver

PORT = 8080
Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving on port {PORT}")
    httpd.serve_forever()
EOF

cat >app.cfg <<'EOF'
host    = localhost
port    = 8080
debug   = false
workers = 4
EOF

cat >utils.sh <<'EOF'
#!/bin/bash
# Utility helpers
log()     { echo "[$(date +%H:%M:%S)] $*"; }
cleanup() { rm -f /tmp/app_*.tmp; }
EOF

cat >run.sh <<'EOF'
#!/bin/bash
# Launch the server
python3 server.py
EOF

cat >db.log <<'EOF'
2026-03-01 10:00:00 INFO  connected to database
2026-03-02 08:30:00 INFO  schema migration v4 applied
2026-03-03 02:00:00 INFO  nightly backup completed
EOF

cat >commit7 <<'EOF'
Build pipeline seed file - stage: commit, step: 7
Required by CI for the final pre-deploy validation gate.
EOF

cat >boot.sh <<'EOF'
#!/bin/bash
# System bootstrap script
export APP_ENV=production
source utils.sh
log "starting up"
EOF

cat >api.sh <<'EOF'
#!/bin/bash
# API smoke test runner
curl -sf http://localhost:8080/health && echo "API OK"
EOF

git add . && git commit -m "initial project setup" 2>/dev/null

# --- Commit 2: small updates to README and config ---
cat >>README.md <<'EOF'

## Usage
Run `bash run.sh` to start the server.
EOF
echo "timeout = 30" >>app.cfg
git add README.md app.cfg
git commit -m "update readme and config" 2>/dev/null

# --- Stage deletions and renames (this is what the user must discover) ---

# Delete three files - the user must list all deleted files and find the longest name
# Lengths: run.sh=6, db.log=6, api.sh=6, commit7=7  ← commit7 is the longest
git rm run.sh db.log api.sh commit7 2>/dev/null

# Rename two files - the user must also identify renames with R status
git mv server.py web_server.py
git mv app.cfg config.cfg

touch pass.txt
git add pass.txt

# Leave one tracked file modified but NOT staged (shows as " M")
echo "# runtime patch" >>utils.sh

# Leave one untracked file (shows as "??")
echo "scratch notes" >scratch.txt

echo "Room 06: Setup complete"
