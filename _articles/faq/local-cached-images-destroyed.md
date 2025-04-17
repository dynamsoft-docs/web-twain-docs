---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: When are the locally cached images destroyed?
keywords: Dynamic Web TWAIN, Security, end user, local cache, destroy
breadcrumbText: When are the locally cached images destroyed?
description: When are the locally cached images destroyed?
---

# Security

## When are the locally cached images destroyed?

Dynamic Web TWAIN introduced a disk caching feature to allow saving image data to the local disk.

The disk caching feature is enabled by default and can be disabled by setting <a href="/web-twain/docs/info/api/WebTwain_Buffer.html#ifallowlocalcache" target="_blank">IfAllowLocalCache</a> to false. You can also set how much memory Dynamic Web TWAIN can use before images start to be cached. By default, 800MB is used. You can change it using the property <a href="/web-twain/docs/info/api/WebTwain_Buffer.html#buffermemorylimit" target="_blank">BufferMemoryLimit</a>.

All cached data is encrypted, can only be accessed by Dynamic Web TWAIN, and is destroyed when Dynamic Web TWAIN is unloaded. If the SDK exits unexpectedly, all cached data will also be destroyed.

For more information on buffer management and local caching, please check here: <a href="/web-twain/docs/extended-usage/buffer-caching.html" target="_blank">Dynamic Web TWAIN Features - Buffer (dynamsoft.com)</a>.
