---
password: "ignore29"
title_prefix: "🙈 "
summary: "Keep unwanted files out of your repo with .gitignore patterns."
---

##GITIGNORE: HIDING FILES FROM GIT

---

## Room 29 - Ignoring the Noise

!!! abstract "📜 Your mission"

    `.gitignore` tells Git which files/directories to IGNORE.

    1. View the current `.gitignore`:

        * `cat .gitignore`

    2. Common patterns:

        * `*.log`          - ignore all .log files
        * `build/`         - ignore the build directory
        * `!important.log` - DO track this specific file (exception)
        * `**/temp`        - ignore `temp` in any directory
        * `doc/*.txt`      - ignore .txt in doc/ only (not subdirs)

    3. Check what's being ignored:

        * `git status --ignored`

    4. Force-add an ignored file:

        * `git add -f secret.env`

    5. Remove a file that's already tracked:

        * `git rm --cached file-to-untrack.txt`

    6. This room has files that SHOULD be ignored but aren't in `.gitignore`.
       Create the proper `.gitignore` to ignore: `*.log`, `node_modules/`, `.env`, `*.pyc`

    7. Global gitignore:

        * `git config --global core.excludesfile ~/.gitignore_global`

    Once you have the password:
    ```bash
    next <PASSWORD>
    ```

### Key Commands

| Command                                     | Purpose                               |
| ------------------------------------------- | ------------------------------------- |
| `git check-ignore -v <file>`                | Check why a file is ignored           |
| `git status --ignored`                      | Show ignored files in status          |
| `git add -f <file>`                         | Force-add an ignored file             |
| `git rm --cached <file>`                    | Stop tracking a previously added file |
| `git check-ignore *`                        | List all ignored files in directory   |
| `git ls-files --ignored --exclude-standard` | List all ignored tracked files        |

### .gitignore Patterns

```gitignore
# Compiled output
*.o
*.class
build/

# Dependencies
node_modules/
vendor/

# IDE files
.vscode/
.idea/
*.swp

# OS files
.DS_Store
Thumbs.db

# Environment / secrets
.env
*.pem
```

!!! tip "💡 Precedence"
`.gitignore` files can exist at any level. Patterns in deeper
directories override higher ones. A global gitignore can be set with
`git config --global core.excludesFile ~/.gitignore_global`

---

## Tasks

### 01. View Current .gitignore

See what's already being ignored.

**Hint:** `cat .gitignore`

??? note "Solution"

    ```bash
    cat .gitignore
    # Shows current ignore patterns
    ```

---

### 02. Check Ignored Files

See which files are currently being ignored.

**Hint:** `git status --ignored`

??? note "Solution"

    ```bash
    git status --ignored
    # Ignored files:
    #   build/
    #   *.log
    ```

---

### 03. Add Ignore Patterns

Add patterns to ignore log files, node_modules, .env, and .pyc files.

**Hint:** `echo "pattern" >> .gitignore`

??? note "Solution"

    ```bash
    echo '*.log' >> .gitignore
    echo 'node_modules/' >> .gitignore
    echo '.env' >> .gitignore
    echo '*.pyc' >> .gitignore

    git status --ignored
    ```

---

### 04. Check Why a File Is Ignored

Diagnose which rule is ignoring a specific file.

**Hint:** `git check-ignore -v <file>`

??? note "Solution"

    ```bash
    git check-ignore -v debug.log
    # .gitignore:1:*.log    debug.log
    # Shows the file, line number, and pattern that matches
    ```

---

### 05. Force-Add an Ignored File

Track a file that matches an ignore pattern.

**Hint:** `git add -f <file>`

??? note "Solution"

    ```bash
    git add -f important.log
    # Forces git to track the file despite .gitignore
    ```

---

### 06. Stop Tracking a File

Remove a file from Git's tracking without deleting it from disk.

**Hint:** `git rm --cached <file>`

??? note "Solution"

    ```bash
    git rm --cached secrets.env
    # File is no longer tracked but still exists locally

    echo 'secrets.env' >> .gitignore
    git add .gitignore
    git commit -m "Stop tracking secrets.env"
    ```

---

### 07. Use Negation Patterns

Ignore all `.log` files except `important.log`.

**Hint:** `!important.log` in `.gitignore`

??? note "Solution"

    ```bash
    cat >> .gitignore << 'EOF'
    *.log
    !important.log
    EOF

    git check-ignore -v important.log
    # No output (not ignored due to negation)
    ```

---

### 08. Find the Password

Create the proper `.gitignore`, then run `git status` to see what's revealed.

**Hint:** check the files that appear in `git status` after updating `.gitignore`

??? note "Solution"

    ```bash
    # After setting up .gitignore properly:
    git status
    # Check any newly visible or special files for the password
    ```

---

!!! success "🔓 Unlock Room 30"

    ```bash
    next <PASSWORD>
    ```
