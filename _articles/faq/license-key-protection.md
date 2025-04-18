---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: The license key is set in JavaScript. How can I protect it?
keywords: Dynamic Web TWAIN, Security, license key protection
breadcrumbText: The license key is set in JavaScript. How can I protect it?
description: The license key is set in JavaScript. How can I protect it?
---

# Security

## The license key is set in JavaScript. How can I protect it?

If you are using Per Client Device or Per Page license of Dynamic Web TWAIN SDK, your license is either the <a href="https://www.dynamsoft.com/license-server/docs/about/terms.html#organization-id" target="_blank">organization ID</a> (which links to the <a href="https://www.dynamsoft.com/license-server/docs/about/terms.html#default-handshake-code" target="_blank">default Handshake Code</a>), the <a href="https://www.dynamsoft.com/license-server/docs/about/terms.html#handshake-code" target="_blank">handshake code</a> or both. Therefore, you can simply protect your license by adding security settings to your handshake code in the license portal.

- You can set a <a href="https://www.dynamsoft.com/license-server/docs/about/terms.html#session-password" target="_blank">session password</a>.

- You can add your website domain as a <a href="https://www.dynamsoft.com/license-server/docs/about/terms.html#valication-field" target="_blank">validation field</a>.

If you are using an offline/non-trackable license, you can configure your license to enable domain binding before activating your license. When you do this, you must make sure your application is deployed to the bound domain, otherwise you will receive an error.

> Note - that this a static characteristic of your application, and it cannot be changed after it's configured.
