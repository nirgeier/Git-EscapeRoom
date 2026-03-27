---
password: "cherry21"
title_prefix: "🍒 "
summary: "Pick specific commits from other branches and apply them to your current branch."
---

##GIT CHERRY-PICK: SELECTIVE COMMITS

---

## Room 21 - Cherry-Picking Commits

!!! abstract "📜 Your mission"

    Cherry-pick applies a SPECIFIC commit from one branch to another.

    1. View all branches and their commits:

        * `git log --oneline --graph --all`

    2. Find the commit on `feature` branch that you need:

        * `git log --oneline feature`

    3. Cherry-pick that commit onto main:

        * `git checkout main`
        * `git cherry-pick <commit-hash>`

    4. Cherry-pick without committing:

        * `git cherry-pick --no-commit <hash>`

    5. Cherry-pick a range of commits:

        * `git cherry-pick A..B`

    6. The `treasure` branch has a commit with message "KEY COMMIT".
       Cherry-pick it to get the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                       | Purpose                            |
| ----------------------------- | ---------------------------------- |
| `git cherry-pick <hash>`      | Apply a single commit              |
| `git cherry-pick A..B`        | Apply a range of commits           |
| `git cherry-pick --no-commit` | Apply changes without committing   |
| `git cherry-pick --abort`     | Abort an in-progress cherry-pick   |
| `git cherry-pick --continue`  | Continue after resolving conflicts |
| `git log --oneline --all`     | View commits across all branches   |

### How Cherry-Pick Works

```
feature:  A --- B --- C --- D
                      ↓ cherry-pick C
main:     X --- Y --- C'

Cherry-pick copies the changes introduced by a commit and creates
a NEW commit (C') on your current branch.  The original stays put.
```

---

## Tasks

### 01. List All Branches and Commits

Visualize the commit graph across all branches.

**Hint:** `git log --oneline --graph --all`

??? note "Solution"

    ```bash
    git log --oneline --graph --all
    # * abc1234 (treasure) KEY COMMIT
    # | * def5678 (feature) Feature work
    # |/
    # * 789abcd (HEAD -> main) Base
    ```

---

### 02. Cherry-Pick a Single Commit

Apply one specific commit from `feature` onto `main`.

**Hint:** `git checkout main`, `git cherry-pick <hash>`

??? note "Solution"

    ```bash
    git checkout main
    git log --oneline feature
    # Copy the hash you want

    git cherry-pick <hash>
    # [main abc1234] <commit message>
    ```

---

### 03. Cherry-Pick Without Committing

Apply changes from a commit but leave them staged, without creating a commit.

**Hint:** `git cherry-pick --no-commit <hash>`

??? note "Solution"

    ```bash
    git cherry-pick --no-commit <hash>

    git status
    # Changes to be committed:
    #   (the cherry-picked changes are staged)

    # You can modify before committing:
    git commit -m "Custom cherry-pick message"
    ```

---

### 04. Cherry-Pick a Range

Apply multiple consecutive commits at once.

**Hint:** `git cherry-pick A..B` (exclusive of A)

??? note "Solution"

    ```bash
    git cherry-pick abc1234..def5678
    # Applies commits AFTER abc1234 up to and including def5678

    # Or use A^..B for inclusive range:
    git cherry-pick abc1234^..def5678
    ```

---

### 05. Handle Cherry-Pick Conflicts

When a cherry-pick conflicts, resolve it and continue.

**Hint:** `git cherry-pick --continue`, `git cherry-pick --abort`

??? note "Solution"

    ```bash
    git cherry-pick <hash>
    # CONFLICT! Resolve the file:
    # Edit the file, remove conflict markers
    git add <file>
    git cherry-pick --continue

    # Or abort:
    git cherry-pick --abort
    ```

---

### 06. Verify the Cherry-Picked Commit

Confirm the new commit was created on your branch.

**Hint:** `git log --oneline`

??? note "Solution"

    ```bash
    git log --oneline
    # The cherry-picked commit appears with a NEW hash
    # (different from the original, same content)
    ```

---

### 07. Find the Password

The `treasure` branch has a commit with message "KEY COMMIT". Cherry-pick it.

**Hint:** `git log --oneline treasure`, `git cherry-pick <hash>`

??? note "Solution"

    ```bash
    git log --oneline treasure
    # Find the "KEY COMMIT" hash

    git checkout main
    git cherry-pick <hash>
    # The cherry-picked files contain the password
    ```

---

!!! success "🔓 Unlock Room 22"

    ```bash
    next <PASSWORD>
    ```
