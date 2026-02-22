#!/usr/bin/env bash
set -euo pipefail

# Creates a todo file following the todo form (todo.md).
# Usage: create-todo.sh <model-dir> <slug> <title> <what> <why> <references>
#
# Example:
#   create-todo.sh models/marklauter/github-wiki-agent stub-historian-actor \
#     "Stub historian actor" \
#     "Create an actor file for the historian role discovered during use case design." \
#     "Emerged while designing the populate-new-wiki use case — someone needs to track design decisions." \
#     "use-cases/01-populate-new-wiki (discovery source)"

MODEL_DIR="$1"
SLUG="$2"
TITLE="$3"
WHAT="$4"
WHY="$5"
REFERENCES="$6"

FILENAME="${SLUG}.md"
DIR="${MODEL_DIR}/todos"

mkdir -p "$DIR"

{
  printf '# %s\n\n' "$TITLE"
  printf '## What\n\n%s\n\n' "$WHAT"
  printf '## Why\n\n%s\n\n' "$WHY"
  printf '## References\n\n%s\n' "$REFERENCES"
} > "${DIR}/${FILENAME}"

echo "${DIR}/${FILENAME}"
