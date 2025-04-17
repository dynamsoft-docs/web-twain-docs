---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: HTTP request error
keywords: Dynamic Web TWAIN, Error Troubleshooting, HTTP request
breadcrumbText: HTTP request error
description: HTTP request error
---

# Error Troubleshooting

## HTTP request error

### Symptom

When attempting to upload images via HTTP Put the images fail to upload and this error is received.

### Cause

- The problem may occur if write permission is not provided on the server.
- If you use Tomcat, the value of the `readonly` property is `false` by default, in this case the HTTP Put operation is not allowed.

### Solution

- Check the write permission of the server.

  - Start Internet Information Services (IIS).
  - Click Web Sites.
  - Right-click the specified work folder, select Properties.
  - Select the Write option at the Directory tab.

- If you are using Tomcat, the `doPut()` will check to see if the `readonly` property has been changed to `false`. If it has not, the HTTP Put operation is not allowed. Please go to {Tomcat installation directory} -> conf -> web.xml, find the default servlet configuration (org.apache.catalina.servlets. DefaultServlet) and change the `readonly` property to `true` .

```xml
<init-param>
    <param-name>readonly</param-name>
    <param-value>false</param-value>
</init-param>
```
