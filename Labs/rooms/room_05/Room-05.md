---
password: "restore"
title_prefix: "➕ "
summary: "Master `git add` with patterns, patches, and interactive staging."
---

## GIT ADD: STAGING DEEP DIVE

---

## Room 05 - The Staging Area

!!! abstract "📜 Your mission"

    * The **staging area** (also called the *index*) is Git's superpower.
    * Unlike most VCS tools, Git lets you choose exactly what enters each commit - file by file, or even hunk by hunk.
    * Work through the tasks below to master every flavour of `git add`.
    At the end, a hidden puzzle lets you **discover the password** by staging Python files.

    ---

    **How to find the password - step by step:**

    1. Enter the room directory and inspect the repo:

        ```bash
        cd room_05
        git status
        ```

    2. You will find **8 untracked Python files**, each named with a step number followed by a word - for example `1_scanner.py`, `2_tracker.py`, and so on up to `8_1nterface.py`.

    3. Stage **all** Python files at once:

    4. List the staged files in order:

        * The files appear sorted numerically (1 → 8) because of their `N_` prefix.

    5. For each filename, **skip the step number and the underscore**, then take the
       **very first character** of what remains:

        ```
        1_aaaa.py    →  a
        2_bbbb.py    →  b
        3_cccc.py    →  c
        4_dddd.py    →  d
        5_eeee.py    →  e
        6_ffff.py    →  f
        7_0000.py    →  0   ← digit, not a letter
        8_1111.py    →  1   ← digit, not a letter
        ────────────────────
        Password        →  abcdef01
        ```

    6. Use the password to unlock the next room:

        ```bash
        next staged01
        ```

---

### Quick Reference

| Command                       | Purpose                                                       |
| ----------------------------- | ------------------------------------------------------------- |
| `git add <file>`              | Stage a specific file                                         |
| `git add <dir>/`              | Stage all changes inside a directory                          |
| `git add *.txt`               | Stage by glob pattern                                         |
| `git add .`                   | Stage everything in the current directory (recursive)         |
| `git add -A`                  | Stage ALL changes - new, modified **and** deleted             |
| `git add -u`                  | Stage modifications & deletions of already-tracked files only |
| `git add -p`                  | Interactive **patch** mode - stage individual hunks           |
| `git add -i`                  | Full interactive staging menu                                 |
| `git add -N <file>`           | Mark an untracked file with intent-to-add                     |
| `git add -f <file>`           | Force-add a file that matches `.gitignore`                    |
| `git add -n`                  | Dry-run - show what _would_ be staged without doing it        |
| `git restore --staged <file>` | Unstage a file (keep working-copy changes)                    |
| `git diff --staged`           | Show what is currently staged vs last commit                  |
| `git diff`                    | Show unstaged working-copy changes                            |

---

## Tasks

### 01. Inspect the Starting State

Before touching `git add`, understand what you are working with.

- You just entered `room_05` and need a clear picture of the working tree.
- Knowing which files are tracked, untracked, or modified is the first step before staging anything.

**Hint:** `git status`, `git status -s`

??? note "Solution"

    ```bash
    # Full status - verbose, human-readable
    git status

    # Short format - one line per file
    # M = modified, A = staged new, ?? = untracked
    git status -s

    # Expected: many ?? untracked files and one M changes.txt
    ```

---

### 02. Stage a Single Specific File

- You want to add only `1_hello.txt` to the next commit.
- Passing the exact filename is the most precise form of staging.

**Hint:** `git add <filename>`

??? note "Solution"

    ```bash
    git add 1_hello.txt

    # Verify it is staged
    git status -s
    # Expected:
    # A  1_hello.txt        ← green A means "staged new file"
    # ?? 2_notes.txt
    # ...
    ```

---

### 03. Stage Multiple Named Files at Once

- You want to stage both `2_notes.txt` and `3_todo.txt` in a single command.
- `git add` accepts multiple filenames separated by spaces.

**Hint:** `git add file1 file2 ...`

??? note "Solution"

    ```bash
    git add 2_notes.txt 3_todo.txt

    git status -s
    # Expected:
    # A  2_notes.txt
    # A  3_todo.txt
    # ?? 4_log_2026_03_15.txt
    # ...
    ```

