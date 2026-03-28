#!/bin/bash
# Room 05 setup - git add: staging deep dive
# Creates a repo with 9 txt files (1_hello…9_config_prod), 8 py files, and changes.txt

git init 2>/dev/null
git config user.name "Escape Artist"
git config user.email "escape@rooms.dev"

# --- Committed baseline (changes.txt for patch mode demo) ---
cat >changes.txt <<'EOF'
# Configuration File
# ==================

database_host = localhost
database_port = 5432
database_name = myapp

# Logging
log_level = INFO
log_file  = /var/log/app.log

# Feature flags
enable_cache   = true
enable_metrics = false
EOF
git add changes.txt
git commit -m "initial config file" 2>/dev/null

# --- 9 untracked txt files (1_hello.txt … 9_config_prod.txt) ---
cat >1_hello.txt <<'EOF'
Hello, World!
Welcome to Room 05 of the Git Escape Room.
This is your first file to stage.
EOF

cat >2_notes.txt <<'EOF'
Meeting notes - March 2026
- Review staging workflow
- Discuss patch mode usage
- Plan sprint backlog
EOF

cat >3_todo.txt <<'EOF'
[ ] Learn git add
[ ] Practice interactive staging
[ ] Understand the index
[x] Install git
EOF

cat >4_log_2026_03_15.txt <<'EOF'
2026-03-15 08:00:01 INFO  Application started
2026-03-15 08:00:02 INFO  Connected to database
2026-03-15 08:01:15 WARN  Slow query detected (1.2s)
2026-03-15 08:05:33 ERROR Connection timeout on retry 3
2026-03-15 08:05:34 INFO  Reconnected successfully
EOF

cat >5_log_2026_03_16.txt <<'EOF'
2026-03-16 09:00:01 INFO  Application started
2026-03-16 09:12:44 INFO  User login: alice
2026-03-16 09:15:02 INFO  User login: bob
2026-03-16 10:30:00 WARN  Disk usage at 85%
EOF

cat >6_readme_draft.txt <<'EOF'
# Project Title
A brief description of what this project does.

## Getting Started
Run `make install` to set up dependencies.

## License
MIT
EOF

cat >7_budget.txt <<'EOF'
Infrastructure: $4,200/mo
  - Cloud compute: $2,800
  - Database: $900
  - CDN: $500
Tooling: $1,100/mo
  - CI/CD: $400
  - Monitoring: $350
  - Security scanning: $350
Total: $5,300/mo
EOF

cat >8_config_dev.txt <<'EOF'
ENV=development
DEBUG=true
PORT=3000
DB_HOST=localhost
CACHE_TTL=60
EOF

cat >9_config_prod.txt <<'EOF'
ENV=production
DEBUG=false
PORT=8080
DB_HOST=db.prod.internal
CACHE_TTL=3600
EOF

# --- 8 Python files: first char of word-part (after N_) spells the password ---
# Password to discover: staged01
#
#   1_scanner.py    → s
#   2_tracker.py    → t
#   3_adapter.py    → a
#   4_gateway.py    → g
#   5_encoder.py    → e
#   6_deployer.py   → d
#   7_0ps.py        → 0
#   8_1nterface.py  → 1
#                      --------
#                      staged01

cat >1_scanner.py <<'PYEOF'
"""Recursively scan a directory and yield file paths by extension filter."""

import os


def scan(root: str, extensions: tuple = ()) -> list:
    """Return all file paths under *root*, optionally filtered by extension.

    Args:
        root:       Directory to walk.
        extensions: Tuple of lowercase extensions to keep, e.g. ('.py', '.txt').
                    Pass an empty tuple to return every file.
    """
    found = []
    for dirpath, _dirs, files in os.walk(root):
        for name in files:
            if not extensions or os.path.splitext(name)[1].lower() in extensions:
                found.append(os.path.join(dirpath, name))
    return sorted(found)


def count_by_extension(root: str) -> dict:
    """Return a {extension: count} mapping for all files under *root*."""
    counts: dict = {}
    for path in scan(root):
        ext = os.path.splitext(path)[1].lower() or "(none)"
        counts[ext] = counts.get(ext, 0) + 1
    return counts


if __name__ == "__main__":
    import sys
    target = sys.argv[1] if len(sys.argv) > 1 else "."
    for ext, n in sorted(count_by_extension(target).items()):
        print(f"{ext:<12} {n:>4} file(s)")
PYEOF

cat >2_tracker.py <<'PYEOF'
"""Track which keys in a dictionary have changed between two snapshots."""


