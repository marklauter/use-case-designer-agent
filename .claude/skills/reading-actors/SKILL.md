---
name: reading-actors
description: This skill should be used when the user asks to "read an actor", "review an actor", "check the actor format", "understand who participates", or when an agent needs to understand the structure of actor files. Loads the structural contract for actor documents.
---

!`cat .claude/modeling-contracts/forms/actor.md`

## Reading actors

Actors live at `actors/` within the model directory, with an `index.md` catalog.

- **Start with the index** — `actors/index.md` lists every actor with their drive and use case participation. Read the index to understand the actor landscape before drilling into individuals.
- **Category determines sections** — primary actors have Goals, Experience goals, and End goals. Supporting actors have Drive and Separation rationale. Sub-systems have Capabilities. Check the Category section first.
- **Abstract parents and children** — some supporting actors are abstract types with concrete children. The Children section lists inheritors. The Abstract parent section links upward.
- **Appears in / Used by** — cross-references to use cases. Use this to trace which interactions an actor participates in.
