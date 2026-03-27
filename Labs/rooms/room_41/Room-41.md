---
password: "shortlog"
title_prefix: "📊 "
summary: "Summarize commit activity by contributor."
---

##GIT SHORTLOG: CONTRIBUTOR STATS

---

## Room 41 - Who Did What?

!!! abstract "📜 Your mission"

    Shortlog summarizes `git log` output by author.

    1. View contributor summary:

        * `git shortlog`

    2. Count commits per author:

        * `git shortlog -sn`   (sorted by count, numbers only)

    3. Shortlog with email:

        * `git shortlog -sne`

    4. Shortlog for a range:

        * `git shortlog v1.0..v2.0`

    5. Group by committer (not author):

        * `git shortlog -c`

    6. This repo has contributions from many authors.
       Find who has the MOST commits.
       The contributor with the most commits has a username that IS the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                             | Purpose                                |
| ----------------------------------- | -------------------------------------- |
| `git shortlog`                      | Group commits by author with messages  |
| `git shortlog -s`                   | Show only commit counts                |
| `git shortlog -sn`                  | Sort by number of commits (descending) |
| `git shortlog -sne`                 | Include email addresses, sorted        |
| `git shortlog --no-merges`          | Exclude merge commits                  |
| `git log --format='%aN' \| sort -u` | List unique contributors               |

### Reading the Output

```text
  $ git shortlog -sn
    152  Alice Johnson
     89  Bob Smith
     34  Charlie Davis

  $ git shortlog -sne
    152  Alice Johnson <alice@example.com>
     89  Bob Smith <bob@example.com>
     34  Charlie Davis <charlie@example.com>

  Use cases:
  ┌─────────────────────────────────────────────┐
  │  • Generate release credits / CONTRIBUTORS  │
  │  • Audit who changed what                   │
  │  • Identify code ownership                  │
  │  • Measure team activity                    │
  └─────────────────────────────────────────────┘

  Pro tip: Pipe to head for top contributors
  $ git shortlog -sn | head -10
```

---

## Tasks

### 01. View Contributor Summary

List commits grouped by author.

**Hint:** `git shortlog`

??? note "Solution"

    ```bash
    git shortlog
    # Alice (5):
    #       Add login feature
    #       Fix password validation
    #       ...
    # Bob (3):
    #       Initial commit
    #       ...
    ```

---

### 02. Count Commits Per Author

Get a sorted count of commits by author.

**Hint:** `git shortlog -sn`

??? note "Solution"

    ```bash
    git shortlog -sn
    #   5  Alice
    #   3  Bob
    #   1  Charlie
    ```

---

### 03. Include Email Addresses

Show author emails in the shortlog.

**Hint:** `git shortlog -sne`

??? note "Solution"

    ```bash
    git shortlog -sne
    #   5  Alice <alice@example.com>
    #   3  Bob <bob@example.com>
    ```

---

### 04. Shortlog for a Range

View contributions between two tags or commits.

**Hint:** `git shortlog v1.0..v2.0`

??? note "Solution"

    ```bash
    git shortlog v1.0..v2.0
    # Shows only commits between v1.0 and v2.0
    ```

---

### 05. Exclude Merge Commits

Get a cleaner view by excluding merges.

**Hint:** `git shortlog --no-merges`

??? note "Solution"

    ```bash
    git shortlog -sn --no-merges
    # Merge commits are excluded from the count
    ```

---

### 06. List Unique Contributors

Get a plain list of all contributor names.

**Hint:** `git log --format='%aN' | sort -u`

??? note "Solution"

    ```bash
    git log --format='%aN' | sort -u
    # Alice
    # Bob
    # Charlie
    ```

---

### 07. Find the Password

The author with the MOST commits has a username that IS the password.

**Hint:** `git shortlog -sn | head -1`

??? note "Solution"

    ```bash
    git shortlog -sn | head -1
    # The top contributor's name is the password
    ```

---

!!! success "🔓 Unlock Room 42"

    ```bash
    next <PASSWORD>
    ```
