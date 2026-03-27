---
password: "pull18"
title_prefix: "⬇️ "
summary: "Fetch and integrate remote changes with `git pull` and pull strategies."
---

##GIT PULL: FETCH + MERGE

---

## Room 18 - Pulling Updates

!!! abstract "📜 Your mission"

    Pull = Fetch + Merge. It downloads AND integrates remote changes.

    1. Pull from remote:

        * `git pull origin main`
        * This fetches from origin and merges into your current branch.

    2. Pull with rebase instead of merge:

        * `git pull --rebase origin main`
        * (Creates a linear history instead of merge commits)

    3. Configure pull strategy:

        * `git config pull.rebase true` (always rebase on pull)
        * `git config pull.ff only` (only fast-forward)

    4. Compare the results:

        * `git log --oneline --graph`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                       | Purpose                   |
| ----------------------------- | ------------------------- |
| `git pull`                    | Pull from tracking remote |
| `git pull origin main`        | Pull specific branch      |
| `git pull --rebase`           | Rebase instead of merge   |
| `git pull --ff-only`          | Only fast-forward         |
| `git config pull.rebase true` | Default to rebase         |

---

## Tasks

### 01. Simple Pull

Fetch and merge from the remote in one command.

**Hint:** `git pull origin main`

??? note "Solution"

    ```bash
    git pull origin main
    # Fetches AND merges origin/main into your current branch
    ```

---

### 02. Pull with Rebase

Pull using rebase instead of merge for linear history.

**Hint:** `git pull --rebase origin main`

??? note "Solution"

    ```bash
    git pull --rebase origin main
    # Replays your local commits on top of the remote changes
    # Result: linear history, no merge commits
    ```

---

### 03. Fast-Forward Only

Only pull if a fast-forward is possible (no merge commit needed).

**Hint:** `git pull --ff-only`

??? note "Solution"

    ```bash
    git pull --ff-only origin main
    # Succeeds if main can fast-forward to origin/main
    # Fails if branches have diverged
    ```

---

### 04. Configure Default Pull Strategy

Set your preferred pull behavior for all repos.

**Hint:** `git config pull.rebase true`

??? note "Solution"

    ```bash
    # Always rebase on pull:
    git config --global pull.rebase true

    # Or: only fast-forward:
    git config --global pull.ff only

    # Now plain 'git pull' uses your preference
    ```

---

### 05. Check What Will Be Pulled

Preview incoming changes before pulling.

**Hint:** `git fetch` + `git log main..origin/main`

??? note "Solution"

    ```bash
    git fetch origin
    git log --oneline main..origin/main
    # Shows commits that 'git pull' would merge

    git diff main..origin/main
    # Shows the actual file changes
    ```

---

### 06. Compare Pull vs Fetch+Merge

Verify that `pull` is identical to doing `fetch` then `merge` manually.

**Hint:** `git log --oneline --graph`

??? note "Solution"

    ```bash
    # These two are equivalent:
    # Method 1:
    git pull origin main

    # Method 2:
    git fetch origin
    git merge origin/main

    git log --oneline --graph
    ```

---

### 07. Find the Password

Pull from origin and check the new commits or files that arrived.

**Hint:** `git pull origin main`, `git log --oneline`

??? note "Solution"

    ```bash
    git pull origin main
    git log --oneline
    # Look through the new commits for the password
    ```

---

!!! success "🔓 Unlock Room 19"

    ```bash
    next <PASSWORD>
    ```
