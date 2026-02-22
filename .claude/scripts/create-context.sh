#!/usr/bin/env bash
set -euo pipefail

# Creates a bounded context file following the context form (context.md).
# Usage: create-context.sh <model-dir> <nn> <slug> <title> <purpose>
#
# Example:
#   create-context.sh models/marklauter/github-wiki-agent 01 wiki-creation \
#     "Wiki Creation" \
#     "Owns the transition from an empty wiki to a populated wiki."

MODEL_DIR="$1"
NN="$2"
SLUG="$3"
TITLE="$4"
PURPOSE="$5"

FILENAME="${NN}-${SLUG}.md"
DIR="${MODEL_DIR}/contexts"

mkdir -p "$DIR"

{
  printf '# %s\n\n' "$TITLE"
  printf '## Purpose\n\n%s\n\n' "$PURPOSE"
  printf '## Ubiquitous language\n\nTODO\n\n'
  printf '## Use cases\n\nTODO\n\n'
  printf '## Events produced\n\nTODO\n\n'
  printf '## Events consumed\n\nTODO\n\n'
  printf '## Integration points\n\nTODO\n'
} > "${DIR}/${FILENAME}"

echo "${DIR}/${FILENAME}"
