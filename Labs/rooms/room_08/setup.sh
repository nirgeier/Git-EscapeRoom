#!/bin/bash
# Room 08 setup - git log: 25 tasks covering basic to advanced options
# Password: Bob's commit whose message contains "secret" → "diffview"
#
# History includes:
#   - 5 authors (Alice, Bob, Charlie, Diana, Eve)
#   - Commits spread across 2025-01 → 2026-03
#   - A feature branch that gets merged (for --merges / --no-merges)
#   - A file renamed with git mv (for --follow)
#   - A git tag v1.0.0 (for --decorate)
#   - A unique string "OMEGA_INIT" added then removed (for -S pickaxe)
#   - Decoy "secret" commits by other authors
#   - Bob's real password commit: "The secret password is: diffview"

git init 2>/dev/null

# ── helpers ──────────────────────────────────────────────────────────────────
as_author() {          # as_author NAME EMAIL DATE
    export GIT_AUTHOR_NAME="$1"
    export GIT_AUTHOR_EMAIL="$2"
    export GIT_COMMITTER_NAME="$1"
    export GIT_COMMITTER_EMAIL="$2"
    export GIT_AUTHOR_DATE="$3 +0000"
    export GIT_COMMITTER_DATE="$3 +0000"
}
c() {                  # c FILE CONTENT MESSAGE
    echo "$2" >>"$1"
    git add "$1" 2>/dev/null
    git commit -m "$3" 2>/dev/null
}

# ── 2025-01: Alice bootstraps the project ───────────────────────────────────
as_author "Alice" "alice@omega.dev" "2025-01-10 09:00:00"
cat >README.md <<'EOF'
# Project Omega
Enterprise-grade backend service.
EOF
cat >server.py <<'EOF'
"""HTTP entry point."""
HOST = "localhost"
PORT = 8080
EOF
cat >config.yml <<'EOF'
host: localhost
port: 8080
debug: false
EOF
cat >.gitignore <<'EOF'
__pycache__/
*.pyc
.env
*.log
EOF
git add . && git commit -m "chore: initial project scaffold" 2>/dev/null

as_author "Alice" "alice@omega.dev" "2025-01-12 10:30:00"
c "server.py" "OMEGA_INIT = True" "feat: add OMEGA_INIT bootstrap flag"

as_author "Alice" "alice@omega.dev" "2025-01-15 14:00:00"
c "server.py" "# removed OMEGA_INIT" "refactor: remove OMEGA_INIT flag after boot sequence"
# pickaxe: -S "OMEGA_INIT" will surface the above two commits

as_author "Alice" "alice@omega.dev" "2025-01-18 08:45:00"
c "auth.py" "# decoy 1" "The secret password is: 84291"

as_author "Alice" "alice@omega.dev" "2025-01-20 11:00:00"
c "auth.py" "def login(): pass" "feat: add login stub"

as_author "Alice" "alice@omega.dev" "2025-01-25 16:00:00"
c "auth.py" "def logout(): pass" "feat: add logout stub"

# ── 2025-02: Bob joins ───────────────────────────────────────────────────────
as_author "Bob" "bob@omega.dev" "2025-02-03 09:15:00"
c "db.py" "import sqlite3" "feat: add database module"

as_author "Bob" "bob@omega.dev" "2025-02-05 10:00:00"
c "db.py" "def connect(): pass" "feat: add db connect stub"

as_author "Bob" "bob@omega.dev" "2025-02-08 11:30:00"
c "db.py" "def query(sql): pass" "feat: add query helper"

as_author "Bob" "bob@omega.dev" "2025-02-10 14:00:00"
c "db.py" "# fix: null check" "fix: handle null result in query helper"

as_author "Bob" "bob@omega.dev" "2025-02-14 09:00:00"
c "db.py" "# index added" "perf: add index on users table"

as_author "Charlie" "charlie@omega.dev" "2025-02-16 09:30:00"
c "README.md" "# decoy 2" "The secret password is: 57032"

# ── 2025-02: Charlie does docs ───────────────────────────────────────────────
as_author "Charlie" "charlie@omega.dev" "2025-02-18 13:00:00"
c "README.md" "## Installation" "docs: add installation section"

