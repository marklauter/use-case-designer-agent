---
name: writing-usecases
description: This skill should be used when the user asks to "write a use case", "create a use case file", "structure a use case", or when an agent needs to create use case files during design work. Loads the structural contract and the creation script.
---

!`cat .claude/modeling-contracts/forms/usecase.md`

## Creating use cases

Use the `create-usecase.sh` script to create use case files. The script handles file naming, directory creation, and section scaffolding with TODO placeholders.

```
bash .claude/scripts/create-usecase.sh <model-dir> <nn> <slug> <title> <goal> <context-ref> <primary-actor-ref> <trigger>
```

- **model-dir** — path to the model directory (e.g., `models/marklauter/github-wiki-agent`)
- **nn** — zero-padded number (e.g., `01`). Check `use-cases/index.md` or list the directory for the next available.
- **slug** — derive from the goal, imperative voice (e.g., `populate-new-wiki`, `review-wiki-quality`)
- **title** — the use case title (e.g., `Populate New Wiki`)
- **goal** — one paragraph describing the desired end state
- **context-ref** — bounded context path (e.g., `contexts/01-wiki-creation`)
- **primary-actor-ref** — primary actor path (e.g., `actors/01-user`)
- **trigger** — what prompts the actor to pursue this goal

The script outputs the created file path. Add an entry to `use-cases/index.md` after creating.
