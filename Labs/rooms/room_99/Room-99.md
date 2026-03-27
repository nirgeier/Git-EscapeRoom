---
password: "escaped"
title_prefix: "🏆 "
summary: "The grand escape - prove your Git mastery!"
---

##THE FINAL EXAM: PROVE YOUR GIT MASTERY

---

## Room 99 - The Grand Escape

!!! abstract "📜 Your Final Mission"

    Complete these 10 challenges to prove you've truly escaped.

    Once you've finished all 10, you're officially a Git master!

---

## Tasks

### 01. Init & Commit with Plumbing Only

Create a new repo, add a file, and make a commit using **only** plumbing commands.

**Hint:** `hash-object`, `update-index`, `write-tree`, `commit-tree`, `update-ref`

??? note "Solution"

    ```bash
    mkdir final-test && cd final-test
    git init

    BLOB=$(echo "Hello Final Exam!" | git hash-object -w --stdin)
    git update-index --add --cacheinfo 100644,$BLOB,hello.txt
    TREE=$(git write-tree)
    COMMIT=$(git commit-tree $TREE -m "First commit via plumbing")
    git update-ref refs/heads/main $COMMIT

    git log --oneline
    cat hello.txt
    ```

---

### 02. Branch Surgery (Squash 3 into 1)

Create a branch, make 3 commits, then use interactive rebase to squash them into one.

**Hint:** `git switch -c`, make 3 commits, `git rebase -i HEAD~3`

??? note "Solution"

    ```bash
    git switch -c feature
    echo "a" > a.txt && git add a.txt && git commit -m "Add a"
    echo "b" > b.txt && git add b.txt && git commit -m "Add b"
    echo "c" > c.txt && git add c.txt && git commit -m "Add c"

    git rebase -i HEAD~3
    # Change 2nd and 3rd to 'squash', save
    # Edit the combined message, save

    git log --oneline
    # One commit with all 3 files
    ```

---

### 03. Conflict Master (Resolve + rerere)

Create a merge conflict between two branches, resolve it, and verify rerere recorded the resolution.

**Hint:** `git config rerere.enabled true`, create conflicting branches, merge, resolve

??? note "Solution"

    ```bash
    git config rerere.enabled true

    git switch main
    echo "main version" > shared.txt
    git add shared.txt && git commit -m "Main change"

    git switch -c conflict-test HEAD~1
    echo "branch version" > shared.txt
    git add shared.txt && git commit -m "Branch change"

    git switch main
    git merge conflict-test
    # CONFLICT! Resolve:
    echo "resolved version" > shared.txt
    git add shared.txt && git commit -m "Merge resolved"

    git rerere status
    # Recorded resolution for 'shared.txt'
    ```

---

### 04. History Detective (Bisect)

Use `git bisect` to find which of 10 commits introduced a bug.

**Hint:** `git bisect start`, `git bisect bad`, `git bisect good`, `git bisect run`

??? note "Solution"

    ```bash
    git bisect start
    git bisect bad HEAD
    git bisect good HEAD~10
    git bisect run bash test.sh
    # Finds the exact commit that introduced the bug

    git bisect reset
    ```

---

### 05. Time Traveler (Recover Deleted Branch)

Use reflog to recover a commit from a deleted branch.

**Hint:** `git reflog`, `git branch recovered <hash>`

??? note "Solution"

    ```bash
    # Create and delete a branch
    git switch -c temp-work
    echo "important" > work.txt
    git add work.txt && git commit -m "Important work"
    git switch main
    git branch -D temp-work

    # Recover it:
    git reflog
    # Find the "Important work" commit hash

    git branch recovered <hash>
    git log --oneline recovered
    ```

---

### 06. Clean Export (Archive)

Create a `.tar.gz` release bundle with a version prefix directory.

**Hint:** `git archive --prefix=project-v1.0/ HEAD | gzip > release.tar.gz`

