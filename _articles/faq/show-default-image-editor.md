---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I show the default image editor tool?
keywords: Dynamic Web TWAIN, Image Editing, show default image editor
breadcrumbText: How can I show the default image editor tool?
description: How can I show the default image editor tool?
date: 2021-12-09 09:25:33 +0800
last_modified: 2024-09-19 08:47:35 +0800
---

# Image Editing

## How can I show the default image editor tool?

Image editor can be easily integrated by using the code sample provided below.

```javascript
// The below command will use the default settings in which it shows all buttons in toolbar and also takes up entire screen.
var imageEditor = DWTObject.Viewer.createImageEditor();
imageEditor.show();
```

If you are looking to customize the settings of the image editor before integrating it, you can change the properties mentioned on [this link](/_articles/info/api/WebTwain_Viewer.md#createimageeditor){:target="_blank"}.
