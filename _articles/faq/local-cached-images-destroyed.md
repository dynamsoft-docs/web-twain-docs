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

The disk caching feature is enabled by default and can be disabled by setting [IfAllowLocalCache](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache){:target="_blank"} to false. You can also set how much memory Dynamic Web TWAIN can use before images start to be cached. By default, 800MB is used. You can change it using the property [BufferMemoryLimit](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit){:target="_blank"}.

All cached data is encrypted, can only be accessed by Dynamic Web TWAIN, and is destroyed when Dynamic Web TWAIN is unloaded. If the SDK exits unexpectedly, all cached data will also be destroyed.

For more information on buffer management and local caching, please check here: [Dynamic Web TWAIN Features - Buffer (dynamsoft.com)](/_articles/docs/extended-usage/buffer-caching.md){:target="_blank"}.
