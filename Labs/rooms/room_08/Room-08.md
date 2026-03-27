---
password: "logmaster"
title_prefix: "📜 "
summary: "Navigate commit history with `git log` — 25 tasks from basic to advanced."
---

# GIT LOG: EXPLORING HISTORY

---

## Room 08 - The Time Machine

!!! abstract "📜 Your mission"

    The git log is your time machine. Learn to navigate it!

    1. This repo has a rich commit history. Explore it:

        * `git log`

    2. Try different log formats:

        * `git log --oneline`
        * `git log --oneline --graph --all`
        * `git log --stat`
        * `git log --patch` (or `-p`)

    3. Filter the log:

        * `git log --author="Alice"`
        * `git log --since="2025-01-01"`
        * `git log --grep="fix"`
        * `git log -n 5` (last 5 commits)

    4. Show a specific commit:

        * `git show HEAD`
        * `git show HEAD~2` (2 commits back)

    5. Find the commit by "Bob" that mentions "secret" in its message.
       Read that commit's message - it contains the password.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

---

### Quick Reference

| Command | Purpose |
| --- | --- |
| `git log` | Full log with all details |
| `git log --oneline` | One line per commit |
| `git log --oneline --graph --all` | Visual branch graph |
| `git log --stat` | Files changed per commit |
| `git log -p` | Full patch per commit |
| `git log -n 5` | Last N commits |
| `git log --author="name"` | Filter by author |
| `git log --grep="text"` | Filter by commit message |
| `git log --since / --until` | Filter by date |
| `git log --all -S "text"` | Pickaxe: commits that added/removed text |
| `git log --all -G "regex"` | Pickaxe with regex |
| `git log --follow -- file` | Follow file through renames |
| `git log --merges` | Only merge commits |
| `git log --no-merges` | Exclude merge commits |
| `git log --diff-filter=R` | Only rename commits |
| `git log --simplify-by-decoration` | Only tagged/branched commits |
| `git log v1.0.0..v2.0.0` | Commits between two refs |
| `git log --first-parent` | Main-branch only (skip merged) |
| `git log --pretty=format:"..."` | Custom output format |
| `git log --format="%an" \| sort \| uniq -c` | Commit counts per author |
| `git shortlog -sn` | Author commit counts, ranked |
| `git log --after="2026-01-01"` | Commits after a date |
| `git log --before="2026-01-01"` | Commits before a date |
| `git log --diff-filter=A -- "*.py"` | Commits that added a Python file |

---

## Tasks

### 01. View the Full Log

Display the complete history with all details — hash, author, date, full message.

**Hint:** `git log`

??? note "Solution"

    ```bash
    git log
    # Shows every commit; press q to exit the pager
    # Notice: 5 authors, dates from Jan 2025 to Mar 2026
    ```

---

### 02. Compact One-Line Log

Get one line per commit: short hash + subject.

**Hint:** `git log --oneline`

??? note "Solution"

    ```bash
    git log --oneline
    # a1b2c3d feat: add passkey (WebAuthn) support
    # d4e5f6a feat: add HTTP/2 support
    # ...
    ```

---

### 03. Visual Branch Graph

See how the `feature/dark-mode` branch diverged and was merged back.

**Hint:** `git log --oneline --graph --all`

??? note "Solution"

    ```bash
    git log --oneline --graph --all
    # *   Merge branch 'feature/dark-mode' into main
    # |\
    # | * fix: dark mode flicker on initial load
    # | * feat: add theme toggle component
    # | * feat: dark mode button styles
    # | * feat: add dark mode base styles
    # |/
    # * feat: add rate limiting to login endpoint
    ```

---

### 04. Show Files Changed Per Commit

Use `--stat` to see which files were touched and how many lines changed.

**Hint:** `git log --stat`

??? note "Solution"

    ```bash
    git log --stat
    # commit a1b2c3d
    # Author: Alice <alice@omega.dev>
    #
    #  auth.py | 1 +
    #  1 file changed, 1 insertion(+)
    ```

---

### 05. Show Full Patches

View the actual diff introduced by each commit.

**Hint:** `git log -p`, `git log --patch`

??? note "Solution"

    ```bash
    git log -p
    # Shows +/- diff lines for every commit
    # Combine with -n 3 to limit to last 3 commits
    git log -p -n 3
    ```

