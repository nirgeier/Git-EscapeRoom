---
password: "describe"
title_prefix: "🏷️ "
summary: "Get human-readable names for commits based on nearby tags."
---

##GIT DESCRIBE: HUMAN-READABLE NAMES

---

## Room 42 - Name That Commit

!!! abstract "📜 Your mission"

    Describe gives you a human-readable name based on the nearest tag.

    1. Describe the current commit:

        * `git describe`
        * Output: `v1.2-3-gabc1234`
        * Means: 3 commits after tag `v1.2`, hash `abc1234`

    2. Describe with more detail:

        * `git describe --long` (always show full format)
        * `git describe --tags` (use lightweight tags too)
        * `git describe --all` (use any ref, not just tags)

    3. Describe an arbitrary commit:

        * `git describe abc1234`

    4. This is useful for:

        * Build version strings
        * Release naming
        * CI/CD pipelines

    5. Create a tag and describe again - notice the difference.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                   | Purpose                                  |
| ------------------------- | ---------------------------------------- |
| `git describe`            | Describe using annotated tags only       |
| `git describe --long`     | Always show long format                  |
| `git describe --tags`     | Include lightweight tags                 |
| `git describe --all`      | Use any ref (branches, tags, etc.)       |
| `git describe --abbrev=0` | Show only the tag name                   |
| `git describe --dirty`    | Append "-dirty" if working tree modified |

### Understanding the Output

```text
  $ git describe
  v2.1.0-14-g2414721
  │       │     │
  │       │     └── g + abbreviated commit hash
  │       └── 14 commits since the tag
  └── nearest annotated tag

  $ git describe --long
  v2.1.0-14-g2414721      (always includes count + hash)

  $ git describe --tags
  v2.1.1-3-gabcdef0        (includes lightweight tags)

  $ git describe --abbrev=0
  v2.1.0                    (just the tag name)

  Common use: version strings in builds
  ┌──────────────────────────────────────────────┐
  │  VERSION=$(git describe --tags --always)      │
  │  echo "Building version: $VERSION"            │
  │  # Output: v2.1.0-14-g2414721                 │
  └──────────────────────────────────────────────┘
```

---

## Tasks

### 01. Describe Current Commit

Get a human-readable name for HEAD.

**Hint:** `git describe`

??? note "Solution"

    ```bash
    git describe
    # v1.2-3-gabc1234
    # (3 commits after tag v1.2, hash abc1234)
    ```

---

### 02. Use Long Format

Always show the full describe format.

**Hint:** `git describe --long`

??? note "Solution"

    ```bash
    git describe --long
    # v1.2-3-gabc1234
    # Even if exactly ON a tag, shows: v1.2-0-gabc1234
    ```

---

### 03. Include Lightweight Tags

Describe using both annotated and lightweight tags.

**Hint:** `git describe --tags`

??? note "Solution"

    ```bash
    git describe --tags
    # May find a closer lightweight tag
    ```

---

### 04. Get Only the Tag Name

Show just the nearest tag without the commit count and hash.

**Hint:** `git describe --abbrev=0`

??? note "Solution"

    ```bash
    git describe --abbrev=0
    # v1.2
    ```

---

### 05. Check for Dirty Working Tree

Detect if the working tree has uncommitted changes.

**Hint:** `git describe --dirty`

??? note "Solution"

    ```bash
    git describe --dirty
    # v1.2-3-gabc1234-dirty  (if there are uncommitted changes)
    # v1.2-3-gabc1234        (if clean)
    ```

---

### 06. Use Describe in Build Scripts

Generate a version string for your build.

**Hint:** `VERSION=$(git describe --tags --always)`

??? note "Solution"

    ```bash
    VERSION=$(git describe --tags --always)
    echo "Building version: $VERSION"
    # v1.2-3-gabc1234
    ```

---

### 07. Find the Password

Describe the commits or explore the tags to find the password.

**Hint:** `git describe --tags`, `git show <tag>`

??? note "Solution"

    ```bash
    git describe --tags
    git tag -l
    # Explore the tags and their messages
    git show <tag-name>
    ```

---

!!! success "🔓 Unlock Room 43"

    ```bash
    next <PASSWORD>
    ```
