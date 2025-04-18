---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Error Message - Uncaught TypeError - Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node' - parameter 1 is not of type 'Node'.
keywords: Dynamic Web TWAIN, Error message
breadcrumbText: Error Message - Uncaught TypeError - Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node'- parameter 1 is not of type 'Node'.
description: Error Message - Uncaught TypeError - Cannot read properties of null (reading 'appendChild') or Failed to execute 'appendChild' on 'Node'- parameter 1 is not of type 'Node'.
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

(1) If you want to use dynamic initialization method, here is sample code to create the object dynamically:

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

(2) If you want to use default initialization method, please set `Dynamsoft.DWT.AutoLoad` to `false` and manually implement `Dynamsoft.DWT.Load()` after you confirm the container has been created.