---

### 06. Limit to the Last N Commits

Show only the 5 most recent commits.

**Hint:** `git log -n 5`, `git log -5`

??? note "Solution"

    ```bash
    git log --oneline -5
    # The 5 latest commits only
    ```

---

### 07. Filter by Author

List all commits made by Alice.

**Hint:** `git log --author="Alice"`

??? note "Solution"

    ```bash
    git log --oneline --author="Alice"
    # Only Alice's commits — she has the most entries

    # Partial match also works:
    git log --oneline --author="ali"
    ```

---

### 08. Filter by Commit Message Keyword

Find all commits whose message contains the word `fix`.

**Hint:** `git log --grep="fix"`

??? note "Solution"

    ```bash
    git log --oneline --grep="fix"
    # fix: correct token expiry calculation
    # fix: resolve race condition in session store
    # ... (many results)
    ```

---

### 09. Combine Author and Message Filters

Find only **Bob's** commits that mention `fix`.

**Hint:** `git log --author="Bob" --grep="fix"`

??? note "Solution"

    ```bash
    git log --oneline --author="Bob" --grep="fix"
    # fix: pool exhaustion under load
    # fix: handle null result in query helper
    # fix: shutdown does not drain in-flight requests
    ```

---

### 10. Filter by Date Range

Show commits made in **February 2025** only.

**Hint:** `git log --since`, `git log --until`

??? note "Solution"

    ```bash
    git log --oneline --since="2025-02-01" --until="2025-03-01"
    # All commits from Feb 2025
    # Bob's DB work + Charlie's docs
    ```

---

### 11. Commits After a Date

Show everything committed after 2026-01-01.

**Hint:** `git log --after="2026-01-01"`

??? note "Solution"

    ```bash
    git log --oneline --after="2026-01-01"
    # Only 2026 commits
    # This is where the password commit lives
    ```

---

### 12. Only Merge Commits

Show only commits that merged a branch.

**Hint:** `git log --merges`

??? note "Solution"

    ```bash
    git log --oneline --merges
    # One result: "Merge branch 'feature/dark-mode' into main"
    ```

---

### 13. Exclude Merge Commits

Show the linear history — no merge commits.

**Hint:** `git log --no-merges`

??? note "Solution"

    ```bash
    git log --oneline --no-merges
    # Clean linear list without the merge bubble
    ```

---

### 14. First-Parent Only

Walk only the main-branch line, ignoring commits that came in via merges.

**Hint:** `git log --first-parent --oneline`

??? note "Solution"

    ```bash
    git log --first-parent --oneline
    # Skips the dark-mode feature commits entirely
    # Shows only commits made directly on main
    ```

---

### 15. Show Decorated Refs (Tags and Branches)

See which commits have tags or branch labels attached.

**Hint:** `git log --oneline --decorate`

??? note "Solution"

    ```bash
    git log --oneline --decorate
    # a1b2c3 (HEAD -> main) feat: add passkey ...
    # ...
    # f7e6d5 (tag: v2.0.0) chore: bump version to 2.0.0
    # ...
    # b4c3d2 (tag: v1.0.0) Merge branch 'feature/dark-mode' into main
    ```

---

### 16. Commits Between Two Tags

Show only the commits introduced between `v1.0.0` and `v2.0.0`.

**Hint:** `git log v1.0.0..v2.0.0 --oneline`

??? note "Solution"

    ```bash
    git log v1.0.0..v2.0.0 --oneline
    # All work done after the v1.0.0 tag up to and including v2.0.0
    ```

---

### 17. Only Tagged or Branch-Tipped Commits

Collapse the log to only commits that are pointed to by a tag or branch.

**Hint:** `git log --simplify-by-decoration --oneline`

??? note "Solution"

    ```bash
    git log --simplify-by-decoration --oneline --decorate
    # (HEAD -> main) ...latest commit
    # (tag: v2.0.0) chore: bump version to 2.0.0
    # (tag: v1.0.0) Merge branch 'feature/dark-mode'
    ```

---

### 18. Follow a File Through a Rename

`server.py` was renamed to `web_server.py`. Show its full history across the rename.

**Hint:** `git log --follow -- web_server.py`

