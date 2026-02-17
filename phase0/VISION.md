# Phase0: Bounded Context Discovery Through Socratic Extraction

**Date:** 2026-02-17
**Status:** Vision / Pre-design

---

## The Problem

The use-case-designer agent is excellent at what it does — but it assumes someone already walked into the room knowing the system boundary, the actors, and roughly which use cases exist. That's a lot of pre-chewed knowledge.

In reality, that knowledge doesn't exist yet. A facilitator stands at a blank whiteboard with domain experts and asks: *"What problem are you trying to solve?"*

Phase0 is everything that happens before the first use case is written.

---

## The Natural Group Process

### Round 1: "What is this thing?"

A facilitator asks domain experts: *"What problem are you trying to solve?"* Not "what system do you want" — what **problem**. The answers are messy, overlapping, contradictory. One person says "we need to track shipments," another says "customers keep calling about late deliveries," a third says "our warehouse doesn't know what's coming."

These are all symptoms of the same system, but nobody has named it yet.

The facilitator's job is to keep asking *why* until the group converges on something like: "We need visibility into the lifecycle of a package from warehouse to doorstep." That's a system boundary. It's also the first bounded context candidate — though nobody calls it that yet.

### Round 2: "Who touches this?"

The facilitator asks: *"Who interacts with this?"* and gets answers like "the customer," "the warehouse guy," "the driver," "the dispatcher." But these are sloppy. "The customer" might be three different actors with conflicting drives:

- The **Sender** (drive: ensure package arrives safely)
- The **Recipient** (drive: know when to expect delivery)
- The **Complainant** (drive: get resolution when something goes wrong)

The Socratic refinement works by qualifying until the qualifiers disappear and you have standalone nouns with singular drives. "Customer who sends things" becomes Sender. "Customer who receives things" becomes Recipient.

Consider: a passenger is someone who rides in a car. Technically the driver is a passenger — but it's the *operator* passenger. You refine "operator passenger" to Driver. Now you have a standalone noun with a clear drive (operate the vehicle), distinct from Passenger (be transported). The qualifier vanished because the noun absorbed it.

This is how ubiquitous language emerges naturally. You don't design it — you extract it through dialogue until every name carries its own meaning without needing a qualifier.

### Round 3: "What goes wrong?"

This is the part most methodologies skip but Cooper never does. You ask domain experts: *"What keeps you up at night?"*

The answers reveal the real system:
- "Packages get lost between warehouse and truck."
- "Two drivers show up for the same route."
- "Customer calls and nobody knows where the package is."

Each of these is a **domain tension** — and tensions are where bounded contexts crystallize. The "lost package" problem lives at the boundary between warehouse and logistics. That boundary *is* the context boundary, discovered through conflict rather than declared by architects.

### Round 4: Use cases emerge naturally

By now the group has actors with drives, tensions at boundaries, and a rough sense of the system's shape. Use cases aren't invented — they fall out. "The Dispatcher assigns routes" isn't something you design; it's something the domain experts have been doing, and now you've given it a name.

This is where the existing use-case-designer agent excels. Phase0 is everything upstream of that handoff.

---

## The Agentic Architecture

### The Facilitator Already Exists

A key realization: the main Claude Code conversation **is** the facilitator. It already:
- Listens to the domain expert (the human user)
- Asks clarifying questions
- Notices when something important is said
- Decides what to explore next
- Invokes specialist agents when the conversation is ready for them

The use-case-designer agent was initially conceived as a facilitator, but it's actually a **specialist** — it gets called in when facilitation has progressed far enough that a use case is ready to be designed. The same is true for every other agent in the pipeline. They're all specialists. The facilitator is the thing orchestrating them: the main conversation itself.

This means the facilitator doesn't need to be *built*. It needs to be **equipped** — with guidance on how to conduct a Phase0 discovery session, and with specialist agents it can dispatch. The CLAUDE.md and guidance files are already the mechanism for equipping it.

### The Pipeline

```
MAIN CONVERSATION  ← the facilitator (already exists)
│
├── equipped with: Phase0 guidance documents
│     ├── discovery process phases
│     ├── Socratic questioning techniques
│     ├── when to invoke which specialist
│     └── how to read historian notes for context recovery
│
├── dispatches specialist agents as needed:
│     ├── System Discovery Agent     → system boundary, problem statements
│     ├── Actor Discovery Agent      → refined actors with drives
│     ├── Tension Mapping Agent      → bounded context candidates
│     ├── Use Case Designer Agent    → structured use cases (exists today)
│     └── Consolidation Agent        → validated context map, protocols
│
└── supported by:
      └── Historian Agent  ← always listening, always writing
```

The specialist agents are **subagents** — invoked by the facilitator when the conversation reaches a point where structured extraction is needed. The facilitator handles the fluid, nonlinear, backtracking-heavy conversational work. The specialists handle the disciplined, template-driven formalization work.

### Why This Decomposition Works

In a real group session, the facilitator bounces between levels constantly. Discovering an actor might surface a tension. A tension might redefine the system boundary. A use case walkthrough might split an actor into two. This fluidity is natural in conversation — and the main Claude conversation already supports it.

What the main conversation is *bad* at is disciplined, template-driven production of formal artifacts. That's what the specialist agents do. The use-case-designer agent doesn't need to be a good facilitator — it needs to be a good formalizer that takes conversational insights and crystallizes them into structured documents.

