---
password: "installed"
title_prefix: "⚙️ "
summary: "Configure Git identity, editor, and preferences with `git config`."
---

## GIT CONFIGURATION

---

## Room 02 - git config: Your Identity

- Git needs to know **who you are** before you can make commits.
- Configuration exists at **three levels**: system, global, and local.
- Your identity is everything in Git.
- Every commit you make is stamped with your name and email.
- Without configuring these, Git will complain or use defaults that won't represent you properly.

---

!!! abstract "📜 Your mission"

    1.  Set your name:
        ```bash
        git config --global user.name "Escape Artist"
        ```
    2.  Set your email:
        ```bash
        git config --global user.email "escape@rooms.dev"
        ```
    3.  List all configuration:
        ```bash
        git config --list
        git config --list --show-origin
        ```
    4.  Add a custom list alias:
        ```bash
        git config --global alias.ls "log --oneline --graph --all"
        # Test the alias:
        git ls
        ```

    5.  Find the password:

        - This room is a git repository.
        - The password is hidden in the **local** git configuration (`.git/config`).
        ```bash
        git config --local --list
        ```

    Once you have the password:

    ```bash
    next <PASSWORD>
    ```

---

### Key Commands

| Command                                       | Purpose                            |
| --------------------------------------------- | ---------------------------------- |
| `git config --global user.name "Name"`        | Set your name                      |
| `git config --global user.email "email"`      | Set your email                     |
| `git config --list`                           | List all settings                  |
| `git config --list --show-origin`             | Show where each setting comes from |
| `git config --global core.editor vim`         | Set default editor                 |
| `git config --global init.defaultBranch main` | Set default branch name            |
| `git config --unset user.name`                | Remove a setting                   |

---

### The Three Config Levels

- Git configuration lives at three levels (each overrides the one above):

| Scope      | Location         | Description                            |
| ---------- | ---------------- | -------------------------------------- |
| `--system` | `/etc/gitconfig` | Applies to ALL users on this machine   |
| `--global` | `~/.gitconfig`   | Applies to YOUR user across all repos  |
| `--local`  | `.git/config`    | Applies only to the CURRENT repository |

---

- Priority: System -> Global -> Local
- Local is the default if no scope is defined
- System config is stored in a central location for all users
- Global config is stored in the user's home directory
- Local config is stored in the `.git` folder of the repository

---

```bash
# View each level separately
git config --system --list
git config --global --list
git config --local --list

# Common useful settings
git config --global color.ui auto          # Colored output
git config --global pull.rebase true       # Rebase on pull
git config --global core.autocrlf input    # Line endings (macOS/Linux)
git config --global alias.st status        # Create shortcuts
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
```

---

## Tasks

### 01. Set Your Name

Every commit is stamped with the author's name. Configure yours.

**Hint:** `git config --global user.name`

??? note "Solution"

    ```bash
    git config --global user.name "Escape Artist"

    # Verify
    git config user.name
    # Output: Escape Artist
    ```

---

### 02. Set Your Email

The email is required for commit attribution and is public in most repos.

**Hint:** `git config --global user.email`

??? note "Solution"

    ```bash
    git config --global user.email "escape@rooms.dev"

    # Verify
    git config user.email
    # Output: escape@rooms.dev
    ```

---

### 03. List All Configuration

See every setting Git is currently using - from all three levels combined.

**Hint:** `git config --list`

??? note "Solution"

    ```bash
    git config --list
    # Shows all active settings (system + global + local merged)

    # To see WHERE each setting comes from:
    git config --list --show-origin
    # Output:
    # file:/etc/gitconfig   core.autocrlf=input
    # file:~/.gitconfig     user.name=Escape Artist
    # file:.git/config      core.bare=false
    ```

---

### 04. View Each Config Level Separately

Understand which settings live at system, global, and local scope.

**Hint:** `git config --system --list`, `git config --global --list`, `git config --local --list`

??? note "Solution"

    ```bash
    # System-wide (all users on this machine)
    git config --system --list 2>/dev/null

    # Your user (all repos)
    git config --global --list

    # This repo only
    git config --local --list
    ```

---

### 05. Set a Default Editor

Configure which editor opens when Git needs input (commit messages, rebase, etc.).

**Hint:** `git config --global core.editor`

??? note "Solution"

    ```bash
    # Use vim
    git config --global core.editor vim

    # Or nano
    git config --global core.editor nano

    # Verify
    git config core.editor
    ```

---

### 06. Create Useful Aliases

Aliases let you create shortcuts for frequently used commands.

**Hint:** `git config --global alias.<name> "<command>"`

??? note "Solution"

    ```bash
    git config --global alias.st status
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.lg "log --oneline --graph --all"

    # Test them
    git st          # same as: git status
    git lg          # pretty log graph
    ```

---

### 07. Remove a Configuration Setting

Clean up a setting you no longer need.

**Hint:** `git config --unset`

??? note "Solution"

    ```bash
    # Remove a global setting
    git config --global --unset alias.ci

    # Verify it's gone
    git config --global alias.ci
    # (no output)
    ```

---

### 08. Find the Password in Local Config

This room folder is itself a git repo. The password is hiding in its local configuration.

**Hint:** `git config --local --list`

??? note "Solution"

    ```bash
    git config --local --list
    # Look through the output for a key-value pair
    # that looks like a password

    # Or search directly:
    git config --local --get-regexp password
    ```

---

!!! success "🔓 Unlock Room 03"

    ```bash
    next <PASSWORD>
    ```
