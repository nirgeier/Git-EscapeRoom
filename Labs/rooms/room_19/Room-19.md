---
password: "push19"
title_prefix: "⬆️ "
summary: "Share commits with `git push`, set upstream, and manage remote branches."
---

##GIT PUSH: SHARING YOUR WORK

---

## Room 19 - Pushing to Remote

!!! abstract "📜 Your mission"

    Push sends your local commits to a remote repository.

    1. This repo has local commits not yet pushed.

        * `git log --oneline origin/main..main`

    2. Push to remote:

        * `git push origin main`

    3. Push a new branch:

        * `git push -u origin feature-branch`
        * (`-u` sets up tracking so future pushes are simpler)

    4. Push all branches:

        * `git push --all origin`

    5. Delete a remote branch:

        * `git push origin --delete old-branch`

    6. Force push (DANGEROUS - rewrites remote history):

        * `git push --force` (or `--force-with-lease` for safety)

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                         | Purpose              |
| ------------------------------- | -------------------- |
| `git push origin main`          | Push to remote       |
| `git push -u origin <branch>`   | Push + set upstream  |
| `git push --all`                | Push all branches    |
| `git push --tags`               | Push all tags        |
| `git push --force-with-lease`   | Safe force push      |
| `git push origin --delete <br>` | Delete remote branch |

⚠️ **Never `--force` on shared branches** - use `--force-with-lease` instead!

---

## Tasks

### 01. See Unpushed Commits

Check which commits exist locally but not yet on the remote.

**Hint:** `git log origin/main..main`

??? note "Solution"

    ```bash
    git log --oneline origin/main..main
    # Shows commits that haven't been pushed
    ```

---

### 02. Push to Remote

Push your local main branch to origin.

**Hint:** `git push origin main`

??? note "Solution"

    ```bash
    git push origin main
    # Enumerating objects...
    # To https://...
    #    abc1234..def5678  main -> main
    ```

---

### 03. Push and Set Upstream

Push a new branch and set up tracking.

**Hint:** `git push -u origin <branch>`

??? note "Solution"

    ```bash
    git push -u origin feature-branch
    # Branch 'feature-branch' set up to track 'origin/feature-branch'

    # Now 'git push' alone works for this branch
    ```

---

### 04. Push All Branches

Push every local branch to the remote.

**Hint:** `git push --all origin`

??? note "Solution"

    ```bash
    git push --all origin
    # Pushes all local branches to origin
    ```

---

### 05. Push Tags

Send tags to the remote.

**Hint:** `git push --tags`

??? note "Solution"

    ```bash
    git push origin v1.0       # push one tag
    git push origin --tags     # push all tags
    ```

---

### 06. Delete a Remote Branch

Remove a branch from the remote.

**Hint:** `git push origin --delete <branch>`

??? note "Solution"

    ```bash
    git push origin --delete old-branch
    # - [deleted]  old-branch
    ```

---

### 07. Safe Force Push

When you've rewritten history, use the safe version of force push.

**Hint:** `git push --force-with-lease`

??? note "Solution"

    ```bash
    git push --force-with-lease
    # Only forces if the remote hasn't been updated by someone else
    # Safer than plain --force
    ```

---

### 08. Find the Password

Check the unpushed commits or files in the repo for the password.

**Hint:** `git log --oneline`, `cat` the files

??? note "Solution"

    ```bash
    git log --oneline
    # Look through commit messages or files for the password
    ```

---

!!! success "🔓 Unlock Room 20"

    ```bash
    next <PASSWORD>
    ```
