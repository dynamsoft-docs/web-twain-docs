---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I get a response string from my HTTP Server if the upload succeeds or fails?
keywords: Dynamic Web TWAIN, Document Saving, response string on upload
breadcrumbText: How can I get a response string from my HTTP Server if the upload succeeds or fails?
description: How can I get a response string from my HTTP Server if the upload succeeds or fails?
---

# Document Saving

## How can I get a response string from my HTTP Server if the upload succeeds or fails?

```javascript
Every HTTP upload method has two callbacks with signatures like this
onEmptyResponse: () => void,
onServerReturnedSomething: (
errorCode: number,
errorString: string,
response: string) => void
```

The 1st callback onEmptyResponse is triggered when the server returns no response string. Generally, if an error has occurred on the server, the server will return some information to indicate what went wrong. Therefore, if nothing is returned, you can treat it as a successful upload.

Of course, in your own server-side script to accept and process the HTTP Post request, you know whether the upload is successful and can make it more obvious by returning some custom information to indicate that. In this case, the 2nd callback onServerReturnedSomething will be triggered on purpose and you will need to read the argument response which contains what is returned by the server.

> NOTE - When the callback onServerReturnedSomething is triggered, you will always get an errorCode and an errorString but you can choose to ignore them if it's triggered on purpose.

Dynamic Web TWAIN also provides an API called [HTTPPostResponseString](/_articles/info/api/WebTwain_IO.md#httppostresponsestring){:target="_blank"} which contains the response and can be read outside of the upload method.
