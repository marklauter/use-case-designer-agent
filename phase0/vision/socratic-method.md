# The Socratic method

Phase0 discovers domain models through Socratic dialogue, not top-down architecture. A facilitator asks questions. Domain experts answer. The model emerges from what they say — not from what the facilitator assumes.

This article explains why Socratic extraction works and describes the three core techniques: the why-chain, noun refinement, and contradictions as gold.

---

## Why extraction, not declaration

Most domain modeling tools are top-down. You declare contexts and fill them in. That works when the modeler already understands the domain. It fails when the domain is unfamiliar, contested, or only partially understood — which is most of the time.

Domain discovery is bottom-up extraction through conversation. This is how discovery actually works with domain experts.

The domain expert does not know what a bounded context is. They know that "the warehouse team and the delivery team use the word 'shipment' to mean completely different things." That contradiction *is* a context boundary, discovered through dialogue rather than declared by architects.

---

## Why Socratic extraction works

Four properties make Socratic questioning the right tool for domain discovery.

1. **Domain experts know more than they can articulate upfront.** Asking "tell me everything about your system" produces a fraction of what targeted questioning extracts. The knowledge is there. It needs to be drawn out, not dumped out.

2. **Contradictions between experts reveal real boundaries.** When Alice says "shipment" means "what leaves the warehouse" and Bob says "shipment" means "what the customer ordered," that disagreement is a context boundary waiting to be named.

3. **The why-chain prevents projection.** The facilitator does not project their model onto the domain. They keep asking why until the domain's own structure emerges. The facilitator's job is to surface, not to supply.

4. **Noun refinement produces ubiquitous language.** The qualify-refine-separate cycle turns sloppy vocabulary into precise, unambiguous terms. This is how domain language crystallizes — through dialogue, not dictionaries.

---

## Technique: the why-chain

The why-chain is the simplest and most powerful Socratic technique. The facilitator asks "why" repeatedly until the group converges on the real problem.

Here is how it works in practice:

1. An expert says: "We need to track shipments."
2. The facilitator asks: *Why?*
3. "Customers keep calling about late deliveries."
4. *Why can't you tell them?*
5. "Our warehouse doesn't know what's coming."
6. The real problem surfaces: "We need visibility into the lifecycle of a package from warehouse to doorstep."

The first statement ("track shipments") is a solution disguised as a problem. The last statement is a system boundary — the actual shape of what needs to be built. Every "why" peels back one layer of assumption until the domain's own structure appears.

The why-chain prevents the facilitator from projecting. They are not proposing a model. They are pulling the thread until the experts name the boundary themselves.

---

## Technique: noun refinement

Noun refinement follows a three-step cycle: **qualify, refine, separate**. It turns vague collective nouns into precise actor names with singular goals.

**Qualify.** Start with the sloppy noun and add qualifiers until each variant is distinct.

"The customer" is sloppy. Qualifying reveals three actors with conflicting goals:

- The customer who sends things
- The customer who receives things
- The customer who complains

**Refine.** Compress each qualified phrase into a standalone noun.

- "Customer who sends things" becomes **Sender**.
- "Customer who receives things" becomes **Recipient**.
- "Customer who complains" becomes **Complainant**.

**Separate.** Each noun now carries its own meaning. The qualifier vanishes because the noun absorbed it.

The passenger/Driver example makes the absorption visible. A passenger is someone who rides in a car. The driver is technically a passenger — but it is the *operator* passenger. You refine "operator passenger" to **Driver**. Now you have a standalone noun with a clear goal (be at the destination, via a route they control), distinct from **Passenger** (be at the destination, without having to operate the vehicle). The qualifier "operator" vanished because "Driver" absorbed its meaning entirely.

This is how ubiquitous language emerges naturally. You do not design it. You extract it through dialogue until every name carries its own meaning without needing a qualifier.

---

## Technique: contradictions as gold

When two domain experts use the same word to mean different things, most facilitators treat it as confusion to be resolved. In Socratic domain discovery, it is the most valuable signal in the room.

Alice says "shipment" means what leaves the warehouse. Bob says "shipment" means what the customer ordered. They are both right — in their own contexts. The contradiction tells you that the warehouse team and the fulfillment team operate in different bounded contexts, even though they share vocabulary.

That disagreement *is* the context boundary. It was not declared by an architect. It was discovered through the natural friction of conversation. The facilitator's job is to notice it, name it, and preserve it — not to resolve it by picking one definition.

Contradictions are gold because they surface structural boundaries that no single expert can see from their vantage point. The boundary lives in the gap between perspectives.

---

## Further reading

- [Conditional goals](conditional-goals.md) — the actors, goals, and values that Socratic extraction draws out
