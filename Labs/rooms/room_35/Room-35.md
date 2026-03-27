---
password: "assume35"
title_prefix: "🫣 "
summary: "Tell Git to ignore local changes to tracked files - useful for config tweaks."
---

##GIT ASSUME-UNCHANGED: HIDING LOCAL EDITS

---

## Room 35 - Invisible Local Changes

!!! abstract "📜 Your mission"

    Sometimes you need to modify a tracked file locally without Git noticing.

    1. Mark a file as "assume unchanged":

        * `git update-index --assume-unchanged config.local.txt`
        * Now Git IGNORES local changes to this file!

    2. Modify the file - Git won't show it in status:

        * `echo "local override" >> config.local.txt`
        * `git status` (no changes shown!)

    3. List assume-unchanged files:

        * `git ls-files -v | grep ^h`
        * (lowercase `h` = assume-unchanged)

    4. Undo assume-unchanged:

        * `git update-index --no-assume-unchanged config.local.txt`

    5. Alternative: skip-worktree (stronger):

        * `git update-index --skip-worktree config.local.txt`
        * `git ls-files -v | grep ^S`

    6. Use cases:

        * Local config overrides
        * IDE settings files
        * Environment-specific files

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                         | Purpose                           |
| ----------------------------------------------- | --------------------------------- |
| `git update-index --assume-unchanged <file>`    | Ignore local changes to a file    |
| `git update-index --no-assume-unchanged <file>` | Resume tracking changes           |
| `git ls-files -v \| grep '^h'`                  | List all assume-unchanged files   |
| `git update-index --skip-worktree <file>`       | Stronger variant (survives reset) |
| `git update-index --no-skip-worktree <file>`    | Undo skip-worktree                |
| `git ls-files -v \| grep '^S'`                  | List all skip-worktree files      |

### assume-unchanged vs skip-worktree

```
                     assume-unchanged          skip-worktree
──────────────────────────────────────────────────────────────
Purpose              Performance hint          User intent
Survives checkout    No (may be reset)         Yes
Survives reset       No                        Yes
Use case             Large files, build opts   Local config overrides
Flag in ls-files -v  h (lowercase)             S (uppercase)

WHEN TO USE WHICH:
  assume-unchanged → "I know this file won't change, skip checking"
  skip-worktree    → "I changed this file locally, don't overwrite it"
```

!!! warning "⚠️ Not a replacement for .gitignore"
These flags only work on TRACKED files. For untracked files,
use `.gitignore` instead.

---

## Tasks

### 01. Mark a File as Assume-Unchanged

Hide local changes to a config file from Git.

**Hint:** `git update-index --assume-unchanged <file>`

??? note "Solution"

    ```bash
    git update-index --assume-unchanged config.local.txt
    ```

---

### 02. Modify Without Git Noticing

Edit the file and verify Git doesn't show changes.

**Hint:** `echo >> config.local.txt`, `git status`

??? note "Solution"

    ```bash
    echo "local override" >> config.local.txt
    git status
    # nothing to commit, working tree clean
    # Git ignores the change!
    ```

---

### 03. List Assume-Unchanged Files

Find all files marked with the assume-unchanged flag.

**Hint:** `git ls-files -v | grep '^h'`

??? note "Solution"

    ```bash
    git ls-files -v | grep '^h'
    # h config.local.txt
    # lowercase 'h' = assume-unchanged
    ```

---

### 04. Remove the Flag

Resume tracking changes to the file.

**Hint:** `git update-index --no-assume-unchanged <file>`

??? note "Solution"

    ```bash
    git update-index --no-assume-unchanged config.local.txt

    git status
    # modified: config.local.txt  ← changes visible again
    ```

---

### 05. Use Skip-Worktree Instead

Apply the stronger variant that survives resets.

**Hint:** `git update-index --skip-worktree <file>`

??? note "Solution"

    ```bash
    git update-index --skip-worktree config.local.txt

    git ls-files -v | grep '^S'
    # S config.local.txt
    # Uppercase 'S' = skip-worktree
    ```

---

### 06. Undo Skip-Worktree

Remove the skip-worktree flag.

**Hint:** `git update-index --no-skip-worktree <file>`

??? note "Solution"

    ```bash
    git update-index --no-skip-worktree config.local.txt

    git ls-files -v | grep -E '^[hS]'
    # No results - both flags are cleared
    ```

---

### 07. Find the Password

Check which file has the assume-unchanged flag set. Read its real content.

**Hint:** `git ls-files -v | grep '^h'`, then `cat` that file

??? note "Solution"

    ```bash
    git ls-files -v | grep '^h'
    # Find the assume-unchanged file

    cat <that-file>
    # The hidden content contains the password
    ```

---

!!! success "🔓 Unlock Room 36"

    ```bash
    next <PASSWORD>
    ```
