---
password: "filter45"
title_prefix: "⚠️ "
summary: "Rewrite entire repository history - the nuclear option."
---

##GIT FILTER-BRANCH & FILTER-REPO: HISTORY REWRITE

---

## Room 45 - Rewriting the Past

!!! abstract "📜 Your mission"

    WARNING: These commands rewrite ENTIRE repository history!

    1. Remove a file from ALL history (filter-branch, deprecated):

        * `git filter-branch --tree-filter 'rm -f secrets.txt' HEAD`

    2. The modern replacement - git-filter-repo:

        * `git filter-repo --invert-paths --path secrets.txt`

    3. Change author across all commits:

        ```bash
        git filter-branch --env-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "old@email.com" ]; then
        export GIT_AUTHOR_EMAIL="new@email.com"
        fi'
        ```

    4. Remove large files from history:

        * `git filter-repo --strip-blobs-bigger-than 10M`

    5. Use cases:

        * Remove accidentally committed secrets
        * Reduce repository size
        * Fix author information

    WARNING: NEVER do this on shared/published history!

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                              | Purpose                          |
| ---------------------------------------------------- | -------------------------------- |
| `git filter-repo --invert-paths --path <file>`       | Remove a file from all history   |
| `git filter-repo --path <dir> --subdirectory-filter` | Extract a subdirectory           |
| `git filter-branch --tree-filter 'rm -f file' HEAD`  | Legacy: remove file from history |
| `git filter-branch --env-filter '...'`               | Rewrite author/committer info    |
| `git filter-repo --mailmap mailmap.txt`              | Rewrite author identities        |
| `git filter-repo --strip-blobs-bigger-than 10M`      | Remove large files from history  |

### filter-branch vs filter-repo

```text
  git filter-branch (DEPRECATED)      git filter-repo (RECOMMENDED)
  ══════════════════════════════       ════════════════════════════════
  Built-in but slow                    External tool, very fast
  Error-prone                          Safe with clear warnings
  Complex syntax                       Simple, readable syntax
  Still in Git (legacy)                Install: pip install git-filter-repo

  Common use cases:
  ┌───────────────────────────────────────────────────┐
  │  • Remove accidentally committed secrets/passwords │
  │  • Delete large binary files from history          │
  │  • Split a subdirectory into its own repo          │
  │  • Change author email across all commits          │
  │  • Remove sensitive data for compliance            │
  └───────────────────────────────────────────────────┘
```

!!! danger "☠️ Destructive Operation"
Both commands REWRITE commit hashes for the entire history.
All collaborators must re-clone after a history rewrite.
**Always back up your repo first!**

---

## Tasks

### 01. Inspect Current History

View the full commit log before rewriting.

**Hint:** `git log --oneline --all`

??? note "Solution"

    ```bash
    git log --oneline --all
    # Note the hashes - they'll ALL change after filtering
    ```

---

### 02. Find a File in All History

Locate which commits touched a specific file.

**Hint:** `git log --all -- secrets.txt`

??? note "Solution"

    ```bash
    git log --all --oneline -- secrets.txt
    # Shows every commit that modified secrets.txt
    ```

---

### 03. Remove a File with filter-branch (Legacy)

Remove `secrets.txt` from every commit in history.

**Hint:** `git filter-branch --tree-filter 'rm -f secrets.txt' HEAD`

??? note "Solution"

    ```bash
    git filter-branch --tree-filter 'rm -f secrets.txt' HEAD
    # Rewrites every commit, removing secrets.txt
    # WARNING: All commit hashes change!
    ```

---

### 04. Use filter-repo (Modern)

The recommended way to remove files from history.

**Hint:** `git filter-repo --invert-paths --path secrets.txt`

??? note "Solution"

    ```bash
    # Install first: pip install git-filter-repo
    git filter-repo --invert-paths --path secrets.txt
    # Fast and safe removal from all history
    ```

---

### 05. Verify File Is Gone

Confirm the file no longer exists in any commit.

**Hint:** `git log --all -- secrets.txt`

??? note "Solution"

    ```bash
    git log --all -- secrets.txt
    # No output - file is completely gone from history

    git grep "secrets" $(git rev-list --all)
    # No results
    ```

---

### 06. Remove Large Files

Strip files larger than a threshold from history.

**Hint:** `git filter-repo --strip-blobs-bigger-than 10M`

??? note "Solution"

    ```bash
    git filter-repo --strip-blobs-bigger-than 10M
    # Removes all blobs over 10MB from the entire history
    ```

---

### 07. Find the Password

Before rewriting, check the file that's about to be removed. It contains the password.

**Hint:** `git show HEAD:secrets.txt`, or `git log --all -- secrets.txt`

??? note "Solution"

    ```bash
    git show HEAD:secrets.txt
    # Read the file content before removing it
    # The password is inside
    ```

---

!!! success "🔓 Unlock Room 46"

    ```bash
    next <PASSWORD>
    ```
