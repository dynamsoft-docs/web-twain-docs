---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I securely transfer scanned documents to my server?
keywords: Dynamic Web TWAIN, Security, securely transfer, server
breadcrumbText: How can I securely transfer scanned documents to my server?
description: How can I securely transfer scanned documents to my server?
date: 2021-11-29 18:33:59 +0800
---

# Security

## How can I securely transfer scanned documents to my server?

Dynamic Web TWAIN supports downloading/uploading documents via HTTPS.

To enable HTTPS,

- Set [IfSSL](/_articles/info/api/WebTwain_IO.md#ifssl){:target="_blank"} to true to turn on SSL in HTTP requests

- Set the SSL port with the API [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport){:target="_blank"}

- Call the API <a href="/web-twain/docs/info/api/WebTwain_IO.html#httpupload" target="_blank">HTTPUpload to upload the documents

To upload documents via HTTP/HTTPS, we recommend the API [here](/_articles/general-usage/image-export/index.md#upload){:target="_blank"}.

> Note - that if you use this feature, you need to enable HTTPS on the server. For how to enable HTTPS, please check out the manual of your webserver.
