---
name: writing-actors
description: This skill should be used when the user asks to "write an actor file", "create a new actor", "structure an actor", or when an agent needs to create actor files during design work. Loads the structural contract and the creation script.
---

!`cat .claude/modeling-contracts/forms/actor.md`

## Creating actors

Use the `create-actor.sh` script to create actor files. The script handles file naming, directory creation, and category-specific section scaffolding.

```
bash .claude/scripts/create-actor.sh <model-dir> <nn> <slug> <name> <category> <role> <description>
```

- **model-dir** — path to the model directory (e.g., `models/marklauter/github-wiki-agent`)
- **nn** — zero-padded number (e.g., `01`). Check `actors/index.md` or list the directory for the next available.
- **slug** — actor name in lowercase (e.g., `user`, `orchestrator`, `proofreaders`)
- **name** — display name, capitalized (e.g., `User`, `Orchestrator`, `Proofreaders`)
- **category** — one of: `primary`, `supporting`, `sub-system`. Determines which sections are scaffolded.
- **role** — one sentence: what this actor does in the system
- **description** — one paragraph: what this actor is and why it exists

The script outputs the created file path. Add an entry to `actors/index.md` after creating.
