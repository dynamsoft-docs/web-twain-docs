---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What type of HTTP servers do your support? Do you support other server types?
keywords: Dynamic Web TWAIN, Document Saving, HTTP servers support
breadcrumbText: What type of HTTP servers do your support? Do you support other server types?
description: What type of HTTP servers do your support? Do you support other server types?
date: 2021-11-29 18:33:59 +0800
---

# Document Saving

## What type of HTTP servers do your support? Do you support other server types?

We support any web servers such Apache, NGINX, IIS, Tomcat, Node.js, etc. We also support Mail/FTP/Database servers.

To upload documents via HTTP, we recommend the API [here](/_articles/general-usage/image-export/index.md#upload){:target="_blank"}.

Dynamic Web TWAIN sends an HTTP POST request to the server when doing an upload. You need to write your server-side script to receive and save the uploaded files. On the server side, any scripting language can be used.

For more information and sample server-side scripts, please refer to [Server Scripts](/_articles/general-usage/server-side-scripting.md){:target="_blank"}, which includes sample scripts on how to save the uploaded file to a database such as MS SQL/Oracle, and how to resend the uploaded file by email.
