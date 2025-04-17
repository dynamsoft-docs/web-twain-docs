---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK – Content-Security-Policy violated
keywords: Dynamic Web TWAIN, Content-Security-Policy
breadcrumbText: Dynamic Web TWAIN – Content-Security-Policy violated
description: Dynamic Web TWAIN – Content-Security-Policy violated
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# Dynamic Web TWAIN – Content-Security-Policy violated

If your server has Content-Security-Policy enabled, you might get an error when accessing a web scanning page using Dynamic Web TWAIN.

```
CSP14312: Resource violated directive 'default-src 'self' 'unsafe-inline' 'unsafe-eval'' in Content-Security-Policy: wss://127.0.0.1:8992/. Resource will be blocked.
```
In such cases, you will need to modify your Content-Security-Policy settings to allow the loading of Dynamic Web TWAIN JS files like dynamsoft.webtwain.initiate.js, dynamsoft.webtwain.config.js. etc.

To do so, please set the Content-Security-Policy value on the client or server side to:
```
connect-src 'self' ws://127.0.0.1:18622 wss://127.0.0.1:18623 ws://127.0.0.1:18625 wss://127.0.0.1:18626 http://127.0.0.1:18622 https://127.0.0.1:18623 http://127.0.0.1:18625 https://127.0.0.1:18626
```

More information can be found on <a href="https://content-security-policy.com/" target="_blank">https://content-security-policy.com/</a>
