# Structuring use cases

A use case file captures one goal pursued by one primary actor — the desired end state, the scenario that achieves it, the invariants that constrain it, and the obstacles that threaten it.

## Structure

Use case files live at `use-cases/{nn}-{slug}.md` within the model directory. `{nn}` is a zero-padded number (e.g., `01`, `02`) that provides stable ordering.

```markdown
# {nn} — {Title}

## Goal

{Desired end state the actor is trying to reach. Express the state of the world the actor wants to exist in. Goals are stable — they survive model upgrades, tool changes, and prompt rewrites.}

## Context

- **Bounded context:** contexts/{nn}-{slug}
- **Primary actor:** actors/{nn}-{slug}
- **Supporting actors:** actors/{nn}-{slug}, actors/{nn}-{slug}
- **Trigger:** {What prompts the actor to pursue this goal}

## Actor responsibilities

{Which actor owns each concern — what it produces, what it consumes, what judgment it applies. Internal data contracts between actors are defined here.}

- **{actor-name}** — {what it owns, what it produces, what it consumes}

## Invariants

{Domain rules that must hold continuously — before, during, and after this use case. An actor that violates an invariant mid-scenario has failed, even if the final output looks correct.}

- {invariant}

## Success outcome

{Observable state of the world when the goal is satisfied. Expressed in domain terms.}

- {outcome}

## Failure outcome

{Observable state when the goal remains unmet. What is preserved? What is the user told?}

- {outcome}

## Scenario

{Steps express intent and outcomes. "Wiki content is verified against current source" gives an actor room to find the best path. Step ordering reflects what the actor values — arrange the interaction so that the actor's values are protected at every point. Domain events (marked with -->) signal meaningful state transitions.}

1. **{Actor}** — {Intent / outcome}
   --> {DomainEvent}
2. **{Actor}** — {Intent / outcome}
3. **{Actor}** — {Intent / outcome}

## Goal obstacles

{Conditions that threaten goal satisfaction. Keyed to scenario steps. Describe what is at risk — "source code is unreachable." Each obstacle includes a recovery strategy: a way to protect the goal or degrade gracefully.}

### {Step}a — {What threatens the goal}

1. **{Actor}** — {Response}
2. **{Actor}** — {Recovery or graceful degradation}

## Domain events

{Events this use case produces. Published events cross bounded context boundaries or are observable to the user — each has its own file in events/. Internal events coordinate within this use case and are defined here only.}

### Published

- **{EventName}** (events/{nn}-{slug}) — {when it occurs and what it signifies}

### Internal

- **{EventName}** — {when it occurs and what it signifies}

## Notes

- {Design decisions, open questions, cross-references to other use cases}
```
