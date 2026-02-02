---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Does the Dynamic Web TWAIN SDK use any deprecated technologies like NPAPI or ActiveX?
keywords: Dynamic Web TWAIN, Security, end user, deprecated, NPAPI, ActiveX
breadcrumbText: Does the Dynamic Web TWAIN SDK use any deprecated technologies like NPAPI or ActiveX?
description: Does the Dynamic Web TWAIN SDK use any deprecated technologies like NPAPI or ActiveX?
date: 2021-11-29 18:33:59 +0800
last_modified: 2026-01-23 06:40:36 -08:00
---

# Security

## Does the Dynamic Web TWAIN SDK use any deprecated technologies like NPAPI or ActiveX?

Dynamic Web TWAIN no longer uses NPAPI. ActiveX support was removed starting in v19.0 (see the [Removed Features](/_articles/info/schedule/Stable.md#removed-features){:target="_blank"} in the release notes).

We added HTML5 support long before Chrome dropped NPAPI, so web scanning remains supported without deprecated tech. Customers should migrate off ActiveX; modern versions require the HTML5 edition.
