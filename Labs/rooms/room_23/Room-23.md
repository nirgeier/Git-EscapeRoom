---
password: "revert23"
title_prefix: "↩️ "
summary: "Safely undo commits by creating a new commit that reverses the changes."
---

##GIT REVERT: SAFE UNDO

---

## Room 23 - Reverting Commits

!!! abstract "📜 Your mission"

    Revert creates a NEW commit that undoes a previous commit. Safe for shared branches!

    DIFFERENCE FROM RESET:

    * `reset` → rewrites history (dangerous for shared branches)
    * `revert` → adds new history (safe for shared branches)

    1. View the history and find the "bad commit":

        * `git log --oneline`

    2. Revert a specific commit:

        * `git revert <commit-hash>`
        * (Opens editor for the revert commit message)

    3. Revert without auto-committing:

        * `git revert --no-commit <hash>`

    4. Revert a merge commit:

        * `git revert -m 1 <merge-commit-hash>`

    5. Revert the commit with message "BUGGY COMMIT" in this repo.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                   | Purpose                            |
| ------------------------- | ---------------------------------- |
| `git revert HEAD`         | Revert the latest commit           |
| `git revert <hash>`       | Revert a specific commit           |
| `git revert --no-commit`  | Apply reversal without committing  |
| `git revert --abort`      | Abort an in-progress revert        |
| `git revert --continue`   | Continue after resolving conflicts |
| `git revert HEAD~3..HEAD` | Revert a range of commits          |

### Revert vs Reset

```
reset:   A --- B --- C        →  A --- B          (C is gone from history)
revert:  A --- B --- C --- C' →  A --- B --- C --- C'  (C' undoes C)

Revert is SAFE for shared branches - it never rewrites history.
Reset should only be used on local/private branches.
```

---

## Tasks

### 01. View the History

Find the "bad commit" you need to revert.

**Hint:** `git log --oneline`

??? note "Solution"

    ```bash
    git log --oneline
    # abc1234 Good commit
    # def5678 BUGGY COMMIT  ← this one!
    # 789abcd Initial commit
    ```

---

### 02. Revert a Commit

Create a new commit that undoes the buggy one.

**Hint:** `git revert <hash>`

??? note "Solution"

    ```bash
    git revert def5678
    # Opens editor for the revert message
    # Creates a NEW commit that reverses the changes

    git log --oneline
    # New revert commit added on top
    ```

---

### 03. Revert Without Auto-Committing

Apply the reversal but leave changes staged for you to review.

**Hint:** `git revert --no-commit <hash>`

??? note "Solution"

    ```bash
    git revert --no-commit def5678

    git status
    # Changes to be committed:
    #   (the reversed changes are staged)

    # Review and commit when ready:
    git commit -m "Revert buggy commit after review"
    ```

---

### 04. Revert the Latest Commit

Revert HEAD (the most recent commit).

**Hint:** `git revert HEAD`

??? note "Solution"

    ```bash
    git revert HEAD
    # Reverts whatever HEAD points to
    ```

---

### 05. Revert a Range of Commits

Undo multiple consecutive commits.

**Hint:** `git revert HEAD~3..HEAD`

??? note "Solution"

    ```bash
    git revert --no-commit HEAD~3..HEAD
    git commit -m "Revert last 3 commits"

    # Creates one revert commit for the whole range
    ```

---

### 06. Abort a Revert in Progress

Cancel a revert if you change your mind mid-conflict.

**Hint:** `git revert --abort`

??? note "Solution"

    ```bash
    git revert <hash>
    # CONFLICT!

    git revert --abort
    # Everything goes back to pre-revert state
    ```

---

### 07. Verify History Is Preserved

Confirm that revert ADDS history (unlike reset).

**Hint:** `git log --oneline`

??? note "Solution"

    ```bash
    git log --oneline
    # aaa1111 Revert "BUGGY COMMIT"
    # abc1234 Good commit
    # def5678 BUGGY COMMIT  ← still in history!
    # 789abcd Initial commit
    ```

---

### 08. Find the Password

Revert the "BUGGY COMMIT" and read the resulting file contents.

**Hint:** `git revert <hash>`, then check the files

??? note "Solution"

    ```bash
    git log --oneline --grep="BUGGY"
    git revert <that-hash>
    cat *.txt
    # The reverted content reveals the password
    ```

---

!!! success "🔓 Unlock Room 24"

    ```bash
    next <PASSWORD>
    ```
