---
name: obsidian-vault
description: Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian.
---

# Obsidian Vault

## Vault location

`/Users/nic/Obsidian Vault/`

Mostly flat at root level.

## Naming conventions

- **Index notes**: aggregate related topics (e.g., `Ralph Wiggum Index.md`, `Skills Index.md`, `RAG Index.md`)
- **Title case** for all note names
- No folders for organization - use links and index notes instead

## Linking

- Use Obsidian `[[wikilinks]]` syntax: `[[Note Title]]`
- Notes link to dependencies/related notes at the bottom
- Index notes are just lists of `[[wikilinks]]`

## Learning logs

Per-topic logs of grilling sessions (e.g. `Observability Learning Log.md`), tracked from the [[Learning Logs Index]]. One file per topic, appended to over time — don't create a new note per session.

Each dated entry uses this template:

```markdown
## YYYY-MM-DD — <doc/topic>

Context: <one line — what was read/discussed before grilling>

**Learned:**
- <fact 1, stated as fact, no "you said/I guessed">
- <fact 2>

**Question log:** (guess -> correction, one line each)
- "<quote or paraphrase of the guess>" -> <what was actually right>

**Pattern:** <one line on how the questioning/instincts trended this session>
```

- **Learned** is pure reference — must stand alone and read correctly a year later with zero session context.
- **Question log** stays terse (one line per item) — it's tracking the evolution of instincts, not re-litigating the conversation.
- **Pattern** is one line, not a paragraph.

## Workflows

### Search for notes

```bash
# Search by filename
find "/mnt/d/Obsidian Vault/AI Research/" -name "*.md" | grep -i "keyword"

# Search by content
grep -rl "keyword" "/mnt/d/Obsidian Vault/AI Research/" --include="*.md"
```

Or use Grep/Glob tools directly on the vault path.

### Create a new note

1. Use **Title Case** for filename
2. Write content as a unit of learning (per vault rules)
3. Add `[[wikilinks]]` to related notes at the bottom
4. If part of a numbered sequence, use the hierarchical numbering scheme

### Find related notes

Search for `[[Note Title]]` across the vault to find backlinks:

```bash
grep -rl "\\[\\[Note Title\\]\\]" "/mnt/d/Obsidian Vault/AI Research/"
```

### Find index notes

```bash
find "/mnt/d/Obsidian Vault/AI Research/" -name "*Index*"
```