??? note "Solution"

    ```bash
    # Without --follow: stops at the rename
    git log --oneline -- web_server.py

    # With --follow: traces back through the rename
    git log --follow --oneline -- web_server.py
    # Also shows the original server.py commits from Jan 2025
    ```

---

### 19. Pickaxe Search — Find When a String Was Added or Removed

Find the commits that added or removed the string `OMEGA_INIT`.

**Hint:** `git log -S "OMEGA_INIT"`

??? note "Solution"

    ```bash
    git log --oneline -S "OMEGA_INIT"
    # Two commits appear:
    # feat: add OMEGA_INIT bootstrap flag      ← string added
    # refactor: remove OMEGA_INIT flag ...     ← string removed
    ```

---

### 20. Pickaxe with Regex

Find commits that touched any line containing `pool` using a regex.

**Hint:** `git log -G "pool"`

??? note "Solution"

    ```bash
    git log --oneline -G "pool"
    # feat: add connection pooling
    # fix: pool exhaustion under load
    # test: add connection pool tests
    # (and any other commits whose diff lines contain "pool")
    ```

---

### 21. Custom Format — Hash, Author, Date, Subject

Build a compact one-line format showing the short hash, author name, relative date, and subject.

**Hint:** `git log --pretty=format:"%h | %an | %ar | %s"`

??? note "Solution"

    ```bash
    git log --pretty=format:"%h | %an | %ar | %s" -10
    # a1b2c3d | Alice      | 9 days ago  | feat: add passkey support
    # d4e5f6a | Bob        | 4 days ago  | feat: add HTTP/2 support
    # ...

    # Useful format placeholders:
    # %H  full hash        %h  short hash
    # %an author name      %ae author email
    # %ad author date      %ar relative date
    # %s  subject          %b  body
    # %D  ref names (tags, branches)
    ```

---

### 22. Count Commits per Author

Rank all contributors by commit count.

**Hint:** `git shortlog -sn`

??? note "Solution"

    ```bash
    git shortlog -sn
    #  28  Alice
    #  20  Bob
    #  10  Charlie
    #   8  Diana
    #   7  Eve

    # --no-merges to exclude merge commits from counts:
    git shortlog -sn --no-merges
    ```

---

### 23. Find Only Commits That Added a File

Show commits where a new Python file was first introduced (status `A`).

**Hint:** `git log --diff-filter=A --name-only -- "*.py"`

??? note "Solution"

    ```bash
    git log --oneline --diff-filter=A --name-only -- "*.py"
    # chore: initial project scaffold
    #   server.py
    #   auth.py
    # feat: add database module
    #   db.py
    # test: add login test
    #   test_auth.py
    # ...
    ```

---

### 24. Show the Full Log for All Branches Including Stale Ones

Include branches that are not reachable from HEAD, such as `feature/dark-mode`.

**Hint:** `git log --all --oneline`

??? note "Solution"

    ```bash
    git log --all --oneline
    # Shows commits on feature/dark-mode even though it was merged
    # and is no longer the current branch

    # Compare without --all:
    git log --oneline
    # dark-mode commits still appear because they were merged in
    # but --all also reveals any unreachable/orphan branches
    ```

---

### 25. Find the Password

There is one commit by **Bob** whose message contains the word `secret`.
The last word of that message is the password.

**Hint:** `git log --oneline --author="Bob" --grep="secret"`

??? note "Solution"

    ```bash
    git log --oneline --author="Bob" --grep="secret"
    # a7f3c12 The secret password is: diffview

    # Read the committed file for confirmation:
    git show a7f3c12:password
    # diffview

    # Password: diffview
    ```

---

!!! success "🔓 Unlock Room 09"

    ```bash
    next diffview
    ```

---

### Format Placeholder Reference

| Placeholder | Meaning |
| --- | --- |
| `%H` | Full commit hash |
| `%h` | Short commit hash |
| `%an` | Author name |
| `%ae` | Author email |
| `%ad` | Author date (respects `--date=`) |
| `%ar` | Author date, relative |
| `%cn` | Committer name |
| `%cd` | Committer date |
| `%s` | Subject (first line of message) |
| `%b` | Body (rest of message) |
| `%D` | Ref names (tags, branches) |
| `%n` | Newline |
