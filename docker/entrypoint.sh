#!/bin/bash
# =============================================================================
# Git Escape Room - Container Entrypoint
#
# 1. Creates the 'escape' user with sudo access
# 2. Copies room content fresh into /home/escape/escapeRooms/
# 3. Runs all room setup: encrypts READMEs, initializes git repos per room
# 4. Writes helper .bashrc / .bash_profile for the user shell
# 5. Starts the Node.js web-terminal server
# =============================================================================
set -eu

BASE=/home/escape/escapeRooms
CONTENT=/app/rooms

# ── 1. Create user ────────────────────────────────────────────────────────────
adduser -D -s /bin/bash -h /home/escape escape 2>/dev/null || true
echo "escape:escape" | chpasswd

echo "escape ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/escape
chmod 0440 /etc/sudoers.d/escape

# ── Configure git globally (root runs setup scripts, escape user inherits) ───
git config --global user.name "Escape Artist"
git config --global user.email "escape@git-escaperoom.dev"
git config --global init.defaultBranch main
git config --global core.editor vim
git config --global color.ui auto

# ── 2. Copy fresh room content ────────────────────────────────────────────────
rm -rf "$BASE"
cp -rp "$CONTENT" "$BASE"
chmod -R a+rwX "$BASE"

# ── 3. Room-specific setup ────────────────────────────────────────────────────
echo "Setting up room environments..."

# ── Helper: encrypt room .md file ───────────────────────────────────────────
encrypt_readme() {
    local room=$1 password=$2
    local num=$(echo "$room" | sed 's/room_//')
    local mdfile="$BASE/$room/Room-${num}.md"
    [ -f "$mdfile" ] || return 0
    openssl enc -aes-256-cbc -a -salt -pbkdf2 \
        -in "$mdfile" \
        -out "${mdfile}.enc" \
        -pass pass:"$password" 2>/dev/null
    mv "${mdfile}.enc" "$mdfile"
    echo "  [OK] $room encrypted"
}

# ── Encrypt READMEs for rooms 02+ ────────────────────────────────────────────
echo "Encrypting room READMEs..."
encrypt_readme room_02 "installed"
encrypt_readme room_03 "config42"
encrypt_readme room_04 "main"
encrypt_readme room_05 "restore"
encrypt_readme room_06 "staged01"
encrypt_readme room_07 "commit7"
encrypt_readme room_08 "logmaster"
encrypt_readme room_09 "diffview"
encrypt_readme room_10 "branch10"
encrypt_readme room_11 "merged11"
encrypt_readme room_12 "conflict"
encrypt_readme room_13 "rebase13"
encrypt_readme room_14 "stash14"
encrypt_readme room_15 "remote15"
encrypt_readme room_16 "clone16"
encrypt_readme room_17 "fetch17"
encrypt_readme room_18 "pull18"
encrypt_readme room_19 "push19"
encrypt_readme room_20 "tag20"
encrypt_readme room_21 "cherry21"
encrypt_readme room_22 "reset22"
encrypt_readme room_23 "revert23"
encrypt_readme room_24 "amend24"
encrypt_readme room_25 "blame25"
encrypt_readme room_26 "bisect26"
encrypt_readme room_27 "reflog27"
encrypt_readme room_28 "alias28"
encrypt_readme room_29 "ignore29"
encrypt_readme room_30 "attrib30"
encrypt_readme room_31 "hook31"
encrypt_readme room_32 "submod32"
encrypt_readme room_33 "worktree"
encrypt_readme room_34 "sparse34"
encrypt_readme room_35 "assume35"
encrypt_readme room_36 "clean36"
encrypt_readme room_37 "archive"
encrypt_readme room_38 "bundle38"
encrypt_readme room_39 "patch39"
encrypt_readme room_40 "grep40"
encrypt_readme room_41 "shortlog"
encrypt_readme room_42 "describe"
encrypt_readme room_43 "notes43"
encrypt_readme room_44 "replace"
encrypt_readme room_45 "filter45"
encrypt_readme room_46 "rerere46"
encrypt_readme room_47 "fsck47"
encrypt_readme room_48 "gc48"
encrypt_readme room_49 "plumb49"
encrypt_readme room_50 "objects"
encrypt_readme room_99 "escaped"

