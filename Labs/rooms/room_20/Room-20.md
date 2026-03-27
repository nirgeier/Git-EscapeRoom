---
password: "tag20"
title_prefix: "🏷️ "
summary: "Mark releases and milestones with lightweight and annotated tags."
---

##GIT TAG: MARKING MILESTONES

---

## Room 20 - Tagging Releases

!!! abstract "📜 Your mission"

    Tags mark specific points in history - usually releases.

    1. List existing tags:

        * `git tag`

    2. Create a lightweight tag:

        * `git tag v1.0`

    3. Create an annotated tag (recommended):

        * `git tag -a v2.0 -m "Version 2.0 release"`

    4. Tag a specific commit:

        * `git tag -a v0.5 abc1234 -m "Retroactive tag"`

    5. Show tag details:

        * `git show v2.0`

    6. Push tags to remote:

        * `git push origin v2.0`
        * `git push origin --tags`  (push all tags)

    7. Delete a tag:

        * `git tag -d v1.0`
        * `git push origin :refs/tags/v1.0`  (delete remote tag)

    8. This repo has several tags. Find the tag whose message contains the password.

        * `git tag -l | xargs -I{} git show {}`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                    | Purpose           |
| -------------------------- | ----------------- |
| `git tag`                  | List tags         |
| `git tag v1.0`             | Lightweight tag   |
| `git tag -a v1.0 -m "msg"` | Annotated tag     |
| `git show v1.0`            | Show tag info     |
| `git push origin v1.0`     | Push specific tag |
| `git push origin --tags`   | Push all tags     |
| `git tag -d v1.0`          | Delete local tag  |

### Lightweight vs Annotated

```
Lightweight: just a pointer (like a branch that doesn't move)
Annotated:   full object with tagger, date, message, and optional GPG signature
```

---

## Tasks

### 01. List All Tags

See what tags already exist in this repo.

**Hint:** `git tag`

??? note "Solution"

    ```bash
    git tag
    # v0.1
    # v0.5
    # v1.0
    # secret-release
    ```

---

### 02. Create a Lightweight Tag

Create a simple pointer tag at the current commit.

**Hint:** `git tag <name>`

??? note "Solution"

    ```bash
    git tag v3.0

    git tag
    # ... v3.0 now in the list
    ```

---

### 03. Create an Annotated Tag

Create a tag with a message, author, and date.

**Hint:** `git tag -a <name> -m "message"`

??? note "Solution"

    ```bash
    git tag -a v4.0 -m "Version 4.0 release"

    git show v4.0
    # tag v4.0
    # Tagger: ...
    # Date: ...
    # Version 4.0 release
    ```

---

### 04. Tag a Past Commit

Tag a specific earlier commit.

**Hint:** `git tag -a <name> <hash> -m "message"`

??? note "Solution"

    ```bash
    git log --oneline
    # abc1234 Some old commit

    git tag -a v0.1-hotfix abc1234 -m "Hotfix for v0.1"
    ```

---

### 05. Show Tag Details

Inspect the metadata and commit associated with a tag.

**Hint:** `git show <tag>`

??? note "Solution"

    ```bash
    git show v1.0
    # Shows: tagger, date, message, and the commit + diff
    ```

---

### 06. Filter Tags by Pattern

Search for tags matching a glob pattern.

**Hint:** `git tag -l "pattern*"`

??? note "Solution"

    ```bash
    git tag -l "v1.*"
    # v1.0
    # v1.1

    git tag -l "*secret*"
    # secret-release
    ```

---

### 07. Delete a Tag

Remove a local tag.

**Hint:** `git tag -d <name>`

??? note "Solution"

    ```bash
    git tag -d v3.0
    # Deleted tag 'v3.0'
    ```

---

### 08. Find the Password

Examine each tag's message. One of them contains the password.

**Hint:** `git tag -l`, then `git show <tag>` for each

??? note "Solution"

    ```bash
    # Show all tags with their messages:
    for tag in $(git tag); do echo "=== $tag ==="; git show $tag --quiet; done
    # OR:
    git tag -l | xargs -I{} git show {}
    # Find the tag whose message contains the password
    ```

---

!!! success "🔓 Unlock Room 21"

    ```bash
    next <PASSWORD>
    ```
