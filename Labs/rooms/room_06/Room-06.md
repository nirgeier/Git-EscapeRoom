---
password: "staged01"
title_prefix: "🔍 "
summary: "Read `git status` to find deleted and renamed files - the longest deleted filename is the password."
---

# GIT STATUS: READING THE CRIME SCENE

---

## Room 06 - Deleted, Renamed, and Gone

!!! abstract "📜 Your mission"

    * Someone has been busy.
    * Files have been **deleted** and **renamed** - all already staged and
    ready to commit.
    * Your job is to use `git status` (and its friends) to figure out exactly
    what happened.
    * The **password for the next room** is hidden in plain sight:
    it is the **filename of the longest deleted file**.

    ---

    **Step-by-step:**

    1. Enter the room and run a full status:

        ```bash
        cd room_06
        git status
        ```

        Look at the **"Changes to be committed"** section - that is where staged deletions
        and renames appear.

    2. Switch to the short format for a quicker overview:

        ```bash
        git status -s
        ```

        Status codes to watch for:

        | Code | Meaning               |
        |------|-----------------------|
        | `D`  | Deleted (staged)      |
        | `R`  | Renamed (staged)      |
        | `M`  | Modified (not staged) |
        | `??` | Untracked             |

    3. Filter for **only deleted** staged files:

        ```bash
        git diff --diff-filter=D --name-only --cached
        ```

    4. List the deleted filenames, find the **longest** one - that is your password.

    5. Unlock the next room:

        ```bash
        next <PASSWORD>
        ```

---

### Quick Reference

| Command                                         | Purpose                                   |
| ----------------------------------------------- | ----------------------------------------- |
| `git status`                                    | Full status - staged, unstaged, untracked |
| `git status -s`                                 | Short two-column format                   |
| `git status -sb`                                | Short format + branch info                |
| `git status --porcelain`                        | Machine-readable (script-safe) output     |
| `git diff --name-status --cached`               | Staged files with status letter (A/D/R/M) |
| `git diff --diff-filter=D --cached --name-only` | Only staged deletions                     |
| `git diff --diff-filter=R --cached --name-only` | Only staged renames                       |

---

## Tasks

### 01. Full Status - Read Every Section

Run the full status and identify what happened: which files were deleted, which were renamed.

**Hint:** `git status`

??? note "Solution"

    ```bash
    git status
    # On branch main
    # Changes to be committed:
    #   deleted:    api.sh
    #   deleted:    commit7
    #   deleted:    db.log
    #   deleted:    run.sh
    #   renamed:    app.cfg -> config.cfg
    #   renamed:    server.py -> web_server.py
    #
    # Changes not staged for commit:
    #   modified:   utils.sh
    #
    # Untracked files:
    #   scratch.txt
    ```

---

### 02. Short Format - Spot the Status Codes

Use the compact view to see every file's two-letter status code at a glance.

**Hint:** `git status -s`

??? note "Solution"

    ```bash
    git status -s
    # D  api.sh
    # D  commit7
    # D  db.log
    # D  run.sh
    # R  app.cfg -> config.cfg
    # R  server.py -> web_server.py
    # M  utils.sh
    # ?? scratch.txt
    #
    # D  = deleted and staged
    # R  = renamed and staged
    # M  = modified but NOT staged (space in first column)
    # ?? = untracked
    ```

---

### 03. Machine-Readable Output

Get a stable format suitable for scripting or piping.

**Hint:** `git status --porcelain`

??? note "Solution"

    ```bash
    git status --porcelain
    # D  api.sh
    # D  commit7
    # D  db.log
    # D  run.sh
    # R  app.cfg -> config.cfg
    # R  server.py -> web_server.py
    # M  utils.sh
    # ?? scratch.txt
    ```

---

### 04. List Staged Changes with Status Letters

Use `git diff --cached` to see exactly what is staged, one file per line with its status letter.

**Hint:** `git diff --name-status --cached`

??? note "Solution"

    ```bash
    git diff --name-status --cached
    # D    api.sh
    # D    commit7
    # D    db.log
    # D    run.sh
    # R100 app.cfg    config.cfg
    # R100 server.py  web_server.py
    #
    # D    = deleted
    # R100 = renamed with 100% similarity
    ```

---

### 05. Filter - Only Staged Deletions

Show only the files that were deleted (ignore renames, modifications, and untracked).

**Hint:** `git diff --diff-filter=D --cached --name-only`

??? note "Solution"

    ```bash
    git diff --diff-filter=D --cached --name-only
    # api.sh
    # commit7
    # db.log
    # run.sh
    #
    # Four files were deleted.
    # Their name lengths: api.sh=6, db.log=6, run.sh=6, commit7=7
    # The longest is: commit7
    ```

---

### 06. Filter - Only Staged Renames

Show only the files that were renamed, confirming what their new names are.

**Hint:** `git diff --diff-filter=R --cached --name-status`

??? note "Solution"

    ```bash
    git diff --diff-filter=R --cached --name-status
    # R100 app.cfg    config.cfg
    # R100 server.py  web_server.py
    ```

---

### 07. Show Branch Info

Include the current branch name in the status output.

**Hint:** `git status -sb`

??? note "Solution"

    ```bash
    git status -sb
    # ## main
    # D  api.sh
    # D  commit7
    # ...
    ```

---

### 08. Find the Password

Look at all the deleted filenames. The **longest** one is the password.

**Hint:** `git diff --diff-filter=D --cached --name-only`

??? note "Solution"

    ```bash
    git diff --diff-filter=D --cached --name-only
    # api.sh    ← 6 chars
    # commit7   ← 7 chars  ✓ longest
    # db.log    ← 6 chars
    # run.sh    ← 6 chars

    # Password: commit7
    ```

---

!!! success "🔓 Unlock Room 07"

    ```bash
    next commit7
    ```

---

### Short Status Code Reference

    XY  Meaning
    ──  ─────────────────────────────
    D   Deleted and staged
    R   Renamed and staged
    M   Modified and staged
    A   New file staged
    M   Modified but NOT staged
    D   Deleted but NOT staged
    ??  Untracked file
    MM  Staged then modified again