---

### 04. Stage Files Matching a Glob Pattern

- The room contains log files named `4_log_2026_03_15.txt` and `5_log_2026_03_16.txt`.
- You want to stage all log files without listing each one individually.

**Hint:** `git add ?_log_*.txt`

??? note "Solution"

    ```bash
    # Shell glob - the shell expands it before Git sees it
    git add ?_log_*.txt

    # Or quote it so Git expands it (works the same here)
    git add "?_log_*.txt"

    git status -s
    # Expected:
    # A  4_log_2026_03_15.txt
    # A  5_log_2026_03_16.txt
    ```

---

### 05. Stage All Files by Extension

- The repo contains 8 Python files named `1_scanner.py` through `8_1nterface.py`.
- Stage every `.py` file with a single pattern.

**Hint:** `git add *.py`

??? note "Solution"

    ```bash
    git add *.py

    git status -s
    # Expected:
    # A  1_scanner.py
    # A  2_tracker.py
    # A  3_adapter.py
    # A  4_gateway.py
    # A  5_encoder.py
    # A  6_deployer.py
    # A  7_0ps.py
    # A  8_1nterface.py
    ```

---

### 06. Stage Everything at Once (`git add .`)

- You want to stage every untracked and modified file in one shot.
- `git add .` stages all changes rooted at the **current directory** (recursively).

**Hint:** `git add .`

??? note "Solution"

    ```bash
    git add .

    git status -s
    # Expected: every file shows as A (staged new file)
    # M  changes.txt   ← modified tracked file also staged

    # Count staged files
    git diff --name-only --cached | wc -l
    ```

---

### 07. The Difference Between `git add .` and `git add -A`

- `git add .` stages new files and modifications, but **misses deletions** outside the current directory in older Git versions.
- `git add -A` (or `--all`) always stages new + modified + **deleted** files regardless of where you run it.

**Hint:** `git add -A`, `git rm`

??? note "Solution"

    ```bash
    # Simulate a deleted file
    rm 3_todo.txt

    # git add . stages everything including this deletion (Git 2.x)
    git add .
    git status -s
    # D  3_todo.txt   ← deletion is staged

    # Reset and try -A explicitly
    git restore --staged 3_todo.txt
    git restore 3_todo.txt          # bring the file back

    rm 3_todo.txt
    git add -A
    git status -s
    # D  3_todo.txt   ← same result - -A is unambiguous across all Git versions
    ```

---

### 08. Stage Only Already-Tracked Files (`git add -u`)

- `changes.txt` is already tracked (it has a commit). You modified it.
- Several other files are **untracked** - you do NOT want to touch them yet.
- `git add -u` (update) stages modifications and deletions of **tracked** files only.

**Hint:** `git add -u`, `git add --update`

??? note "Solution"

    ```bash
    git add -u

    git status -s
    # Expected:
    # M  changes.txt   ← staged modification of tracked file
    # ?? 1_hello.txt     ← untracked files are untouched
    # ?? 2_notes.txt
    # ...
    ```

---

### 09. Preview What Would Be Staged (Dry Run)

- Before actually staging anything, you want to see which files a `git add` command would affect.
- Use `--dry-run` (or `-n`) to preview without making changes.

**Hint:** `git add -n`, `git add --dry-run`

??? note "Solution"

    ```bash
    # Preview staging all .txt files
    git add -n *.txt
    # Output:
    # add '1_hello.txt'
    # add '7_budget.txt'
    # add '2_notes.txt'
    # ... (no files are actually staged)

    # Confirm nothing changed
    git status -s
    # Still all ?? untracked
    ```

---

### 10. Stage Part of a File - Interactive Patch Mode

- `changes.txt` has **two independent changes**: a production database hostname and a new `api_key` line.
- You want to stage the hostname change but **not** the api_key (it should not be committed yet).
- `git add -p` lets you review and selectively stage individual _hunks_.

**Hint:** `git add -p changes.txt`

