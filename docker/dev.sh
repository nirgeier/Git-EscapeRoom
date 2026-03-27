#!/usr/bin/env bash
# dev.sh - Stop, rebuild mkdocs site, and restart the Docker Compose stack
# mkdocs runs in watch mode so docs changes auto-rebuild
set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
ROOT_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

echo ">> Stopping Docker Compose..."
cd "$SCRIPT_DIR"
docker-compose down 2>/dev/null || true

echo ">> Initial mkdocs build..."
bash "$ROOT_DIR/.mkdocs-shared/init_site.sh" --no-serve

echo ">> Starting mkdocs in watch mode (background)..."
cd "$ROOT_DIR"
# Use the build config to run mkdocs build --watch in the background
# This rebuilds mkdocs-site/ on any .md change
MKDOCS_CONFIG="$ROOT_DIR/.mkdocs-build/01-mkdocs-site.yml"
if [ -f "$MKDOCS_CONFIG" ]; then
  (
    cd "$ROOT_DIR"
    source "$ROOT_DIR/.venv/bin/activate" 2>/dev/null || true
    # mkdocs serve writes to mkdocs-site/ and watches for changes
    # We use --no-strict to avoid stopping on warnings
    mkdocs build --config-file "$MKDOCS_CONFIG" --watch-theme 2>/dev/null
    # Start a file watcher that rebuilds on .md changes
    while true; do
      fswatch -1 -r --include='\.md$' --include='\.yml$' "$ROOT_DIR/Labs/" "$ROOT_DIR/mkdocs/" 2>/dev/null ||
        inotifywait -r -e modify,create --include='.*\.(md|yml)$' "$ROOT_DIR/Labs/" "$ROOT_DIR/mkdocs/" 2>/dev/null ||
        sleep 5
      echo "[mkdocs] Change detected, rebuilding..."
      mkdocs build --config-file "$MKDOCS_CONFIG" --dirty 2>/dev/null || true
    done
  ) &
  MKDOCS_PID=$!
  echo ">> mkdocs watcher running (PID: $MKDOCS_PID)"
  # Clean up mkdocs watcher on exit
  trap "kill $MKDOCS_PID 2>/dev/null; exit" INT TERM EXIT
fi

echo ">> Building and starting Docker Compose (with watch)..."
cd "$SCRIPT_DIR"
docker compose up --build --watch
