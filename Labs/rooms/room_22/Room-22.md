---
password: "reset22"
title_prefix: "⏪ "
summary: "Rewind history with git reset - understand the three modes: soft, mixed, and hard."
---

##GIT RESET: REWINDING HISTORY

---

## Room 22 - The Three Modes of Reset

!!! abstract "📜 Your mission"

    Reset moves HEAD (and optionally staging/working dir) to a different commit.

    THREE MODES:

    * `--soft`   → Move HEAD only (staged + working dir unchanged)
    * `--mixed`  → Move HEAD + clear staging (DEFAULT, working dir unchanged)
    * `--hard`   → Move HEAD + clear staging + clear working dir (DESTRUCTIVE!)

    1. View the commit history:

        * `git log --oneline`

    2. Soft reset - undo last commit but keep changes staged:

        * `git reset --soft HEAD~1`
        * `git status`  (changes are still staged!)

    3. Mixed reset - undo last commit, unstage changes:

        * `git reset HEAD~1`
        * `git status`  (changes are in working directory)

    4. Hard reset - COMPLETELY undo (DANGER!):

        * `git reset --hard HEAD~1`
        * (All changes GONE - use with extreme caution)

    5. Reset a single file from staging:

        * `git reset HEAD file.txt`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                   | Purpose                             |
| ------------------------- | ----------------------------------- |
| `git reset --soft HEAD~1` | Move HEAD; keep changes staged      |
| `git reset HEAD~1`        | Move HEAD; unstage changes (mixed)  |
| `git reset --hard HEAD~1` | Move HEAD; discard all changes      |
| `git reset <file>`        | Unstage a specific file             |
| `git reflog`              | Find commits to recover after reset |
| `git diff --cached`       | See what is currently staged        |

### The Three Modes Explained

```
                Working Dir    Staging Area    HEAD
--soft              ✓              ✓            ←  moves back
--mixed (default)   ✓              ←            ←  moves back
--hard              ←              ←            ←  moves back

✓ = unchanged    ← = reset to match the target commit
```

!!! warning "⚠️ Danger Zone"
`git reset --hard` permanently discards uncommitted changes.
Always check `git stash` or `git reflog` if you need a safety net.

---

## Tasks

### 01. View Current History

See the commits before resetting.

**Hint:** `git log --oneline`

??? note "Solution"

    ```bash
    git log --oneline
    # abc1234 Third commit
    # def5678 Second commit
    # 789abcd First commit
    ```

---

### 02. Soft Reset

Undo the last commit but keep changes staged.

**Hint:** `git reset --soft HEAD~1`

??? note "Solution"

    ```bash
    git reset --soft HEAD~1

    git status
    # Changes to be committed:
    #   modified: file.txt  ← still staged!

    git log --oneline
    # The last commit is gone, but changes are preserved
    ```

---

### 03. Mixed Reset (Default)

Undo the last commit and unstage the changes.

**Hint:** `git reset HEAD~1`

??? note "Solution"

    ```bash
    git reset HEAD~1

    git status
    # Changes not staged for commit:
    #   modified: file.txt  ← unstaged, still in working dir
    ```

---

### 04. Hard Reset

Completely discard the last commit and all changes. **Destructive!**

**Hint:** `git reset --hard HEAD~1`

??? note "Solution"

    ```bash
    git reset --hard HEAD~1

    git status
    # nothing to commit, working tree clean
    # Changes are GONE (unless you use reflog)
    ```

---

### 05. Reset a Single File

Unstage a specific file without moving HEAD.

**Hint:** `git reset HEAD <file>`

??? note "Solution"

    ```bash
    git add file.txt
    git reset HEAD file.txt

    git status
    # file.txt is now unstaged
    ```

---

### 06. Compare the Three Modes

Make 3 commits, then try each reset mode and observe the differences.

**Hint:** `git status` after each reset shows the key difference

??? note "Solution"

    ```bash
    # After --soft:   changes are STAGED
    # After --mixed:  changes are UNSTAGED (in working dir)
    # After --hard:   changes are GONE
    ```

---

### 07. Recover from a Hard Reset

Use reflog to find and restore a commit after hard reset.

**Hint:** `git reflog`, `git reset --hard <hash>`

??? note "Solution"

    ```bash
    git reflog
    # abc1234 HEAD@{0}: reset: moving to HEAD~1
    # def5678 HEAD@{1}: commit: The commit we lost

    git reset --hard def5678
    # Commit restored!
    ```

---

### 08. Find the Password

Use `git reflog` or `git log` to find the hidden password in this repo's history.

**Hint:** the password may be in a commit that was "reset" away

??? note "Solution"

    ```bash
    git reflog
    # Look for commits that were reset away
    git show <hash>
    # Find the password
    ```

---

!!! success "🔓 Unlock Room 23"

    ```bash
    next <PASSWORD>
    ```
