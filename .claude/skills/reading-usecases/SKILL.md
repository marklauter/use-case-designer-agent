---
name: reading-usecases
description: This skill should be used when the user asks to "read a use case", "review a use case", "check the scenario", "understand the interaction", or when an agent needs to understand the structure of use case files. Loads the structural contract for use case documents.
---

!`cat .claude/modeling-contracts/forms/usecase.md`

## Reading use cases

Use cases live at `use-cases/` within the model directory, with an `index.md` catalog.

- **Start with the index** — `use-cases/index.md` maps each use case to its bounded context and primary actor. Read the index before drilling into individual files.
- **Cross-reference actors** — the Context section names the primary and supporting actors. Read `actors/index.md` to understand who participates and their drives.
- **Scenario is the spine** — the numbered scenario steps tell the story. Each step names the actor and expresses intent. Domain events (marked with `-->`) are the meaningful state transitions.
- **Obstacles branch from steps** — goal obstacles are keyed to scenario steps (e.g., "Step 3a"). Read them as threats to the goal, not alternate flows.