??? note "Solution"

    ```bash
    git add -p changes.txt
    # Git shows each hunk and asks: Stage this hunk [y,n,q,a,d,s,e,?]?
    #
    # Hunk options:
    #   y  - yes, stage this hunk
    #   n  - no, skip this hunk
    #   s  - split into smaller hunks
    #   e  - manually edit the hunk
    #   q  - quit, don't stage remaining hunks
    #   ?  - show help

    # After answering each hunk:
    git diff --staged   # shows only what you chose to stage
    git diff            # shows what remains unstaged
    ```

---

### 11. Split a Large Hunk (`s` in patch mode)

- Sometimes `git add -p` shows a single hunk that contains multiple logical changes.
- The `s` key splits the hunk into smaller pieces so you can stage them independently.

**Hint:** `git add -p`, press `s` at the hunk prompt

??? note "Solution"

    ```bash
    git add -p changes.txt
    # When you see a large hunk, type:
    #   s   → split into smaller hunks
    # Then answer y/n for each smaller hunk individually.

    # Verify the split worked
    git diff --staged   # shows only the hunks you approved
    ```

---

### 12. Manually Edit a Hunk (`e` in patch mode)

- The hunk boundaries don't split exactly where you need.
- Typing `e` in patch mode opens the hunk in `$EDITOR` so you can remove individual lines.

**Hint:** `git add -p`, press `e`; lines starting with `+` that you delete won't be staged

??? note "Solution"

    ```bash
    git add -p changes.txt
    # At the hunk prompt, type:  e
    # Your editor opens with the hunk diff.
    #
    # To EXCLUDE a + line from staging:
    #   change  +api_key = SUPER_SECRET_KEY_12345
    #   to       api_key = SUPER_SECRET_KEY_12345   (remove the leading +)
    #
    # Save and quit the editor.
    # Git stages only the lines you kept.

    git diff --staged   # api_key line should NOT appear here
    git diff            # api_key line IS still in the working copy
    ```

---

### 13. Full Interactive Staging Menu (`git add -i`)

- You want a menu-driven interface to see the entire staging area at once, add/reset files, and diff them.

**Hint:** `git add -i`, `git add --interactive`

??? note "Solution"

    ```bash
    git add -i
    # Menu:
    #  1: status       2: update       3: revert
    #  4: add untracked  5: patch      6: diff
    #  7: quit         8: help

    # Workflow:
    # Choose 4 (add untracked) → select files by number → press Enter twice to confirm
    # Choose 5 (patch)         → select file → stage hunks interactively
    # Choose 1 (status)        → review what is staged
    # Choose 7 (quit)
    ```

---

### 14. Mark a File with Intent-to-Add (`-N`)

- You want `git diff` (without `--staged`) to show a new file's content, but you are not ready to stage it.
- `git add -N` (or `--intent-to-add`) registers the path in the index as an empty blob.

**Hint:** `git add -N <file>`

??? note "Solution"

    ```bash
    git add -N 6_readme_draft.txt

    git status -s
    # A  6_readme_draft.txt    ← shows as staged (empty)

    git diff                 # shows the full content as "new additions"
    git diff --staged        # shows an empty file (the intent placeholder)

    # To actually stage the content later:
    git add 6_readme_draft.txt
    ```

---

### 15. Force-Add an Ignored File (`git add -f`)

- Create a `.gitignore` that ignores `*.log` files.
- Then force-add one of the log files anyway.

**Hint:** `git add -f`, `git add --force`

??? note "Solution"

    ```bash
    # Create a .gitignore
    echo "*.log" > .gitignore
    echo "debug output" > debug.log

    # Normal add is blocked
    git add debug.log
    # The following paths are ignored by one of your .gitignore files: debug.log

    # Force it
    git add -f debug.log

    git status -s
    # A  .gitignore
    # A  debug.log   ← staged despite the ignore rule

    # Clean up
    git restore --staged debug.log
    rm debug.log .gitignore
    ```

---

### 16. Unstage a File (`git restore --staged`)

- You accidentally staged `7_budget.txt` but want to remove it from the index while keeping your local changes.

**Hint:** `git restore --staged <file>`

