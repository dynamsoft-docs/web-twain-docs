---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I automatically trigger actions when images arrive on my server side?
keywords: Dynamic Web TWAIN, Document Saving, trigger actions, server side
breadcrumbText: How can I automatically trigger actions when images arrive on my server side?
description: How can I automatically trigger actions when images arrive on my server side?
date: 2021-11-29 18:33:59 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Document Saving

## How can I automatically trigger actions when images arrive on my server side?

Dynamic Web TWAIN sends an HTTP POST request to the server when doing an upload. You need to write your server-side script to receive and save the uploaded files. On the server side, any scripting language can be used. The server-side script file is specified in the POST Form with the name RemoteFile by default and will be triggered to process the uploaded file.

To change the default field name RemoteFile, you can use the API [HttpFieldNameOfUploadedImage](/_articles/info/api/WebTwain_IO.md#httpfieldnameofuploadedimage){:target="_blank"}.

For Server-side Scripting examples, please check [this](/_articles/general-usage/server-side-scripting.md){:target="_blank"}.
