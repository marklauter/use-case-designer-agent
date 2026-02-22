#!/usr/bin/env bash
set -euo pipefail

# Appends an entry to the glossary following the glossary form (glossary.md).
# Usage: create-glossary-entry.sh <model-dir> <term> <definition>
#
# Creates GLOSSARY.md with the entry if it doesn't exist.
# Appends the entry if the file exists. The agent is responsible for
# maintaining alphabetical order using Edit after appending.
#
# Example:
#   create-glossary-entry.sh models/marklauter/github-wiki-agent \
#     "Editorial lens" \
#     "A distinct editorial discipline applied to wiki content during review."

MODEL_DIR="$1"
TERM="$2"
DEFINITION="$3"

GLOSSARY="${MODEL_DIR}/GLOSSARY.md"
ENTRY=$(printf '**%s** — %s' "$TERM" "$DEFINITION")

if [ ! -f "$GLOSSARY" ]; then
  {
    printf '# Glossary\n\n'
    printf '%s\n' "$ENTRY"
  } > "$GLOSSARY"
else
  printf '\n%s\n' "$ENTRY" >> "$GLOSSARY"
fi

echo "$GLOSSARY"
