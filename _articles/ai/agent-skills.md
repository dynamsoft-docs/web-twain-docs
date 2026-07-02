---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Agent Skills | Dynamic Web TWAIN Documentation
keywords: Dynamic Web TWAIN, Documentation, Agent Skills
breadcrumbText: Agent Skills
description: This post teaches you how to use Dynamic Web TWAIN's offical agent skills.
---

# Agent Skills

Agent Skills are structured instruction files that teach AI agents how to use Dynamic Web TWAIN in your web apps accurately and efficiently. They work with Claude Code, Cursor, Codex, and other AI agents.

You can run the following command to install the skills:

```bash
npx skills add https://github.com/Dynamsoft/web-twain-samples/
```

## Example Prompts

Try the following prompts after installing. Your AI agent will automatically use the installed skills:

| Prompt | Description |
|--------|-------------|
| Please create a component to use Dynamic Web TWAIN for document scanning in this angular app. Just a scan button to perform scanning and view the document in a viewer. | Use Web TWAIN in an existing Angular project. |
| Please write an html file which loads Web TWAIN via CDN. The page contains a scan button, which triggers scanning with the scanner ui. The scanned images are displayed in Web TWAIN's viewer. | Create a plain JavaScript HTML file to scan documents. |
| What is Dynamic Web TWAIN service? | Ask questions about Web TWAIN. |


## Additional Resources

* [GitHub repo](https://github.com/Dynamsoft/web-twain-samples/tree/main/skills)
* [Agent Skills documentation](https://agentskills.io/home)
