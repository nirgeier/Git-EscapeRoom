---
password: "remote15"
title_prefix: "🌐 "
summary: "Manage remote repositories with `git remote` - add, rename, remove."
---

##GIT REMOTE: CONNECTING TO THE WORLD

---

## Room 15 - Remote Repositories

!!! abstract "📜 Your mission"

    Remotes are BOOKMARKS to other copies of your repository.

    1. List current remotes:

        * `git remote -v`

    2. Add a remote:

        * `git remote add origin https://example.com/repo.git`
        * `git remote add upstream https://example.com/upstream.git`

    3. View remote details:

        * `git remote show origin`

    4. Rename a remote:

        * `git remote rename origin primary`

    5. Remove a remote:

        * `git remote remove upstream`

    6. This repo has several remotes configured.
       Find the remote named "secret" and read its URL.
       The URL path contains the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                           | Purpose                |
| --------------------------------- | ---------------------- |
| `git remote -v`                   | List remotes with URLs |
| `git remote add <name> <url>`     | Add a remote           |
| `git remote remove <name>`        | Remove a remote        |
| `git remote rename <old> <new>`   | Rename a remote        |
| `git remote show <name>`          | Show remote details    |
| `git remote set-url <name> <url>` | Change remote URL      |

---

## Tasks

### 01. List Configured Remotes

See all remote names and their URLs.

**Hint:** `git remote -v`

??? note "Solution"

    ```bash
    git remote -v
    # origin    https://github.com/user/repo.git (fetch)
    # origin    https://github.com/user/repo.git (push)
    # upstream  https://github.com/org/repo.git (fetch)
    # upstream  https://github.com/org/repo.git (push)
    ```

---

### 02. Add a New Remote

Add a remote called `backup` pointing to a URL.

**Hint:** `git remote add <name> <url>`

??? note "Solution"

    ```bash
    git remote add backup https://example.com/backup.git

    git remote -v
    # backup   https://example.com/backup.git (fetch)
    # backup   https://example.com/backup.git (push)
    # origin   ...
    ```

---

### 03. Show Remote Details

Get detailed information about a specific remote.

**Hint:** `git remote show <name>`

??? note "Solution"

    ```bash
    git remote show origin
    # * remote origin
    #   Fetch URL: ...
    #   Push URL:  ...
    #   HEAD branch: main
    #   Remote branches: ...
    ```

---

### 04. Rename a Remote

Change a remote's name.

**Hint:** `git remote rename <old> <new>`

??? note "Solution"

    ```bash
    git remote rename origin primary

    git remote -v
    # primary  https://github.com/user/repo.git (fetch)
    # primary  https://github.com/user/repo.git (push)
    ```

---

### 05. Change a Remote URL

Update the URL for an existing remote.

**Hint:** `git remote set-url <name> <new-url>`

??? note "Solution"

    ```bash
    git remote set-url origin git@github.com:user/repo.git

    git remote -v
    # origin   git@github.com:user/repo.git (fetch)
    # origin   git@github.com:user/repo.git (push)
    ```

---

### 06. Remove a Remote

Delete a remote you no longer need.

**Hint:** `git remote remove <name>`

??? note "Solution"

    ```bash
    git remote remove backup

    git remote -v
    # backup is gone
    ```

---

### 07. Find the Password

Find the remote named "secret" and read its URL. The URL path contains the password.

**Hint:** `git remote -v`

??? note "Solution"

    ```bash
    git remote -v
    # Look for the remote named "secret"
    # Its URL path contains the password
    ```

---

!!! success "🔓 Unlock Room 16"

    ```bash
    next <PASSWORD>
    ```
