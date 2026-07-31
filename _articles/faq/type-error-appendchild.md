---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Uncaught TypeError - Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node' - parameter 1 is not of type 'Node'.
keywords: Dynamic Web TWAIN, Error message
breadcrumbText: Error Message - Uncaught TypeError - Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node'- parameter 1 is not of type 'Node'.
description: Error Message - Uncaught TypeError - Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node'- parameter 1 is not of type 'Node'.
date: 2022-12-27 15:57:25 +0000
last_modified: 2026-07-29 08:01:45 +0000
---

# Error Troubleshooting

## Error Message - Uncaught TypeError: Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node': parameter 1 is not of type 'Node'.

### Symptom:
You may see the following errors when you open your application. These errors may be sporadic or may halt your application.

- **Uncaught TypeError: Cannot read properties of null (reading 'appendChild')**

- **Uncaught TypeError: Failed to execute 'appendChild' on 'Node': parameter 1 is not of type 'Node'**

### Cause:
Typically, an application uses `DWTObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer')` to create the object at the target container. There are certain conditions where Dynamic Web TWAIN's initialization process will complete, but after initialization, the target container is not defined or remains null.  You will then see the error when trying to upload your files.

### Workaround:
Please check if your container is created dynamically (especially if you are using dynamic frameworks). There are two ways to address the issue. 

(1) If you want to use the dynamic initialization method, first disable auto-loading in `dynamsoft.webtwain.config.js` by setting both `Dynamsoft.DWT.AutoLoad = false` and `Dynamsoft.DWT.Containers = []`. Otherwise, the auto-loading process can race with your own `CreateDWTObjectEx()` call and create the exact container-not-ready condition described above. Once auto-loading is disabled, here is sample code to create the object dynamically once your container is confirmed to exist:

```javascript
Dynamsoft.DWT.CreateDWTObjectEx(
    {
        WebTwainId: 'myDWT'
    },
    function(obj) {
        DWTObject = obj;
        DWTObject.Viewer.bind(document.getElementById('dwtcontrolContainer'));
        DWTObject.Viewer.height = 400;
        DWTObject.Viewer.width = 600;
        DWTObject.Viewer.show();
    },
    function(err) {
        console.log(err);
    }
);
```

(2) If you want to use the default initialization method instead, set `Dynamsoft.DWT.AutoLoad` to `false` and manually call `Dynamsoft.DWT.Load()` once you've confirmed the container has been created.
