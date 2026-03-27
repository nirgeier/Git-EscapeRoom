---
password: "replace"
title_prefix: "🔄 "
summary: "Transparently swap Git objects to rewrite history without altering hashes."
---

##GIT REPLACE: TRANSPARENT OBJECT SWAP

---

## Room 44 - The Switcheroo

!!! abstract "📜 Your mission"

    Replace lets you swap one Git object for another, transparently.

    1. Replace a commit with another:

        * `git replace <old-commit> <new-commit>`

    2. List replacements:

        * `git replace -l`

    3. Delete a replacement:

        * `git replace -d <old-commit>`

    4. Use cases:

        * Fix a commit message without rewriting history
        * Graft histories together
        * Replace a tree (directory state)

    5. Replacements are stored in `refs/replace/`.
       They're transparent - Git acts as if the original was the replacement.

    6. Create a "fixed" version of a commit:

        * `git commit-tree <tree> -p <parent> -m "Fixed message"`
        * `git replace <bad-commit> <new-commit>`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                       | Purpose                         |
| --------------------------------------------- | ------------------------------- |
| `git replace <original> <replacement>`        | Replace an object transparently |
| `git replace -l`                              | List all active replacements    |
| `git replace -d <object>`                     | Delete a replacement            |
| `git commit-tree <tree> -p <parent> -m "msg"` | Create a new commit object      |
| `git cat-file -p <object>`                    | Inspect any Git object          |
| `git log --no-replace-objects`                | View log ignoring replacements  |

### How Replace Works

```mermaid
flowchart LR
    A --> B --> C --> D
    D -. "git replace D D'" .-> D'["D' (replacement)"]
    style D stroke-dasharray: 5 5
    style D' fill:#4CAF50,color:#fff
```

**Normal view:** Everyone sees `D'` in place of `D`

**Behind the scenes:** Original `D` still exists. Replacements stored in `refs/replace/<original-sha>`

!!! note "Key Properties"

    - Original object is **NOT** deleted
    - All Git commands see the replacement
    - `--no-replace-objects` bypasses replacements
    - Must push `refs/replace/*` explicitly
    - Useful for grafting history or fixing commits

---

## Tasks

### 01. List Existing Replacements

Check if any objects have been replaced.

**Hint:** `git replace -l`

??? note "Solution"

    ```bash
    git replace -l
    # Lists SHA-1 hashes of replaced objects
    ```

---

### 02. Inspect an Object

Look at the raw content of a Git object.

**Hint:** `git cat-file -p <hash>`

??? note "Solution"

    ```bash
    git cat-file -p HEAD
    # tree abc1234
    # parent def5678
    # author ...
    # committer ...
    # commit message
    ```

---

### 03. Create a Replacement Commit

Build a new commit object with a fixed message.

**Hint:** `git commit-tree <tree> -p <parent> -m "Fixed message"`

??? note "Solution"

    ```bash
    # Get tree and parent from the original commit:
    git cat-file -p HEAD
    # tree aaa...
    # parent bbb...

    NEW=$(git commit-tree aaa... -p bbb... -m "Fixed message")
    echo $NEW
    ```

---

### 04. Replace an Object

Swap the original commit for the new one.

**Hint:** `git replace <original> <replacement>`

??? note "Solution"

    ```bash
    git replace HEAD $NEW

    git log -1
    # Shows "Fixed message" (the replacement)
    ```

---

### 05. View Without Replacements

See the original, unreplaced objects.

**Hint:** `git --no-replace-objects log`

??? note "Solution"

    ```bash
    git --no-replace-objects log -1
    # Shows the ORIGINAL commit message
    ```

---

### 06. Remove a Replacement

Delete a replacement and restore the original.

**Hint:** `git replace -d <hash>`

??? note "Solution"

    ```bash
    git replace -d HEAD

    git log -1
    # Back to the original commit message
    ```

---

### 07. Find the Password

Check for existing replacements. View the original vs replaced content.

**Hint:** `git replace -l`, `git --no-replace-objects log`

??? note "Solution"

    ```bash
    git replace -l
    # Find the replaced object

    git --no-replace-objects show <hash>
    # The original or replaced content has the password
    ```

---

!!! success "🔓 Unlock Room 45"

    ```bash
    next <PASSWORD>
    ```
