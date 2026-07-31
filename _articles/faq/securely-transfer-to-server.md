---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I securely transfer scanned documents to my server?
keywords: Dynamic Web TWAIN, Security, securely transfer, server
breadcrumbText: How can I securely transfer scanned documents to my server?
description: How can I securely transfer scanned documents to my server?
date: 2021-11-29 18:33:59 +0000
last_modified: 2026-07-29 08:01:45 +0000
---

# Security

## How can I securely transfer scanned documents to my server?

Dynamic Web TWAIN supports downloading/uploading documents via HTTPS.

To enable HTTPS,

- Set [IfSSL](/_articles/info/api/WebTwain_IO.md#ifssl){:target="_blank"} to true to turn on SSL in HTTP requests

- Set the SSL port with the API [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport){:target="_blank"}

- Call the API [HTTPUpload](/_articles/info/api/WebTwain_IO.md#httpupload){:target="_blank"} to upload the documents

To upload documents via HTTP/HTTPS, we recommend following [Uploading over HTTP](/_articles/general-usage/image-export/server-upload.md#uploading-over-http){:target="_blank"}.

> Note - that if you use this feature, you need to enable HTTPS on the server. For how to enable HTTPS, please check out the manual of your webserver.
