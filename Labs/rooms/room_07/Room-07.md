---
password: "commit7"
title_prefix: "💾 "
summary: "Create commits, write good messages, and use `git commit` options."
---

##GIT COMMIT: SAVING SNAPSHOTS

---

## Room 07 - Your First Commit

!!! abstract "📜 Your mission"

    A commit is a SNAPSHOT of your project at a point in time.

    1. This repo has staged changes ready to commit.

        Run: `git status`

    2. Create your first commit:

        * `git commit -m "My first commit"`

    3. View the commit:

        * `git log --oneline`

    4. Make another change, stage it, and commit:

        * `echo "update" >> file.txt`
        * `git add file.txt`
        * `git commit -m "Second commit"`

    5. Try committing with a multi-line message:

        * `git commit`  (opens your editor)

    6. Use the shortcut to stage + commit modified files:

        * `git commit -am "Stage and commit in one step"`
        * (Note: this does NOT add untracked files!)

    7. View your commit history:

        * `git log --oneline --graph`

    8. **Find the password commit:**

        * Somewhere in the 250+ commits, one commit message starts with `password:`.
        * That message contains the password for the next room.

        Search the log for it:

        ```bash
        git log <add some flags to find the password>>
        ```

        The commit message itself **is** the clue — read it carefully.
        A file named `password` was also created in that commit.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

---

### Key Commands

| Command                             | Purpose                    |
| ----------------------------------- | -------------------------- |
| `git commit -m "msg"`               | Commit with inline message |
| `git commit -am "msg"`              | Stage tracked + commit     |
| `git commit`                        | Opens editor for message   |
| `git commit --allow-empty -m "msg"` | Empty commit (CI triggers) |
| `git commit -v`                     | Show diff in editor        |

### Commit Message Best Practices

```
feat: add user login page         ← type: subject (imperative mood)
                                   ← blank line
Implement OAuth2 login flow        ← body (what and why)
with Google and GitHub providers.
                                   ← blank line
Closes #123                        ← footer (references)
```

**Conventional Commits types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

---

### What a Commit Contains

```
commit abc1234def5678...
├── tree    → snapshot of ALL files at this point
├── parent  → pointer to previous commit(s)
├── author  → who wrote the changes + timestamp
├── committer → who applied the commit + timestamp
└── message → description of the changes
```

---

## Tasks

### 01. Check What's Ready to Commit

Before committing, always verify what is staged.

**Hint:** `git status`, `git diff --staged`

??? note "Solution"

    ```bash
    git status
    # Shows "Changes to be committed" section

    git diff --staged
    # Shows the actual diff that will be committed
    ```

---

### 02. Create Your First Commit

Commit the staged changes with an inline message.

**Hint:** `git commit -m "message"`

??? note "Solution"

    ```bash
    git commit -m "My first commit"
    # [main abc1234] My first commit
    #  1 file changed, 1 insertion(+)
    ```

---

### 03. View the Commit Log

See the commit you just made in the history.

**Hint:** `git log --oneline`

??? note "Solution"

    ```bash
    git log --oneline
    # abc1234 My first commit
    # def5678 initial commit
    ```

---

### 04. Make a Change, Stage, and Commit

Modify a tracked file, stage the change, and commit it - the core Git workflow.

**Hint:** `echo >> file`, `git add`, `git commit -m`

??? note "Solution"

    ```bash
    echo "update" >> file.txt
    git add file.txt
    git commit -m "Second commit"
    ```

---

### 05. Stage and Commit in One Step

Use the `-am` shortcut to stage all modifications to tracked files and commit.

**Hint:** `git commit -am "message"`

??? note "Solution"

    ```bash
    echo "another line" >> file.txt
    git commit -am "Stage and commit in one step"

    # NOTE: -am does NOT add untracked (new) files.
    # You must git add them first.
    ```

---

### 06. Create an Empty Commit

Sometimes you need a commit with no file changes (e.g., to trigger CI).

**Hint:** `git commit --allow-empty -m "message"`

??? note "Solution"

    ```bash
    git commit --allow-empty -m "Trigger CI build"

    git log --oneline -1
    # Shows the empty commit
    ```

---

### 07. View the Diff Inside the Commit Editor

When writing longer commit messages, see the diff while you write.

**Hint:** `git commit -v`

??? note "Solution"

    ```bash
    echo "new feature" >> file.txt
    git add file.txt
    git commit -v
    # Opens your editor with the diff shown below the message area
    # Write your message, save, and quit
    ```

---

### 08. Find the Password Commit

Somewhere among the 250+ commits, one commit message starts with `password:`.
Find it, read it — the value after the colon is the password.

**Hint:** `git log --oneline --grep="password"`

??? note "Solution"

    ```bash
    # Search commit messages for the word "password":
    git log --oneline --grep="password"
    # a3f9c12 password: logmaster

    # Confirm by showing the commit in full:
    git show a3f9c12

    # Or read the file that was committed alongside it:
    git show a3f9c12:password
    # logmaster

    # Password: logmaster
    ```

---

!!! success "🔓 Unlock Room 08"

    ```bash
    next logmaster
    ```
