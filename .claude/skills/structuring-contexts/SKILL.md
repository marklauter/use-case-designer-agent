---
name: structuring-contexts
description: Structural contract for bounded context documents. Defines the artifact shape for both reading and writing context files. Load when writing or reviewing bounded context documents.
---

## Structure

Context files live at `contexts/{nn}-{slug}.md` within the model directory. `{nn}` is a zero-padded number (e.g., `01`, `02`) that provides stable ordering. One file per bounded context.

```markdown
# {Title}

## Purpose

{One paragraph. What this bounded context owns — the region of the domain it governs. State the semantic boundary, the core responsibility, and any key preconditions or exclusions that distinguish this context from adjacent ones.}

## Ubiquitous language

{Terms with precise meaning within this context. Each term exists here because it means something specific that may differ from the same word in another context.}

- **{Term}** — {What it means within this context.}

## Use cases

{Use cases that live in this context.}

- use-cases/{nn}-{slug} — {What the use case achieves, in one sentence.}

## Events produced

{Domain events this context emits. The meaningful state transitions that other contexts may react to.}

- events/{nn}-{slug} ({EventName}) — {When it occurs and what it signifies.}

## Events consumed

{Domain events this context reacts to. Events produced by other contexts that trigger or inform behavior here.}

- events/{nn}-{slug} ({EventName}) — {What this context does in response.}

## Integration points

{How this context relates to other contexts. Three relationship types: requires, feeds, shares with.}

- **Requires:** contexts/{nn}-{slug} — {What must be in place and why.}
- **Feeds:** contexts/{nn}-{slug} — {What this context provides and why the other context needs it.}
- **Shares with:** contexts/{nn}-{slug} — {What is shared and the protocol that governs it.}

## Notes

- {Design decisions, open questions, cross-references to actors or invariants.}
```
