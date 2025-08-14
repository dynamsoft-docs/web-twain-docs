---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?
keywords: Dynamic Web TWAIN, Security, images stored, encrypted
breadcrumbText: Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?
description: Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?
date: 2021-11-29 18:33:59 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Security

## Where does the Dynamic Web TWAIN SDK store images on end-user machines? Are they encrypted?

Images are stored in the memory buffer on end-user machines. Since memory configuration is limited on end-user machines, Dynamic Web TWAIN introduced a disk caching feature to allow saving image data to the local disk.

The disk caching feature is enabled by default and can be disabled by setting [IfAllowLocalCache](/_articles/info/api/WebTwain_Buffer.md#ifallowlocalcache){:target="_blank"} to false. You can also set how much memory Dynamic Web TWAIN can use before images start to be cached. By default, 800MB is used. You can change it using the property [BufferMemoryLimit](/_articles/info/api/WebTwain_Buffer.md#buffermemorylimit){:target="_blank"}.

All cached data is encrypted, can only be accessed by Dynamic Web TWAIN, and is destroyed when Dynamic Web TWAIN is unloaded.

For more information, please check here: [Dynamic Web TWAIN Features - Buffer](/_articles/extended-usage/buffer-caching.md){:target="_blank"}.
