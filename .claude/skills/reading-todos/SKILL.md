---
name: reading-todos
description: This skill should be used when the user asks to "read a todo", "review todos", "check what work is pending", "see open work items", or when an agent needs to understand the structure of todo files. Loads the structural contract for todo documents.
---

!`cat .claude/modeling-contracts/forms/todo.md`

## Reading todos

Todos live at `todos/` within the model directory. No index, no ordering. They are ephemeral — they exist only while the work is pending.

- **List** — `ls todos/` within the model directory. The slug names the action (e.g., `stub-historian-actor.md`, `revise-populate-scenario-3.md`).
- **What and Why** — the What section describes the work. The Why section explains what surfaced the gap. Together they provide enough context to pick up the work without re-reading the source conversation.
- **References** — cross-links to the artifacts this todo touches. Use these to understand what will change when the work is done.
- **Absence is completion** — when a todo is done, it gets deleted. An empty `todos/` directory means all captured work has been addressed.
