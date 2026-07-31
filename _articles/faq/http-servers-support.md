---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What type of HTTP servers do you support? Do you support other server types?
keywords: Dynamic Web TWAIN, Document Saving, HTTP servers support
breadcrumbText: What type of HTTP servers do you support? Do you support other server types?
description: What type of HTTP servers do you support? Do you support other server types?
date: 2021-11-29 18:33:59 +0000
last_modified: 2026-07-29 08:01:45 +0000
---

# Document Saving

## What type of HTTP servers do you support? Do you support other server types?

Dynamic Web TWAIN works with any web server capable of receiving an HTTP POST request, such as Apache, NGINX, IIS, Tomcat, or Node.js. We also support uploading via FTP, as well as sending images directly to Mail/Database servers through your own server-side script.

To upload documents over HTTP, see [Uploading over HTTP](/_articles/general-usage/image-export/server-upload.md#uploading-over-http){:target="_blank"} for the relevant API and sample code.

You need to write your own server-side script to receive and save the uploaded files. On the server side, any scripting language can be used.

For more information and sample server-side scripts, please refer to [Server Scripts](/_articles/general-usage/server-side-scripting.md){:target="_blank"}, which includes sample scripts on how to save the uploaded file to a database such as MS SQL/Oracle, and how to resend the uploaded file by email.
