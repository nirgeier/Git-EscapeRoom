#!/usr/bin/env bash
: <<'DOC'
build.sh
---------
Helper for building and pushing a multi-architecture Docker image
for the Git Escape Room project using Docker Buildx and docker-compose.

Usage:
	./build.sh              # build + push all platforms (default)
	./build.sh --local      # build for local arch only (no push, loads into docker)
	./build.sh --push       # explicitly build + push all platforms

Requirements:
	- Docker with buildx plugin (Docker >= 19.03)
	- Logged in to GHCR:    echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
	- Logged in to DockerHub: docker login -u USERNAME
	- Must be run from a git working tree

Customization:
	IMAGE=ghcr.io/nirgeier/git-escaperoom IMAGE_TAG=v1.2.3 ./build.sh

DOC

set -euo pipefail

# ── Parse arguments ───────────────────────────────────────────────────────────
LOCAL=false
for arg in "$@"; do
  case $arg in
    --local) LOCAL=true ;;
    --push)  LOCAL=false ;;
    *) echo "Unknown argument: $arg"; exit 1 ;;
  esac
done

# ── Resolve repo root ─────────────────────────────────────────────────────────
ROOT_DIR=$(git rev-parse --show-toplevel)
cd "$ROOT_DIR"

# ── Variables ─────────────────────────────────────────────────────────────────
IMAGE=${IMAGE:-ghcr.io/nirgeier/git-escaperoom}
IMAGE_TAG=${IMAGE_TAG:-latest}
DOCKERHUB_IMAGE=${DOCKERHUB_IMAGE:-nirgeier/git-escaperoom}
BUILD_TIME=$(date +"%Y-%m-%dT%H:%M:%SZ")
SourceRepository=$(git config --local --get remote.origin.url)

echo ""
echo "  Image  : ${IMAGE}:${IMAGE_TAG}"
echo "  Mode   : $([ "$LOCAL" = true ] && echo 'local (current arch only)' || echo 'multi-platform push')"
echo "  Root   : ${ROOT_DIR}"
echo ""

# ── Step 1: Check mkdocs site ─────────────────────────────────────────────────
echo "[1/4] Checking mkdocs site..."
if [ ! -d "$ROOT_DIR/mkdocs-site" ]; then
  echo "  ERROR: mkdocs-site/ not found. Run 'mkdocs build' first."
  exit 1
fi
echo "  mkdocs-site/ found, skipping build."

# ── Step 2: Register binfmt (skip for local builds) ──────────────────────────
if [ "$LOCAL" = false ]; then
  echo "[2/4] Registering binfmt emulation handlers..."
  docker run --privileged --rm tonistiigi/binfmt --install all
else
  echo "[2/4] Skipping binfmt registration (local build)"
fi

# ── Step 3: Create / select buildx builder ────────────────────────────────────
if [ "$LOCAL" = false ]; then
  echo "[3/4] Setting up multiarch-builder..."
  if ! docker buildx inspect multiarch-builder >/dev/null 2>&1; then
    docker buildx create --name multiarch-builder --use
  else
    docker buildx use multiarch-builder
  fi
  docker buildx inspect --bootstrap
else
  echo "[3/4] Using default builder (local arch only)"
fi

# ── Step 4: Build ─────────────────────────────────────────────────────────────
cd "$ROOT_DIR/docker"

if [ "$LOCAL" = true ]; then
  echo "[4/4] Building for local arch (no push)..."
  docker buildx bake \
    --allow=fs.read=.. \
    -f docker-compose.yml \
    --set "escape-room-git.platforms=linux/$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')" \
    --load \
    escape-room-git
else
  echo "[4/4] Building all platforms and pushing..."
  if ! docker login ghcr.io --password-stdin <<< "" 2>/dev/null; then
    echo ""
    echo "  WARNING: Not logged in to ghcr.io"
    echo "  Run: echo \$CR_PAT | docker login ghcr.io -u USERNAME --password-stdin"
    echo ""
  fi
  docker buildx bake \
    --allow=fs.read=.. \
    -f docker-compose.yml \
    --push \
    escape-room-git
fi

echo ""
echo "  Done! Image: ${IMAGE}:${IMAGE_TAG}"
echo ""