??? note "Solution"

    ```bash
    # Stage the file first
    git add 7_budget.txt
    git status -s
    # A  7_budget.txt

    # Unstage it
    git restore --staged 7_budget.txt
    git status -s
    # ?? 7_budget.txt   ← back to untracked, file content unchanged
    ```

---

### 17. Unstage Everything at Once

- You ran `git add .` and staged everything, but you want to start over.

**Hint:** `git restore --staged .`

??? note "Solution"

    ```bash
    git add .
    git status -s   # all files staged

    # Unstage everything
    git restore --staged .

    git status -s   # all files back to untracked / modified
    ```

---

### 18. Review Staged Changes Before Committing

- Before you commit you want to see exactly what diff will land in the commit.
- `git diff --staged` (alias: `git diff --cached`) shows index vs last commit.

**Hint:** `git diff --staged`, `git diff --cached`

??? note "Solution"

    ```bash
    git add -u        # stage only the modification to changes.txt

    # See what is staged
    git diff --staged
    # Shows the full unified diff of staged changes

    # See what is NOT staged
    git diff
    # Shows working-copy changes not yet in the index

    # See both with a summary
    git diff --stat --staged
    ```

---

### 19. Stage Files in a Specific Sub-directory

- Imagine your repo has a `src/` subdirectory. You want to stage only files inside it.
- Passing a directory path to `git add` stages everything within it recursively.

**Hint:** `git add <directory>/`

??? note "Solution"

    ```bash
    mkdir -p src
    cp calculator.py file_stats.py src/

    git add src/
    git status -s
    # A  src/calculator.py
    # A  src/file_stats.py
    # ?? calculator.py     ← the copies in the root are untouched

    # Clean up
    git restore --staged src/
    rm -rf src/
    ```

---

### 20. Combine Patterns - Add All Config Files

- You have `8_config_dev.txt` and `9_config_prod.txt`.
- Stage only the config files without listing them individually.

**Hint:** `git add ?_config_*.txt`

??? note "Solution"

    ```bash
    git add ?_config_*.txt

    git status -s
    # A  8_config_dev.txt
    # A  9_config_prod.txt
    ```

---

### 21. Use `git add` with Verbose Output

- You want to see every file path as Git stages it, useful when staging large trees.

**Hint:** `git add -v .`

??? note "Solution"

    ```bash
    git add -v .
    # add '1_scanner.py'
    # add '2_tracker.py'
    # add '1_hello.txt'
    # add '7_budget.txt'
    # ... one line per file staged
    ```

---

### 22. Find the Password

- The password is hidden in the **filenames** of the 7 Python files in this repo.
- Each filename follows the pattern `N_word.py` - a step number, then a word.
- Stage all Python files, then list what you staged **in order**.
- Take the **first letter of the word part** (after `N_`) from each filename in sequence - they spell the password.

**Hint:** `git add *.py` → `git diff --staged --name-only`

??? note "Solution"

    ```bash
    # Stage every Python file
    git add *.py

    # List staged files in alphabetical (step) order
    git diff --staged --name-only

    # Output:
    # 1_scanner.py    ← s
    # 2_tracker.py    ← t
    # 3_adapter.py    ← a
    # 4_gateway.py    ← g
    # 5_encoder.py    ← e
    # 6_deployer.py   ← d
    # 7_0ps.py        ← 0
    # 8_1nterface.py  ← 1
    #
    # First characters in order: s t a g e d 0 1 → staged01
    ```

---

!!! success "🔓 Unlock Room 06"

    Once you have found the password:

    ```bash
    next staged01
    ```

---

### Key Concepts Summary

```mermaid
flowchart LR
    WD["Working Directory"] -- "git add" --> SA["Staging Area (Index)"]
    SA -- "git commit" --> R["Repository"]
    SA -- "git restore --staged" --> WD
```

- **`git add .`** - stage everything (new + modified, current dir downward)
- **`git add -A`** - stage everything including deletions, everywhere
- **`git add -u`** - stage only changes to already-tracked files
- **`git add -p`** - the most powerful form - stage individual hunks
- **`git add -N`** - register intent; makes new files visible to `git diff`
- **`git add -f`** - override `.gitignore` rules
- **`git add -n`** - preview without staging (dry-run)
