#!/usr/bin/env bash
# Thin wrapper — delegates to the shared escaperoom-framework build script
SERVICE_NAME=escape-room-git \
  IMAGE=${IMAGE:-ghcr.io/nirgeier/git-escaperoom} \
  IMAGE_TAG=${IMAGE_TAG:-latest} \
  exec "$(git rev-parse --show-toplevel)/.escaperoom-framework/build.sh" "$@"
