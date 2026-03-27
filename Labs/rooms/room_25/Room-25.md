---
password: "blame25"
title_prefix: "🔍 "
summary: "Track down who changed what and when - line-by-line commit attribution."
---

##GIT BLAME: LINE-BY-LINE DETECTIVE

---

## Room 25 - Who Wrote That?

!!! abstract "📜 Your mission"

    Blame shows who last modified each line of a file and when.

    1. Blame a file - see who wrote each line:

        * `git blame app.txt`

    2. Blame with date format:

        * `git blame -e app.txt`  (show emails)

    3. Blame a specific range of lines:

        * `git blame -L 5,10 app.txt`

    4. Blame ignoring whitespace:

        * `git blame -w app.txt`

    5. This repo's `codebase.txt` was written by multiple authors.
       Find the line written by "Spy" - it contains the password.

        * `git blame codebase.txt | grep "Spy"`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                    | Purpose                             |
| -------------------------- | ----------------------------------- |
| `git blame <file>`         | Show per-line commit info           |
| `git blame -L 5,10 <file>` | Blame only lines 5–10               |
| `git blame -w <file>`      | Ignore whitespace changes           |
| `git blame -M <file>`      | Detect moved lines within a file    |
| `git blame -C <file>`      | Detect lines moved from other files |
| `git log -p <file>`        | Show full patch history of a file   |
| `git blame --date=short`   | Show dates in short format          |

### Reading Blame Output

```
a1b2c3d4 (Alice  2025-03-15  5)  echo "Hello World"
^^^^^^^^  ^^^^^  ^^^^^^^^^^  ^   ^^^^^^^^^^^^^^^^^^
commit    author    date    line       content

Each line shows the LAST commit that touched it - not who originally wrote it.
Use  git log --follow <file>  to trace a file through renames.
```

---

## Tasks

### 01. Blame a Whole File

See who last modified each line of `app.txt`.

**Hint:** `git blame app.txt`

??? note "Solution"

    ```bash
    git blame app.txt
    # a1b2c3d4 (Alice 2025-03-10 1) function init()
    # d3e4f5g6 (Bob   2025-03-12 2)   setup()
    # ...
    ```

---

### 02. Blame a Line Range

Check only lines 5-10 of a file.

**Hint:** `git blame -L 5,10 <file>`

??? note "Solution"

    ```bash
    git blame -L 5,10 app.txt
    # Shows blame for only lines 5 through 10
    ```

---

### 03. Show Emails in Blame

Display author email addresses instead of names.

**Hint:** `git blame -e <file>`

??? note "Solution"

    ```bash
    git blame -e app.txt
    # a1b2c3d4 (<alice@example.com> 2025-03-10 1) function init()
    ```

---

### 04. Ignore Whitespace Changes

Skip blame attribution for commits that only changed whitespace.

**Hint:** `git blame -w <file>`

??? note "Solution"

    ```bash
    git blame -w app.txt
    # Ignores whitespace-only changes
    # Shows the ACTUAL content author, not the reformatter
    ```

---

### 05. Detect Moved Lines

Find lines that were moved from elsewhere in the same file.

**Hint:** `git blame -M <file>`

??? note "Solution"

    ```bash
    git blame -M app.txt
    # Detects lines moved within the file
    # Attributes to original author, not the mover
    ```

---

### 06. Detect Copied Lines

Find lines copied from other files.

**Hint:** `git blame -C <file>`

??? note "Solution"

    ```bash
    git blame -C app.txt
    # Detects lines copied from other files in the same commit

    git blame -C -C app.txt
    # More aggressive: searches ALL commits
    ```

---

### 07. View Full History of a File

See every change ever made to a file.

**Hint:** `git log -p <file>`

??? note "Solution"

    ```bash
    git log -p app.txt
    # Shows each commit that modified app.txt with full diffs

    git log --follow -p app.txt
    # Also traces through renames
    ```

---

### 08. Find the Password

Blame `codebase.txt` and find the line written by "Spy".

**Hint:** `git blame codebase.txt | grep "Spy"`

??? note "Solution"

    ```bash
    git blame codebase.txt | grep "Spy"
    # The line written by "Spy" contains the password
    ```

---

!!! success "🔓 Unlock Room 26"

    ```bash
    next <PASSWORD>
    ```
