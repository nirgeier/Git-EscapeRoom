---
password: "archive"
title_prefix: "📁 "
summary: "Export a snapshot of your repository without the .git directory."
---

##GIT ARCHIVE: EXPORT WITHOUT .GIT

---

## Room 37 - Package Your Code

!!! abstract "📜 Your mission"

    Archive creates a tarball or zip of your repo WITHOUT the `.git` directory.

    1. Create a tar archive:

        * `git archive --format=tar HEAD > project.tar`

    2. Create a zip:

        * `git archive --format=zip HEAD > project.zip`

    3. Archive a specific branch/tag:

        * `git archive --format=tar v1.0 > release-v1.0.tar`

    4. Archive a subdirectory:

        * `git archive HEAD src/ > src-only.tar`

    5. Archive with prefix (adds a directory wrapper):

        * `git archive --prefix=myproject/ HEAD > myproject.tar`

    6. Compress with gzip:

        * `git archive HEAD | gzip > project.tar.gz`

    7. `.gitattributes`: `export-ignore`
       Files marked with `export-ignore` are EXCLUDED from archives.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                              | Purpose                             |
| ------------------------------------ | ----------------------------------- |
| `git archive --format=tar HEAD`      | Create a tar archive of HEAD        |
| `git archive --format=zip HEAD`      | Create a zip archive of HEAD        |
| `git archive --prefix=dir/ HEAD`     | Add a prefix directory to all paths |
| `git archive HEAD src/`              | Archive only specific paths         |
| `git archive v1.0 -o release.tar.gz` | Archive a specific tag              |
| `git archive --remote=<url> HEAD`    | Archive from a remote repository    |

### Archive vs Clone

```text
  git clone                          git archive
  ─────────────────────────────────────────────────
  Full repo + .git history           Snapshot only
  Can push/pull                      Read-only export
  Large download                     Minimal size
  For development                    For distribution

  Use cases for git archive:
  ┌─────────────────────────────────────────┐
  │  • Release tarballs for distribution    │
  │  • CI/CD build inputs                   │
  │  • Sharing code without history         │
  │  • Creating deployment packages         │
  └─────────────────────────────────────────┘
```

---

## Tasks

### 01. Create a Tar Archive

Export the current HEAD as a tar file.

**Hint:** `git archive --format=tar HEAD > project.tar`

??? note "Solution"

    ```bash
    git archive --format=tar HEAD > project.tar
    tar -tf project.tar | head
    # Lists the files in the archive (no .git!)
    ```

---

### 02. Create a Zip Archive

Export as a zip file.

**Hint:** `git archive --format=zip HEAD > project.zip`

??? note "Solution"

    ```bash
    git archive --format=zip HEAD > project.zip
    # Or with output flag:
    git archive -o project.zip HEAD
    ```

---

### 03. Archive with a Prefix Directory

Wrap the archive contents in a named directory.

**Hint:** `git archive --prefix=myproject/ HEAD`

??? note "Solution"

    ```bash
    git archive --prefix=myproject-v1.0/ HEAD | gzip > myproject-v1.0.tar.gz
    tar -tzf myproject-v1.0.tar.gz | head
    # myproject-v1.0/README.md
    # myproject-v1.0/src/...
    ```

---

### 04. Archive a Specific Tag or Branch

Export a release version.

**Hint:** `git archive v1.0`

??? note "Solution"

    ```bash
    git archive --format=tar v1.0 > release-v1.0.tar
    # Archives the tree at tag v1.0
    ```

---

### 05. Archive Only a Subdirectory

Export just part of the repo.

**Hint:** `git archive HEAD src/`

??? note "Solution"

    ```bash
    git archive --format=tar HEAD src/ > src-only.tar
    tar -tf src-only.tar
    # Only files under src/
    ```

---

### 06. Verify No .git in Archive

Confirm the archive doesn't contain Git history.

**Hint:** `tar -tf project.tar | grep .git`

??? note "Solution"

    ```bash
    tar -tf project.tar | grep .git
    # No output - .git is not included in archives
    ```

---

### 07. Find the Password

Archive the repo and inspect its contents. Or explore tags for the password.

**Hint:** `git tag`, `git archive <tag>`, or check the file contents

??? note "Solution"

    ```bash
    git log --oneline --all
    # Find the password in commit messages or files
    ```

---

!!! success "🔓 Unlock Room 38"

    ```bash
    next <PASSWORD>
    ```