as_author "Charlie" "charlie@omega.dev" "2025-02-20 15:00:00"
c "README.md" "## Configuration" "docs: add configuration section"

as_author "Charlie" "charlie@omega.dev" "2025-02-22 10:00:00"
c "CHANGELOG.md" "## v0.1.0" "docs: add CHANGELOG"

as_author "Diana" "diana@omega.dev" "2025-02-28 16:00:00"
c "test_auth.py" "# decoy 3" "The secret password is: 39617"

# ── 2025-03: Diana adds tests ────────────────────────────────────────────────
as_author "Diana" "diana@omega.dev" "2025-03-01 09:00:00"
c "test_auth.py" "def test_login(): assert True" "test: add login test"

as_author "Diana" "diana@omega.dev" "2025-03-03 10:30:00"
c "test_auth.py" "def test_logout(): assert True" "test: add logout test"

as_author "Diana" "diana@omega.dev" "2025-03-05 14:00:00"
c "test_db.py" "def test_connect(): assert True" "test: add db connect test"

as_author "Diana" "diana@omega.dev" "2025-03-10 11:00:00"
c "test_db.py" "def test_query(): assert True" "test: add query test"

# ── 2025-03: Alice fixes bugs ────────────────────────────────────────────────
as_author "Alice" "alice@omega.dev" "2025-03-15 09:00:00"
c "auth.py" "# fix: token expiry" "fix: correct token expiry calculation"

as_author "Alice" "alice@omega.dev" "2025-03-18 16:00:00"
c "auth.py" "# fix: session race" "fix: resolve race condition in session store"

as_author "Alice" "alice@omega.dev" "2025-03-22 10:00:00"
c "server.py" "# rate limiter" "feat: add rate limiting to login endpoint"

# ── 2025-04: feature branch (dark-mode) ─────────────────────────────────────
as_author "Eve" "eve@omega.dev" "2025-04-01 09:00:00"
git checkout -b feature/dark-mode 2>/dev/null

c "theme.css" "body { background: #1e1e1e; }" "feat: add dark mode base styles"

as_author "Eve" "eve@omega.dev" "2025-04-03 11:00:00"
c "theme.css" ".button { color: #fff; }" "feat: dark mode button styles"

as_author "Eve" "eve@omega.dev" "2025-04-05 14:00:00"
c "theme.css" "/* toggle logic */" "feat: add theme toggle component"

as_author "Eve" "eve@omega.dev" "2025-04-07 10:00:00"
c "theme.css" "/* fix flicker */" "fix: dark mode flicker on initial load"

# ── merge feature branch → main ─────────────────────────────────────────────
as_author "Alice" "alice@omega.dev" "2025-04-10 12:00:00"
git checkout main 2>/dev/null
git merge --no-ff feature/dark-mode -m "Merge branch 'feature/dark-mode' into main" 2>/dev/null

# ── 2025-04: tag v1.0.0 ─────────────────────────────────────────────────────
as_author "Alice" "alice@omega.dev" "2025-04-10 12:05:00"
git tag -a v1.0.0 -m "Release v1.0.0" 2>/dev/null

# ── 2025-04 → 05: file rename (server.py → web_server.py) ──────────────────
as_author "Bob" "bob@omega.dev" "2025-04-15 09:00:00"
git mv server.py web_server.py
git commit -m "refactor: rename server.py to web_server.py" 2>/dev/null

as_author "Bob" "bob@omega.dev" "2025-04-20 11:00:00"
c "web_server.py" "# async support" "feat: add async request handling"

as_author "Bob" "bob@omega.dev" "2025-04-25 14:00:00"
c "web_server.py" "# middleware" "feat: add middleware pipeline"

# ── 2025-05: Bob's decoy "secret" commit ─────────────────────────────────────
as_author "Bob" "bob@omega.dev" "2025-05-02 10:00:00"
c "web_server.py" "# secret config" "chore: move secret config to env vars"

as_author "Eve" "eve@omega.dev" "2025-05-03 11:15:00"
c "ci.yml" "# decoy 4" "The secret password is: 72458"

# ── 2025-05: Charlie adds more docs ─────────────────────────────────────────
as_author "Charlie" "charlie@omega.dev" "2025-05-05 13:00:00"
c "README.md" "## API Reference" "docs: add API reference section"

