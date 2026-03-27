# Git EscapeRoom Labs

<!-- header start -->
<div markdown style="text-align: center;border-radius: 20px;">

# 🔀 Git Escape Room

**Learn Git from Zero to Hero through 50 Interactive Puzzle Rooms**

</div>

---

<img src="assets/images/tldr.png" style="width:100px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">

!!! success "Decryption Tip"

    If the content doesn't appear after entering the password in the selected room, please refresh the page (F5 or Ctrl+R).

---

<!-- markdownlint-disable MD033 -->

{% include "./assets/partials/usage.md" %}

<!-- markdownlint-enable MD033 -->

---

## Intro

- This tutorial teaches **Git** through puzzles designed as escape rooms.
- Each room covers a different Git concept - from basic installation to plumbing commands and internals.
- Every room folder includes a `README` that describes the room's objectives, hints, rules, and how to verify the solution.
- The Git Escape Room is a series of Git puzzles (Escape-rooms, similar to the real-life attractions).
- The puzzles are designed to teach players Git skills & features from beginner to expert level.

---

## Pre-Requirements

- This tutorial will test your `Git` and `Linux` skills.
- You should be familiar with the following topics:
  - Basic Linux commands and shell navigation
  - Basic knowledge of a text editor (vim, nano, etc.)
  - Basic knowledge of `Docker` (if you choose to run it with Docker)

---

## Room Links

