#!/usr/bin/env bash
set -euo pipefail

# Creates an index.md catalog file following the catalog form (catalog.md).
# Usage: create-catalog.sh <model-dir> <topic> <description>
#
# Creates {topic}/index.md if it doesn't exist. Does nothing if it already exists.
#
# Example:
#   create-catalog.sh models/marklauter/github-wiki-agent actors \
#     "Each actor represents a participant in the system with a distinct goal or drive."

MODEL_DIR="$1"
TOPIC="$2"
DESCRIPTION="$3"

DIR="${MODEL_DIR}/${TOPIC}"
INDEX="${DIR}/index.md"

if [ -f "$INDEX" ]; then
  echo "$INDEX"
  exit 0
fi

# Capitalize first letter of topic for the title
TITLE="$(echo "${TOPIC}" | sed 's/\b\(.\)/\u\1/g' | sed 's/-/ /g')"

mkdir -p "$DIR"

{
  printf '# %s\n\n' "$TITLE"
  printf '%s\n\n' "$DESCRIPTION"
  printf '## Entries\n'
} > "$INDEX"

echo "$INDEX"