as_author "Charlie" "charlie@omega.dev" "2025-05-10 15:00:00"
c "CHANGELOG.md" "## v1.0.0" "docs: add v1.0.0 changelog entry"

# ── 2025-05: Diana adds secret decoy ─────────────────────────────────────────
as_author "Diana" "diana@omega.dev" "2025-05-15 09:00:00"
c "test_auth.py" "# secret test key" "test: use secret test API key in fixtures"

# ── 2025-06: Alice refactors ─────────────────────────────────────────────────
as_author "Alice" "alice@omega.dev" "2025-06-01 10:00:00"
c "auth.py" "# oauth2" "feat: add OAuth2 Google provider"

as_author "Alice" "alice@omega.dev" "2025-06-05 11:00:00"
c "auth.py" "# github oauth" "feat: add OAuth2 GitHub provider"

as_author "Alice" "alice@omega.dev" "2025-06-10 14:00:00"
c "auth.py" "# fix redirect" "fix: correct redirect URI encoding"

as_author "Alice" "alice@omega.dev" "2025-06-15 16:00:00"
c "config.yml" "cache_ttl: 300" "feat: add Redis cache layer"

as_author "Alice" "alice@omega.dev" "2025-06-20 09:00:00"
c "config.yml" "metrics: true" "feat: add Prometheus metrics endpoint"

# ── 2025-07: Bob adds perf fixes ─────────────────────────────────────────────
as_author "Bob" "bob@omega.dev" "2025-07-01 10:00:00"
c "db.py" "# pool" "feat: add connection pooling"

as_author "Bob" "bob@omega.dev" "2025-07-05 11:00:00"
c "db.py" "# fix pool" "fix: pool exhaustion under load"

as_author "Bob" "bob@omega.dev" "2025-07-10 14:00:00"
c "db.py" "# retry" "feat: add connection retry with backoff"

# ── 2025-08: Eve adds CI ──────────────────────────────────────────────────────
as_author "Eve" "eve@omega.dev" "2025-08-01 09:00:00"
c "ci.yml" "name: CI" "chore: add GitHub Actions CI workflow"

as_author "Eve" "eve@omega.dev" "2025-08-05 10:00:00"
c "ci.yml" "# fix creds" "fix: CI missing AWS credentials"

as_author "Eve" "eve@omega.dev" "2025-08-10 11:00:00"
c "ci.yml" "# codeql" "feat: add CodeQL security scanning"

# ── 2025-09 → 10: more contributors ──────────────────────────────────────────
as_author "Charlie" "charlie@omega.dev" "2025-09-01 13:00:00"
c "CHANGELOG.md" "## v1.1.0" "docs: add v1.1.0 changelog entry"

as_author "Diana" "diana@omega.dev" "2025-09-10 09:00:00"
c "test_db.py" "def test_pool(): assert True" "test: add connection pool tests"

as_author "Alice" "alice@omega.dev" "2025-09-20 10:00:00"
c "web_server.py" "# graceful shutdown" "feat: add graceful shutdown handler"

as_author "Bob" "bob@omega.dev" "2025-10-01 09:00:00"
c "web_server.py" "# fix shutdown" "fix: shutdown does not drain in-flight requests"

as_author "Eve" "eve@omega.dev" "2025-10-10 11:00:00"
c "ci.yml" "# sast" "feat: add SAST scanning"

as_author "Alice" "alice@omega.dev" "2025-10-20 14:00:00"
c "auth.py" "# mfa" "feat: add MFA support"

as_author "Diana" "diana@omega.dev" "2025-11-01 09:00:00"
c "test_auth.py" "def test_mfa(): assert True" "test: add MFA unit tests"

as_author "Charlie" "charlie@omega.dev" "2025-11-10 13:00:00"
c "README.md" "## Deployment" "docs: add deployment guide"

as_author "Bob" "bob@omega.dev" "2025-11-15 10:00:00"
c "db.py" "# jsonb" "feat: add jsonb settings column"

as_author "Alice" "alice@omega.dev" "2025-11-18 14:30:00"
c "config.yml" "# decoy 5" "The secret password is: 10583"

as_author "Alice" "alice@omega.dev" "2025-11-20 11:00:00"
c "config.yml" "log_level: INFO" "feat: add structured JSON logging"

