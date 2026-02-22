---
name: reading-glossaries
description: This skill should be used when the user asks to "read the glossary", "look up a term", "check the vocabulary", "find a definition", or when an agent needs to understand the structure of glossary documents. Loads the structural contract for GLOSSARY.md files.
---

!`cat .claude/modeling-contracts/forms/glossary.md`

## Reading glossaries

The glossary is a single file at `GLOSSARY.md` in the model root. Entries are alphabetical.

- **Model-spanning terms only** — the glossary holds terms that span the model. Terms scoped to one bounded context live in that context's Ubiquitous language section instead.
- **Check both locations** — to find a term's definition, check GLOSSARY.md first, then the relevant context file's Ubiquitous language section.
- **Formerly annotations** — renamed terms carry a "Formerly:" note. If you encounter an unfamiliar term, it may have been renamed — grep the glossary for the old name.
