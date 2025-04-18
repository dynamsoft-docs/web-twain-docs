---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?
keywords: Dynamic Web TWAIN, Security, images stored, encrypted
breadcrumbText: Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?
description: Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?
---

# Security

## Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?

Images are stored in the memory buffer on end-user machines. Since memory configuration is limited on end-user machines, Dynamic Web TWAIN introduced a disk caching feature to allow saving image data to the local disk.

The disk caching feature is enabled by default and can be disabled by setting <a href="/web-twain/docs/info/api/WebTwain_Buffer.html#ifallowlocalcache" target="_blank">IfAllowLocalCache</a> to false. You can also set how much memory Dynamic Web TWAIN can use before images start to be cached. By default, 800MB is used. You can change it using the property <a href="/web-twain/docs/info/api/WebTwain_Buffer.html#buffermemorylimit" target="_blank">BufferMemoryLimit</a>.

All cached data is encrypted, can only be accessed by Dynamic Web TWAIN, and is destroyed when Dynamic Web TWAIN is unloaded.

For more information, please check here: <a href="/web-twain/docs/extended-usage/buffer-caching.html" target="_blank">Dynamic Web TWAIN Features - Buffer</a>.
