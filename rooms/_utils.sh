#!/bin/bash

########################################
### Colors
########################################
NO_COLOR='\033[0m'

# Regular Colors
Black='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
Blue='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
White='\033[0;37m'

# Bold
BBlack='\033[1;30m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
BYELLOW='\033[1;33m'
BBlue='\033[1;34m'
BPURPLE='\033[1;35m'
BCyan='\033[1;36m'
BWhite='\033[1;37m'

# Function to encrypt file with OpenSSL AES-256-CBC
encrypt_file() {
  local file=$1
  local key=$2
  openssl enc -aes-256-cbc -a -salt -pbkdf2 \
    -in "$file" -out "${file}.enc" \
    -pass pass:"$key" 2>/dev/null
  mv "${file}.enc" "$file"
}

# Function to decrypt file with OpenSSL AES-256-CBC
decrypt_file() {
  local file=$1
  local key=$2
  openssl enc -aes-256-cbc -d -a -pbkdf2 \
    -in "$file" -out "${file}.dec" \
    -pass pass:"$key" 2>/dev/null
  mv "${file}.dec" "$file"
}

function slow_typing() {
  text=$1
  color="${2:-'\033[0;33m'}"
  for ((i = 0; i < ${#text}; i += 1)); do
    echo -n -e "${color}${text:$i:1}${NO_COLOR}"
    sleep 0
  done
  echo
}

print_readme() {
  local file="${1:-README}"
  if command -v glow &>/dev/null; then
    glow "$file"
  else
    cat "$file"
  fi
}

handle_error() {
  local exit_code=$?
  echo "An error occurred with exit code $exit_code"
  exit $exit_code
}
