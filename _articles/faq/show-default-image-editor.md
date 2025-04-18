---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I show the default image editor tool?
keywords: Dynamic Web TWAIN, Image Editing, show default image editor
breadcrumbText: How can I show the default image editor tool?
description: How can I show the default image editor tool?
---

# Image Editing

## How can I show the default image editor tool?

Image editor can be easily integrated by using the code sample provided below.

```javascript
// The below command will use the default settings in which it shows all buttons in toolbar and also takes up entire screen.
var imageEditor = DWTObject.Viewer.createImageEditor();
imageEditor.show();
```

If you are looking to customize the settings of the image editor before integrating it, you can change the properties mentioned on <a href="/web-twain/docs/info/api/WebTwain_Viewer.html#createimageeditor" target="_blank">this link</a>.
