#!/usr/bin/env bash

# Shows the current Git branch for the active tmux pane directory.
# Works well with WezTerm + tmux + Neovim.

# Get the current directory from the active tmux pane.
CURRENT_DIR="$(tmux display-message -p '#{pane_current_path}' 2>/dev/null)"

# If tmux is not running or the path is empty, hide the item.
if [ -z "$CURRENT_DIR" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# If the current directory is not inside a Git repository, hide the item.
if ! git -C "$CURRENT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# Get the Git repository root.
REPO="$(git -C "$CURRENT_DIR" rev-parse --show-toplevel 2>/dev/null)"

if [ -z "$REPO" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# Get the branch name.
BRANCH="$(git -C "$REPO" branch --show-current 2>/dev/null)"

# If detached HEAD, fall back to short commit hash.
if [ -z "$BRANCH" ]; then
  BRANCH="$(git -C "$REPO" rev-parse --short HEAD 2>/dev/null)"
fi

# If branch or commit hash cannot be determined, hide the item.
if [ -z "$BRANCH" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

# Check dirty state:
# - unstaged changes
# - staged changes
# - untracked files
DIRTY=""

if ! git -C "$REPO" diff --quiet --ignore-submodules -- 2>/dev/null; then
  DIRTY="*"
elif ! git -C "$REPO" diff --cached --quiet --ignore-submodules -- 2>/dev/null; then
  DIRTY="*"
elif [ -n "$(git -C "$REPO" ls-files --others --exclude-standard 2>/dev/null)" ]; then
  DIRTY="*"
fi

# Show branch name.
sketchybar --set "$NAME" drawing=on label="${BRANCH}${DIRTY}"
