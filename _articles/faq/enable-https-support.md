---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I enable HTTPS support?
keywords: Dynamic Web TWAIN, Document Saving, enable HTTPS support
breadcrumbText: How can I enable HTTPS support?
description: How can I enable HTTPS support?
date: 2021-11-29 18:33:59 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Document Saving

## How can I enable HTTPS support?

Dynamic Web TWAIN provides SSL support.

To enable HTTPS,

- Set [IfSSL](/_articles/info/api/WebTwain_IO.md#ifssl){:target="_blank"} to true to turn on SSL in HTTP requests.

- Set the SSL port with the API [HTTPPort](/_articles/info/api/WebTwain_IO.md#httpport){:target="_blank"}.

- Call the API <a href="/web-twain/docs/info/api/WebTwain_IO.html#httpupload" target="_blank">HTTPUpload to upload the documents.

For more information on how to use HTTPUpload, please check [here](/_articles/info/api/WebTwain_IO.md#httpupload){:target="_blank"}.

Note that if you use this feature, you need to enable HTTPS on the server. For how to enable HTTPS, please check out the manual of your webserver.
