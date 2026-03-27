---
password: "grep40"
title_prefix: "🔎 "
summary: "Search through tracked files and commit history with lightning speed."
---

##GIT GREP: SEARCH TRACKED FILES

---

## Room 40 - Find the Needle

!!! abstract "📜 Your mission"

    `git grep` searches content in tracked files (faster than regular grep!).

    1. Search for a pattern in current files:

        * `git grep "TODO"`

    2. Search in a specific commit:

        * `git grep "password" HEAD~5`

    3. Count occurrences:

        * `git grep -c "function"`

    4. Show line numbers:

        * `git grep -n "import"`

    5. Search with context:

        * `git grep -C 3 "error"`  (3 lines context)

    6. Search across ALL branches:

        * `git grep "secret" $(git branch -a --format='%(refname)')`

    7. Search with regex:

        * `git grep -e "def .*test" --and -e "assert"`

    8. This repo has a hidden password string.
       Use `git grep` to find it in one of the old commits.

        * `git log --all -S "PASSWORD" --oneline`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                   | Purpose                                |
| ------------------------- | -------------------------------------- |
| `git grep "TODO"`         | Search tracked files for a pattern     |
| `git grep -n "pattern"`   | Show line numbers with matches         |
| `git grep -c "pattern"`   | Count matches per file                 |
| `git grep -C 3 "pattern"` | Show 3 lines of context around matches |
| `git grep -l "pattern"`   | List only filenames with matches       |
| `git log -S "string"`     | Find commits that added/removed string |

### git grep vs regular grep

```text
  git grep                           grep -r
  ════════                           ══════
  Only tracked files                 All files (incl. .git, node_modules)
  Respects .gitignore                Searches everything
  Much faster on large repos         Slower (no index)
  Can search specific commits        Only working directory

  Power moves:
  ┌────────────────────────────────────────────────────────┐
  │  git grep -n "TODO" -- '*.py'    # Only Python files   │
  │  git grep "bug" HEAD~5           # Search older commit  │
  │  git grep -e "foo" --and -e "bar"  # Both patterns     │
  │  git log -S "API_KEY" --all      # Pickaxe search      │
  │  git log -G "regex" --all        # Regex in diffs      │
  └────────────────────────────────────────────────────────┘
```

---

## Tasks

### 01. Search for a Pattern

Find all occurrences of "TODO" in tracked files.

**Hint:** `git grep "TODO"`

??? note "Solution"

    ```bash
    git grep "TODO"
    # app.py:5:# TODO fix this function
    # utils.py:12:# TODO add error handling
    ```

---

### 02. Search with Line Numbers

Show exact line numbers for each match.

**Hint:** `git grep -n "pattern"`

??? note "Solution"

    ```bash
    git grep -n "import"
    # app.py:1:import os
    # app.py:2:import sys
    ```

---

### 03. Count Matches Per File

Get a summary of how many matches each file has.

**Hint:** `git grep -c "pattern"`

??? note "Solution"

    ```bash
    git grep -c "function"
    # app.py:5
    # utils.py:3
    ```

---

### 04. List Only Matching Filenames

Show just the file names, not the matched lines.

**Hint:** `git grep -l "pattern"`

??? note "Solution"

    ```bash
    git grep -l "error"
    # app.py
    # handlers/errors.py
    ```

---

### 05. Search with Context

Show surrounding lines for context.

**Hint:** `git grep -C 3 "pattern"`

??? note "Solution"

    ```bash
    git grep -C 3 "error"
    # Shows 3 lines before and after each match
    ```

---

### 06. Search in a Specific Commit

Search older versions of the codebase.

**Hint:** `git grep "pattern" HEAD~5`

??? note "Solution"

    ```bash
    git grep "password" HEAD~5
    # Searches the files as they were 5 commits ago
    ```

---

### 07. Pickaxe Search

Find commits that added or removed a specific string.

**Hint:** `git log -S "string"`

??? note "Solution"

    ```bash
    git log -S "API_KEY" --oneline
    # Shows commits that added or removed "API_KEY"

    git log -G "regex.*pattern" --oneline
    # Same but with regex
    ```

---

### 08. Search Only Specific File Types

Limit search to Python files.

**Hint:** `git grep "pattern" -- '*.py'`

??? note "Solution"

    ```bash
    git grep -n "def " -- '*.py'
    # Only searches .py files
    ```

---

### 09. Find the Password

Use pickaxe or git grep to find the hidden password string.

**Hint:** `git log --all -S "PASSWORD" --oneline`, or `git grep "password"`

??? note "Solution"

    ```bash
    git log --all -S "PASSWORD" --oneline
    # Find the commit that contains the password

    git show <hash>
    # Read the password from the commit
    ```

---

!!! success "🔓 Unlock Room 41"

    ```bash
    next <PASSWORD>
    ```
