---
password: "hook31"
title_prefix: "🪝 "
summary: "Automate workflows with Git hooks - scripts that run at key points in the Git lifecycle."
---

##GIT HOOKS: AUTOMATION TRIGGERS

---

## Room 31 - Hooking Into Git

!!! abstract "📜 Your mission"

    Hooks are scripts that Git runs automatically at certain events.

    1. Explore the hooks directory:

        * `ls .git/hooks/`
        * (All `.sample` files - remove `.sample` to activate)

    2. Create a pre-commit hook:

        ```bash
        cat > .git/hooks/pre-commit << 'EOF'
        #!/bin/bash
        echo "Running pre-commit checks..."
        # Example: reject commits with TODO
        if git diff --cached | grep -q "TODO"; then
          echo "ERROR: Remove TODOs before committing!"
          exit 1
        fi
        exit 0
        EOF
        chmod +x .git/hooks/pre-commit
        ```

    3. Common hooks:

        * `pre-commit`    → runs before commit (linting, tests)
        * `commit-msg`    → validate commit message format
        * `pre-push`      → runs before push (CI checks)
        * `post-merge`    → runs after merge (install deps)
        * `pre-rebase`    → runs before rebase

    4. This room has a `commit-msg` hook. Read it to find the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                                 | Purpose                         |
| ------------------------------------------------------- | ------------------------------- |
| `ls .git/hooks/`                                        | List available hook samples     |
| `chmod +x .git/hooks/pre-commit`                        | Make a hook executable          |
| `git commit --no-verify`                                | Skip hooks for this commit      |
| `cat .git/hooks/pre-commit.sample`                      | View the sample pre-commit hook |
| `cp .git/hooks/pre-commit.sample .git/hooks/pre-commit` | Activate sample hook            |
| `git config core.hooksPath <dir>`                       | Set a custom hooks directory    |

### Common Git Hooks

```
CLIENT-SIDE HOOKS:
  pre-commit       → Runs before commit is created (lint, tests)
  prepare-commit-msg → Modify the default commit message
  commit-msg       → Validate or format commit message
  pre-push         → Runs before pushing (run tests)
  post-checkout    → Runs after checkout (install deps)

SERVER-SIDE HOOKS:
  pre-receive      → Runs before accepting a push
  update           → Runs once per branch being updated
  post-receive     → Runs after push is accepted (deploy)
```

!!! tip "💡 Sharing Hooks"
Hooks in `.git/hooks/` are NOT committed to the repo.
To share hooks, store them in a directory like `.githooks/`
and set: `git config core.hooksPath .githooks`

---

## Tasks

### 01. Explore the Hooks Directory

List all available hook samples.

**Hint:** `ls .git/hooks/`

??? note "Solution"

    ```bash
    ls .git/hooks/
    # applypatch-msg.sample  pre-commit.sample
    # commit-msg.sample      pre-push.sample
    # post-update.sample     pre-rebase.sample
    # pre-applypatch.sample  prepare-commit-msg.sample
    ```

---

### 02. Read a Sample Hook

Examine a sample hook to understand the format.

**Hint:** `cat .git/hooks/pre-commit.sample`

??? note "Solution"

    ```bash
    cat .git/hooks/pre-commit.sample
    # Shows a bash script that runs before each commit
    ```

---

### 03. Create a Pre-Commit Hook

Write a hook that rejects commits containing "TODO".

**Hint:** write a script to `.git/hooks/pre-commit`

??? note "Solution"

    ```bash
    cat > .git/hooks/pre-commit << 'EOF'
    #!/bin/bash
    if git diff --cached | grep -q "TODO"; then
      echo "ERROR: Remove TODOs before committing!"
      exit 1
    fi
    exit 0
    EOF
    chmod +x .git/hooks/pre-commit
    ```

---

### 04. Test the Hook

Try committing a file with "TODO" and observe the rejection.

**Hint:** `echo "TODO: fix this" > test.txt`, `git add test.txt`, `git commit -m "test"`

??? note "Solution"

    ```bash
    echo "TODO: fix this" > test.txt
    git add test.txt
    git commit -m "test"
    # ERROR: Remove TODOs before committing!
    # The commit is rejected!
    ```

---

### 05. Bypass a Hook

Skip the hook check for a one-time commit.

**Hint:** `git commit --no-verify`

??? note "Solution"

    ```bash
    git commit --no-verify -m "Skip hooks this time"
    # Commit succeeds even with the pre-commit hook
    ```

---

### 06. Create a Commit-Msg Hook

Validate that commit messages follow a pattern.

**Hint:** `.git/hooks/commit-msg` receives the message file path as `$1`

??? note "Solution"

    ```bash
    cat > .git/hooks/commit-msg << 'EOF'
    #!/bin/bash
    if ! grep -qE '^(feat|fix|docs|chore):' "$1"; then
      echo "ERROR: Message must start with feat:|fix:|docs:|chore:"
      exit 1
    fi
    EOF
    chmod +x .git/hooks/commit-msg
    ```

---

### 07. Set a Custom Hooks Path

Share hooks with the team by storing them in the repo.

**Hint:** `git config core.hooksPath <dir>`

??? note "Solution"

    ```bash
    mkdir .githooks
    cp .git/hooks/pre-commit .githooks/
    git config core.hooksPath .githooks
    # Now hooks are in a committable directory
    ```

---

### 08. Find the Password

Read the `commit-msg` hook in this repo. It contains the password.

**Hint:** `cat .git/hooks/commit-msg`

??? note "Solution"

    ```bash
    cat .git/hooks/commit-msg
    # The hook script contains the password
    ```

---

!!! success "🔓 Unlock Room 32"

    ```bash
    next <PASSWORD>
    ```
