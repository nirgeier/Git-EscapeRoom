FROM node:20-alpine

# Install system tools needed by rooms and node-pty
# hadolint ignore=DL3018
RUN apk add --no-cache \
  bash \
  python3 \
  make \
  g++ \
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

# ── Node.js app ───────────────────────────────────────────────────────────────
COPY docker/package.json ./
RUN npm install --omit=dev

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

EXPOSE 3000

ENV SHELL=/bin/bash

# ── Shell aliases ─────────────────────────────────────────────────────────────
RUN echo "alias ll='ls -lah'"  >> /etc/profile.d/aliases.sh && \
  echo "alias la='ls -laF'"  >> /etc/profile.d/aliases.sh && \
  echo "alias l='ls -lAh'"   >> /etc/profile.d/aliases.sh

ENTRYPOINT ["/app/entrypoint.sh"]
