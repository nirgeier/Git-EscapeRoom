---
password: "worktree"
title_prefix: "🌳 "
summary: "Work on multiple branches simultaneously without stashing - each in its own directory."
---

##GIT WORKTREE: PARALLEL BRANCHES

---

## Room 33 - Multiple Working Directories

!!! abstract "📜 Your mission"

    Worktree lets you check out MULTIPLE branches simultaneously in separate directories!

    1. List current worktrees:

        * `git worktree list`

    2. Create a new worktree for a branch:

        * `git worktree add ../hotfix-dir hotfix-branch`
        * (Now you have TWO working directories!)

    3. Create a worktree with a new branch:

        * `git worktree add -b new-feature ../feature-dir`

    4. Switch between them:

        * `cd ../hotfix-dir` (you're on hotfix-branch)
        * `cd ../repo` (you're on main)

    5. Remove a worktree:

        * `git worktree remove ../hotfix-dir`

    6. Prune stale worktrees:

        * `git worktree prune`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                            | Purpose                              |
| ---------------------------------- | ------------------------------------ |
| `git worktree list`                | List all linked worktrees            |
| `git worktree add <path> <branch>` | Create worktree for existing branch  |
| `git worktree add -b <new> <path>` | Create worktree with new branch      |
| `git worktree remove <path>`       | Remove a worktree                    |
| `git worktree prune`               | Clean up stale worktree references   |
| `git worktree lock <path>`         | Prevent a worktree from being pruned |

### How Worktrees Work

```
~/project/  (main worktree - main branch)
├── .git/
├── src/
└── ...

~/project-hotfix/  (linked worktree - hotfix branch)
├── .git   ← file (points back to ~/project/.git)
├── src/
└── ...

Both directories share the SAME repository.
Each worktree checks out a DIFFERENT branch.
No need to stash, commit, or switch - just cd!
```

!!! tip "💡 Use Cases" - Review a PR while your current work stays untouched - Run tests on one branch while coding on another - Compare behavior across branches side by side

---

## Tasks

### 01. List Current Worktrees

See how many worktrees this repo has.

**Hint:** `git worktree list`

??? note "Solution"

    ```bash
    git worktree list
    # /path/to/repo  abc1234 [main]
    ```

---

### 02. Create a Worktree for an Existing Branch

Check out a branch in a separate directory.

**Hint:** `git worktree add <path> <branch>`

??? note "Solution"

    ```bash
    git worktree add ../hotfix-dir hotfix-branch
    # Preparing worktree (checking out 'hotfix-branch')

    ls ../hotfix-dir
    # Contains the files from hotfix-branch
    ```

---

### 03. Create a Worktree with a New Branch

Create a new branch and check it out in a separate directory.

**Hint:** `git worktree add -b <new-branch> <path>`

??? note "Solution"

    ```bash
    git worktree add -b new-feature ../feature-dir
    # Creates new branch AND worktree in one step
    ```

---

### 04. Work in Multiple Directories

Switch between worktrees and verify each is on a different branch.

**Hint:** `cd <dir>`, `git branch`

??? note "Solution"

    ```bash
    cd ../hotfix-dir
    git branch
    # * hotfix-branch

    cd ../repo
    git branch
    # * main
    ```

---

### 05. Verify Shared Repository

Confirm both worktrees share the same Git data.

**Hint:** `cat .git` in the linked worktree

??? note "Solution"

    ```bash
    cd ../hotfix-dir
    cat .git
    # gitdir: /path/to/repo/.git/worktrees/hotfix-dir
    # Points back to the main repo's .git
    ```

---

### 06. Remove a Worktree

Clean up a worktree you no longer need.

**Hint:** `git worktree remove <path>`

??? note "Solution"

    ```bash
    git worktree remove ../hotfix-dir
    # Removed worktree ../hotfix-dir

    git worktree list
    # Only the main worktree remains
    ```

---

### 07. Find the Password

Create a worktree for each branch and look for the password file.

**Hint:** `git branch -a`, then create worktrees and explore

??? note "Solution"

    ```bash
    git branch -a
    # Check each branch for password-related files

    git worktree add ../search secret-branch
    cat ../search/password.txt
    ```

---

!!! success "🔓 Unlock Room 34"

    ```bash
    next <PASSWORD>
    ```
