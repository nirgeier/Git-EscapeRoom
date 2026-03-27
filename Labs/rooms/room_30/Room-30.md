---
password: "attrib30"
title_prefix: "📋 "
summary: "Control line endings, diff behavior, and merge strategies with .gitattributes."
---

##GITATTRIBUTES: FILE-LEVEL RULES

---

## Room 30 - Fine-Grained File Control

!!! abstract "📜 Your mission"

    `.gitattributes` controls how Git handles specific file types.

    1. Create a `.gitattributes` file with patterns like:

        * `*.txt text`
        * `*.jpg binary`
        * `*.sh text eol=lf`
        * `*.bat text eol=crlf`

    2. Line ending normalization:

        * `* text=auto`          - auto-detect text files
        * `*.sh text eol=lf`     - always use LF for .sh files
        * `*.bat text eol=crlf`  - always use CRLF for .bat files

    3. Binary files:

        * `*.png binary`
        * `*.zip binary`

    4. Diff drivers:

        * `*.md diff=markdown`

    5. Export-ignore (excluded from `git archive`):

        * `.gitignore export-ignore`
        * `tests/ export-ignore`

    6. Merge strategies:

        * `database.xml merge=ours`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                 | Purpose                              |
| --------------------------------------- | ------------------------------------ |
| `echo "* text=auto" > .gitattributes`   | Normalize line endings               |
| `echo "*.png binary" >> .gitattributes` | Mark PNG files as binary             |
| `git check-attr -a <file>`              | Show attributes for a file           |
| `git check-attr diff <file>`            | Check the diff attribute             |
| `git add --renormalize .`               | Re-apply attributes to tracked files |
| `cat .gitattributes`                    | View current attribute rules         |

### Common .gitattributes Patterns

```
# Auto-detect text files and normalize line endings
* text=auto

# Force specific line endings
*.sh    text eol=lf
*.bat   text eol=crlf

# Binary files - no diff, no merge
*.png   binary
*.jpg   binary
*.zip   binary

# Custom diff for specific file types
*.md    diff=markdown

# Merge strategy: keep ours on conflict
database.xml merge=ours

# Linguist: language statistics for GitHub
docs/*  linguist-documentation
```

---

## Tasks

### 01. Create a .gitattributes File

Set up auto line-ending normalization.

**Hint:** `echo "* text=auto" > .gitattributes`

??? note "Solution"

    ```bash
    echo '* text=auto' > .gitattributes
    cat .gitattributes
    ```

---

### 02. Set Line Endings Per File Type

Force LF for shell scripts and CRLF for batch files.

**Hint:** `*.sh text eol=lf`, `*.bat text eol=crlf`

??? note "Solution"

    ```bash
    cat >> .gitattributes << 'EOF'
    *.sh  text eol=lf
    *.bat text eol=crlf
    EOF
    ```

---

### 03. Mark Binary Files

Tell Git to treat image and archive files as binary.

**Hint:** `*.png binary`

??? note "Solution"

    ```bash
    cat >> .gitattributes << 'EOF'
    *.png binary
    *.jpg binary
    *.zip binary
    EOF
    ```

---

### 04. Check File Attributes

Inspect what attributes apply to a specific file.

**Hint:** `git check-attr -a <file>`

??? note "Solution"

    ```bash
    git check-attr -a script.sh
    # script.sh: text: set
    # script.sh: eol: lf

    git check-attr -a image.png
    # image.png: binary: set
    ```

---

### 05. Set Export-Ignore

Exclude files from `git archive` exports.

**Hint:** `.gitignore export-ignore`

??? note "Solution"

    ```bash
    echo '.gitignore export-ignore' >> .gitattributes
    echo 'tests/ export-ignore' >> .gitattributes
    ```

---

### 06. Set a Custom Merge Strategy

Keep your version of a config file during merges.

**Hint:** `database.xml merge=ours`

??? note "Solution"

    ```bash
    echo 'database.xml merge=ours' >> .gitattributes
    # During merges, database.xml will always keep "ours" version
    ```

---

### 07. Re-Normalize Tracked Files

Apply the new attributes to already-tracked files.

**Hint:** `git add --renormalize .`

??? note "Solution"

    ```bash
    git add --renormalize .
    git status
    # Shows files whose line endings were normalized

    git commit -m "Renormalize line endings"
    ```

---

### 08. Find the Password

Inspect the existing `.gitattributes` or check file attributes for a clue.

**Hint:** `cat .gitattributes`, `git check-attr -a *`

??? note "Solution"

    ```bash
    cat .gitattributes
    # Look for comments or special patterns hinting at the password

    git check-attr -a *
    # Inspect attribute assignments for clues
    ```

---

!!! success "🔓 Unlock Room 31"

    ```bash
    next <PASSWORD>
    ```
