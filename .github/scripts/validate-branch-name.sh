#!/bin/bash

branch_name=$(git rev-parse --abbrev-ref HEAD)

if ! [[ "$branch_name" =~ ^(feature|bugfix|hotfix|release)/.+$ ]]; then
  echo "Invalid branch name. Branch name must start with feature/, bugfix/, hotfix/, or release/."
  exit 1
fi

echo "Branch name is valid."
