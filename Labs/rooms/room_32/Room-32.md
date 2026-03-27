---
password: "submod32"
title_prefix: "📦 "
summary: "Embed external repositories inside your project as submodules."
---

##GIT SUBMODULE: REPOS WITHIN REPOS

---

## Room 32 - Managing Submodules

!!! abstract "📜 Your mission"

    Submodules let you include another Git repository inside yours.

    1. Add a submodule:

        * `git submodule add <url> path/to/submodule`

    2. Check submodule status:

        * `git submodule status`

    3. When cloning a repo with submodules:

        * `git clone --recurse-submodules <url>`
        * OR after cloning:
        * `git submodule init`
        * `git submodule update`

    4. Update submodules to latest:

        * `git submodule update --remote`

    5. View `.gitmodules` file:

        * `cat .gitmodules`

    6. This repo has submodules configured. Explore the `.gitmodules` file.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                        | Purpose                            |
| ---------------------------------------------- | ---------------------------------- |
| `git submodule add <url> <path>`               | Add a new submodule                |
| `git submodule status`                         | Show current commit of each submod |
| `git submodule update --init --recursive`      | Initialize and fetch submodules    |
| `git submodule update --remote`                | Update submodules to latest remote |
| `git submodule foreach 'git pull origin main'` | Run command in every submodule     |
| `git rm <submodule-path>`                      | Remove a submodule                 |
| `cat .gitmodules`                              | View submodule configuration       |

### Submodule Structure

```
my-project/
├── .gitmodules          ← tracks submodule URLs and paths
├── .git/
│   └── modules/         ← actual submodule git data
├── src/
└── libs/
    └── shared-lib/      ← submodule (pinned to a specific commit)
        ├── .git         ← file pointing to ../../.git/modules/...
        └── ...

Submodules are pinned to a SPECIFIC COMMIT, not a branch.
You must explicitly update them to pull in new changes.
```

---

## Tasks

### 01. Check for Submodules

See if this repo has any submodules configured.

**Hint:** `cat .gitmodules`, `git submodule status`

??? note "Solution"

    ```bash
    cat .gitmodules
    # Shows [submodule "name"] entries with path and url

    git submodule status
    # Shows the commit each submodule is pinned to
    ```

---

### 02. Initialize Submodules

Register and clone submodule content.

**Hint:** `git submodule init`, `git submodule update`

??? note "Solution"

    ```bash
    git submodule init
    # Registers submodule URLs from .gitmodules

    git submodule update
    # Clones and checks out the pinned commit
    ```

---

### 03. Explore Submodule Content

Enter a submodule directory and see its own git history.

**Hint:** `cd <submodule-path>`, `git log --oneline`

??? note "Solution"

    ```bash
    cd libs/shared-lib
    git log --oneline
    # Shows the submodule's own commit history

    cd ../..
    ```

---

### 04. Update Submodules to Latest

Pull the latest changes from the submodule's remote.

**Hint:** `git submodule update --remote`

??? note "Solution"

    ```bash
    git submodule update --remote
    # Updates each submodule to the latest commit on its tracking branch

    git status
    # Shows submodule directory as modified (new commit)
    ```

---

### 05. Run a Command in All Submodules

Execute a command inside every submodule.

**Hint:** `git submodule foreach '<command>'`

??? note "Solution"

    ```bash
    git submodule foreach 'git status'
    # Runs git status inside each submodule

    git submodule foreach 'echo $name at $(git rev-parse --short HEAD)'
    ```

---

### 06. Add a New Submodule

Add an external repo as a submodule.

**Hint:** `git submodule add <url> <path>`

??? note "Solution"

    ```bash
    git submodule add https://example.com/lib.git libs/new-lib
    # Creates the directory and updates .gitmodules

    cat .gitmodules
    ```

---

### 07. Find the Password

Explore the `.gitmodules` file or the submodule content for the password.

**Hint:** `cat .gitmodules`, explore the submodule directories

??? note "Solution"

    ```bash
    cat .gitmodules
    # Look for clues in the URLs or module names

    git submodule status
    # Explore the submodule for the password
    ```

---

!!! success "🔓 Unlock Room 33"

    ```bash
    next <PASSWORD>
    ```
