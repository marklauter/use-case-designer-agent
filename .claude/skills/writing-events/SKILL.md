---
name: writing-events
description: This skill should be used when the user asks to "write a domain event", "create an event file", "structure an event", or when an agent needs to create domain event files during design work. Loads the structural contract and the creation script.
---

!`cat .claude/modeling-contracts/forms/event.md`

## Creating events

Use the `create-event.sh` script to create domain event files. The script handles file naming, directory creation, and section scaffolding with TODO placeholders.

```
bash .claude/scripts/create-event.sh <model-dir> <nn> <slug> <event-name> <context-ref> <producer-ref> <description>
```

- **model-dir** — path to the model directory (e.g., `models/marklauter/github-wiki-agent`)
- **nn** — zero-padded number (e.g., `01`). Check `events/index.md` or list the directory for the next available.
- **slug** — event name in kebab-case (e.g., `wiki-populated`, `finding-filed`)
- **event-name** — PastTense name (e.g., `WikiPopulated`, `FindingFiled`, `DriftDetected`)
- **context-ref** — bounded context path (e.g., `contexts/01-wiki-creation`)
- **producer-ref** — producing use case path (e.g., `use-cases/01-populate-new-wiki`)
- **description** — one paragraph: what happened and why it matters

The script outputs the created file path. Add an entry to `events/index.md` after creating.