as_author "Eve" "eve@omega.dev" "2025-12-01 09:00:00"
c "ci.yml" "# image scan" "feat: add container image scanning"

as_author "Diana" "diana@omega.dev" "2025-12-08 09:00:00"
c "test_db.py" "# decoy 6" "The secret password is: 66341"

as_author "Alice" "alice@omega.dev" "2025-12-10 10:00:00"
c "auth.py" "# fix jwt" "fix: correct JWT expiry edge case"

as_author "Bob" "bob@omega.dev" "2025-12-15 11:00:00"
c "web_server.py" "# cors" "feat: add CORS configuration"

as_author "Charlie" "charlie@omega.dev" "2025-12-20 14:00:00"
c "CHANGELOG.md" "## v1.2.0" "docs: add v1.2.0 changelog entry"

# ── 2026-01: tag v2.0.0 ──────────────────────────────────────────────────────
as_author "Alice" "alice@omega.dev" "2026-01-05 10:00:00"
c "config.yml" "version: 2.0.0" "chore: bump version to 2.0.0"
git tag -a v2.0.0 -m "Release v2.0.0" 2>/dev/null

# ── 2026-01 → 02: more work ───────────────────────────────────────────────────
as_author "Bob" "bob@omega.dev" "2026-01-10 09:00:00"
c "web_server.py" "# graphql" "feat: add GraphQL API endpoint"

as_author "Diana" "diana@omega.dev" "2026-01-15 10:00:00"
c "test_db.py" "def test_jsonb(): assert True" "test: add jsonb query tests"

as_author "Eve" "eve@omega.dev" "2026-01-20 11:00:00"
c "ci.yml" "# deploy" "feat: add CD deployment workflow"

as_author "Alice" "alice@omega.dev" "2026-01-25 14:00:00"
c "auth.py" "# webhook auth" "feat: add webhook signature verification"

as_author "Charlie" "charlie@omega.dev" "2026-02-01 13:00:00"
c "README.md" "## Webhooks" "docs: add webhook integration guide"

as_author "Bob" "bob@omega.dev" "2026-02-10 10:00:00"
c "db.py" "# replica" "feat: add read replica support"

as_author "Alice" "alice@omega.dev" "2026-02-15 11:00:00"
c "web_server.py" "# i18n" "feat: add internationalisation support"

as_author "Diana" "diana@omega.dev" "2026-02-20 09:00:00"
c "test_auth.py" "def test_webhook(): assert True" "test: add webhook auth tests"

# ── THE PASSWORD COMMIT — Bob, 2026-03 ────────────────────────────────────────
as_author "Bob" "bob@omega.dev" "2026-03-01 10:00:00"
echo "diffview" >password
git add password
git commit -m "The secret password is: diffview" 2>/dev/null

# ── a few more commits after the password commit ─────────────────────────────
as_author "Alice" "alice@omega.dev" "2026-03-05 10:00:00"
c "config.yml" "timeout: 30" "fix: add request timeout to config"

as_author "Eve" "eve@omega.dev" "2026-03-10 11:00:00"
c "ci.yml" "# dependabot" "chore: add Dependabot config"

as_author "Charlie" "charlie@omega.dev" "2026-03-12 10:00:00"
c "CHANGELOG.md" "# decoy 7" "The secret password is: 93827"

as_author "Eve" "eve@omega.dev" "2026-03-14 11:30:00"
c "ci.yml" "# decoy 8" "The secret password is: 47156"

as_author "Charlie" "charlie@omega.dev" "2026-03-15 13:00:00"
c "CHANGELOG.md" "## v2.1.0" "docs: add v2.1.0 changelog entry"

as_author "Alice" "alice@omega.dev" "2026-03-20 09:00:00"
c "auth.py" "# passkey" "feat: add passkey (WebAuthn) support"

as_author "Bob" "bob@omega.dev" "2026-03-25 10:00:00"
c "web_server.py" "# http2" "feat: add HTTP/2 support"

unset GIT_AUTHOR_DATE GIT_COMMITTER_DATE
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"

echo "Room 08: Setup complete — $(git rev-list --count HEAD) commits, $(git branch | wc -l | tr -d ' ') branch(es)"
