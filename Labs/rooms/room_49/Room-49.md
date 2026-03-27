---
password: "plumb49"
title_prefix: "🔩 "
summary: "Peek under the hood with Git's low-level plumbing commands."
---

##GIT PLUMBING COMMANDS: INTERNALS

---

## Room 49 - Under the Hood

!!! abstract "📜 Your mission"

    Plumbing commands are Git's LOW-LEVEL commands. Porcelain commands (`add`, `commit`, etc.) are built ON TOP of these.

    1. Hash an object:

        * `echo "Hello" | git hash-object --stdin`
        * `echo "Hello" | git hash-object -w --stdin`  (write to object db)

    2. Read an object:

        * `git cat-file -p <hash>`   (print content)
        * `git cat-file -t <hash>`   (show type: blob, tree, commit, tag)
        * `git cat-file -s <hash>`   (show size)

    3. List tree contents:

        * `git ls-tree HEAD`
        * `git ls-tree -r HEAD`  (recursive)

    4. List files in index:

        * `git ls-files`
        * `git ls-files -s`  (with staging info)

    5. Read a tree into the index:

        * `git read-tree HEAD`

    6. Write the index to a tree object:

        * `git write-tree`

    7. Create a commit from a tree:

        * `git commit-tree <tree-hash> -m "message"`

    8. Update a ref:

        * `git update-ref refs/heads/main <commit-hash>`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                       | Purpose                              |
| --------------------------------------------- | ------------------------------------ |
| `git hash-object --stdin`                     | Compute the SHA-1 hash of content    |
| `git cat-file -p <hash>`                      | Pretty-print object content          |
| `git cat-file -t <hash>`                      | Show object type                     |
| `git cat-file -s <hash>`                      | Show object size                     |
| `git ls-tree HEAD`                            | List tree (directory) contents       |
| `git ls-files`                                | List files in the index              |
| `git write-tree`                              | Create a tree from the current index |
| `git commit-tree <tree> -p <parent> -m "msg"` | Create a commit object               |
| `git update-ref refs/heads/branch <hash>`     | Point a ref to a commit              |

### Porcelain vs Plumbing

```text
  Porcelain (user-facing)         Plumbing (low-level)
  ═══════════════════════         ════════════════════
  git add                         git hash-object + git update-index
  git commit                      git write-tree + git commit-tree
  git log                         git rev-list + git cat-file
  git branch                      git update-ref
  git checkout                    git read-tree + git checkout-index

  Creating a commit manually:
  ┌─────────────────────────────────────────────────────┐
  │  BLOB=$(echo "hi" | git hash-object -w --stdin)     │
  │  git update-index --add --cacheinfo 100644,$BLOB,f  │
  │  TREE=$(git write-tree)                              │
  │  COMMIT=$(git commit-tree $TREE -m "first commit")  │
  │  git update-ref refs/heads/main $COMMIT              │
  └─────────────────────────────────────────────────────┘
```

---

## Tasks

### 01. Hash an Object

Compute the SHA-1 hash of some content.

**Hint:** `echo "Hello" | git hash-object --stdin`

??? note "Solution"

    ```bash
    echo "Hello" | git hash-object --stdin
    # e965047ad7c57865823c7d992b1d046ea66edf78
    ```

---

### 02. Store a Blob

Write content directly to the object database.

**Hint:** `echo "content" | git hash-object -w --stdin`

??? note "Solution"

    ```bash
    echo "my data" | git hash-object -w --stdin
    # Returns hash and stores the blob in .git/objects/
    ```

---

### 03. Read an Object

Inspect a stored object's type, size, and content.

**Hint:** `git cat-file -t`, `-s`, `-p`

??? note "Solution"

    ```bash
    git cat-file -t HEAD     # commit
    git cat-file -s HEAD     # size in bytes
    git cat-file -p HEAD     # pretty-print content
    ```

---

### 04. List Tree Contents

Explore a tree object (directory listing).

**Hint:** `git ls-tree HEAD`

??? note "Solution"

    ```bash
    git ls-tree HEAD
    # 100644 blob aaa111  README.md
    # 040000 tree bbb222  src

    git ls-tree -r HEAD
    # Recursive - shows all files
    ```

---

### 05. List Files in the Index

See what's in the staging area.

**Hint:** `git ls-files -s`

??? note "Solution"

    ```bash
    git ls-files -s
    # 100644 aaa111 0 README.md
    # 100644 bbb222 0 src/app.py
    ```

---

### 06. Create a Commit with Plumbing

Build a commit manually using low-level commands.

**Hint:** `git write-tree`, `git commit-tree`

??? note "Solution"

    ```bash
    TREE=$(git write-tree)
    COMMIT=$(git commit-tree $TREE -m "Manual commit")
    echo $COMMIT

    git cat-file -p $COMMIT
    # tree ...
    # author ...
    # committer ...
    # Manual commit
    ```

---

### 07. Update a Reference

Point a branch to a specific commit hash.

**Hint:** `git update-ref refs/heads/<branch> <hash>`

??? note "Solution"

    ```bash
    git update-ref refs/heads/test-branch $COMMIT
    git log --oneline test-branch
    # Shows the commit we created
    ```

---

### 08. Find the Password

Trace the object chain from HEAD: commit → tree → blobs. The password is in one of the blobs.

**Hint:** `git cat-file -p HEAD`, then follow the tree hash, then blob hashes

??? note "Solution"

    ```bash
    git cat-file -p HEAD
    # tree <hash>

    git cat-file -p <tree-hash>
    # Lists blobs

    git cat-file -p <blob-hash>
    # The password is in one of the blob contents
    ```

---

!!! success "🔓 Unlock Room 50"

    ```bash
    next <PASSWORD>
    ```
