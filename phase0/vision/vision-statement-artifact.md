# The vision statement artifact

The vision statement is Phase0's product. It is the single artifact that captures who the system serves, what they value, and what forces shape the design. Everything downstream — use cases, bounded contexts, domain events, protocols — is elaboration of the vision. Nothing downstream can be justified without tracing back to it.

This article describes what the artifact looks like, what it contains, and how you know when it is done.

---

## The three questions

A vision statement answers three questions. Each answer has a specific shape.

**1. Who does this system serve?**

The answer is a set of **primary actors** — the people (or systems) whose goals the system exists to satisfy. Each primary actor is a standalone noun with a singular goal. Not "customer" — that is too broad. Sender, Recipient, Complainant. The qualifier has been absorbed into the noun. If the actor still needs a qualifier to distinguish it, refine further.

**2. What do they value?**

Each primary actor has a **conditional goal**: a desired end state plus value conditions. The desired state says where the actor wants to *be*, not how they get there. The value conditions say what the actor values about being in that state. Together they form a value statement.

Example: a Sender's conditional goal is *package is at its destination — safely, on time, intact.* The desired state is "package is at its destination." The value conditions are safety, timeliness, and physical integrity. Each value condition is a design driver. See [Conditional goals](conditional-goals.md) for the full theory.

**3. What forces are at play?**

Value conditions collide with reality. Each collision is a **tension**. Each tension either spawns a **supporting actor** with a drive that resolves it, or is acknowledged as unresolved. The set of tensions and supporting actors describes the forces that shape the system.

---

## Structure of a vision statement

A complete vision statement contains four sections.

**Primary actors and their conditional goals.** For each primary actor: the actor name, the desired end state, and the explicit value conditions. No actor appears without a conditional goal. No conditional goal appears without value conditions.

**Tensions.** For each value condition that collides with reality: what the tension is, which actor's value condition it threatens, and what real-world force creates the collision. Tensions are named by what they put at risk, not by the solution that resolves them.

**Supporting actors.** For each tension that demands a new participant: the actor name, their drive, and which tension spawned them. Every supporting actor's drive traces back through a tension to a specific value condition on a specific primary actor's conditional goal. This is the genealogy — break the chain and the actor is unjustified.

**System boundary.** A rough statement of what is inside the system and what is outside. Not a detailed architecture. Just enough to know where the system ends and the rest of the world begins.

---

## Completeness criteria

A vision statement is done when five conditions hold:

1. Every primary actor has a conditional goal with explicit value conditions.
2. Every value condition has been tested against reality to surface tensions.
3. Every tension has been resolved by a supporting actor, or explicitly acknowledged as unresolved.
4. Every supporting actor's drive traces back to a specific tension on a specific primary actor's value condition — the genealogy test passes.
5. The system boundary is clear enough that you can say what is inside and what is outside.

If any of these conditions fails, the vision is incomplete. Go back to the facilitator and keep asking.

---

## What the vision statement is not

The vision statement is not use cases. Use cases describe sequences of interaction; the vision describes the forces that make those interactions necessary.

It is not a domain model. Domain models describe entities, aggregates, and their relationships; the vision describes the actors and values those entities exist to serve.

It is not bounded contexts. Bounded contexts partition the domain into autonomous regions of meaning; the vision describes the tensions from which those boundaries emerge.

All of those come after. They are elaboration. The vision is the foundation from which they are elaborated.

---

## The handoff

The vision statement is where Phase0's work ends and downstream work begins. It feeds into the use-case-designer agent, which structures use cases from the actors, goals, and tensions the vision provides. It feeds into domain modeling, which formalizes the entities and contexts that the vision's tensions and boundaries imply.

Phase0 produces the foundation. Everything else builds on it.

---

## Further reading

- [The manifesto](manifesto.md) — where the three questions are introduced
- [Conditional goals](conditional-goals.md) — the theory that structures the artifact
