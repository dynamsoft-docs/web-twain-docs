---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I automatically trigger actions when images arrive on my server side?
keywords: Dynamic Web TWAIN, Document Saving, trigger actions, server side
breadcrumbText: How can I automatically trigger actions when images arrive on my server side?
description: How can I automatically trigger actions when images arrive on my server side?
---

# Document Saving

## How can I automatically trigger actions when images arrive on my server side?

Dynamic Web TWAIN sends an HTTP POST request to the server when doing an upload. You need to write your server-side script to receive and save the uploaded files. On the server side, any scripting language can be used. The server-side script file is specified in the POST Form with the name RemoteFile by default and will be triggered to process the uploaded file.

To change the default field name RemoteFile, you can use the API <a href="/web-twain/docs/info/api/WebTwain_IO.html#httpfieldnameofuploadedimage" target="_blank">HttpFieldNameOfUploadedImage</a>.

For Server-side Scripting examples, please check <a href="/web-twain/docs/general-usage/server-side-scripting.html" target="_blank">this</a>.