def diff(old: dict, new: dict) -> dict:
    """Return a change report between *old* and *new* dicts.

    Returns:
        A dict with keys 'added', 'removed', and 'changed'.
    """
    old_keys = set(old)
    new_keys = set(new)
    return {
        "added":   {k: new[k] for k in new_keys - old_keys},
        "removed": {k: old[k] for k in old_keys - new_keys},
        "changed": {
            k: {"from": old[k], "to": new[k]}
            for k in old_keys & new_keys
            if old[k] != new[k]
        },
    }


def apply_patch(snapshot: dict, changes: dict) -> dict:
    """Apply an added/changed/removed patch from diff() to snapshot."""
    result = dict(snapshot)
    for k, v in changes.get("added", {}).items():
        result[k] = v
    for k, info in changes.get("changed", {}).items():
        result[k] = info["to"]
    for k in changes.get("removed", {}):
        result.pop(k, None)
    return result


if __name__ == "__main__":
    v1 = {"host": "localhost", "port": 5432, "debug": True}
    v2 = {"host": "db.prod",   "port": 5432, "pool": 20}
    report = diff(v1, v2)
    for section, data in report.items():
        if data:
            print(f"{section}: {data}")
PYEOF

cat >3_adapter.py <<'PYEOF'
"""Adapter pattern: wrap incompatible interfaces behind a common API."""


class LegacyLogger:
    """Old-style logger with a fixed write_log(severity, msg) signature."""

    def write_log(self, severity: str, msg: str) -> None:
        print(f"[{severity.upper()}] {msg}")


class StructuredLogger:
    """Modern logger that emits structured dicts."""

    def log(self, level: str, message: str, **context) -> dict:
        entry = {"level": level, "message": message, **context}
        print(entry)
        return entry


class LoggerAdapter:
    """Adapt StructuredLogger to the LegacyLogger interface."""

    def __init__(self, structured: StructuredLogger) -> None:
        self._logger = structured

    def write_log(self, severity: str, msg: str) -> None:
        self._logger.log(level=severity.lower(), message=msg)


if __name__ == "__main__":
    modern  = StructuredLogger()
    adapter = LoggerAdapter(modern)
    adapter.write_log("INFO",  "application started")
    adapter.write_log("ERROR", "connection refused")
PYEOF

cat >4_gateway.py <<'PYEOF'
"""Minimal API gateway: route, validate, and forward requests."""


class Gateway:
    """Route incoming requests to registered backend handlers."""

    def __init__(self) -> None:
        self._routes: dict = {}
        self._middleware: list = []

    def register(self, path: str, handler) -> None:
        """Map *path* to a callable handler(request) -> response."""
        self._routes[path] = handler

    def use(self, middleware) -> None:
        """Add middleware that transforms the request dict in place."""
        self._middleware.append(middleware)

    def handle(self, request: dict) -> dict:
        """Run middleware chain then dispatch to the matching handler."""
        req = dict(request)
        for mw in self._middleware:
            req = mw(req)
        path    = req.get("path", "/")
        handler = self._routes.get(path)
        if handler is None:
            return {"status": 404, "body": f"No route: {path}"}
        return handler(req)


if __name__ == "__main__":
    gw = Gateway()
    gw.use(lambda r: {**r, "headers": {**r.get("headers", {}), "X-Via": "gw"}})
    gw.register("/ping", lambda r: {"status": 200, "body": "pong"})
    gw.register("/echo", lambda r: {"status": 200, "body": r})

    for path in ["/ping", "/echo", "/missing"]:
        resp = gw.handle({"path": path, "headers": {}})
        print(f"{path:10s} -> {resp['status']} {resp['body']}")
PYEOF

cat >5_encoder.py <<'PYEOF'
"""Encode and decode text using Base64 and a Caesar cipher."""

import base64


def b64_encode(text: str, encoding: str = "utf-8") -> str:
    """Return the Base64-encoded form of *text*."""
    return base64.b64encode(text.encode(encoding)).decode(encoding)


def b64_decode(token: str, encoding: str = "utf-8") -> str:
    """Decode a Base64 *token* back to plain text."""
    return base64.b64decode(token.encode(encoding)).decode(encoding)


def caesar(text: str, shift: int = 13) -> str:
    """Apply a Caesar cipher with *shift* to all alphabetic characters."""
    result = []
    for ch in text:
        if ch.isalpha():
            base = ord("A") if ch.isupper() else ord("a")
            result.append(chr((ord(ch) - base + shift) % 26 + base))
        else:
            result.append(ch)
    return "".join(result)