| #   | Room                                                         | Summary                                                                       |
| --- | ------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| 01  | [Install & Verify Git](rooms/Room-01.md)                     | Check if Git is installed, explore its binary location and sub-commands       |
| 02  | [Git Configuration](rooms/Room-02.md)                        | Configure Git identity, editor, and preferences with `git config`             |
| 03  | [Git Init](rooms/Room-03.md)                                 | Initialize a repository and explore the `.git` directory structure            |
| 04  | [The Three States of Git](rooms/Room-04.md)                  | Understand Git's three areas: Working Directory, Staging Area, and Repository |
| 05  | [Git Add: Staging Deep Dive](rooms/Room-05.md)               | Master `git add` with patterns, patches, and interactive staging              |
| 06  | [Git Status & Restore](rooms/Room-06.md)                     | Read `git status` output and use `git restore` to manage file states          |
| 07  | [Git Commit: Saving Snapshots](rooms/Room-07.md)             | Create commits, write good messages, and use `git commit` options             |
| 08  | [Git Log: Exploring History](rooms/Room-08.md)               | Navigate commit history with `git log` formats, filters, and search           |
| 09  | [Git Diff: Comparing Changes](rooms/Room-09.md)              | Compare changes with `git diff` between working dir, staging, and commits     |
| 10  | [Git Branch: Parallel Universes](rooms/Room-10.md)           | Create, switch, list, and manage branches with `git branch` and `git switch`  |
| 11  | [Git Merge: Bringing Branches Together](rooms/Room-11.md)    | Combine branches with `git merge`, fast-forward and three-way merges          |
| 12  | [Merge Conflicts](rooms/Room-12.md)                          | Resolve merge conflicts by editing conflict markers and completing the merge  |
| 13  | [Git Rebase: Linear History](rooms/Room-13.md)               | Rewrite history with `git rebase` and interactive rebase for clean timelines  |
| 14  | [Git Stash: Emergency Shelf](rooms/Room-14.md)               | Save and restore work-in-progress with `git stash`                            |
| 15  | [Git Remote: Connecting to the World](rooms/Room-15.md)      | Manage remote repositories with `git remote` - add, rename, remove            |
| 16  | [Git Clone: Copying Repositories](rooms/Room-16.md)          | Clone repositories with depth, branch, and bare options                       |
| 17  | [Git Fetch: Download Without Merging](rooms/Room-17.md)      | Download remote changes without merging using `git fetch`                     |
| 18  | [Git Pull: Fetch + Merge](rooms/Room-18.md)                  | Fetch and integrate remote changes with `git pull` and pull strategies        |
| 19  | [Git Push: Sharing Your Work](rooms/Room-19.md)              | Share commits with `git push`, set upstream, and manage remote branches       |
| 20  | [Git Tag: Marking Milestones](rooms/Room-20.md)              | Mark releases and milestones with lightweight and annotated tags              |
| 21  | [Git Cherry-Pick: Selective Commits](rooms/Room-21.md)       | Pick specific commits from other branches and apply them                      |
| 22  | [Git Reset: Rewinding History](rooms/Room-22.md)             | Rewind history with git reset - soft, mixed, and hard modes                   |
| 23  | [Git Revert: Safe Undo](rooms/Room-23.md)                    | Safely undo commits by creating a new reverting commit                        |
| 24  | [Git Commit --Amend: Fixing Mistakes](rooms/Room-24.md)      | Fix the last commit - change message, add files, or update content            |
| 25  | [Git Blame: Line-by-Line Detective](rooms/Room-25.md)        | Track down who changed what and when - line-by-line attribution               |
| 26  | [Git Bisect: Bug Hunting](rooms/Room-26.md)                  | Binary search through history to find the commit that introduced a bug        |
| 27  | [Git Reflog: Your Safety Net](rooms/Room-27.md)              | Recover lost commits, branches, and undone work from the reflog               |
| 28  | [Git Alias: Custom Shortcuts](rooms/Room-28.md)              | Create shortcuts for your most-used Git commands                              |
| 29  | [Gitignore: Hiding Files from Git](rooms/Room-29.md)         | Keep unwanted files out of your repo with .gitignore patterns                 |
| 30  | [Gitattributes: File-Level Rules](rooms/Room-30.md)          | Control line endings, diff behavior, and merge strategies                     |
| 31  | [Git Hooks: Automation Triggers](rooms/Room-31.md)           | Automate workflows with scripts that run at key Git lifecycle points          |
| 32  | [Git Submodule: Repos Within Repos](rooms/Room-32.md)        | Embed external repositories inside your project as submodules                 |
| 33  | [Git Worktree: Parallel Branches](rooms/Room-33.md)          | Work on multiple branches simultaneously without stashing                     |
| 34  | [Git Sparse-Checkout: Partial Repos](rooms/Room-34.md)       | Clone only the parts of a repo you need                                       |
| 35  | [Git Assume-Unchanged: Hiding Local Edits](rooms/Room-35.md) | Tell Git to ignore local changes to tracked files                             |
| 36  | [Git Clean: Remove Untracked Files](rooms/Room-36.md)        | Remove untracked files and directories from your working tree                 |
| 37  | [Git Archive: Export Without .git](rooms/Room-37.md)         | Export a snapshot of your repository without the .git directory               |
| 38  | [Git Bundle: Offline Transfer](rooms/Room-38.md)             | Transfer repositories offline using Git bundles                               |
| 39  | [Git Format-Patch & Am: Email Patches](rooms/Room-39.md)     | Create and apply patches for email-based collaboration                        |
| 40  | [Git Grep: Search Tracked Files](rooms/Room-40.md)           | Search through tracked files and commit history                               |
| 41  | [Git Shortlog: Contributor Stats](rooms/Room-41.md)          | Summarize commit activity by contributor                                      |
| 42  | [Git Describe: Human-Readable Names](rooms/Room-42.md)       | Get human-readable names for commits based on nearby tags                     |
| 43  | [Git Notes: Commit Metadata](rooms/Room-43.md)               | Attach extra metadata to commits without changing their hashes                |
| 44  | [Git Replace: Transparent Object Swap](rooms/Room-44.md)     | Transparently swap Git objects to rewrite history                             |
| 45  | [Git Filter-Branch & Filter-Repo](rooms/Room-45.md)          | Rewrite entire repository history - the nuclear option                        |
| 46  | [Git Rerere: Reuse Recorded Resolution](rooms/Room-46.md)    | Let Git remember and reuse conflict resolutions                               |
| 47  | [Git Fsck: Filesystem Check](rooms/Room-47.md)               | Check the integrity of your Git repository                                    |
| 48  | [Git GC: Garbage Collection](rooms/Room-48.md)               | Optimize your repository by cleaning up and compressing objects               |
| 49  | [Git Plumbing Commands: Internals](rooms/Room-49.md)         | Peek under the hood with Git's low-level plumbing commands                    |
| 50  | [Git Object Model: The Four Objects](rooms/Room-50.md)       | Understand the four fundamental Git objects that power everything             |
| 99  | [The Final Exam](rooms/Room-99.md)                           | The grand escape - prove your Git mastery!                                    |
