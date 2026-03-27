---
password: "patch39"
title_prefix: "🩹 "
summary: "Create and apply patches for email-based collaboration."
---

##GIT FORMAT-PATCH & AM: EMAIL PATCHES

---

## Room 39 - Old-School Collaboration

!!! abstract "📜 Your mission"

    Patches are the OLD-SCHOOL way to share changes - via email or files.

    1. Create patches from commits:

        * `git format-patch -3`    (last 3 commits → 3 `.patch` files)
        * `git format-patch main..feature`

    2. View a patch file:

        * `cat 0001-*.patch`

    3. Apply patches:

        * `git am 0001-*.patch`            (apply and commit)
        * `git apply 0001-*.patch`         (apply without committing)

    4. Apply a series of patches:

        * `git am *.patch`

    5. If there's a conflict during `am`:

        * `git am --abort`    (cancel)
        * `git am --skip`     (skip this patch)
        * `git am --continue` (after fixing conflicts)

    6. Create a single combined patch:

        * `git diff main..feature > combined.patch`
        * `git apply combined.patch`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                          | Purpose                            |
| -------------------------------- | ---------------------------------- |
| `git format-patch -3`            | Create patches for last 3 commits  |
| `git format-patch main..feature` | Patches for all commits in a range |
| `git am *.patch`                 | Apply patch files as commits       |
| `git am --abort`                 | Abort a failed patch apply         |
| `git apply file.patch`           | Apply a diff (no commit created)   |
| `git diff > file.patch`          | Generate a simple diff patch       |

### format-patch vs diff

| Feature    | `git format-patch`         | `git diff > file.patch`     |
| ---------- | -------------------------- | --------------------------- |
| Output     | One file per commit        | Single file for all changes |
| Metadata   | Preserves author & message | Only the diff               |
| Apply with | `git am`                   | `git apply`                 |
| Result     | Creates commits            | Only modifies working tree  |

```mermaid
flowchart LR
    A["👤 Author"] -- "git format-patch" --> P["📄 .patch files"]
    P -- "email" --> M["👤 Maintainer"]
    M -- "git am *.patch" --> R["✅ Commits applied!"]
```

!!! tip "💡 Linux Kernel Workflow"
The Linux kernel still uses `git format-patch` and `git am` as its
primary contribution method - patches are sent via email to mailing lists.

---

## Tasks

### 01. Create Patches from Recent Commits

Generate patch files for the last 3 commits.

**Hint:** `git format-patch -3`

??? note "Solution"

    ```bash
    git format-patch -3
    # 0001-First-commit-message.patch
    # 0002-Second-commit-message.patch
    # 0003-Third-commit-message.patch
    ```

---

### 02. Read a Patch File

Examine the contents of a generated patch.

**Hint:** `cat 0001-*.patch`

??? note "Solution"

    ```bash
    cat 0001-*.patch
    # Shows: From, Subject, Date, body, and the diff
    ```

---

### 03. Apply Patches with git am

Apply patch files as commits.

**Hint:** `git am *.patch`

??? note "Solution"

    ```bash
    git am *.patch
    # Applying: First commit message
    # Applying: Second commit message
    # Applying: Third commit message
    ```

---

### 04. Apply a Diff Patch

Apply a simple diff (no commit created).

**Hint:** `git apply file.patch`

??? note "Solution"

    ```bash
    git diff > changes.patch
    git checkout -- .
    git apply changes.patch
    # Changes reapplied to working directory (no commit)
    ```

---

### 05. Create Patches for a Branch Range

Generate patches for all commits on a feature branch.

**Hint:** `git format-patch main..feature`

??? note "Solution"

    ```bash
    git format-patch main..feature
    # Creates one .patch file per commit on feature not in main
    ```

---

### 06. Abort a Failed Patch Apply

Handle conflicts during `git am`.

**Hint:** `git am --abort`

??? note "Solution"

    ```bash
    git am *.patch
    # CONFLICT!

    git am --abort
    # Or fix and continue:
    # git add <resolved-file>
    # git am --continue
    ```

---

### 07. Find the Password

Examine the patch files in this room. One of them contains the password.

**Hint:** `ls *.patch`, `cat *.patch | grep -i password`

??? note "Solution"

    ```bash
    ls *.patch
    cat *.patch | grep -i password
    # Or apply them and check the files
    ```

---

!!! success "🔓 Unlock Room 40"

    ```bash
    next <PASSWORD>
    ```
