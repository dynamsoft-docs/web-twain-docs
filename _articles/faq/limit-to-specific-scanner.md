---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I limit all users to use a specific scanner model?
keywords: Dynamic Web TWAIN, Capture/ Image Source, limit, specific scanner
breadcrumbText: How can I limit all users to use a specific scanner model?
description: How can I limit all users to use a specific scanner model?
---

# Capture/Image Source

## How can I limit all users to use a specific scanner model?

You can limit all the users to use a specific scanner model by automatically selecting that scanner programmatically. Use the method [SelectSourceByIndex()](/_articles/info/api/WebTwain_Acquire.md#selectsourcebyindex){:target="_blank"} to select a scanner by its index in the source list. In some cases, you may want to select a source by its name as shown in the example below. This way you can use the specific scanner model.

```javascript
var sources = DWTObject.GetSourceNames();
sources.find(function (name, index) {
  //"EPSON DS-530" is the name of the scanner
  if (name === "EPSON DS-530") DWTObject.SelectSourceByIndex(index);
});
```
