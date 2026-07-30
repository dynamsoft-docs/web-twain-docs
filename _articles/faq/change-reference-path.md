---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I change the reference path to the Dynamsoft resources in my project?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, reference path, resources path, 2803, 2804
breadcrumbText: How can I change the reference path to the Dynamsoft resources in my project?
description: How can I change the reference path to the Dynamsoft resources in my project?
date: 2021-07-14 18:58:25 +0000
last_modified: 2026-07-29 00:00:00 +0000
---
View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How can I change the reference path to the Dynamsoft resources in my project?

If you encounter either of the following errors in the browser console,

> {"code": -2803, "message": "Loading the WebTwain JavaScript source files failed."}  
> {"code": -2804, "message": "Loading the WebTwain css files failed."}

it usually means that Dynamic Web TWAIN cannot locate its runtime resources.

This article explains how Dynamic Web TWAIN locates its resources and how to correctly configure the resource path after moving or renaming the **Resources** folder.

## How Dynamic Web TWAIN loads its resources

Dynamic Web TWAIN loads its resources in two stages.

1. Your HTML page first loads the two entry JavaScript files.

2. After initialization, Dynamic Web TWAIN loads all remaining JavaScript files, CSS files according to the value of `Dynamsoft.DWT.ResourcesPath`.

The loading process is illustrated below.

```text
index.html
    │
    │ loads
    ▼
dynamsoft.webtwain.initiate.js
dynamsoft.webtwain.config.js
    │
    │ ResourcesPath = "xxxx"
    ▼
Dynamic Web TWAIN
    │
    ├── loads CSS files
    ├── loads additional JavaScript files
    ├── loads WebAssembly files
    └── loads other runtime resources
```

> **Note**
>
> `ResourcesPath` does **not** determine where `dynamsoft.webtwain.config.js` is located.
>
> Instead, it tells Dynamic Web TWAIN where to find all of its remaining resources after initialization.

## Example project structure

Suppose your project is organized as follows.

```text
Project
├── HTML
│   └── index.html
└── DWT
    └── Resources
        ├── dynamsoft.webtwain.config.js
        ├── dynamsoft.webtwain.initiate.js
        ├── dynamsoft.webtwain.install.js
        ├── addon/
        ├── src/
        ├── dist/
        └── ...
```

In this example:

- `index.html` is located in the **HTML** folder.
- All Dynamic Web TWAIN resources are located in **DWT/Resources**.

The internal structure of the **Resources** folder must remain unchanged. You may move or rename the folder, but do not modify its contents.

## Step 1. Reference the entry JavaScript files

Because `index.html` is located inside the **HTML** folder, the two entry files should be referenced using the following relative paths.

```html
<script type="text/javascript" src="../DWT/Resources/dynamsoft.webtwain.config.js"></script>
<script type="text/javascript" src="../DWT/Resources/dynamsoft.webtwain.initiate.js"></script>
```

## Step 2. Configure ResourcesPath

Open the following file.

```text
DWT/Resources/dynamsoft.webtwain.config.js
```

Locate the following line.

```javascript
Dynamsoft.DWT.ResourcesPath = "Resources";
```

Change it to the same relative path used by your HTML page.

```javascript
Dynamsoft.DWT.ResourcesPath = "../DWT/Resources";
```

## Why do I need to configure both?

The two paths serve different purposes.

| Configuration | Purpose |
|---------------|---------|
| `<script src="...">` | Loads the two entry JavaScript files from your HTML page. |
| `Dynamsoft.DWT.ResourcesPath` | Tells Dynamic Web TWAIN where to load all remaining runtime resources after initialization. |

Even if the two JavaScript files are loaded successfully, Dynamic Web TWAIN will still fail to initialize if `ResourcesPath` is incorrect.