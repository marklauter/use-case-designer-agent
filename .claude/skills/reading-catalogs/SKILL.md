---
name: reading-catalogs
description: This skill should be used when the user asks to "read an index", "review the catalog", "browse artifacts", "check what exists", or when an agent needs to understand the structure of index files. Loads the structural contract for catalog documents.
---

!`cat .claude/modeling-contracts/forms/catalog.md`

## Reading catalogs

Each topic folder (`actors/`, `contexts/`, `events/`, `invariants/`, `use-cases/`) contains an `index.md`.

- **Catalogs are entry points** — read the index before drilling into individual artifacts. The one-sentence description per entry gives enough context to decide which files to read in full.
- **Cross-references vary by type** — actor entries show use case participation and drive. Event entries show producer and consumers. Use case entries show bounded context and primary actor. The form documents each type's cross-reference pattern.
- **Ordering** — entries are ordered by numeric prefix, matching the file ordering in the folder.
- **Referencing style** — siblings use bare `{nn}-{slug}`. Cross-topic references use `{namespace}/{nn}-{slug}`. No markdown link syntax.
