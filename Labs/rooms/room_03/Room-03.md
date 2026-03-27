---
password: "config42"
title_prefix: "📂 "
summary: "Initialize a repository and explore the `.git` directory structure."
---

##GIT INIT

---

## Room 03 - Creating Your First Repository

- `git init` transforms a regular directory into a **Git repository**.
- It creates a hidden `.git/` directory that stores ALL version control data.

---

!!! abstract "📜 Your mission"

    Every journey starts with `git init`.

    1. Create a new directory called `my-project`:

          * `mkdir my-project && cd my-project`

    2. Initialize it as a git repository:

          * `git init`

    3. Explore what git created:

          * `ls -la .git/`

    4. Look inside the .git directory structure:

          * `tree .git/` (or `find .git/ -type f`)

    5. Read the HEAD file:
          * `cat .git/HEAD`

    6. What does HEAD point to? It references `refs/heads/<default-branch>`, which is the default branch name (often `main` or `master`).
       This is the CURRENT branch pointer.

    7. The CURRENT branch is the password for the next room.
       Use it to unlock the next challenge:

          * `next <HEAD content>`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

---

### Key Commands

| Command                          | Purpose                                     |
| -------------------------------- | ------------------------------------------- |
| `git init`                       | Initialize new repository                   |
| `git init --bare`                | Initialize bare repository (no working dir) |
| `git init --initial-branch=main` | Init with custom branch name                |
| `ls -la .git/`                   | Explore repository internals                |
| `cat .git/HEAD`                  | See what HEAD points to                     |
| `cat .git/config`                | View repo-local configuration               |

---

### The .git Directory Structure

```
.git/
├── HEAD              ← Points to current branch (refs/heads/main)
├── config            ← Repository-local configuration
├── description       ← Used by GitWeb (rarely modified)
├── hooks/            ← Client-side and server-side hooks
│   ├── pre-commit.sample
│   ├── commit-msg.sample
│   └── ...
├── info/
│   └── exclude       ← Local gitignore (not committed)
├── objects/          ← ALL content stored here (blobs, trees, commits)
│   ├── info/
│   └── pack/
└── refs/             ← Pointers to commit objects
    ├── heads/        ← Branch tips
    └── tags/         ← Tag pointers
```

### init vs clone

```bash
# git init: create NEW empty repository
git init my-project
cd my-project

# git clone: copy EXISTING repository
git clone https://github.com/user/repo.git
cd repo
# (Already has .git/, history, remote configured)
```

---

## Tasks

### 01. Create a New Directory

Every project starts in its own folder.

**Hint:** `mkdir`, `cd`

??? note "Solution"

    ```bash
    mkdir my-project
    cd my-project
    pwd
    # /path/to/my-project
    ```

---

### 02. Initialize a Git Repository

Transform the empty directory into a Git-tracked repository.

**Hint:** `git init`

??? note "Solution"

    ```bash
    git init
    # Initialized empty Git repository in /path/to/my-project/.git/

    # Verify
    ls -la
    # You should see:  .git/
    ```

---

### 03. Explore the `.git` Directory

After `git init`, a hidden `.git/` directory holds everything Git knows.

**Hint:** `ls -la .git/`, `tree .git/`

??? note "Solution"

    ```bash
    ls -la .git/
    # HEAD  config  description  hooks/  info/  objects/  refs/

    # If tree is installed:
    tree .git/ -L 2

    # Alternative:
    find .git/ -type f | head -20
    ```

---

### 04. Read the HEAD File

HEAD tells Git which branch you are currently on.

**Hint:** `cat .git/HEAD`

??? note "Solution"

    ```bash
    cat .git/HEAD
    # ref: refs/heads/main
    #   (or refs/heads/master on older systems)

    # The branch name after refs/heads/ is the current branch.
    ```

---

### 05. Inspect the Config File

Each repo has its own local config inside `.git/config`.

**Hint:** `cat .git/config`

??? note "Solution"

    ```bash
    cat .git/config
    # [core]
    #   repositoryformatversion = 0
    #   filemode = true
    #   bare = false
    #   logallrefupdates = true
    ```

---

### 06. Try Initializing with a Custom Branch Name

By default, `git init` uses `main` (or `master`). You can choose your own.

**Hint:** `git init --initial-branch=<name>`

??? note "Solution"

    ```bash
    cd ..
    mkdir custom-branch-project
    cd custom-branch-project
    git init --initial-branch=develop
    cat .git/HEAD
    # ref: refs/heads/develop

    # Clean up
    cd ..
    rm -rf custom-branch-project
    ```

---

### 07. Create a Bare Repository

Bare repos have no working directory - used as central "server" repos.

**Hint:** `git init --bare`

??? note "Solution"

    ```bash
    cd ..
    git init --bare my-bare-repo.git
    ls my-bare-repo.git/
    # HEAD  config  description  hooks/  info/  objects/  refs/
    # Note: no .git/ subdirectory - the repo IS the directory

    # Clean up
    rm -rf my-bare-repo.git
    ```

---

### 08. Find the Password

The default branch name that Git created is the password for the next room.

**Hint:** `cat .git/HEAD` - the branch name after `refs/heads/` is the password

??? note "Solution"

    ```bash
    cd my-project
    cat .git/HEAD
    # ref: refs/heads/main

    # The password is: main
    ```

---

!!! success "🔓 Unlock Room 04"

    ```bash
    next <PASSWORD>
    ```
