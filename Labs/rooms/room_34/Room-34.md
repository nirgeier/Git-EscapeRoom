---
password: "sparse34"
title_prefix: "✂️ "
summary: "Clone only the parts of a repo you need - perfect for huge monorepos."
---

##GIT SPARSE-CHECKOUT: PARTIAL REPOS

---

## Room 34 - Checkout Only What You Need

!!! abstract "📜 Your mission"

    Sparse checkout lets you check out only PART of a large repository.

    1. Enable sparse checkout:

        * `git sparse-checkout init`

    2. Set which directories to include:

        * `git sparse-checkout set src/ docs/`

    3. List what's included:

        * `git sparse-checkout list`

    4. Add more directories:

        * `git sparse-checkout add tests/`

    5. Cone mode (faster, directory-based):

        * `git sparse-checkout init --cone`
        * `git sparse-checkout set src/frontend src/backend`

    6. Disable sparse checkout:

        * `git sparse-checkout disable`

    7. This is useful for HUGE monorepos where you only need part of the code.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                           | Purpose                             |
| --------------------------------- | ----------------------------------- |
| `git sparse-checkout init --cone` | Enable cone-mode sparse-checkout    |
| `git sparse-checkout set <dirs>`  | Set which directories to include    |
| `git sparse-checkout add <dir>`   | Add a directory to the sparse set   |
| `git sparse-checkout list`        | List currently included directories |
| `git sparse-checkout disable`     | Disable sparse-checkout (full repo) |
| `git clone --sparse <url>`        | Clone with sparse-checkout enabled  |

### Sparse-Checkout in Action

```
Full repo on remote:
├── src/
│   ├── frontend/
│   └── backend/
├── docs/
├── tests/
├── infra/
└── scripts/

After: git sparse-checkout set src/backend docs/

Your working directory:
├── src/
│   └── backend/    ✓ checked out
├── docs/           ✓ checked out
└── (everything else is hidden but still in .git)

Git history is COMPLETE - only the working directory is filtered.
```

!!! tip "💡 Cone Mode vs Non-Cone"
`--cone` mode (recommended) works at the directory level and is fast.
Non-cone mode uses gitignore-style patterns for file-level control
but is slower on large repos.

---

## Tasks

### 01. Enable Sparse-Checkout

Set up sparse-checkout in cone mode.

**Hint:** `git sparse-checkout init --cone`

??? note "Solution"

    ```bash
    git sparse-checkout init --cone
    # Sparse-checkout enabled, only root files checked out
    ```

---

### 02. Select Directories

Choose which directories to include.

**Hint:** `git sparse-checkout set <dirs>`

??? note "Solution"

    ```bash
    git sparse-checkout set src/ docs/
    ls
    # Only src/ and docs/ (and root files) are visible
    ```

---

### 03. List What's Included

See which paths are currently checked out.

**Hint:** `git sparse-checkout list`

??? note "Solution"

    ```bash
    git sparse-checkout list
    # src
    # docs
    ```

---

### 04. Add More Directories

Include additional directories without removing existing ones.

**Hint:** `git sparse-checkout add <dir>`

??? note "Solution"

    ```bash
    git sparse-checkout add tests/

    git sparse-checkout list
    # src
    # docs
    # tests
    ```

---

### 05. Verify History Is Complete

Confirm the full git history is available even with sparse checkout.

**Hint:** `git log --oneline --all`

??? note "Solution"

    ```bash
    git log --oneline --all
    # Full history is available
    # Only the WORKING DIRECTORY is filtered, not history
    ```

---

### 06. Disable Sparse-Checkout

Return to a full checkout.

**Hint:** `git sparse-checkout disable`

??? note "Solution"

    ```bash
    git sparse-checkout disable
    ls
    # All directories are back!
    ```

---

### 07. Find the Password

Use sparse-checkout to include the hidden `secrets/` directory.

**Hint:** `git sparse-checkout set secrets/`

??? note "Solution"

    ```bash
    git sparse-checkout init --cone
    git sparse-checkout set secrets/
    cat secrets/password.txt
    # The password is in the secrets directory
    ```

---

!!! success "🔓 Unlock Room 35"

    ```bash
    next <PASSWORD>
    ```
