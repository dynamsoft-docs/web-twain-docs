---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I upload a JSON file to my server?
keywords: Dynamic Web TWAIN, Document Saving, upload JSON
breadcrumbText: How can I upload a JSON file to my server?
description: How can I upload a JSON file to my server?
date: 2021-11-29 18:33:59 +0800
last_modified: 2022-06-10 04:40:03 +0800
---

# Document Saving

## How can I upload a JSON file to my server?

While you cannot send a JSON file with HTTPUpload, you can send the JSON string with the API [SetHTTPFormField](/_articles/info/api/WebTwain_IO.md#sethttpformfield){:target="_blank"}.

Dynamic Web TWAIN sends an HTTP POST request to the server when doing an upload. The SetHTTPFormField() method is used to [add extra fields to the HTTP form](/_articles/faq/additional-form-fields.md){:target="_blank"}. Just like how you can add extra text information to the form, you can also add the JSON string to it.
