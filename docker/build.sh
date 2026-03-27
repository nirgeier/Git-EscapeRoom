#!/usr/bin/env bash
: <<'DOC'
build.sh - Multi-architecture Docker build for Git Escape Room
DOC

set -euo pipefail

ROOT_DIR=$(git rev-parse --show-toplevel)
cd "$ROOT_DIR"

IMAGE=${IMAGE:-ghcr.io/nirgeier/git-escaperoom}
IMAGE_TAG=${IMAGE_TAG:-latest}
DOCKERHUB_IMAGE=${DOCKERHUB_IMAGE:-nirgeier/git-escaperoom}

BUILD_TIME=$(date +"%Y-%m-%dT%H:%M:%SZ")
SourceRepository=$(git config --local --get remote.origin.url)

echo "Building image: ${IMAGE}:${IMAGE_TAG} (root: ${ROOT_DIR})"

echo "Building mkdocs site..."
bash "$ROOT_DIR/.mkdocs-shared/init_site.sh" --no-serve

echo "Registering binfmt emulation handlers..."
docker run --privileged --rm tonistiigi/binfmt --install all

echo "Creating and switching to buildx builder 'multiarch-builder'..."
if ! docker buildx inspect multiarch-builder >/dev/null 2>&1; then
  docker buildx create --name multiarch-builder --use
else
  docker buildx use multiarch-builder
fi

echo "Bootstrapping buildx builder..."
docker buildx inspect --bootstrap

echo "Running buildx bake for production (build + push)..."
cd "$ROOT_DIR/docker"
docker buildx bake \
  --allow=fs.read=.. \
  -f docker-compose.yml \
  --push \
  escape-room-git

echo "Done."
