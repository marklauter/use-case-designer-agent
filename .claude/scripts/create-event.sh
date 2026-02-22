#!/usr/bin/env bash
set -euo pipefail

# Creates a domain event file following the event form (event.md).
# Usage: create-event.sh <model-dir> <nn> <slug> <event-name> <context-ref> <producer-ref> <description>
#
# Example:
#   create-event.sh models/marklauter/github-wiki-agent 01 wiki-populated \
#     "WikiPopulated" \
#     "contexts/01-wiki-creation" \
#     "use-cases/01-populate-new-wiki" \
#     "Raised when all writing assignments have been fulfilled and the wiki contains its initial set of content pages."

MODEL_DIR="$1"
NN="$2"
SLUG="$3"
EVENT_NAME="$4"
CONTEXT_REF="$5"
PRODUCER_REF="$6"
DESCRIPTION="$7"

FILENAME="${NN}-${SLUG}.md"
DIR="${MODEL_DIR}/events"

mkdir -p "$DIR"

{
  printf '# %s\n\n' "$EVENT_NAME"
  printf '## Context\n\n'
  printf '- **Bounded context:** %s\n' "$CONTEXT_REF"
  printf '- **Producer:** %s\n' "$PRODUCER_REF"
  printf '- **Consumers:** TODO\n'
  printf '- **Materialization:** TODO\n\n'
  printf '## Description\n\n%s\n\n' "$DESCRIPTION"
  printf '## Payload\n\nTODO\n'
} > "${DIR}/${FILENAME}"

echo "${DIR}/${FILENAME}"
