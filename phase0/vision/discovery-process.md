# The discovery process

Phase0 discovers systems through facilitated group dialogue rather than upfront architecture. A facilitator leads domain experts through four rounds of Socratic questioning. Each round sharpens the picture: from a vague problem statement to named actors, surfaced tensions, and use cases that fall out naturally. This article walks through the four rounds and shows how they connect.

## Round 1: what is this thing?

The facilitator asks domain experts one question: *"What problem are you trying to solve?"* Not "what system do you want" — what **problem**.

The answers are messy, overlapping, contradictory. One person says "we need to track shipments." Another says "customers keep calling about late deliveries." A third says "our warehouse doesn't know what's coming."

These are all symptoms of the same system, but nobody has named it yet.

The facilitator keeps asking *why* until the group converges on something like: "We need visibility into the lifecycle of a package from warehouse to doorstep." That statement is a system boundary. It is also the first bounded context candidate — though nobody calls it that yet.

The goal of Round 1 is convergence. Symptoms become a shared description of the problem space. Everything that follows builds on this boundary.

## Round 2: who touches this?

The facilitator asks: *"Who interacts with this?"*

The group offers rough answers: "the customer," "the warehouse guy," "the driver," "the dispatcher." But these are sloppy. "The customer" might be three different primary actors with conflicting goals:

- The **Sender** — goal: the package is at its destination, safely, on time, intact
- The **Recipient** — goal: the package is in their possession, predictably, conveniently
- The **Complainant** — goal: the problem is resolved, fairly, promptly

Each of these is a conditional goal: a desired end state plus value conditions. The Sender does not want to "send a package" — that is a task. The Sender wants the package to *be there*. Safely. On time. Intact. Those value conditions are where system design comes from.

The Socratic refinement works by qualifying until the qualifiers disappear and you have standalone nouns with singular goals. "Customer who sends things" becomes Sender. "Customer who receives things" becomes Recipient.

Consider another example: a passenger is someone who rides in a car. Technically the driver is a passenger — but it is the *operator* passenger. You refine "operator passenger" to Driver. Now you have a standalone noun with a clear goal (be at the destination, via a route they control), distinct from Passenger (be at the destination, without having to operate the vehicle). The qualifier vanished because the noun absorbed it.

This is how ubiquitous language emerges naturally. You do not design it — you extract it through dialogue until every name carries its own meaning without needing a qualifier.

## Round 3: what goes wrong?

This is the round most methodologies skip but Cooper never does. The facilitator asks domain experts: *"What keeps you up at night?"*

The answers reveal where value conditions collide with reality:

- "Packages get lost between warehouse and truck." The Sender's *intact* value is threatened.
- "Two drivers show up for the same route." The Recipient's *predictably* value is threatened.
- "Customer calls and nobody knows where the package is." The Sender's *on time* value and the Complainant's *fairly* value are both threatened.

Each of these is a **tension** — a value condition meeting the forces of reality.

Tensions are where bounded contexts crystallize. The "lost package" problem lives at the boundary between warehouse and logistics. That boundary *is* the context boundary, discovered through conflict rather than declared by architects.

Tensions also spawn supporting actors. "Nobody knows where the package is" creates a tension that demands a **Tracker** — a supporting actor whose drive is visibility (know where every package is at all times). The Tracker exists because no primary actor's goal alone will produce package tracking. The tension between the Sender's values and operational reality *demands* it.

## Round 4: use cases emerge naturally

By Round 4, the group has assembled the raw material:

- Primary actors with conditional goals
- Supporting actors with drives
- Tensions at boundaries
- A rough sense of the system's shape

Use cases are not invented at this point — they fall out. "The Dispatcher assigns routes" is not something you design; it is something the domain experts have been doing, and now you have given it a name.

The four rounds move from vague symptoms to precise, named constructs. Each round narrows the space: Round 1 draws the boundary, Round 2 populates it with actors and goals, Round 3 stress-tests those goals against reality, and Round 4 lets the process artifacts crystallize into use cases ready for detailed specification.

## Further reading

- [Conditional goals](conditional-goals.md) — the theory behind the actor refinement in Round 2 and the tension analysis in Round 3
- [The Socratic method](socratic-method.md) — the facilitation techniques that drive each round
