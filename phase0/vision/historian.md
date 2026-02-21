# The historian

In a long discovery session, early insights compress and fade. Working memory is finite — for humans and for agents. Someone needs to hold the threads. This article describes who that someone is and how the role works in Phase0.

## The real-world answer

In a group design session the facilitator does not hold the threads alone. There is always someone — the historian — whose job is to write things down.

The facilitator drives conversation. "That's interesting, say more about that." "Wait — you two just said opposite things." The facilitator is focused on flow.

The historian is focused on record. Silently, in parallel, they capture what matters:

- "Alice said 'shipment' means what leaves the warehouse."
- "Bob contradicted — he means what the customer ordered."
- "Open question: same concept or two different ones?"
- "Decision: we split Sender and Recipient."

The historian does not need deep domain understanding. They need to recognize **what matters**: contradictions, decisions, new terms, open questions, and shifts in understanding. That is a distinct skill from facilitation or domain expertise.

## What the historian recognizes

The historian watches for four categories of significance.

- **Decisions.** Not what was discussed — what was decided. "We split Customer into Sender and Recipient" is a decision. The twenty minutes of debate that preceded it is discussion. The historian captures the decision and enough context to understand why it was made.
- **Contradictions.** When two people use the same word to mean different things, or describe the same process differently, that is a contradiction. Contradictions are where bounded context boundaries hide. The historian flags them before the conversation moves on.
- **New terms.** When the group names something for the first time — or renames something, or retires a term — the historian records it. These are the raw materials of ubiquitous language.
- **Deferrals.** Some questions surface before the group is ready to answer them. The historian captures these explicitly as open questions so they are not lost when the conversation shifts focus.

## Why this matters for agents

Humans have context windows too. When a meeting runs long, early insights get compressed or lost — both for the AI and for the human domain expert in the conversation. The historian compensates for both.

An AI agent's context window is a hard limit. When it fills, earlier content is summarized or dropped. A human's working memory degrades more gradually but just as surely. Three sessions in, nobody remembers exactly why the group decided to split Warehouse from Logistics. The historian's notes remember.

## Note-taking as a learned skill

In human practice, note-taking is a learned skill. People are taught to capture:

- What was **decided** (not just discussed)
- What was **contradicted** (not just stated)
- What was **named** (new terms, renamed terms, retired terms)
- What was **deferred** (explicit open questions)

Agents need this skill too — and critically, they need to exercise it **without being prompted**. A human historian does not wait to be told "write that down." They recognize significance as it happens and record it. An agent historian should do the same. The moment a contradiction surfaces or a decision crystallizes, the historian writes it down. No one asks. No one needs to.

## The architecture

This resolves the "who holds the threads" question cleanly:

**The threads live in the notes, not in any agent's head.**

```
+--------------------------------------------------+
|  HISTORIAN AGENT  (always listening)              |
|                                                   |
|  Watches:  conversation between user & agents     |
|  Writes:   session log, open questions,           |
|            contradictions, decisions, new terms    |
|  Never:    asks questions, makes design decisions  |
|                                                   |
|  Output format: timestamped markdown notes        |
|  Storage: session-scoped files, rolled up into    |
|           cross-session summaries                 |
+--------------------------------------------------+
```

The historian agent writes session-scoped markdown files. After each session it rolls these up into cross-session summaries. Other agents read those summaries to recover context they have lost. The human reads them to remember what happened three sessions ago.

## The historian is not the facilitator

This distinction is critical. The historian does not route conversations. It does not invoke specialists. It does not ask questions. It does not make design decisions. It listens and writes.

Other agents — the facilitator, the specialist formalizers — do the active work of discovery. The historian supports them by maintaining a durable record of the process itself. This mirrors how shared artifacts already work in Phase0 (markdown files as the integration layer), but adds a dedicated agent responsible for capturing the *process* of discovery, not just its *products*.

## What the historian captures vs. what specialist agents write

The historian and the specialist agents write different things. Five examples make the boundary clear.

- When the group discusses splitting Customer into Sender and Recipient, the **historian** writes "We discussed splitting Customer into Sender and Recipient." The **specialist agent** writes the ACTOR-CATALOG.md entry for Sender.
- When an open question surfaces about whether Driver belongs in Logistics or Fleet, the **historian** writes "Open question: does Driver belong in Logistics or Fleet?" The **specialist agent** writes DC-03-fleet-management.md when the question is resolved.
- When a contradiction emerges — "shipment" means different things to warehouse and delivery — the **historian** writes "Contradiction: 'shipment' means different things to warehouse and delivery." The **specialist agent** writes the GLOSSARY.md entries that formalize the distinction.
- When the group makes a boundary decision, the **historian** writes "Decision: bounded context boundary between Warehouse and Logistics." The **specialist agent** writes the domain context definitions.
- When Alice says "we don't track packages, we track promises," the **historian** writes it down. **No specialist agent writes anything.** This is raw material — not yet an artifact. It is an insight, a half-formed idea, a metaphor the domain expert used. These are the seeds that specialist agents will later formalize. Without the historian, they vanish when the context window compresses.

The last example is the crucial one. The historian captures things that are not ready to become artifacts yet. Raw insights, half-formed ideas, metaphors — these are the material that specialist agents will eventually crystallize into formal constructs. But only if someone wrote them down.

## Further reading

- [The agentic architecture](agentic-architecture.md) — the historian's place in the lens diagram, and how the facilitator dispatches specialist agents while the historian quietly records
