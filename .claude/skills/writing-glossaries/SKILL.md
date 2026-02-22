---
name: writing-glossaries
description: This skill should be used when the user asks to "add a glossary entry", "define a term", "update the glossary", or when an agent needs to write glossary entries during design work. Loads the structural contract and the creation script.
---

!`cat .claude/modeling-contracts/forms/glossary.md`

## Writing glossary entries

Use the `create-glossary-entry.sh` script to add entries. The script creates `GLOSSARY.md` if it doesn't exist and appends the entry.

```
bash .claude/scripts/create-glossary-entry.sh <model-dir> <term> <definition>
```

- **model-dir** — path to the model directory (e.g., `models/marklauter/github-wiki-agent`)
- **term** — the term to define (e.g., `Editorial lens`)
- **definition** — one sentence, present tense, declarative (e.g., `A distinct editorial discipline applied to wiki content during review.`)

The script appends to the end of the file. Use Edit to move the entry into alphabetical position after appending. If a term is only meaningful within one bounded context, add it to that context's Ubiquitous language section instead.
