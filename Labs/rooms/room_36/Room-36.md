---
password: "clean36"
title_prefix: "🧹 "
summary: "Remove untracked files and directories from your working tree."
---

##GIT CLEAN: REMOVE UNTRACKED FILES

---

## Room 36 - Sweep the Working Tree

!!! abstract "📜 Your mission"

    Clean removes files that are NOT tracked by Git.

    1. See what would be cleaned (dry run):

        * `git clean -n`

    2. Remove untracked files:

        * `git clean -f`

    3. Remove untracked directories too:

        * `git clean -fd`

    4. Remove ignored files as well:

        * `git clean -fX`   (ONLY ignored files)
        * `git clean -fx`   (untracked AND ignored)

    5. Interactive clean:

        * `git clean -i`

    6. This room has tons of "junk" files.
       Clean them up, but be careful NOT to delete `important.txt`!
       Use: `git clean -n` first to preview.

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command         | Purpose                                          |
| --------------- | ------------------------------------------------ |
| `git clean -n`  | Dry run - show what WOULD be removed             |
| `git clean -f`  | Force remove untracked files                     |
| `git clean -fd` | Remove untracked files AND directories           |
| `git clean -fX` | Remove only files matched by `.gitignore`        |
| `git clean -fx` | Remove ALL untracked files (ignored + unignored) |
| `git clean -i`  | Interactive mode - pick what to delete           |

### Clean Modes Cheat Sheet

```text
                  Untracked    Ignored    Directories
───────────────────────────────────────────────────────
git clean -f        ✅           ❌          ❌
git clean -fd       ✅           ❌          ✅
git clean -fX       ❌           ✅          ❌
git clean -fx       ✅           ✅          ❌
git clean -fdx      ✅           ✅          ✅
git clean -fdX      ❌           ✅          ✅

Safety tip:  ALWAYS run  git clean -n  first to preview!
```

!!! warning "⚠️ Destructive Operation"
`git clean -f` permanently deletes files that are NOT tracked by Git.
There is no undo - these files are gone forever!

---

## Tasks

### 01. Preview What Would Be Cleaned

Dry-run to see what `clean` would remove.

**Hint:** `git clean -n`

??? note "Solution"

    ```bash
    git clean -n
    # Would remove junk1.tmp
    # Would remove junk2.tmp
    # Would remove temp/
    ```

---

### 02. Remove Untracked Files

Delete untracked files (not directories).

**Hint:** `git clean -f`

??? note "Solution"

    ```bash
    git clean -f
    # Removing junk1.tmp
    # Removing junk2.tmp
    ```

---

### 03. Remove Untracked Directories Too

Clean untracked files AND directories.

**Hint:** `git clean -fd`

??? note "Solution"

    ```bash
    git clean -fd
    # Removes untracked files AND directories like temp/
    ```

---

### 04. Clean Only Ignored Files

Remove files matched by `.gitignore` patterns.

**Hint:** `git clean -fX`

??? note "Solution"

    ```bash
    git clean -fX
    # Removes only files that .gitignore would catch
    # (e.g., *.log, build/, node_modules/)
    ```

---

### 05. Use Interactive Clean

Pick and choose what to delete.

**Hint:** `git clean -i`

??? note "Solution"

    ```bash
    git clean -i
    # Would remove the following items:
    #   1 - junk.tmp
    #   2 - temp/
    # *** Commands ***
    #   1: clean  2: filter by pattern  3: select by numbers  4: quit
    ```

---

### 06. Nuclear Clean (Everything)

Remove ALL untracked files, directories, AND ignored files.

**Hint:** `git clean -fdx`

??? note "Solution"

    ```bash
    # Preview first!
    git clean -ndx

    # Then execute:
    git clean -fdx
    # Removes EVERYTHING not tracked - be very careful!
    ```

---

### 07. Find the Password

Clean up the junk files, then check what remains. The password is in a tracked file revealed after cleaning.

**Hint:** `git clean -fd`, then `ls` and `cat` the remaining files

??? note "Solution"

    ```bash
    git clean -n    # Preview first
    git clean -fd   # Clean up
    ls
    # The remaining tracked file contains the password
    cat important.txt
    ```

---

!!! success "🔓 Unlock Room 37"

    ```bash
    next <PASSWORD>
    ```
