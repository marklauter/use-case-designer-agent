# Use case philosophy

Guiding principles for writing use cases in this project. Every use case must reflect these ideas.

## Primary actors have goals; supporting actors have drives

A **primary actor** has a *goal* — a desired end state the system exists to serve. You don't need to explain why they want it. The system is built for them. Their goals always have conditions.

A **supporting actor** has a *drive* — a reason to participate. Drives explain why supporting actors exist at all. They are born from tensions between primary actor goals and the forces of reality.

Consider an elevator system. The Passenger is the primary actor. Their goal is to be on a different floor — safely, without trauma, without excessive waiting, without losing limbs. The system exists to serve that goal. Note: "arrive at a floor" leaks an implementation detail. The Passenger doesn't want to travel — they want to *be there*. The conditions on the goal (safely, promptly, intact) are where system design comes from.

The building Owner is a supporting actor — elevators cost money, so someone must own and maintain them. The Owner's drive is economic: minimize maintenance cost. The government Inspector is also a supporting actor, spawned by the conflict between the Owner's economic drive and the Passenger's safety condition. The Inspector's drive is public safety, born from the state's interest in public welfare.

Now consider this system. The User is the primary actor with a goal. The Creator is a supporting actor whose drive is production — fill pages with content. The Proofreader is a supporting actor whose drive is critique — find what's wrong. The Proofreader exists because the Creator's production drive is insufficient to guarantee accuracy.

Goals and drives both make actors predictable in a modeling sense. You know what a primary actor wants to achieve, and you know what a supporting actor will optimize for — and therefore where it will fall short. An actor is not a tool. A tool has no goal or drive — `grep` does exactly what you tell it. An actor makes decisions shaped by what it cares about.

## Goal conditions create tensions; tensions spawn supporting actors

It is the **conditions** on a primary actor's goal that create tensions. The Passenger doesn't just want to be on a different floor — they want to be there *safely*, *promptly*, *without trauma*. Each condition meets reality and produces a tension. "Safely" collides with the Owner's economic drive to minimize cost. "Promptly" collides with building capacity and demand patterns. Each tension spawns supporting actors with drives that address what a single actor cannot.

The Owner's cost-minimization drive is insufficient to protect the Passenger's safety condition — so the Inspector exists, with a drive born from the state's interest in public welfare. The Creator's production drive is insufficient to guarantee accuracy — so the Proofreader exists, with a drive toward critique.

This is not about malice. The Owner isn't trying to hurt Passengers. The Creator isn't trying to produce inaccurate content. But a single drive cannot serve competing concerns. Separation of actors is the structural answer to conflicts of interest.

Every supporting actor has a genealogy — you can trace *why* they exist back to a tension involving a primary actor's goal. If you can't trace that lineage, the actor shouldn't exist in the model.

Ask "what tension demands this actor, and what drive resolves it?"

## Goal conflicts spawn actors

Supporting actors do not emerge from job descriptions or org charts. They emerge from tensions between a primary actor's goal and the drives of existing actors.

The Inspector exists because the Owner's economic drive alone won't protect the Passenger's safety goal. The Proofreader exists because the Creator's production drive alone won't protect accuracy. In each case, the supporting actor is born from a specific, nameable conflict.

If there is no tension — no gap between what existing actors optimize for and what the primary actor's goal requires — there is no reason for a new actor.

## Goals are conditional

A primary actor's goal is a **conditional goal**: a desired end state plus the values the actor holds about how they exist in that state. A conditional goal is a **value statement** — it expresses not just *where* the actor wants to be, but *what they value* about being there.

### Desired state, not path

The end state describes where the actor wants to *be*, not how they get there. "Arrive at the 5th floor" leaks an implementation detail — it assumes travel. The real end state is "be on the 5th floor." If a genie could teleport the Passenger, the goal is satisfied. The verb "arrive" contaminates the goal with a solution path.

Apply the gift test: "I want to have a guitar" is a goal. "I want to buy a guitar" is a task disguised as a goal. If someone gifts you the guitar, you don't care that you didn't buy it. The goal was *having*, not *buying*. Buying was one path to having. If your goal statement would be satisfied by a shortcut that skips the described action, then you've written a task, not a goal.

### The conditions are values

"Be on the 5th floor" is the desired state, but it isn't the whole goal. The Passenger also values their physical integrity. They value their time. They value their psychological comfort. The conditional goal is: be on the 5th floor, safely, promptly, without trauma, with all my limbs. These conditions are not acceptance criteria bolted on by an engineer. They are expressions of what the actor **values**. They *are* the goal — a conditional goal is incomplete without them.

