---
password: "branch10"
title_prefix: "🌿 "
summary: "Create, switch, list, and manage branches with `git branch` and `git switch`."
---

##GIT BRANCH: PARALLEL UNIVERSES

---

## Room 10 - Branching Out

!!! abstract "📜 Your mission"

    Branches let you work on multiple things simultaneously!

    1. List all branches:

        * `git branch`

    2. Create a new branch:

        * `git branch feature-login`

    3. Switch to it:

        * `git checkout feature-login`
        * (or: `git switch feature-login`)

    4. Create AND switch in one command:

        * `git checkout -b feature-signup`
        * (or: `git switch -c feature-signup`)

    5. This repo has several branches. List them all:

        * `git branch -a`

    6. Find the branch that contains a file called `secret_key.txt`.
       Switch to that branch and read the file.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

---

### Key Commands

| Command                     | Purpose                   |
| --------------------------- | ------------------------- |
| `git branch`                | List local branches       |
| `git branch -a`             | List all (local + remote) |
| `git branch <name>`         | Create new branch         |
| `git branch -d <name>`      | Delete merged branch      |
| `git branch -D <name>`      | Force delete branch       |
| `git branch -m <old> <new>` | Rename branch             |
| `git switch <name>`         | Switch to branch          |
| `git switch -c <name>`      | Create + switch           |
| `git checkout <name>`       | Switch (older syntax)     |
| `git checkout -b <name>`    | Create + switch (older)   |

### How Branches Work

```
main:    A ── B ── C ── D        ← HEAD
                    \
feature:             E ── F      ← feature branch

# A branch is just a POINTER to a commit!
# Creating a branch is instant (just writes 41 bytes)
```

---

## Tasks

### 01. List Local Branches

See which branches exist in this repo.

**Hint:** `git branch`

??? note "Solution"

    ```bash
    git branch
    # * main           ← current branch (marked with *)
    #   feature-login
    #   feature-signup
    #   secret-vault
    ```

---

### 02. Create a New Branch

Create a branch without switching to it.

**Hint:** `git branch <name>`

??? note "Solution"

    ```bash
    git branch feature-login

    git branch
    # * main
    #   feature-login   ← created but still on main
    ```

---

### 03. Switch to a Branch

Move HEAD to the new branch.

**Hint:** `git switch <name>`, `git checkout <name>`

??? note "Solution"

    ```bash
    git switch feature-login
    # Switched to branch 'feature-login'

    # Older syntax:
    git checkout feature-login
    ```

---

### 04. Create and Switch in One Command

Create a new branch and immediately switch to it.

**Hint:** `git switch -c <name>`, `git checkout -b <name>`

??? note "Solution"

    ```bash
    git switch -c feature-signup
    # Switched to a new branch 'feature-signup'

    # Older syntax:
    git checkout -b feature-signup
    ```

---

### 05. List All Branches Including Remote

See local and remote-tracking branches.

**Hint:** `git branch -a`

??? note "Solution"

    ```bash
    git branch -a
    # * feature-signup
    #   main
    #   feature-login
    #   remotes/origin/main
    ```

---

### 06. Rename a Branch

Rename the current branch or a named branch.

**Hint:** `git branch -m <old> <new>`

??? note "Solution"

    ```bash
    # Rename the current branch
    git branch -m new-name

    # Rename a specific branch
    git branch -m feature-login feature-auth
    ```

---

### 07. Delete a Branch

Remove a branch you no longer need.

**Hint:** `git branch -d <name>`, `git branch -D <name>`

??? note "Solution"

    ```bash
    # Delete a merged branch (safe)
    git branch -d feature-auth

    # Force delete an unmerged branch
    git branch -D feature-auth
    ```

---

### 08. Find the Secret Branch

One of the branches contains a file called `secret_key.txt`. Find it and read the password.

**Hint:** `git branch`, `git switch <branch>`, `cat secret_key.txt`

??? note "Solution"

    ```bash
    # List all branches
    git branch

    # Try each branch, look for secret_key.txt
    git switch secret-vault
    cat secret_key.txt
    # The file contains the password
    ```

---

!!! success "🔓 Unlock Room 11"

    ```bash
    next <PASSWORD>
    ```
