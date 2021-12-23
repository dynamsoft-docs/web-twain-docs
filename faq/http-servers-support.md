---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: What type of HTTP servers do your support? Do you support other server types?
keywords: Dynamic Web TWAIN, Document Saving, HTTP servers support
breadcrumbText: What type of HTTP servers do your support? Do you support other server types?
description: What type of HTTP servers do your support? Do you support other server types?
---

# Document Saving

## What type of HTTP servers do your support? Do you support other server types?

We support any web servers such Apache, NGINX, IIS, Tomcat, Node.js, etc. We also support Mail/FTP/Database servers.

To upload documents via HTTP, we recommend the API <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html?ver=latest#httpupload" target="_blank">HTTPUpload()</a>. You can find more information on HTTP and FTP upload <a href="https://www.dynamsoft.com/web-twain/docs/indepth/features/output.html?ver=latest#upload" target="_blank">here</a>.

Dynamic Web TWAIN sends an HTTP POST request to the server when doing an upload. You need to write your server-side script to receive and save the uploaded files. On the server side, any scripting language can be used.

For more information and sample server-side scripts, please refer to <a href="https://www.dynamsoft.com/web-twain/docs/indepth/development/Server-script.html" target="_blank">Server Scripts</a>, which includes sample scripts on how to save the uploaded file to a database such as MS SQL/Oracle, and how to resend the uploaded file by email.
