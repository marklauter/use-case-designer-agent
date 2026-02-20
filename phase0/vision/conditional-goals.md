# Conditional goals

A conditional goal is the foundational modeling concept in Phase0. It is a desired end state plus the values the actor holds about how they exist in that state. Every actor, every tension, every supporting role, and every piece of system design traces back to a conditional goal. This article develops the concept from first principles and shows how the entire system design derives from it.

---

## The entry point: actors and goals

Alan Cooper's goal-directed design begins with two questions:

1. **Who is involved?** — primary actors.
2. **What are their goals?** — desired end states.

That is the entry point. Not problem statements, not domain narratives, not "what keeps you up at night." Those are facilitation techniques — useful for starting a conversation, but they are not modeling concepts. The modeling starts with actors and goals.

---

## What a conditional goal is

A primary actor's goal is a **conditional goal**: a desired end state plus the values the actor holds about how they exist in that state. A conditional goal is a **value statement**.

It has two parts:

- **The desired state** describes where the actor wants to *be*, not how they get there. It is a state of the world, not a sequence of steps.
- **The value conditions** express what the actor values about being in that state. They are not acceptance criteria bolted on by an engineer. They are the actor's values. They *are* the goal.

A Passenger's conditional goal: *be on a different floor — safely, promptly, without trauma, with all my limbs.*

The desired state is "be on a different floor." The value conditions are safety, promptness, psychological comfort, and physical integrity. A Passenger who reaches floor 5 missing an arm did not achieve their goal — because physical integrity was part of what they valued, not an optional extra.

---

## The gift test

The desired state describes where the actor wants to *be*, not how they get there. "Arrive at a new floor" leaks an implementation detail — it implies travel. The real end state is "be on a different floor." If a genie could teleport the Passenger, the goal is satisfied.

The gift test distinguishes goals from tasks:

- "I want to have a guitar" is a goal.
- "I want to buy a guitar" is a task disguised as a goal.

If someone gifts you the guitar, you don't care that you didn't buy it. The goal was *having*, not *buying*. Buying was one path to having.

If your goal statement would be satisfied by a shortcut that skips the described action, you have written a task, not a goal.

---

## Value conditions drive system design

The destination tells you nothing about system design. The values tell you everything.

"Floor 5" does not shape a single design decision. The value conditions do:

- **"Safely"** collides with economic pressure — someone must ensure physical protection even when cost-cutting is tempting.
- **"Promptly"** collides with building capacity and demand patterns — someone must manage throughput so passengers do not wait indefinitely.
- **"Without trauma"** demands maintenance standards, emergency protocols, and communication during delays.
- **"With all my limbs"** demands engineering constraints that prevent catastrophic mechanical failure.

A spec says "elevator must not free-fall." A value says "I don't want to lose my limbs." The spec is one implementation of the value. You can satisfy the value in ways the spec never imagined. Designing from values keeps the solution space open. Designing from specs closes it prematurely.

---

## Drives belong to supporting actors

A **drive** is a supporting actor's reason to participate. Drives are born from tensions between the value conditions on a primary actor's goal and the forces of reality.

A single drive cannot serve competing concerns. The building Owner's drive is economic — minimize cost. That drive alone is insufficient to protect the Passenger's safety value. The tension between the Owner's economic drive and the Passenger's safety value demands resolution by a third party. That is where the Inspector comes from.

This is not about malice. The Owner is not trying to hurt Passengers. But separation of actors is the structural answer to conflicts of interest.

---

## The elevator example

The full derivation of the elevator system, from a single conditional goal:

- **Passenger** is the primary actor. Their conditional goal is: *be on a different floor — safely, promptly, without trauma, with all my limbs.* The system exists to serve them.
- **Owner** is a supporting actor. Their drive is economic interest — minimize cost. They exist because elevators cost money; someone must own and maintain them.
- **Inspector** is a supporting actor. Their drive is public safety. They are spawned by the tension between the Owner's economic drive and the Passenger's *safety* value. The state's interest in public welfare demands a third party who is not economically motivated to cut corners.
- **Scheduler** is a supporting actor. Their drive is efficiency — optimize throughput. They are spawned by the Passenger's *promptness* value colliding with building capacity. This is why hotels bias upper floors in the morning and offices bias lower.

Notice: the Inspector does not exist because "regulations require inspections." The Inspector exists because the Passenger's safety value collides with the Owner's economic drive, and that tension *demands* resolution by a party whose drive is public welfare. The regulation is an implementation detail. The tension is the modeling concept.

---

## The derivation chain

Everything in the system traces back to primary actor values:

```
Primary actor
  → conditional goal (desired state + value conditions)
    → value conditions meet reality → tensions
      → tensions spawn supporting actors (each with a drive)
        → system design (invariants, use cases, bounded contexts)
```

This chain is not a process you perform once. It is a genealogy you can read at any time. Pick any element of the system design — an invariant, a use case, a bounded context — and trace it back through the chain. If you reach a primary actor's value condition, the element belongs. If the chain breaks, the element is unjustified.

---

## The genealogy test

Every supporting actor has a genealogy. You can trace *why* they exist back to a specific value condition on a specific primary actor's goal.

Ask: "What tension demands this actor, and what drive resolves it?"

If you cannot answer that question, the actor should not exist in the model. An actor without a genealogy is an assumption that has not been tested — a role borrowed from an org chart or a job description rather than derived from the forces at play.

---

## The discovery order

The discovery order follows directly from the derivation chain:

1. **Who are the primary actors?** — Cooper's first question.
2. **What are their conditional goals?** — desired state plus value conditions.
3. **What tensions do those value conditions create when they meet reality?**
4. **What supporting actors do those tensions spawn?** — each with a drive explaining their participation.

This is not a facilitation script. It is the logical order in which modeling concepts become available. You cannot identify tensions before you know the value conditions. You cannot derive supporting actors before you know the tensions.

---

## Further reading

- [The discovery process](discovery-process.md) — how a facilitated session unfolds, following this discovery order through four natural rounds
- [The Socratic method](socratic-method.md) — why Socratic extraction works for drawing out the actors, goals, and values that conditional goals require