??? note "Solution"

    ```bash
    git archive --prefix=project-v1.0/ HEAD | gzip > project-v1.0.tar.gz

    tar -tzf project-v1.0.tar.gz | head
    # project-v1.0/README.md
    # project-v1.0/src/...
    ```

---

### 07. Secret Removal (filter-repo)

Remove a file called `secrets.txt` from the entire history.

**Hint:** `git filter-repo --invert-paths --path secrets.txt`

??? note "Solution"

    ```bash
    # Create the scenario:
    echo "API_KEY=secret123" > secrets.txt
    git add secrets.txt && git commit -m "Oops committed secrets"

    # Remove from all history:
    git filter-repo --invert-paths --path secrets.txt
    # Or legacy:
    git filter-branch --tree-filter 'rm -f secrets.txt' HEAD

    git log --all -- secrets.txt
    # No results - completely gone!
    ```

---

### 08. Object Inspector (Trace the Chain)

Given HEAD, trace the entire object chain: commit → tree → blobs.

**Hint:** `git cat-file -p HEAD`, then follow tree and blob hashes

??? note "Solution"

    ```bash
    echo "=== COMMIT ==="
    git cat-file -p HEAD

    TREE=$(git cat-file -p HEAD | grep '^tree' | awk '{print $2}')
    echo "=== TREE ==="
    git cat-file -p $TREE

    BLOB=$(git cat-file -p $TREE | head -1 | awk '{print $3}')
    echo "=== BLOB ==="
    git cat-file -p $BLOB
    ```

---

### 09. Patch Pipeline (format-patch + am)

Generate patches, create a new branch, and apply them.

**Hint:** `git format-patch -3`, `git switch -c`, `git am *.patch`

??? note "Solution"

    ```bash
    # Generate patches from last 3 commits
    git format-patch -3

    # Create a fresh branch from earlier point
    git switch -c patch-target HEAD~3

    # Apply patches
    git am 0001-*.patch 0002-*.patch 0003-*.patch

    git log --oneline
    # Same commits applied via patches
    ```

---

### 10. Health Check (fsck + gc + count-objects)

Run all three diagnostic commands and understand the output.

**Hint:** `git fsck`, `git gc`, `git count-objects -v`

??? note "Solution"

    ```bash
    # 1. Check integrity
    git fsck
    # Reports dangling objects, missing refs, etc.

    # 2. View stats before GC
    git count-objects -v
    # count: N loose objects, in-pack: M packed objects

    # 3. Run garbage collection
    git gc

    # 4. View stats after GC
    git count-objects -v
    # count: 0 (loose objects packed), packs: 1
    ```

---

!!! success "🎉🎉🎉 CONGRATULATIONS! YOU'VE ESCAPED! 🎉🎉🎉"

    ```text
    ╔══════════════════════════════════════════════════════════════╗
    ║                                                              ║
    ║   🏆  G I T   E S C A P E   R O O M   C O M P L E T E  🏆  ║
    ║                                                              ║
    ║         You have mastered the art of Git!                    ║
    ║                                                              ║
    ║   From your first commit to plumbing internals,              ║
    ║   from rebasing to the object model -                        ║
    ║   you now understand Git inside and out.                     ║
    ║                                                              ║
    ║   ┌──────────────────────────────────────────────┐           ║
    ║   │  Rooms completed: 50                         │           ║
    ║   │  Commands learned: 200+                      │           ║
    ║   │  Git mastery level: ████████████████ 100%    │           ║
    ║   └──────────────────────────────────────────────┘           ║
    ║                                                              ║
    ║   "Any sufficiently advanced Git user is                     ║
    ║    indistinguishable from a wizard." 🧙                      ║
    ║                                                              ║
    ╚══════════════════════════════════════════════════════════════╝
    ```

!!! tip "🌟 What's Next?"

    - Contribute to open-source projects using your Git skills
    - Set up Git hooks to automate your workflow
    - Explore `git worktree` for parallel development
    - Teach someone else - the best way to solidify knowledge!