This separation mirrors the real world: the facilitator at the whiteboard is loose, adaptive, responsive. The person writing up the meeting notes into formal specs afterward is rigorous, structured, template-driven. These are different skills, and forcing one agent to do both is why the use-case-designer was initially conceived as a facilitator when it's really a specialist.

---

## Why Socratic Extraction Works

Most "domain modeling" tools are **top-down** — you declare contexts and fill them in. Phase0 is **bottom-up extraction** through conversation, which is how discovery actually works with domain experts.

The domain expert doesn't know what a bounded context is. They know that "the warehouse team and the delivery team use the word 'shipment' to mean completely different things." That contradition *is* a context boundary, discovered through dialogue rather than declared by architects.

The Socratic method is the right tool because:

1. **Domain experts know more than they can articulate upfront.** Asking "tell me everything about your system" produces a fraction of what targeted questioning extracts.
2. **Contradictions between experts reveal real boundaries.** When Alice says "shipment" means "what leaves the warehouse" and Bob says "shipment" means "what the customer ordered," that's gold — a context boundary waiting to be named.
3. **The why-chain prevents projection.** The facilitator doesn't project their model onto the domain. They keep asking why until the domain's own structure emerges.
4. **Noun refinement produces ubiquitous language.** The qualify-refine-separate cycle (passenger → operator passenger → Driver) is how domain vocabulary crystallizes into unambiguous terms.

---

## Who Holds the Threads?

### The Real-World Answer: The Historian

In a group design session, the facilitator doesn't hold the threads alone. There's always someone — the **historian** — whose job is to *write things down*. The facilitator drives the conversation. The historian captures what matters.

This is a critical distinction. The facilitator is focused on flow: "that's interesting, say more about that," "wait — you two just said opposite things." The historian is silently recording:

- "Alice said 'shipment' means what leaves the warehouse"
- "Bob contradicted — he means what the customer ordered"
- "Open question: same concept or two different ones?"
- "Decision: we split Sender and Recipient"

The historian doesn't need deep domain understanding. They need to recognize **what matters**: contradictions, decisions, new terms, open questions, and shifts in understanding. That's a distinct skill from facilitation or domain expertise.

### Why This Matters for Agents

Humans have context windows too. Working memory is finite. When a meeting runs long, early insights get compressed or lost — both for the AI and for the human domain expert in the conversation. The historian compensates for both.

In human practice, note-taking is a **learned skill**. People are taught to capture:
- What was **decided** (not just discussed)
- What was **contradicted** (not just stated)
- What was **named** (new terms, renamed terms, retired terms)
- What was **deferred** (explicit open questions)

Agents need this skill too — and critically, they need to exercise it **without being prompted**. A human historian doesn't wait to be told "write that down." They recognize significance as it happens and record it. An agent historian should do the same.

### The Architecture

This resolves the "who holds the threads" question cleanly:

**The threads live in the notes, not in any agent's head.**

```
┌──────────────────────────────────────────────────┐
│  HISTORIAN AGENT  (always listening)              │
│                                                   │
│  Watches:  conversation between user & agents     │
│  Writes:   session log, open questions,           │
│            contradictions, decisions, new terms    │
│  Never:    asks questions, makes design decisions  │
│                                                   │
│  Output format: timestamped markdown notes        │
│  Storage: session-scoped files, rolled up into    │
│           cross-session summaries                 │
└──────────────────────────────────────────────────┘
```

The historian agent is **not the facilitator**. It doesn't route conversations or invoke specialists. It listens and writes. Other agents read its notes to recover context they've lost — and the human reads them to remember what happened three sessions ago.

This mirrors how shared artifacts already work in the existing use-case-designer (markdown files as the integration layer), but adds a dedicated agent responsible for capturing the *process* of discovery, not just its *products*.

### What the Historian Captures vs. What Specialist Agents Write

| Historian writes | Specialist agents write |
|-----------------|----------------------|
| "We discussed splitting Customer into Sender and Recipient" | ACTOR-CATALOG.md entry for Sender |
| "Open question: does Driver belong in Logistics or Fleet?" | DC-03-fleet-management.md |
| "Contradiction: 'shipment' means different things to warehouse and delivery" | GLOSSARY.md entries |
| "Decision: bounded context boundary between Warehouse and Logistics" | Domain context definitions |
| "Alice's insight: 'we don't track packages, we track promises'" | Nothing — this is raw material, not yet an artifact |

The last row is crucial. The historian captures things that aren't ready to become artifacts yet. Raw insights, half-formed ideas, metaphors the domain expert used — these are the seeds that specialist agents will later formalize. Without the historian, they vanish when the context window compresses.

---

## What This Means for the Repository

The use-case-designer-agent repo becomes Phase0 — a broader bounded-context discovery system where use case design is one stage in a larger extraction pipeline. The existing agent, guidance, and samples remain valid; they just become one layer in a deeper stack.

### Immediate Next Steps

1. **Formalize this vision** into guidance documents that parallel the existing `UC-MODEL-DESIGN-PHASES.md` but cover the full discovery lifecycle.
2. **Design the Actor Discovery Agent** first — the noun-refinement process (qualify → refine → separate) is concrete enough to build now and provides the clearest bridge to the existing use-case-designer.
3. **Restructure the repo** to reflect that use-case design is one capability within Phase0, not the whole system.
4. **Eat our own dogfood** — use the Socratic method to discover Phase0's own bounded contexts, actors, and use cases.
