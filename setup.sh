#!/bin/bash
# Install git hooks from hooks/ into .git/hooks/
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
ln -sf "$REPO_ROOT/hooks/pre-commit" "$REPO_ROOT/.git/hooks/pre-commit"
echo "Hooks installed."