A Passenger who reaches the 5th floor having lost an arm did not achieve their goal — because physical integrity was part of what they valued, not an optional extra.

### Value conditions drive the entire system design

The value conditions shape the system more than the destination does. "Floor 5" tells you nothing about system design. The values tell you everything:

- **"Safely"** collides with the Owner's economic drive → spawns the Inspector
- **"Promptly"** collides with building capacity → produces elevator scheduling (why hotels bias upper floors in the morning and offices bias lower)
- **"Without trauma"** demands maintenance standards, emergency protocols, communication during delays
- **"Without being trapped"** demands redundancy, monitoring, rescue procedures

A spec says "elevator must not free-fall." A value says "I don't want to lose my limbs." The spec is one implementation of the value. You can satisfy the value in ways the spec never imagined. Designing from values keeps the solution space open. Designing from specs closes it prematurely.

### The derivation chain

Everything in the system traces back to conditional goals:

```
Primary actor
  → conditional goal (desired state + value conditions)
    → value conditions meet reality → tensions
      → tensions spawn supporting actors (each with a drive)
        → system design (invariants, use cases, bounded contexts)
```

Ask "what state of the world does the actor want to be in, and what do they value about being in that state?" not "what commands does the actor run?"

## Invariants over preconditions

Domain rules are not entry gates you check once. They are constraints that must hold continuously — before, during, and after execution. An actor that violates an invariant mid-scenario has failed, even if the final output looks correct.

Express constraints as invariants, not as preconditions or validation steps.

## Domain events over return values

Actors communicate through meaningful state transitions, not function returns. A drift assessment, a filed finding, a change report — these are domain events. They are the published language between bounded contexts.

Name them. Define them. They are the integration points of the system.

## Markdown is the wire format

Protocols, domain events, reports, and assessments are all materialized as markdown. Not JSON. Not YAML. Not protocol buffers. The consumers are humans and LLM agents, and markdown is the format both read natively. Formal machine-readable schemas are not needed when every consumer is a capable reader.

This is a deliberate choice, not a shortcut. A system whose integration points are optimized for human and AI consumption does not need a serialization layer between them.

## Obstacles over exceptions

When something goes wrong, describe the threat to the goal — not the error code. "Source code is unreachable" tells you what's at risk. "Exit code 128" tells you nothing about what to do next.

Frame failures as goal obstacles with recovery strategies, not try/catch blocks.

## Intent over mechanics

Scenario steps express what is accomplished, not how. "Wiki content is verified against current source" gives an actor room to find the best path. "Run grep on lines 1-50 of each file" does not.

The actor's job is to satisfy intent. The use case's job is to express it clearly.

## Bounded contexts over shared models

Each use case lives in a bounded context with its own language and its own rules. Proofread and resolve share a published language (the issue body protocol) but operate independently. They do not share internal state.

Respect boundaries. Define protocols at every crossing point.

## Single responsibility for actors

Creators write. Researchers explore. Proofreaders review. Orchestrators coordinate. An actor that both decides what to write and evaluates whether it wrote well has two jobs and will do both poorly.

This is a corollary of the goal/drive distinction. A primary actor has one goal. A supporting actor has one drive. A Creator's drive is production. A Proofreader's drive is critique. An actor with both drives will compromise between them — producing content that is "good enough" rather than content that is excellent and then separately verified. Two actors with opposing drives produce better outcomes than one actor trying to balance competing concerns.

Separate judgment from execution. Separate analysis from mutation.

## Nouns, verbs, and objects

- **Actors** are nouns. Proofreader, Creator, Corrector, Commissioning orchestrator. They're *who*.
- **Use cases** are verbs. Populate New Wiki, Review Wiki Quality, Sync Wiki with Source Changes. They're *what happens*.
- **Events** are nouns — past participles used as nouns. WikiPopulated, FindingFiled, WikiSynced. They're *what was produced*, the fact that something happened.

If you catch yourself naming an actor with a verb or a use case with a noun, something is off.

## Extract, don't invent

Use case design is Socratic. The designer asks questions; the domain expert has the answers. The designer's job is to draw out goals, constraints, and events that the expert already knows but hasn't structured — not to fabricate domain knowledge or infer requirements from silence.

Work one phase at a time: goal, then invariants, then domain events, then scenario and obstacles. Summarize what you heard before moving on. If the answer is task-oriented ("it runs git pull"), redirect to intent ("what state does that achieve?"). If something contradicts a principle in this document, flag it.

The user knows the domain. The designer knows how to structure it.
