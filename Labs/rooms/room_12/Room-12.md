---
password: "conflict"
title_prefix: "⚔️ "
summary: "Resolve merge conflicts by editing conflict markers and completing the merge."
---

##MERGE CONFLICTS

---

## Room 12 - The Battle of Branches

!!! abstract "📜 Your mission"

    When two branches modify the SAME lines, Git can't auto-merge. YOU must resolve it!

    1. Try merging the `conflict-branch`:

        * `git merge conflict-branch`
        * You'll see: `CONFLICT (content): Merge conflict in battle.txt`

    2. Open the conflicted file:

        * `cat battle.txt`

        You'll see conflict markers:
        ```
        <<<<<<< HEAD
        (your changes)
        =======
        (their changes)
        >>>>>>> conflict-branch
        ```

    3. RESOLVE the conflict by editing `battle.txt`:

        * Remove ALL conflict markers (`<<<`, `===`, `>>>`)
        * Keep the content you want (or combine both)
        * Save the file

    4. Mark as resolved and complete the merge:

        * `git add battle.txt`
        * `git commit -m "Resolve merge conflict"`

    5. Verify with: `git log --oneline --graph`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Conflict Markers

```
<<<<<<< HEAD
Your changes (current branch)
=======
Their changes (incoming branch)
>>>>>>> conflict-branch
```

### Resolution Steps

```bash
# 1. Start merge (conflict occurs)
git merge conflict-branch

# 2. See conflicted files
git status

# 3. Edit files - remove markers, keep desired content

# 4. Stage resolved files
git add battle.txt

# 5. Complete the merge
git commit

# OR: abort the whole thing
git merge --abort
```

---

## Tasks

### 01. Trigger a Merge Conflict

Attempt the merge and observe the conflict message.

**Hint:** `git merge conflict-branch`

??? note "Solution"

    ```bash
    git merge conflict-branch
    # Auto-merging battle.txt
    # CONFLICT (content): Merge conflict in battle.txt
    # Automatic merge failed; fix conflicts and then commit the result.
    ```

---

### 02. Identify Conflicted Files

Check which files have conflicts after a failed merge.

**Hint:** `git status`

??? note "Solution"

    ```bash
    git status
    # Unmerged paths:
    #   both modified:   battle.txt
    ```

---

### 03. Read the Conflict Markers

Open the conflicted file and identify the three sections.

**Hint:** `cat battle.txt`

??? note "Solution"

    ```bash
    cat battle.txt
    # <<<<<<< HEAD
    # (changes from current branch)
    # =======
    # (changes from conflict-branch)
    # >>>>>>> conflict-branch
    ```

---

### 04. Resolve the Conflict

Edit the file to remove ALL conflict markers and keep the desired content.

**Hint:** open with an editor, remove `<<<`, `===`, `>>>` lines

??? note "Solution"

    ```bash
    # Edit battle.txt - remove markers, keep the content you want.
    # For example, to keep both:
    cat > battle.txt << 'EOF'
    Main's changes
    Conflict branch's changes
    EOF

    # Verify no markers remain:
    grep -c '<<<\|===\|>>>' battle.txt
    # 0
    ```

---

### 05. Complete the Merge

Stage the resolved file and create the merge commit.

**Hint:** `git add`, `git commit`

??? note "Solution"

    ```bash
    git add battle.txt
    git commit -m "Resolve merge conflict in battle.txt"

    git log --oneline --graph
    # Shows the merge commit
    ```

---

### 06. Abort a Merge Instead

Start the merge again on a different branch and abort it mid-conflict.

**Hint:** `git merge --abort`

??? note "Solution"

    ```bash
    git merge some-other-branch
    # CONFLICT!

    # Changed your mind? Abort:
    git merge --abort
    # Working directory restored to pre-merge state
    ```

---

### 07. Use Theirs or Ours Strategy

Resolve a conflict by picking one side entirely.

**Hint:** `git checkout --ours <file>`, `git checkout --theirs <file>`

??? note "Solution"

    ```bash
    # Accept current branch version:
    git checkout --ours battle.txt
    git add battle.txt

    # OR accept incoming branch version:
    git checkout --theirs battle.txt
    git add battle.txt

    git commit -m "Resolve conflict using theirs"
    ```

---

### 08. Find the Password

Resolve the conflict in `battle.txt` and read the merged content. The password is in the resolved text.

**Hint:** resolve the conflict, then `cat battle.txt`

??? note "Solution"

    ```bash
    # Resolve the conflict, then:
    cat battle.txt
    # The password is in the content of the file
    ```

---

!!! success "🔓 Unlock Room 13"

    ```bash
    next <PASSWORD>
    ```
