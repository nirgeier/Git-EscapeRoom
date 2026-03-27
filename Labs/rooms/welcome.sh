#!/bin/bash

clear

SCRIPT_PATH=$(dirname -- "${BASH_SOURCE[0]}")

if [ -x "${SCRIPT_PATH}/_utils.sh" ]; then
  source "${SCRIPT_PATH}/_utils.sh"
fi

echo -e "${YELLOW}"
echo -e "--------------------------------------------"
echo -e "          Git Escape Room  🔑               "
echo -e "--------------------------------------------"
echo -e ""

slow_typing "- Welcome to the Git Escape Room!" ${PURPLE}
slow_typing "- Master Git from zero to hero by solving 50 puzzle rooms..." ${GREEN}
slow_typing "- The folder /home/escape/escapeRooms contains the different rooms (folders named room_xx)" ${PURPLE}
slow_typing "- Each folder has an encrypted README file (except the first room)" ${GREEN}
slow_typing "- To reveal the next room README, follow the clues ..." ${PURPLE}
echo -e "- Every README uses ${GREEN}'OpenSSL AES-256-CBC encryption' ${NO_COLOR} ... " ${GREEN}
slow_typing "- To decrypt them you will need a password (key), which you get at the end of each room... " ${PURPLE}

slow_typing ""
slow_typing ">> Tip 01: " ${CYAN}
slow_typing "   To decrypt a room README, use:" ${CYAN}
echo -e "   ${GREEN}openssl enc -aes-256-cbc -d -a -pbkdf2 -in README -out README.txt -pass pass:YOUR_PASSWORD${NO_COLOR}"
echo -e "   ${GREEN}mv README.txt README${NO_COLOR}"
slow_typing "   Then you can read the decrypted file with: cat README" ${CYAN}

slow_typing "" ${CYAN}
slow_typing ">> Tip 02: " ${CYAN}
slow_typing "   To make the magic happen (delete, rename, etc.) " ${CYAN}
slow_typing "   you will need your secret sudo password: " ${CYAN}
echo -e "   ${YELLOW}escape${NO_COLOR}."

slow_typing "" ${CYAN}
slow_typing ">> Sections: " ${CYAN}
slow_typing "   Rooms 01-03 | Getting Started - Install & Configure Git" ${GREEN}
slow_typing "   Rooms 04-06 | The Three States - Working Dir, Staging, Repository" ${YELLOW}
slow_typing "   Rooms 07-10 | Core Commands - commit, log, diff, branch" ${PURPLE}
slow_typing "   Rooms 11-13 | Branching & Merging - merge, conflict, rebase" ${CYAN}
slow_typing "   Rooms 14-16 | Stashing & Remotes - stash, remote, clone" ${GREEN}
slow_typing "   Rooms 17-20 | Remote Operations - fetch, pull, push, tag" ${YELLOW}
slow_typing "   Rooms 21-25 | History Surgery - cherry-pick, reset, revert, amend, blame" ${PURPLE}
slow_typing "   Rooms 26-30 | Detective Tools - bisect, reflog, alias, gitignore, attributes" ${CYAN}
slow_typing "   Rooms 31-35 | Advanced Features - hooks, submodules, worktree, sparse, assume-unchanged" ${GREEN}
slow_typing "   Rooms 36-40 | Maintenance & Sharing - clean, archive, bundle, patch, grep" ${YELLOW}
slow_typing "   Rooms 41-45 | Power Tools - shortlog, describe, notes, replace, filter-branch" ${PURPLE}
slow_typing "   Rooms 46-50 | Git Internals - rerere, fsck, gc, plumbing, objects" ${CYAN}
slow_typing "   Room  99    | Exit Exam - The Grand Escape" ${BRed}

echo -e ""
echo -e "${RED}>>> Press any key to continue to room #01${NO_COLOR}"

read -t 600 -n 1

clear

echo -e ""
slow_typing "This is what you need to do in the First room (room_01):" ${BYELLOW}
echo -e "---------------------------------------------------------"

slow_typing "Welcome to your first room: Installing Git" ${GREEN}
slow_typing "Your first mission: Confirm Git is installed and discover its secrets." ${GREEN}
echo -e ""
slow_typing "1. Run: git --version" ${GREEN}
slow_typing "   Verify that git is installed " ${GREEN}

slow_typing "2. Run: which git" ${YELLOW}
slow_typing "   This shows you where git is called from." ${YELLOW}

slow_typing "3. Find the password:" ${GREEN}
slow_typing "   Look inside the 'room01' git repository in this room." ${GREEN}
slow_typing "   The password is hidden in the commit history." ${GREEN}
slow_typing "   Hint: use 'git log' to reveal it." ${GREEN}

slow_typing "4. Move to the next room:" ${YELLOW}
echo -e "   ${YELLOW}next <PASSWORD>${NO_COLOR}"

echo -e ""
echo -e ""
