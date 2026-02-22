---
name: reading-events
description: This skill should be used when the user asks to "read a domain event", "review an event", "check the event format", "understand what happened", or when an agent needs to understand the structure of domain event files. Loads the structural contract for event documents.
---

!`cat .claude/modeling-contracts/forms/event.md`

## Reading events

Events live at `events/` within the model directory, with an `index.md` catalog.

- **Start with the index** — `events/index.md` lists every event with its producer and consumers. Read the index for the full event catalog before drilling into individuals.
- **PastTense naming** — event names describe what happened (WikiPopulated, FindingFiled). The name alone should convey the state transition.
- **Context section** — names the bounded context, the producing use case, the consumers, and the materialization. This is the event's integration contract.
- **Payload** — the data the event carries. Each item is a noun or noun phrase. The payload defines what downstream consumers can depend on.
