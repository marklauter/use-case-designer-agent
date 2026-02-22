#!/usr/bin/env bash
set -euo pipefail

# Creates an actor file following the actor form (actor.md).
# Usage: create-actor.sh <model-dir> <nn> <slug> <name> <category> <role> <description>
#
# category: "primary", "supporting", or "sub-system"
#
# Example:
#   create-actor.sh models/marklauter/github-wiki-agent 01 user \
#     "User" "primary" \
#     "Initiates all wiki operations and approves structural decisions." \
#     "The human operator who owns the repository and its wiki."

MODEL_DIR="$1"
NN="$2"
SLUG="$3"
NAME="$4"
CATEGORY="$5"
ROLE="$6"
DESCRIPTION="$7"

FILENAME="${NN}-${SLUG}.md"
DIR="${MODEL_DIR}/actors"

mkdir -p "$DIR"

{
  printf '# %s\n\n' "$NAME"
  printf '## Category\n\n%s\n\n' "$CATEGORY"
  printf '## Role\n\n%s\n\n' "$ROLE"
  printf '## Description\n\n%s\n\n' "$DESCRIPTION"

  case "$CATEGORY" in
    primary)
      printf '## Goals\n\nTODO\n\n'
      printf '## Experience goals\n\nTODO\n\n'
      printf '## End goals\n\nTODO\n\n'
      ;;
    supporting)
      printf '## Drive\n\nTODO\n\n'
      printf '## Separation rationale\n\nTODO\n\n'
      ;;
    sub-system)
      printf '## Capabilities\n\nTODO\n\n'
      ;;
  esac

  printf '## Appears in\n\nTODO\n'
} > "${DIR}/${FILENAME}"

echo "${DIR}/${FILENAME}"
