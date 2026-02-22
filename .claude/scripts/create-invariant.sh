#!/usr/bin/env bash
set -euo pipefail

# Creates an invariant file following the invariant form (invariant.md).
# Usage: create-invariant.sh <model-dir> <nn> <slug> <name> <statement> <rationale> <origin>
#
# Example:
#   create-invariant.sh models/marklauter/github-wiki-agent 01 source-repo-readonly \
#     "Source repository is read-only" \
#     "The source repository is never modified by any wiki operation." \
#     "Mutation of the source could break builds or lose developer work." \
#     "Established by use-cases/01-populate-new-wiki."

MODEL_DIR="$1"
NN="$2"
SLUG="$3"
NAME="$4"
STATEMENT="$5"
RATIONALE="$6"
ORIGIN="$7"

FILENAME="${NN}-${SLUG}.md"
DIR="${MODEL_DIR}/invariants"

mkdir -p "$DIR"

{
  printf '# %s\n\n' "$NAME"
  printf '## Statement\n\n%s\n\n' "$STATEMENT"
  printf '## Rationale\n\n%s\n\n' "$RATIONALE"
  printf '## Scope\n\nTODO\n\n'
  printf '## Origin\n\n%s\n' "$ORIGIN"
} > "${DIR}/${FILENAME}"

echo "${DIR}/${FILENAME}"
