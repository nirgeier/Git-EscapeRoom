---
password: "fetch17"
title_prefix: "⬇️ "
summary: "Download remote changes without merging using `git fetch`."
---

##GIT FETCH: DOWNLOAD WITHOUT MERGING

---

## Room 17 - Fetching Updates

!!! abstract "📜 Your mission"

    Fetch downloads new data from a remote without changing your working files.

    1. This repo is cloned from a remote that has new commits.

        Check: `git log --oneline --all`

    2. Fetch the latest:

        * `git fetch origin`

    3. Compare local vs remote:

        * `git log --oneline main..origin/main`

    4. View what was fetched:

        * `git log --oneline --all --graph`

    5. Fetch DOES NOT change your working directory or current branch.
       It only updates remote-tracking branches (`origin/main`, etc.)

    6. Fetch all remotes:

        * `git fetch --all`

    7. Prune deleted remote branches:

        * `git fetch --prune`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                     | Purpose                        |
| --------------------------- | ------------------------------ |
| `git fetch origin`          | Fetch from origin              |
| `git fetch --all`           | Fetch from all remotes         |
| `git fetch --prune`         | Remove deleted remote branches |
| `git log main..origin/main` | See what was fetched           |

### Fetch vs Pull

```
fetch:  Downloads data → Updates remote-tracking branches → Does NOT merge
pull:   Downloads data → Updates remote-tracking branches → MERGES into current
```

---

## Tasks

### 01. View Current State

Check what branches exist locally and remotely before fetching.

**Hint:** `git log --oneline --all --graph`

??? note "Solution"

    ```bash
    git log --oneline --all --graph
    # Shows local branches and remote-tracking branches
    ```

---

### 02. Fetch from Origin

Download new data from origin without merging.

**Hint:** `git fetch origin`

??? note "Solution"

    ```bash
    git fetch origin
    # remote: Counting objects...
    # From ...
    #    abc1234..def5678  main -> origin/main
    ```

---

### 03. See What Was Fetched

Compare the local main with what origin has.

**Hint:** `git log main..origin/main`

??? note "Solution"

    ```bash
    git log --oneline main..origin/main
    # Shows commits on origin/main that aren't in local main
    ```

---

### 04. Verify Working Directory Is Unchanged

Confirm that fetch did NOT modify your files.

**Hint:** `git status`, `git diff`

??? note "Solution"

    ```bash
    git status
    # Your branch is behind 'origin/main' by N commits
    # nothing to commit, working tree clean

    # Fetch only updates remote-tracking refs, NOT your files
    ```

---

### 05. Fetch from All Remotes

If you have multiple remotes, fetch from all of them at once.

**Hint:** `git fetch --all`

??? note "Solution"

    ```bash
    git fetch --all
    # Fetching origin
    # Fetching upstream
    # ...
    ```

---

### 06. Prune Stale Remote Branches

Clean up remote-tracking branches that no longer exist on the remote.

**Hint:** `git fetch --prune`

??? note "Solution"

    ```bash
    git fetch --prune
    # - [deleted]  origin/old-feature
    # Removes local refs to branches deleted on the remote
    ```

---

### 07. Integrate Fetched Changes

After fetching, merge or rebase to integrate the new commits.

**Hint:** `git merge origin/main` or `git rebase origin/main`

??? note "Solution"

    ```bash
    # Option 1: Merge
    git merge origin/main

    # Option 2: Rebase (linear history)
    git rebase origin/main
    ```

---

### 08. Find the Password

Fetch from origin, then look at the new commits that arrived. The password is in one of them.

**Hint:** `git fetch origin`, `git log main..origin/main`

??? note "Solution"

    ```bash
    git fetch origin
    git log --oneline main..origin/main
    # One of the fetched commit messages contains the password
    ```

---

!!! success "🔓 Unlock Room 18"

    ```bash
    next <PASSWORD>
    ```
