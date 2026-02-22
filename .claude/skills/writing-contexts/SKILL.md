---
name: writing-contexts
description: This skill should be used when the user asks to "write a bounded context", "create a context file", "structure a context", or when an agent needs to create bounded context files during design work. Loads the structural contract and the creation script.
---

!`cat .claude/modeling-contracts/forms/context.md`

## Creating contexts

Use the `create-context.sh` script to create bounded context files. The script handles file naming, directory creation, and section scaffolding with TODO placeholders.

```
bash .claude/scripts/create-context.sh <model-dir> <nn> <slug> <title> <purpose>
```

- **model-dir** — path to the model directory (e.g., `models/marklauter/github-wiki-agent`)
- **nn** — zero-padded number (e.g., `01`). Check `contexts/index.md` or list the directory for the next available.
- **slug** — derive from what the context owns (e.g., `wiki-creation`, `editorial-review`)
- **title** — the context title (e.g., `Wiki Creation`, `Editorial Review`)
- **purpose** — one paragraph describing what this bounded context owns

The script outputs the created file path. Add an entry to `contexts/index.md` after creating.