# ── 4. Fix final ownership ────────────────────────────────────────────────────
chown -R escape:escape /home/escape

# Copy root's gitconfig to escape user so they have the same defaults
cp /root/.gitconfig /home/escape/.gitconfig 2>/dev/null || true
chown escape:escape /home/escape/.gitconfig 2>/dev/null || true

# ── 5. Write .bashrc ─────────────────────────────────────────────────────────
cat >/home/escape/.bashrc <<'BASHRC'
# Load shared utilities (colors, slow_typing, encrypt/decrypt helpers)
[ -f /home/escape/escapeRooms/_utils.sh ] && source /home/escape/escapeRooms/_utils.sh

# Custom prompt showing git branch
git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='\[\033[01;32m\]escape\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(git_branch)\[\033[00m\]\$ '

export HOME=/home/escape
export ESCAPE_ROOMS=/home/escape/escapeRooms

# Shorthand: decrypt a room's .md file in-place
# Usage: decrypt_room <room_dir> <password>
decrypt_room() {
    local dir="$ESCAPE_ROOMS/$1" pass="$2"
    local num="${1##*_}"          # room_05 → 05
    local md="Room-${num}.md"
    openssl enc -aes-256-cbc -d -a -pbkdf2 \
        -in  "$dir/$md" \
        -out "$dir/${md}.dec" \
        -pass pass:"$pass" 2>/dev/null \
    && mv "$dir/${md}.dec" "$dir/$md" \
    && echo "Decrypted! Run: cat $dir/$md" \
    || echo "Wrong password or file already decrypted."
}

# Navigate to the next room, optionally decrypt its Room-XX.md
# Usage: next [password]
next() {
    local cur="$PWD"
    # Extract room number from current path (e.g. room_01 -> 1)
    local num=$(echo "$cur" | grep -oE 'room_[0-9]+' | tail -1 | sed 's/room_0*//')
    if [ -z "$num" ]; then
        echo -e "\033[0;31mCannot detect current room. Navigate to a room folder first.\033[0m"
        return 1
    fi
    local next_num=$(printf "%02d" $((num + 1)))
    local next_dir="$ESCAPE_ROOMS/room_${next_num}"
    if [ ! -d "$next_dir" ]; then
        echo -e "\033[0;31mNo room_${next_num} found. You may have reached the end!\033[0m"
        return 1
    fi
    # If a password was provided, decrypt the next room's .md file
    local decrypted=0
    if [ -n "${1:-}" ]; then
        local mdfile="$next_dir/Room-${next_num}.md"
        if [ -f "$mdfile" ]; then
            # Check if already decrypted (encrypted files are base64 and start with "U2FsdGVk" = "Salted__")
            if ! head -1 "$mdfile" 2>/dev/null | grep -q '^U2FsdGVk'; then
                echo -e "\033[0;33mRoom is already decrypted.\033[0m"
                decrypted=1
            else
                openssl enc -aes-256-cbc -d -a -pbkdf2 \
                    -in "$mdfile" \
                    -out "${mdfile}.dec" \
                    -pass pass:"$1" 2>/dev/null \
                && mv "${mdfile}.dec" "$mdfile" \
                && decrypted=1 \
                || { rm -f "${mdfile}.dec"; echo -e "\033[0;31mWrong password! Room was not decrypted.\033[0m"; return 1; }
            fi
        fi
    fi
    cd "$next_dir"
    echo -e "\033[0;32m>> Moved to Room ${next_num}\033[0m"
    if [ "$decrypted" -eq 1 ]; then
        # Hidden marker for the web UI to auto-decrypt the docs page
        echo -e "\033]1337;UnlockRoom=${next_num}:${1}\007"
        clear
    fi
}

# Show welcome + room 01 instructions on first interactive login
if [ -z "${ESCAPE_ROOM_WELCOMED:-}" ]; then
    export ESCAPE_ROOM_WELCOMED=1
    bash /home/escape/escapeRooms/welcome.sh
fi
BASHRC

cat >/home/escape/.bash_profile <<'PROFILE'
[ -f ~/.bashrc ] && source ~/.bashrc
cd /home/escape/escapeRooms/room_01
PROFILE

chown escape:escape /home/escape/.bashrc /home/escape/.bash_profile

# ── 6. Start web server ───────────────────────────────────────────────────────
exec node /app/server.js