if __name__ == "__main__":
    msg     = "Hello, Git!"
    encoded = b64_encode(msg)
    print(f"Original : {msg}")
    print(f"Base64   : {encoded}")
    print(f"Decoded  : {b64_decode(encoded)}")
    print(f"ROT-13   : {caesar(msg)}")
PYEOF

cat >6_deployer.py <<'PYEOF'
"""Simple deployment step runner with automatic rollback on failure."""


class Deployer:
    """Execute a sequence of steps; roll back completed steps on failure."""

    def __init__(self) -> None:
        self._steps: list = []

    def step(self, name: str, run, undo=None) -> "Deployer":
        """Register a named deployment step with an optional undo action."""
        self._steps.append({"name": name, "run": run, "undo": undo})
        return self

    def deploy(self) -> bool:
        """Run all steps. On failure, undo completed steps in reverse."""
        completed = []
        for step in self._steps:
            try:
                print(f"  [RUN]  {step['name']}")
                step["run"]()
                completed.append(step)
            except Exception as exc:
                print(f"  [FAIL] {step['name']}: {exc}")
                for done in reversed(completed):
                    if done["undo"]:
                        print(f"  [UNDO] {done['name']}")
                        done["undo"]()
                return False
        return True


if __name__ == "__main__":
    d = Deployer()
    d.step("build",    lambda: print("    assets built"),
                       lambda: print("    build cleaned"))
    d.step("migrate",  lambda: print("    schema migrated"))
    d.step("restart",  lambda: (_ for _ in ()).throw(RuntimeError("port busy")))
    ok = d.deploy()
    print("Deploy", "succeeded" if ok else "rolled back")
PYEOF

cat >7_0ps.py <<'PYEOF'
"""0ps: operational utilities - retries, health checks, rate limiting.

The leading '0' in the filename is intentional: it is part of the
staging puzzle (first character after the '7_' step prefix = '0').
"""

import time


def retry(func, attempts: int = 3, delay: float = 0.1):
    """Call *func* up to *attempts* times; return on first success."""
    last_exc = None
    for attempt in range(1, attempts + 1):
        try:
            return func()
        except Exception as exc:
            last_exc = exc
            if attempt < attempts:
                time.sleep(delay)
    raise last_exc


def health_check(checks: dict) -> dict:
    """Run named health-check callables; return {name: 'ok' | 'error: ...'} report."""
    report = {}
    for name, check in checks.items():
        try:
            check()
            report[name] = "ok"
        except Exception as exc:
            report[name] = f"error: {exc}"
    return report


if __name__ == "__main__":
    calls = {"n": 0}

    def flaky():
        calls["n"] += 1
        if calls["n"] < 3:
            raise ConnectionError("not ready")
        return "connected"

    result = retry(flaky, attempts=5)
    print(f"retry result : {result} (took {calls['n']} attempt(s))")

    report = health_check({
        "database": lambda: None,
        "cache":    lambda: (_ for _ in ()).throw(TimeoutError("timed out")),
    })
    for svc, status in report.items():
        print(f"  {svc:10s}: {status}")
PYEOF

cat >8_1nterface.py <<'PYEOF'
"""1nterface: define and validate simple typed interface contracts.

The leading '1' in the filename is intentional: it is part of the
staging puzzle (first character after the '8_' step prefix = '1').
"""


def implements(obj: object, interface: dict) -> list:
    """Check whether *obj* satisfies an interface specification.

    Args:
        obj:       Any Python object.
        interface: Dict mapping attribute names to expected types,
                   e.g. {"name": str, "save": type(lambda: None)}.

    Returns:
        List of violation strings; empty list means fully satisfied.
    """
    violations = []
    for attr, expected_type in interface.items():
        if not hasattr(obj, attr):
            violations.append(f"missing: {attr!r}")
        elif not isinstance(getattr(obj, attr), expected_type):
            actual = type(getattr(obj, attr)).__name__
            violations.append(
                f"{attr!r} expected {expected_type.__name__}, got {actual}"
            )
    return violations


class Repository:
    """In-memory key-value store satisfying a minimal storage interface."""

    name = "memory-store"

    def __init__(self) -> None:
        self._data: dict = {}

    def save(self, key: str, value) -> None:
        self._data[key] = value

    def load(self, key: str):
        return self._data[key]


if __name__ == "__main__":
    repo   = Repository()
    issues = implements(repo, {"name": str})
    if issues:
        for v in issues:
            print(f"  violation: {v}")
    else:
        print(f"'{repo.name}' satisfies the storage interface.")
    repo.save("key", "value")
    print(f"load('key') = {repo.load('key')}")
PYEOF

echo "Room 05: Setup complete"
