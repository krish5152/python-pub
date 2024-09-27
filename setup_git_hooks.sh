#!/bin/bash

# Path to the .git/hooks directory
HOOKS_DIR=".git/hooks"

# Check if .git directory exists
if [ ! -d ".git" ]; then
  echo "Error: This script must be run from the root of a Git repository."
  exit 1
fi

# Create hooks directory if it doesn't exist
if [ ! -d "$HOOKS_DIR" ]; then
  echo "Creating hooks directory..."
  mkdir -p "$HOOKS_DIR"
fi

# Path to commit-msg file
COMMIT_MSG_FILE="$HOOKS_DIR/commit-msg"

# Create commit-msg file if it doesn't exist
if [ ! -f "$COMMIT_MSG_FILE" ]; then
  echo "Creating commit-msg file..."
  cat << 'EOF' > "$COMMIT_MSG_FILE"
#!/bin/sh

commit_message=$(cat "$1")

if ! echo "$commit_message" | grep -Eq "^Feature.*[0-9]+$"; then
  echo "Error: Commit message must start with 'Feature' and end with a number (e.g., 'Feature branch ID-21')."
  exit 1
fi
EOF
  chmod +x "$COMMIT_MSG_FILE"
  echo "commit-msg hook created successfully."
else
  echo "commit-msg hook already exists."
fi
