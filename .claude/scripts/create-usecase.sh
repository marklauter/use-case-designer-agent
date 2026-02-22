#!/usr/bin/env bash
set -euo pipefail

# Creates a use case file following the use case form (usecase.md).
# Usage: create-usecase.sh <model-dir> <nn> <slug> <title> <goal> <context-ref> <primary-actor-ref> <trigger>
#
# Example:
#   create-usecase.sh models/marklauter/github-wiki-agent 01 populate-new-wiki \
#     "Populate New Wiki" \
#     "The wiki contains a complete, well-structured set of pages covering the source repository." \
#     "contexts/01-wiki-creation" \
#     "actors/01-user" \
#     "User initiates wiki population for a newly provisioned workspace."

MODEL_DIR="$1"
NN="$2"
SLUG="$3"
TITLE="$4"
GOAL="$5"
CONTEXT_REF="$6"
PRIMARY_ACTOR_REF="$7"
TRIGGER="$8"

FILENAME="${NN}-${SLUG}.md"
DIR="${MODEL_DIR}/use-cases"

mkdir -p "$DIR"

{
  printf '# %s — %s\n\n' "$NN" "$TITLE"
  printf '## Goal\n\n%s\n\n' "$GOAL"
  printf '## Context\n\n'
  printf '- **Bounded context:** %s\n' "$CONTEXT_REF"
  printf '- **Primary actor:** %s\n' "$PRIMARY_ACTOR_REF"
  printf '- **Supporting actors:** TODO\n'
  printf '- **Trigger:** %s\n\n' "$TRIGGER"
  printf '## Actor responsibilities\n\nTODO\n\n'
  printf '## Invariants\n\nTODO\n\n'
  printf '## Success outcome\n\nTODO\n\n'
  printf '## Failure outcome\n\nTODO\n\n'
  printf '## Scenario\n\nTODO\n\n'
  printf '## Goal obstacles\n\nTODO\n\n'
  printf '## Domain events\n\n'
  printf '### Published\n\nTODO\n\n'
  printf '### Internal\n\nTODO\n'
} > "${DIR}/${FILENAME}"

echo "${DIR}/${FILENAME}"
