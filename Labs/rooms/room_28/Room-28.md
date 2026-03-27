---
password: "alias28"
title_prefix: "⚡ "
summary: "Create shortcuts for your most-used Git commands with aliases."
---

##GIT ALIAS: CUSTOM SHORTCUTS

---

## Room 28 - Speed Up Your Workflow

!!! abstract "📜 Your mission"

    Create your own Git shortcuts to work faster!

    1. Create a simple alias:

        * `git config --global alias.st status`
        * `git config --global alias.co checkout`
        * `git config --global alias.br branch`
        * `git config --global alias.ci commit`

    2. Create complex aliases:

        * `git config --global alias.lg "log --oneline --graph --all"`
        * `git config --global alias.last "log -1 HEAD"`
        * `git config --global alias.unstage "restore --staged"`

    3. Use shell commands in aliases (prefix with `!`):

        * `git config --global alias.visual "!gitk"`

    4. List all aliases:

        * `git config --get-regexp alias`

    5. This repo has a custom alias already configured.
       Find it: `git config --get-regexp alias`
       Run the alias to reveal the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                | Purpose                     |
| -------------------------------------- | --------------------------- |
| `git config --global alias.st status`  | Create a global alias       |
| `git config alias.co checkout`         | Create a repo-level alias   |
| `git config --get-regexp alias`        | List all aliases            |
| `git config --global --unset alias.st` | Remove an alias             |
| `git st`                               | Use the alias               |
| `git config --global -e`               | Edit global config directly |

### Popular Aliases

```bash
# Quick shortcuts
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

# Fancy log
git config --global alias.lg "log --oneline --graph --decorate --all"

# Show last commit
git config --global alias.last "log -1 HEAD"

# Unstage files
git config --global alias.unstage "reset HEAD --"
```

---

## Tasks

### 01. Create Simple Aliases

Set up common shortcuts.

**Hint:** `git config alias.st status`

??? note "Solution"

    ```bash
    git config alias.st status
    git config alias.co checkout
    git config alias.br branch
    git config alias.ci commit
    ```

---

### 02. Test Your Aliases

Run the aliases to verify they work.

**Hint:** `git st`, `git br`

??? note "Solution"

    ```bash
    git st
    # Same as 'git status'

    git br
    # Same as 'git branch'
    ```

---

### 03. Create a Complex Alias

Build a fancy log alias with graph and colors.

**Hint:** `git config alias.lg "log --oneline --graph --all"`

??? note "Solution"

    ```bash
    git config alias.lg "log --oneline --graph --decorate --all"

    git lg
    # Beautiful one-line graph view
    ```

---

### 04. Create a Last-Commit Alias

An alias that shows the last commit.

**Hint:** `git config alias.last "log -1 HEAD"`

??? note "Solution"

    ```bash
    git config alias.last "log -1 HEAD"

    git last
    # Shows details of the last commit
    ```

---

### 05. Create a Shell Command Alias

Use `!` to run arbitrary shell commands.

**Hint:** `git config alias.root '!pwd'`

??? note "Solution"

    ```bash
    git config alias.root '!pwd'

    git root
    # Prints the repo root directory
    ```

---

### 06. List All Aliases

See every alias configured in this repo.

**Hint:** `git config --get-regexp alias`

??? note "Solution"

    ```bash
    git config --get-regexp alias
    # alias.st status
    # alias.co checkout
    # alias.lg log --oneline --graph --decorate --all
    # alias.secret ...
    ```

---

### 07. Remove an Alias

Delete an alias you no longer need.

**Hint:** `git config --unset alias.<name>`

??? note "Solution"

    ```bash
    git config --unset alias.root

    git config --get-regexp alias
    # 'root' is gone
    ```

---

### 08. Find the Password

This repo has a custom alias already defined. Find it and run it.

**Hint:** `git config --get-regexp alias`

??? note "Solution"

    ```bash
    git config --get-regexp alias
    # Find the suspicious alias (e.g., alias.secret)

    git secret
    # Running the alias reveals the password
    ```

---

!!! success "🔓 Unlock Room 29"

    ```bash
    next <PASSWORD>
    ```
