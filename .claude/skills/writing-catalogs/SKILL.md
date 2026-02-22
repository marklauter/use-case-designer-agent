---
name: writing-catalogs
description: This skill should be used when the user asks to "write an index", "create a catalog", "update the index file", or when an agent needs to create or update index files during design work. Loads the structural contract and the creation script.
---

!`cat .claude/modeling-contracts/forms/catalog.md`

## Creating and updating catalogs

Use the `create-catalog.sh` script to create new catalog files. The script creates the topic directory and `index.md` skeleton. Does nothing if the index already exists.

```
bash .claude/scripts/create-catalog.sh <model-dir> <topic> <description>
```

- **model-dir** — path to the model directory (e.g., `models/marklauter/github-wiki-agent`)
- **topic** — the artifact type folder (e.g., `actors`, `use-cases`, `events`)
- **description** — one sentence describing what this artifact type represents in the model

The script outputs the index file path. After creation, add entries using Edit as artifacts are created. Keep the index in sync — update it whenever an artifact is added, removed, or renamed.
