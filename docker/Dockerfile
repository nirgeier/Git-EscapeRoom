# ── Stage 1: build node-pty native addon ─────────────────────────────────────
FROM node:20-alpine AS builder

# hadolint ignore=DL3018
RUN apk add --no-cache python3 make g++

WORKDIR /app
COPY docker/package.json ./
RUN npm install --omit=dev

# ── Stage 2: runtime image ────────────────────────────────────────────────────
FROM node:20-alpine

ARG SourceRepository=https://github.com/nirgeier/Git-EscapeRoom

# Install only runtime tools needed by the escape room
# hadolint ignore=DL3018
RUN apk add --no-cache \
  bash \
  coreutils \
  curl \
  vim \
  less \
  grep \
  sed \
  gawk \
  findutils \
  tree \
  openssl \
  shadow \
  sudo \
  git \
  git-lfs \
  openssh \
  patch \
  diffutils

WORKDIR /app

# Copy pre-built node_modules from builder (no python/make/g++ in final image)
COPY --from=builder /app/node_modules ./node_modules
COPY docker/package.json ./

COPY docker/server.js  ./
COPY docker/public/    ./public/

# ── Escape room content ───────────────────────────────────────────────────────
COPY Labs/rooms/ ./rooms/

# ── Run setup.sh for each room that has one ───────────────────────────────────
RUN git config --global user.name "Escape Artist" && \
  git config --global user.email "escape@git-escaperoom.dev" && \
  git config --global init.defaultBranch main && \
  for setup in ./rooms/room_*/setup.sh; do \
  [ -f "$setup" ] && (cd "$(dirname "$setup")" && bash setup.sh) || true; \
  done

# ── Pre-built mkdocs documentation (served at /docs/) ────────────────────────
COPY mkdocs-site/ ./docs/

# ── Entrypoint ────────────────────────────────────────────────────────────────
COPY docker/entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

LABEL org.opencontainers.image.description="Interactive Git Escape Room - learn Git by solving puzzles in a browser-based terminal"
LABEL org.opencontainers.image.source="${SourceRepository}"

EXPOSE 3000

ENV SHELL=/bin/bash

# ── Shell aliases ─────────────────────────────────────────────────────────────
RUN echo "alias ll='ls -lah'"  >> /etc/profile.d/aliases.sh && \
  echo "alias la='ls -laF'"  >> /etc/profile.d/aliases.sh && \
  echo "alias l='ls -lAh'"   >> /etc/profile.d/aliases.sh

ENTRYPOINT ["/app/entrypoint.sh"]
