# Agent.md

Guidelines for AI assistants that create or update documentation in this repository.

## Scope and Intent

- Repository: `dynamsoft-docs/web-twain-docs`
- Product: Dynamic Web TWAIN documentation
- Primary goal: produce accurate, consistent Markdown docs that match existing repo conventions.
- Keep changes focused. Do not mix docs updates with local tooling/script changes unless explicitly requested.

## Branching and PR Base

- For normal docs work, branch from `preview` unless a different base is explicitly requested.
- Keep each PR focused on one topic (for example: one FAQ issue, one API clarification, one guide update).
- Avoid unrelated edits, formatting-only churn, and broad timestamp sweeps.

## File Placement

- FAQ pages live in `_articles/faq/`.
- General guides live in `_articles/general-usage/` or `_articles/extended-usage/`.
- API reference pages live in `_articles/info/api/`.
- When adding a new FAQ, also update `_articles/faq/index.md`.

## Frontmatter Rules

Use existing files in the same folder as the source of truth.

### FAQ page template

```yaml
---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: <question>
keywords: Dynamic Web TWAIN, <topic keywords>
breadcrumbText: <same as title>
description: <same as title, or concise variant>
date: YYYY-MM-DD HH:mm:ss ±HHMM (or ±HH:MM)
last_modified: YYYY-MM-DD HH:mm:ss ±HHMM (or ±HH:MM)
---
```

### Non-FAQ docs template (common)

```yaml
---
layout: default-layout
needAutoGenerateSidebar: true
title: <page title>
keywords: Dynamic Web TWAIN, <topic keywords>
breadcrumbText: <short breadcrumb label>
description: <concise summary>
---
```

Notes:
- `noTitleIndex` is common for FAQ and selected index-style pages; match nearby files.
- If updating an existing FAQ, update `last_modified` to current edit time and match the exact datetime/offset format used by nearby files in the same folder.

## FAQ Content Pattern

For `_articles/faq/*.md`, match this structure:

1. Category H1 (for example `# Addon`, `# Security`, `# Capture/Image Source`)
2. Question H2 (`## ...?`)
3. Direct answer first
4. Steps or code sample if applicable
5. Optional notes (`> [!NOTE]`) and related links

Keep answers practical and implementation-oriented.

## Writing Style

- Be concise, technical, and specific.
- Prefer product terminology already used in repo:
  - `DWTObject`
  - `LoadImage()` / `LoadImageEx()`
  - `SetReaderOptions()`
  - `OnPostLoad`
- Do not introduce unsupported behavior claims.
- Do not mention internal tickets, private case history, or customer-identifying details in public docs.

## Linking and API References

- Use internal absolute doc links like:
  - `/_articles/info/api/WebTwain_IO.md#loadimageex`
- Link API names to canonical API pages when mentioning methods/events.
- Prefer existing anchor patterns used in nearby docs.
- Keep external links to official pages only when necessary.

## Code Snippet Rules

- Use fenced code blocks with language tags (typically `javascript`, `html`, `bash`).
- Keep snippets minimal but runnable.
- Reuse existing coding style from surrounding docs:
  - 4-space indentation in JS snippets is common.
  - `DWTObject` naming is preferred in examples.

## Safety and Accuracy Checks

Before submitting changes:

1. Verify every method/event name against `_articles/info/api/`.
2. Verify error code/value statements against docs or validated support guidance.
3. Ensure links resolve and anchors are valid.
4. Ensure new FAQ is added to `_articles/faq/index.md` in the correct section.
5. Ensure git diff includes only intended docs files.

## Do Not Do

- Do not edit local development scripts (`scripts/*.sh`, local-only files) for a docs-only task unless asked.
- Do not reformat large unrelated sections.
- Do not rename files casually; preserve existing URL paths.
- Do not add AI/meta commentary into user-facing docs.
