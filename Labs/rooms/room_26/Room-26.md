---
password: "bisect26"
title_prefix: "🔬 "
summary: "Binary search through commit history to find the exact commit that introduced a bug."
---

##GIT BISECT: BUG HUNTING

---

## Room 26 - Binary Search for Bugs

!!! abstract "📜 Your mission"

    Bisect uses binary search to find the EXACT commit that introduced a bug.

    1. This repo has 20 commits. Somewhere a bug was introduced.
       The file `test.sh` returns exit code 1 (fail) on the bad commit.

    2. Start bisecting:

        * `git bisect start`

    3. Mark the current commit as bad:

        * `git bisect bad`

    4. Mark a known good commit:

        * `git bisect good <earliest-commit-hash>`

    5. Git will checkout a middle commit. Test it:

        * `bash test.sh`
        * If it passes: `git bisect good`
        * If it fails: `git bisect bad`

    6. Repeat until Git finds the first bad commit!

    7. Automate it:

        * `git bisect start HEAD <good-hash>`
        * `git bisect run bash test.sh`

    8. When done: `git bisect reset`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                   | Purpose                                |
| ------------------------- | -------------------------------------- |
| `git bisect start`        | Begin a bisect session                 |
| `git bisect bad`          | Mark current commit as bad             |
| `git bisect good <hash>`  | Mark a commit as good                  |
| `git bisect reset`        | End bisect and return to original HEAD |
| `git bisect skip`         | Skip a commit that can't be tested     |
| `git bisect log`          | Show bisect steps so far               |
| `git bisect run <script>` | Automate bisect with a test script     |

### How Bisect Works

```
good                                              bad
 ↓                                                 ↓
 A --- B --- C --- D --- E --- F --- G --- H --- I
                         ↑
                   Git checks here first (midpoint)

If D is good → bug is in E..I  → check midpoint of E..I
If D is bad  → bug is in A..D  → check midpoint of A..D

Binary search finds the culprit in O(log n) steps.
100 commits? Only ~7 checks needed!
```

---

## Tasks

### 01. Start a Bisect Session

Begin the binary search.

**Hint:** `git bisect start`

??? note "Solution"

    ```bash
    git bisect start
    ```

---

### 02. Mark Current as Bad

Tell Git the current commit has the bug.

**Hint:** `git bisect bad`

??? note "Solution"

    ```bash
    git bisect bad
    # Marks HEAD as a bad commit
    ```

---

### 03. Mark a Known Good Commit

Find the earliest commit and mark it as good.

**Hint:** `git log --oneline --reverse`, `git bisect good <hash>`

??? note "Solution"

    ```bash
    git log --oneline --reverse | head -1
    # abc1234 Initial commit

    git bisect good abc1234
    # Bisecting: N revisions left to test
    # Git checks out a middle commit
    ```

---

### 04. Test and Mark Each Step

Run the test and mark the commit as good or bad.

**Hint:** `bash test.sh`, then `git bisect good` or `git bisect bad`

??? note "Solution"

    ```bash
    bash test.sh
    echo $?    # 0 = good, 1 = bad

    # If exit code is 0:
    git bisect good

    # If exit code is 1:
    git bisect bad

    # Repeat until Git finds the first bad commit
    ```

---

### 05. Automate Bisect

Let Git run the test script automatically.

**Hint:** `git bisect run bash test.sh`

??? note "Solution"

    ```bash
    git bisect start
    git bisect bad HEAD
    git bisect good <earliest-hash>
    git bisect run bash test.sh
    # Git finds the first bad commit automatically!
    ```

---

### 06. View Bisect Log

See the steps taken so far.

**Hint:** `git bisect log`

??? note "Solution"

    ```bash
    git bisect log
    # Shows each bisect step and the result
    ```

---

### 07. End the Bisect Session

Return to your original branch.

**Hint:** `git bisect reset`

??? note "Solution"

    ```bash
    git bisect reset
    # Switched back to the original HEAD
    ```

---

### 08. Find the Password

Use bisect to find the first bad commit. The commit message contains the password.

**Hint:** `git bisect run bash test.sh`, then read the commit message

??? note "Solution"

    ```bash
    git bisect start
    git bisect bad HEAD
    git bisect good $(git rev-list --max-parents=0 HEAD)
    git bisect run bash test.sh
    # The first bad commit's message contains the password
    git bisect reset
    ```

---

!!! success "🔓 Unlock Room 27"

    ```bash
    next <PASSWORD>
    ```
