---
password: "clone16"
title_prefix: "📋 "
summary: "Clone repositories with depth, branch, and bare options."
---

##GIT CLONE: COPYING REPOSITORIES

---

## Room 16 - Cloning

!!! abstract "📜 Your mission"

    Clone creates a COMPLETE copy of a repository with all its history.

    1. Clone the local `upstream` bare repo in this room:

        * `git clone upstream/ my-clone`

    2. Explore the clone:

        * `cd my-clone`
        * `git log --oneline`
        * `git remote -v`

    3. Clone with options:

        * `git clone --depth 1 upstream/ shallow-clone` (only latest commit)
        * `git clone --branch feature upstream/ branch-clone`
        * `git clone --bare upstream/ bare-clone.git`

    4. Compare `.git` sizes:

        * `du -sh my-clone/.git`
        * `du -sh shallow-clone/.git`

    5. The password is hidden in one of the commits in `upstream`.
       Clone it, search the log, find the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                | Purpose                     |
| -------------------------------------- | --------------------------- |
| `git clone <url>`                      | Full clone                  |
| `git clone --depth 1 <url>`            | Shallow clone (latest only) |
| `git clone --branch <br> <url>`        | Clone specific branch       |
| `git clone --bare <url>`               | Bare clone (no working dir) |
| `git clone --recurse-submodules <url>` | Clone with submodules       |

---

## Tasks

### 01. Clone a Local Repository

Clone the `upstream` bare repo into a new directory.

**Hint:** `git clone upstream/ my-clone`

??? note "Solution"

    ```bash
    git clone upstream/ my-clone
    # Cloning into 'my-clone'...

    cd my-clone
    git log --oneline
    ```

---

### 02. Inspect the Clone's Remote

Check which remote was automatically configured.

**Hint:** `git remote -v`

??? note "Solution"

    ```bash
    git remote -v
    # origin  /path/to/upstream/ (fetch)
    # origin  /path/to/upstream/ (push)
    ```

---

### 03. Shallow Clone

Create a clone with only the latest commit (no full history).

**Hint:** `git clone --depth 1 <url> <dir>`

??? note "Solution"

    ```bash
    git clone --depth 1 upstream/ shallow-clone

    cd shallow-clone
    git log --oneline
    # Only one commit visible
    ```

---

### 04. Clone a Specific Branch

Clone only a particular branch.

**Hint:** `git clone --branch <name> <url> <dir>`

??? note "Solution"

    ```bash
    git clone --branch feature upstream/ branch-clone

    cd branch-clone
    git branch
    # * feature
    ```

---

### 05. Bare Clone

Create a bare clone (no working directory, just the Git database).

**Hint:** `git clone --bare <url> <dir>`

??? note "Solution"

    ```bash
    git clone --bare upstream/ bare-clone.git

    ls bare-clone.git/
    # HEAD  config  description  hooks  info  objects  refs
    # No working directory - just the git internals
    ```

---

### 06. Compare Clone Sizes

Compare the `.git` directory sizes of different clone types.

**Hint:** `du -sh <dir>/.git`

??? note "Solution"

    ```bash
    du -sh my-clone/.git
    du -sh shallow-clone/.git
    du -sh bare-clone.git
    # Shallow clone is smaller (less history)
    ```

---

### 07. Find the Password

Clone the upstream repo and search the commit log for the password.

**Hint:** `git clone upstream/ search-clone`, `cd search-clone`, `git log --oneline`

??? note "Solution"

    ```bash
    cd my-clone
    git log --oneline
    # Search through commit messages for the password
    ```

---

!!! success "🔓 Unlock Room 17"

    ```bash
    next <PASSWORD>
    ```
