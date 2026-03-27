---
password: "stash14"
title_prefix: "📦 "
summary: "Save and restore work-in-progress with `git stash`."
---

##GIT STASH: EMERGENCY SHELF

---

## Room 14 - Stashing Your Work

!!! abstract "📜 Your mission"

    Stash lets you SAVE uncommitted work temporarily and come back to it later.

    1. This repo has uncommitted changes. Check:

        * `git status`
        * `git diff`

    2. Stash your current changes:

        * `git stash`
        * (Your working directory is now CLEAN!)

    3. List your stashes:

        * `git stash list`

    4. Apply the stash (keep it in the list):

        * `git stash apply`

    5. Pop the stash (apply + remove from list):

        * `git stash pop`

    6. Stash with a message:

        * `git stash push -m "work in progress on login"`

    7. This repo has multiple stashes. Find the one with message containing "password".
       Apply it to reveal the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                     | Purpose                         |
| --------------------------- | ------------------------------- |
| `git stash`                 | Stash current changes           |
| `git stash push -m "msg"`   | Stash with message              |
| `git stash list`            | List all stashes                |
| `git stash apply`           | Apply latest (keep in list)     |
| `git stash pop`             | Apply latest (remove from list) |
| `git stash apply stash@{2}` | Apply specific stash            |
| `git stash drop stash@{0}`  | Delete a stash                  |
| `git stash clear`           | Delete ALL stashes              |
| `git stash show -p`         | Show stash diff                 |
| `git stash branch <name>`   | Create branch from stash        |

---

## Tasks

### 01. Check for Uncommitted Changes

See what changes exist before stashing.

**Hint:** `git status`, `git diff`

??? note "Solution"

    ```bash
    git status
    # Shows modified files

    git diff
    # Shows the actual changes
    ```

---

### 02. Stash Your Changes

Save all uncommitted changes to the stash.

**Hint:** `git stash`

??? note "Solution"

    ```bash
    git stash
    # Saved working directory and index state WIP on main: abc1234 ...

    git status
    # nothing to commit, working tree clean
    ```

---

### 03. List All Stashes

View every stash entry.

**Hint:** `git stash list`

??? note "Solution"

    ```bash
    git stash list
    # stash@{0}: WIP on main: abc1234 ...
    # stash@{1}: On main: work in progress on login
    # stash@{2}: On main: password hidden here
    ```

---

### 04. Apply a Stash Without Removing It

Restore stashed changes but keep the stash in the list.

**Hint:** `git stash apply`

??? note "Solution"

    ```bash
    git stash apply
    # Changes restored to working directory

    git stash list
    # stash@{0} still present
    ```

---

### 05. Pop a Stash

Apply a stash and remove it from the list in one step.

**Hint:** `git stash pop`

??? note "Solution"

    ```bash
    git stash pop
    # Changes restored AND stash@{0} removed

    git stash list
    # stash@{0} is gone
    ```

---

### 06. Stash with a Descriptive Message

Create a stash with a custom message so you can find it later.

**Hint:** `git stash push -m "message"`

??? note "Solution"

    ```bash
    git stash push -m "work in progress on login"
    # Saved working directory and index state On main: work in progress on login

    git stash list
    # stash@{0}: On main: work in progress on login
    ```

---

### 07. Apply a Specific Stash

Apply a stash by its index rather than the latest.

**Hint:** `git stash apply stash@{N}`

??? note "Solution"

    ```bash
    git stash apply stash@{2}
    # Applies the third stash (0-indexed)
    ```

---

### 08. View Stash Contents Without Applying

Peek at what a stash contains.

**Hint:** `git stash show -p stash@{N}`

??? note "Solution"

    ```bash
    git stash show stash@{1}
    # Shows file summary

    git stash show -p stash@{1}
    # Shows the full diff
    ```

---

### 09. Find the Password

One of the stashes has a message containing "password". Find and apply it.

**Hint:** `git stash list`, look for the right stash, then `git stash apply stash@{N}`

??? note "Solution"

    ```bash
    git stash list
    # Find the stash with "password" in the message

    git stash show -p stash@{N}
    # Read the content to find the password

    # Or apply it:
    git stash apply stash@{N}
    cat <the-modified-file>
    ```

---

!!! success "🔓 Unlock Room 15"

    ```bash
    next <PASSWORD>
    ```
