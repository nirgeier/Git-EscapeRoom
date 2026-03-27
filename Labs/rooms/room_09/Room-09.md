---
password: "diffview"
title_prefix: "🔍 "
summary: "Compare changes with `git diff` between working dir, staging, and commits."
---

##GIT DIFF: COMPARING CHANGES

---

## Room 09 - Spot the Difference

!!! abstract "📜 Your mission"

    `git diff` shows you EXACTLY what changed, line by line.

    1. This repo has modified files. See what changed:

        * `git diff` (working dir vs staging)
        * `git diff --staged` (staging vs last commit)
        * `git diff HEAD` (working dir vs last commit)

    2. Compare two commits:

        * `git diff HEAD~2 HEAD`

    3. Compare specific files:

        * `git diff -- file1.txt`

    4. Show just the names of changed files:

        * `git diff --name-only`
        * `git diff --name-status`

    5. Show word-level diffs:

        * `git diff --word-diff`

    6. Count lines changed:

        * `git diff --stat`

    7. In the file `puzzle.txt`, there's a line that was ADDED (marked with `+`).
       That line contains the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

---

### Key Commands

| Command                     | Purpose                    |
| --------------------------- | -------------------------- |
| `git diff`                  | Working dir vs Staging     |
| `git diff --staged`         | Staging vs Last commit     |
| `git diff HEAD`             | Working dir vs Last commit |
| `git diff HEAD~2 HEAD`      | Between two commits        |
| `git diff branch1..branch2` | Between branches           |
| `git diff --name-only`      | Just filenames             |
| `git diff --stat`           | Summary statistics         |
| `git diff --word-diff`      | Word-level changes         |
| `git diff -- file.txt`      | Specific file only         |

### Reading Diff Output

```diff
diff --git a/file.txt b/file.txt
index abc1234..def5678 100644
--- a/file.txt         ← old version
+++ b/file.txt         ← new version
@@ -1,3 +1,4 @@       ← hunk header (line numbers)
 unchanged line         ← context (no prefix)
-removed line           ← deleted (red -)
+added line             ← added (green +)
 another unchanged
```

---

## Tasks

### 01. See Unstaged Changes

Compare working directory against the staging area.

**Hint:** `git diff`

??? note "Solution"

    ```bash
    git diff
    # Shows all modifications that have NOT been staged yet
    # Lines with - are removals, + are additions
    ```

---

### 02. See Staged Changes

Compare the staging area against the last commit.

**Hint:** `git diff --staged`

??? note "Solution"

    ```bash
    git diff --staged
    # Shows what will be included in the NEXT commit
    # (alias: git diff --cached)
    ```

---

### 03. Compare Working Directory vs Last Commit

See ALL changes (staged + unstaged) relative to the last commit.

**Hint:** `git diff HEAD`

??? note "Solution"

    ```bash
    git diff HEAD
    # Shows the combined staged + unstaged changes vs last commit
    ```

---

### 04. Compare Two Commits

See what changed between two specific points in history.

**Hint:** `git diff <commit1> <commit2>`

??? note "Solution"

    ```bash
    git diff HEAD~2 HEAD
    # Shows everything that changed in the last 2 commits
    ```

---

### 05. Diff a Specific File

Narrow the diff to just one file.

**Hint:** `git diff -- <file>`

??? note "Solution"

    ```bash
    git diff -- file1.txt
    # Shows changes only in file1.txt

    git diff HEAD -- puzzle.txt
    # Compare puzzle.txt against last commit
    ```

---

### 06. Show Only Changed Filenames

Get a list of changed files without the full diff.

**Hint:** `git diff --name-only`, `git diff --name-status`

??? note "Solution"

    ```bash
    git diff --name-only
    # file1.txt
    # puzzle.txt

    git diff --name-status
    # M  file1.txt       ← Modified
    # M  puzzle.txt
    ```

---

### 07. Word-Level Diff

See changes at the word level instead of line level.

**Hint:** `git diff --word-diff`

??? note "Solution"

    ```bash
    git diff --word-diff
    # Shows: [-old word-]{+new word+} inline
    # Much easier to spot small text changes
    ```

---

### 08. Summary Statistics

Get a quick summary of insertions and deletions.

**Hint:** `git diff --stat`

??? note "Solution"

    ```bash
    git diff --stat
    #  file1.txt  | 3 ++-
    #  puzzle.txt | 5 +++--
    #  2 files changed, 5 insertions(+), 3 deletions(-)
    ```

---

### 09. Find the Password in puzzle.txt

There's a line ADDED (marked with `+`) in `puzzle.txt` that contains the password.

**Hint:** `git diff puzzle.txt`, look for the `+` line

??? note "Solution"

    ```bash
    git diff puzzle.txt
    # Look for lines starting with +
    # One of them contains the password
    ```

---

!!! success "🔓 Unlock Room 10"

    ```bash
    next <PASSWORD>
    ```
