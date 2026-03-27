---
password: "amend24"
title_prefix: "✏️ "
summary: "Fix the last commit - change the message, add forgotten files, or update content."
---

##GIT COMMIT --AMEND: FIXING MISTAKES

---

## Room 24 - Amending Commits

!!! abstract "📜 Your mission"

    Amend lets you modify the MOST RECENT commit.

    1. View the last commit:

        * `git log -1`

    2. Fix the commit message:

        * `git commit --amend -m "Better commit message"`

    3. Add forgotten files to the last commit:

        * `git add forgotten-file.txt`
        * `git commit --amend --no-edit`

    4. This repo's last commit has a typo in its message and is missing a file.
       Fix both using `--amend`.

    5. Compare before/after with:

        * `git log -1`
        * `git show HEAD`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                  | Purpose                              |
| ---------------------------------------- | ------------------------------------ |
| `git commit --amend`                     | Open editor to change last message   |
| `git commit --amend -m "new msg"`        | Replace last commit message          |
| `git commit --amend --no-edit`           | Amend files without changing message |
| `git commit --amend --author="Name <e>"` | Fix the author of the last commit    |
| `git log -1 --format=fuller`             | View full details of last commit     |
| `git diff HEAD~1`                        | See what the last commit changed     |

### What Amend Actually Does

```
Before:  A --- B --- C  (HEAD)

git commit --amend

After:   A --- B --- C'  (HEAD - new hash!)

Amend REPLACES the last commit with a new one.
The old commit (C) still exists in reflog but is no longer on any branch.
```

!!! warning "⚠️ Never amend commits that have been pushed"
Amending rewrites history - only use on local, unpushed commits.

---

## Tasks

### 01. View the Last Commit

See what the current last commit looks like.

**Hint:** `git log -1`, `git show HEAD`

??? note "Solution"

    ```bash
    git log -1
    # commit abc1234
    # Author: ...
    # Date: ...
    #     Ths commit has a typo

    git show HEAD
    # Also shows the diff
    ```

---

### 02. Fix the Commit Message

Change the last commit's message.

**Hint:** `git commit --amend -m "new message"`

??? note "Solution"

    ```bash
    git commit --amend -m "This commit has no typo"

    git log -1
    # The message is fixed, hash has changed
    ```

---

### 03. Add a Forgotten File

Stage a file and add it to the last commit without changing the message.

**Hint:** `git add <file>`, `git commit --amend --no-edit`

??? note "Solution"

    ```bash
    git add forgotten-file.txt
    git commit --amend --no-edit

    git show HEAD --stat
    # forgotten-file.txt is now included in the commit
    ```

---

### 04. Change the Author

Fix the author info on the last commit.

**Hint:** `git commit --amend --author="Name <email>"`

??? note "Solution"

    ```bash
    git commit --amend --author="Alice <alice@example.com>" --no-edit

    git log -1 --format=fuller
    # Author: Alice <alice@example.com>
    ```

---

### 05. Verify the Hash Changed

Confirm that amending creates a new commit with a different hash.

**Hint:** `git log --oneline`, `git reflog`

??? note "Solution"

    ```bash
    git reflog
    # Shows both the old and new commit hashes
    # abc1234 HEAD@{0}: commit (amend): Fixed message
    # def5678 HEAD@{1}: commit: Ths commit has a typo
    ```

---

### 06. Amend Content of the Last Commit

Modify a file that was already in the last commit and include the change.

**Hint:** edit the file, `git add`, `git commit --amend --no-edit`

??? note "Solution"

    ```bash
    echo "updated line" >> app.txt
    git add app.txt
    git commit --amend --no-edit

    git show HEAD
    # The commit now includes the updated content
    ```

---

### 07. Find the Password

Fix the typo in the commit message and add the forgotten file. The password is revealed in the process.

**Hint:** `git commit --amend`, check `git show HEAD`

??? note "Solution"

    ```bash
    git add forgotten-file.txt
    git commit --amend -m "Fixed commit"
    git show HEAD
    # The file or message contains the password
    ```

---

!!! success "🔓 Unlock Room 25"

    ```bash
    next <PASSWORD>
    ```
