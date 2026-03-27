---
password: "reflog27"
title_prefix: "🛡️ "
summary: "Your safety net - recover lost commits, branches, and undone work from the reflog."
---

##GIT REFLOG: YOUR SAFETY NET

---

## Room 27 - Recovering Lost Work

!!! abstract "📜 Your mission"

    Reflog records EVERY move of HEAD - even after `reset --hard`!

    1. View the reflog:

        * `git reflog`

    2. Each entry shows:

        * The commit hash
        * What action was performed (commit, checkout, reset, etc.)
        * The position (`HEAD@{0}` = current, `HEAD@{1}` = previous, etc.)

    3. This repo had a commit that was "lost" via `reset --hard`.
       Find it using reflog:

        * `git reflog`

    4. Recover the lost commit:

        * `git checkout <lost-hash>`
        * (or: `git branch recovery <lost-hash>`)

    5. The lost commit contains a file with the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                          | Purpose                           |
| -------------------------------- | --------------------------------- |
| `git reflog`                     | Show HEAD movement history        |
| `git reflog show <branch>`       | Show reflog for a specific branch |
| `git checkout <hash>`            | Jump to a reflog entry            |
| `git branch recovered <hash>`    | Create branch from a lost commit  |
| `git reset --hard <hash>`        | Restore HEAD to a reflog entry    |
| `git reflog expire --expire=now` | Clear the reflog (dangerous!)     |

### Understanding the Reflog

```
$ git reflog
a1b2c3d HEAD@{0}: commit: add feature
f4e5d6c HEAD@{1}: reset: moving to HEAD~2
7g8h9i0 HEAD@{2}: commit: work in progress
b1c2d3e HEAD@{3}: checkout: moving from main to feature

Reflog records every HEAD movement for ~90 days.
Even after reset --hard, your commits are still recoverable!
```

!!! tip "💡 Pro Tip"
Reflog is LOCAL only - it is never pushed to a remote.
If you lose work, check the reflog before panicking.

---

## Tasks

### 01. View the Reflog

See every HEAD movement in this repo.

**Hint:** `git reflog`

??? note "Solution"

    ```bash
    git reflog
    # a1b2c3d HEAD@{0}: reset: moving to HEAD~2
    # f4e5d6c HEAD@{1}: commit: Add password file
    # 7g8h9i0 HEAD@{2}: commit: Initial setup
    ```

---

### 02. Understand Reflog Entries

Identify what action each line represents.

**Hint:** look at the action description after the hash

??? note "Solution"

    ```bash
    git reflog
    # Each line format: <hash> HEAD@{N}: <action>: <description>
    # Actions: commit, checkout, reset, merge, rebase, pull, etc.
    ```

---

### 03. Find a Lost Commit

Identify commits that were "lost" by a hard reset.

**Hint:** `git reflog`, look for `reset: moving to` entries

??? note "Solution"

    ```bash
    git reflog
    # Look for entries BEFORE reset actions
    # The commit hash in the entry above "reset:" is the lost commit
    ```

---

### 04. Recover a Lost Commit

Create a branch from the lost commit to restore it.

**Hint:** `git branch <name> <hash>`

??? note "Solution"

    ```bash
    git branch recovery abc1234
    # Creates a new branch pointing to the lost commit

    git checkout recovery
    git log --oneline
    # The lost commit is back!
    ```

---

### 05. View Branch-Specific Reflog

See the reflog for a specific branch.

**Hint:** `git reflog show <branch>`

??? note "Solution"

    ```bash
    git reflog show main
    # Shows only movements of the main branch ref
    ```

---

### 06. Use Reflog References Directly

Reference previous HEAD positions using `HEAD@{N}` syntax.

**Hint:** `git show HEAD@{1}`, `git diff HEAD@{0} HEAD@{2}`

??? note "Solution"

    ```bash
    git show HEAD@{1}
    # Shows the commit HEAD pointed to one step ago

    git diff HEAD@{0} HEAD@{2}
    # Diff between current and two movements ago
    ```

---

### 07. Find the Password

A commit was lost via `reset --hard`. Use the reflog to find and inspect it.

**Hint:** `git reflog`, find the lost hash, `git show <hash>`

??? note "Solution"

    ```bash
    git reflog
    # Find the commit before the reset action

    git show <lost-hash>
    # The lost commit's file contains the password
    ```

---

!!! success "🔓 Unlock Room 28"

    ```bash
    next <PASSWORD>
    ```
