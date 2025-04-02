---
layout: default-layout
needAutoGenerateSidebar: true
needGenerateH3Content: true
noTitleIndex: true
title: Dynamic Web TWAIN API Reference - RESTful API
keywords: Dynamic Web TWAIN, Documentation, API Reference, RESTful API, REST API, RESTful, REST
breadcrumbText: RESTful
description: Dynamic Web TWAIN SDK Documentation API Reference RESTful API
permalink: /info/api/restful.html
---

# RESTful API

This is the comprehensive reference for the Dynamic Web TWAIN RESTful API. By default, all APIs use the root URL [`https://127.0.0.1:18623/api`](https://127.0.0.1:18623/api) set by the Dynamic Web TWAIN Service. (can also use [`http://127.0.0.1:18622/api`](http://127.0.0.1:18622/api)) Read about how to alter the address along with a developer walkthrough in our [user guide]({{ site.extended-usage}}restful-api.html).

[**Server Control**](#server-control)

| Endpoint                                | Method  | Description                      |
| --------------------------------------- | ------- | -------------------------------- |
| [`/server`](#get-server)                | `GET`   | Get server settings              |
| [`/server`](#patch-server)              | `PATCH` | Update specified server settings |
| [`/server/version`](#get-serverversion) | `GET`   | Get server API version           |

[**Scanner Control**](#scanner-control)

| Endpoint                                                                                                   | Method   | Description                                    |
| ---------------------------------------------------------------------------------------------------------- | -------- | ---------------------------------------------- |
| [`/device/scanners`](#get-devicescanners)                                                                  | `GET`    | Get list of scanners                           |
| [`/device/scanners/jobs`](#post-devicescannersjobs)                                                        | `POST`   | Create a scan job                              |
| [`/device/scanners/jobs/{jobuid}`](#get-devicescannersjobsjobuid)                                          | `GET`    | Get status of a scan job                       |
| [`/device/scanners/jobs/{jobuid}`](#patch-devicescannersjobsjobuid)                                        | `PATCH`  | Update status of a scan job                    |
| [`/device/scanners/jobs/{jobuid}`](#delete-devicescannersjobsjobuid)                                       | `DELETE` | Delete a scan job                              |
| [`/device/scanners/jobs/{jobuid}/scanner/capabilities`](#get-devicescannersjobsjobuidscannercapabilities) | `GET`    | Retrieve scanner capabilities specified in a scan job         |
| [`/device/scanners/jobs/{jobuid}/scanner/settings`](#get-devicescannersjobsjobuidscannersettings)          | `GET`    | Retrieve settings of scanner specified in a scan job.  |
| [`/device/scanners/jobs/{jobuid}/next-page-info`](#get-devicescannersjobsjobuidnext-page-info)             | `GET`    | Get information of the next page in a scan job |
| [`/device/scanners/jobs/{jobuid}/next-page`](#get-devicescannersjobsjobuidnext-page)                       | `GET`    | Get the page in a scan job                     |

[**Document Management**](#document-management)

| Endpoint                                                                                              | Method   | Description                         |
| ----------------------------------------------------------------------------------------------------- | -------- | ----------------------------------- |
| [`/storage/documents`](#post-storagedocuments)                                                       | `POST`   | Create a new document for storage   |
| [`/storage/documents/{documentuid}`](#get-storagedocumentsdocumentuid)                              | `GET`    | Get info of a stored document       |
| [`/storage/documents/{documentuid}`](#delete-storagedocumentsdocumentuid)                           | `DELETE` | Delete a stored document            |
| [`/storage/documents/{documentuid}/content`](#get-storagedocumentsdocumentuidcontent)              | `GET`    | Get content of a stored document    |
| [`/storage/documents/{documentuid}/pages`](#post-storagedocumentsdocumentuidpages)                 | `POST`   | Insert pages into a stored document |
| [`/storage/documents/{documentuid}/pages/{param}`](#delete-storagedocumentsdocumentuidpagesparam) | `DELETE` | Delete a page in a stored document  |

[**Document Processing**](#document-processing)

| Endpoint                                          | Method | Description                                          |
| ------------------------------------------------- | ------ | ---------------------------------------------------- |
| [`/process/read-barcode`](#post-processread-barcode) | `POST` | Read a barcode on a page scanned from a specified source |
| [`/process/check-blank`](#post-processcheck-blank) | `POST` | Check if a page scanned from a specified source is blank |


## Server Control

### `GET /server`

Get the server settings. Some settings require administrator privileges to retrieve.

#### Parameters

None

#### Request Example

Only valid request:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['server'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

| HTTP Status Code | Meaning                                                                 | Description          | Data Schema                             |
| ---------------- | ----------------------------------------------------------------------- | -------------------- | --------------------------------------- |
| 200              | [OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)                 | Successful operation. | [`ServerSettings`](#serversettings) |
| 405              | [Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5) | Method not allowed.   | [`Error`](#error)                   |

#### Response Examples

##### 200 Response

```json
{
  "logLevel": 1
}
```

##### 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, PATCH.",
  "statusCode": 405
}
```

### `PATCH /server`

Update specified server settings. Some settings require administrator privileges to modify.

#### Parameters

| Name     | Location | Type          | Required | Restrictions                                                            | Description                                                                                   |
| -------- | -------- | ------------- | -------- | ----------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
|logLevel|body|[`ServerSettingsInput`](#serversettingsinput)| no |none|

#### Request Example

Set DWT Service log verbosity to maximum:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['server'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

let raw = JSON.stringify({ logLevel: 30 });

let requestOptions = {
   method: 'PATCH',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.| [`ServerSettings`](#serversettings)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

#### Response Examples

200 Response:

```json
{
  "logLevel": 1
}
```

400 Response:

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, PATCH.",
  "statusCode": 405
}
```

### `GET /server/version`

Get the API version of the server.

#### Parameters

None

#### Request Example

Only valid request to get the server API version:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['server', 'version'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[`VersionInfo`](#versioninfo)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

#### Response Examples

200 Response:

```json
{
  "version": "20240719",
  "compatible": true
}
```

405 Response:

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

## Scanner Control

### GET /device/scanners

Get a list of scanners from the host. By default this returns all scanners, but you can optionally request scanners specified by protocols. Scanner protocols are enumerated with the [`Dynamsoft.DWT.EnumDWT_DeviceType`]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype).

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`type`|query|[`ScannerType`](#scannertype) | no | One or a combination of:<br/>  - `0x10`: `TWAINSCANNER`<br/> - `0x20`: `WIASCANNER`<br/> - `0x40`: `TWAINX64SCANNER`<br/> - `0x80`: `ICASCANNER`<br/> - `0x100`: `SANESCANNER`<br/> - `0x200`: `ESCLSCANNER`<br/> - `0x400`: `WIFIDIRECTSCANNER`<br/> - `0x800`: `WIATWAINSCANNER` |Device type(s), can be one or a combination, specifies TWAIN/TWAIN64/WIA/ICA/SANE by default.|

#### Request Example

Get the list of all TWAIN/TWAIN64/WIA/ICA/SANE scanners:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['device', 'scanners'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[`Scanner[]`](#scanner)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

<!-- #### Responses Data Schema

HTTP Status Code **200**
We also return websocket protocol info. but not list. -->

#### Response Examples

200 Response:

```json
[
  {
    "name": "TWAIN2 FreeImage Software Scanner",
    "type": 16,
    "device": "{\"deviceInfo\":{\"Manufacturer\":\"VFdBSU4gV29ya2luZyBHcm91cA==\",\"ProductFamily\":\"U29mdHdhcmUgU2Nhbg==\",\"ProductName\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\",\"ProtocolMajor\":2,\"ProtocolMinor\":1,\"SupportedGroups\":0,\"Version\":{\"Country\":1,\"Info\":\"Mi4xLjMgc2FtcGxlIHJlbGVhc2UgMzJiaXQ=\",\"Language\":2,\"MajorNum\":2,\"MinorNum\":1}},\"deviceType\":16,\"isSystemDefaultPrinter\":false,\"name\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\"}"
  }
]
```

400 Response:

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

405 Response:

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

### `POST /device/scanners/jobs`

Create a scan job.

You can scan with a specified scanner, or use the latest scanner by default. This API provides an extensive set of parameters to:

- Set scanner capabilities
- Show the scanner UI when the client is on the same machine that the Dynamic Web TWAIN Service is running on.
- Get the scanned image with the `jobuid` once the scan job completes, or save to a specified document
- Create a pending job with the specified scanner. (every scanner can only have one pending job) We recommend creating pending jobs for **shared scanners**. By default, requests for the job are bound to the domain of the client that created the scan job.

The `config`, `settings`, and `capability` all provide **different ways** to specify the **same scan settings** for the scan job. These settings override each other in predicable ways as outlined in [`CreateScanJobOptions`](#createscanjoboptions), but we recommend only using **one of the three parameters** for clarity, whichever is most convenient to you.

After creating a scan job, the job either:

1. completes successfully,
2. hangs indefinitely,
3. times out once it hits the `jobTimeout` value **if set**,
4. or gets deleted if you send a [delete request](#delete-devicescannersjobsjobuid).

#### Parameters

| Name                    | Location | Type           | Required | Description                                                                                                                                                                                                                                                                                                                                                                                                        |
| ----------------------- | -------- | -------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `X-DICS-LICENSE-KEY`    | header   | `string`         | yes      | DWT license key with the RESTful API module - contact our [sales team](https://www.dynamsoft.com/company/contact/) for a full license, or get a [30-day free trial](https://www.dynamsoft.com/web-twain/downloads/).                                                                                                                                                                                                                                                                                                                                                                                                 |
|`CreateScanJobOptions`|body|[`CreateScanJobOptions`](#createscanjoboptions)| no |none|

#### Request Example

Start a scan job as pending and check the feeder. The `device` and `settings` values were obtained from earlier `/device/scanners/twain/settings` and `/device/scanners` calls. Various scanning configurations are set with the `config` parameter:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['device', 'scanners', 'jobs'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-LICENSE-KEY", "YOUR_LICENSE_KEY_HERE");
myHeaders.append("Content-Type", "application/json");

let raw = JSON.stringify({
  "autoRun": false,
  "device": "{\"deviceInfo\":{\"Manufacturer\":\"VFdBSU4gV29ya2luZyBHcm91cA==\",\"ProductFamily\":\"U29mdHdhcmUgU2Nhbg==\",\"ProductName\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\",\"ProtocolMajor\":2,\"ProtocolMinor\":1,\"SupportedGroups\":0,\"Version\":{\"Country\":1,\"Info\":\"Mi4xLjMgc2FtcGxlIHJlbGVhc2UgMzJiaXQ=\",\"Language\":2,\"MajorNum\":2,\"MinorNum\":1}},\"deviceType\":16,\"isSystemDefaultPrinter\":false,\"name\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\"}",
  "name": "TWAIN2 FreeImage Software Scanner",
  "checkFeederLoaded": true,
  "config": {
    "PixelType": 1,
    "Resolution": 300,
    "IfFeederEnabled": true,
    "IfDuplexEnabled": false,
    "IfGetImageInfo": true,
    "IfGetExtImageInfo": true,
    "extendedImageInfoQueryLevel": 0,
    "IfCloseSourceAfterAcquire": true,
    "XferCount": 11
  },
  "caps": {
    "exception": "ignore",
    "capabilities": [
      {
        "capability": 4355,
        "curValue": 500
      }
    ]
  },
  "settings": "Rfj6pIMTNkCu3BfDloGItBAAAAACEAAABgAFAAEAAAAQAAAAExAAAAYABQAAAAAAEAAAAAcQAAAGAAUAAQAAABAAAAArEQAABAAFABgAAAAQAAAAHBEAAAQABQAAAAAAEAAAAAABAAAEAAUAAAAAABwAAAAUEQAACAAFAPgqAAAAAAAANCEAAAAAAAAQAAAADBEAAAQABQACAAAAEAAAAB8RAAAEAAUAAAAAABAAAAABAQAABAAFAAIAAAAQAAAAIBEAAAQABQAAAAAAEAAAACIRAAAEAAUAAwAAABAAAAAQEQAABAAFAAAAAAAQAAAAAgEAAAQABQAAAAAAEAAAABgRAAAHAAUAAABIQxAAAAAZEQAABwAFAAAASEMQAAAAIxEAAAcABQAAAABDEAAAAAMRAAAHAAUAAAAAABAAAAABEQAABwAFAAAAAAAQAAAACBEAAAcABQAAAIA/EAAAAAGAAAAGAAUAAAAAAA=="
});

let requestOptions = {
   method: 'POST',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successful operation.|[`ScannerJob`](#scannerjob)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|License is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|423|[Locked](https://tools.ietf.org/html/rfc2518#section-10.4)|Source is connected to maximum supported number of applications.|[`Error`](#error)|

#### Response Examples

201 Response:

```json
{
  "jobuid": "B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86",
  "status": "pending",
  "scanner": {
    "name": "TWAIN2 FreeImage Software Scanner",
    "type": 16,
    "device": "{\"deviceInfo\":{\"Manufacturer\":\"VFdBSU4gV29ya2luZyBHcm91cA==\",\"ProductFamily\":\"U29mdHdhcmUgU2Nhbg==\",\"ProductName\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\",\"ProtocolMajor\":2,\"ProtocolMinor\":1,\"SupportedGroups\":0,\"Version\":{\"Country\":1,\"Info\":\"Mi4xLjMgc2FtcGxlIHJlbGVhc2UgMzJiaXQ=\",\"Language\":2,\"MajorNum\":2,\"MinorNum\":1}},\"deviceType\":16,\"isSystemDefaultPrinter\":false,\"name\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\"}"
  }
}
```

400 Response:

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

403 Response:

```json
{
  "code": -2800,
  "message": "The current product key is empty or invalid. Please contact the site administrator.",
  "statusCode": 403
}
```

405 Response:

```json
{
  "code": -2112,
  "message": "This endpoint only supports POST.",
  "statusCode": 405
}
```

423 Response:

```json
{
  "code": -1004,
  "message": "Source is connected to maximum supported number of applications.",
  "statusCode": 423
}
```

### `GET /device/scanners/jobs/{jobuid}`

Get the status of a scan job provided its `jobuid`.

Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes | none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |

#### Request Example

Request the status of a previously-requested scan job:

```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

let requestOptions = {
   method: 'GET',
   headers: myHeaders,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[`ScannerJobInfo`](#scannerjobinfo)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|Job was deleted. Return 404 instead upon restart of the Dynamic Web TWAIN Service as that clears all job info.|[`Error`](#error)|

#### Response Examples

> 200 Response

```json
{
  "status": "pending",
  "code": "0",
  "message": "Successful"
}
```

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, PATCH, DELETE.",
  "statusCode": 405
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Job was deleted.",
  "statusCode": 410
}
```

### `PATCH /device/scanners/jobs/{jobuid}`

Update status of a scan job given its `jobuid`.

Update the status of the job while the job is in the `pending` state. This request is ignored if the job is in any other state. Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes | none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |
|`status`|body|`string`| yes | - `running`: running<br/> - `canceled`: canceled |Default value `running` - update the job status. When the job is running, the only acceptable value is `canceled` to cancel the job. When the job is pending, the only acceptable value is `running` to start the job.|

#### Request Example

Start a pending job:

```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

let raw = JSON.stringify({
  status: 'running'
})

let requestOptions = {
   method: 'PATCH',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[`ScannerJobStatus`](#scannerjobstatus)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|409|[Conflict](https://tools.ietf.org/html/rfc7231#section-6.5.8)|Attempted to cancel non-pending or non-running job, or update a non-pending job to running.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|Job was deleted. Return 404 instead upon restart of the Dynamic Web TWAIN Service as that clears all job info.|[`Error`](#error)|

<!--#### Responses Data Schema

HTTP Status Code **200**

|Name|Type|Required|Restrictions|Title|Description|
|---|---|---|---|---|---|
|» status|string|true|none|scanner job status.|-->

#### Response Examples

> 200 Response

```json
{
  "status": "running"
}
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, PATCH, DELETE.",
  "statusCode": 405
}
```

> 409 Response

```json
{
  "code": -1011,
  "message": "Cannot cancel non-pending or non-running job, or update a non-pending job to running.",
  "statusCode": 409
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Job was deleted.",
  "statusCode": 410
}
```

### `DELETE /device/scanners/jobs/{jobuid}`

Delete a scan job, provided its `jobuid`.

if the job is running, cancel then delete the scan job, including all scanned documents. Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes | none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |

#### Request Example

Only valid request syntax (to cancel a scan job):

```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let requestOptions = {
   method: 'DELETE',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|Successful operation.|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|Job already deleted.|[`Error`](#error)|

#### Response Examples

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, PATCH, DELETE.",
  "statusCode": 405
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Job already deleted.",
  "statusCode": 410
}
```

### `GET /device/scanners/jobs/{jobuid}/scanner/capabilities`

Retrieve the capabilities of the scanner specified in the scan job, provided its `jobuid`.

This API can only be called when the job is in a `pending` state, hence you must [create the job](#post-devicescannersjobs) with `autoRun` set to `false` for a valid response. By default this API returns all capabilities, but you can select specific capabilities with comma separated values using `caps`. See the [capability enumerations]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cap) for more information. Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes | none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |
|`caps`|query|`string`| no | See list of all capabilities [here]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_cap). | Comma-separated list of enumerated capabilities to request - leave empty to request all capabilities. |

#### Request Example

Query duplex scanning (value `4114`)
and auto-feed (value `4103`) capabilities of the specified job:
```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid, 'scanner', 'capabilities'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

url.searchParams.append('caps', '4114,4103');

let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[`CapabilityDetails`]({{ site.api }}Interfaces.html#capabilitydetails)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|409|[Conflict](https://tools.ietf.org/html/rfc7231#section-6.5.8)|Cannot be called when job is not pending.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|Job was deleted. Return 404 instead upon restart of the Dynamic Web TWAIN Service as that clears all job info.|[`Error`](#error)|

#### Response Examples

> 200 Response

```json
[
  {}
]
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

> 409 Response

```json
{
  "code": -1011,
  "message": "Cannot be called when job is not pending.",
  "statusCode": 409
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Job was deleted.",
  "statusCode": 410
}
```

### `GET /device/scanners/jobs/{jobuid}/scanner/settings`

Retrieve the `settings` of the scanner specified in the scan job, provided the `jobuid`.

This request only supports TWAIN scanners, and is only valid when the job is pending. This API relies on `EnableSourceUI` to show the scanner UI if enabled by the `showui` parameter. Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes | none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |
|`showui`|query|`boolean`| no | none |Default value `true` - shows the scanner UI.|

#### Request Example

Get the `settings` of the scanner performing a scan job and show the UI

```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid, 'scanner', 'settings'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

const params = new URLSearchParams();
params.append(`showui`, 'true');

let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|base64 encoded string|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|409|[Conflict](https://tools.ietf.org/html/rfc7231#section-6.5.8)|The job is not pending.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|The job was deleted.|[`Error`](#error)|

<!--#### Responses Data Schema

HTTP Status Code **200**

|Name|Type|Required|Restrictions|Title|Description|
|---|---|---|---|---|---|
|» settings|string|false|none|base64 encoded|-->

#### Response Examples

> 200 Response

```json
{
  "settings": "Rfj6pIMTNkCu3BfDloGItBAAAAACEAAABgAFAAEAAAAQAAAAExAAAAYABQAAAAAAEAAAAAcQAAAGAAUAAQAAABAAAAArEQAABAAFABgAAAAQAAAAHBEAAAQABQAAAAAAEAAAAAABAAAEAAUAAAAAABwAAAAUEQAACAAFAPgqAAAAAAAANCEAAAAAAAAQAAAADBEAAAQABQACAAAAEAAAAB8RAAAEAAUAAAAAABAAAAABAQAABAAFAAIAAAAQAAAAIBEAAAQABQAAAAAAEAAAACIRAAAEAAUAAwAAABAAAAAQEQAABAAFAAAAAAAQAAAAAgEAAAQABQAAAAAAEAAAABgRAAAHAAUAAABIQxAAAAAZEQAABwAFAAAASEMQAAAAIxEAAAcABQAAAABDEAAAAAMRAAAHAAUAAAAAABAAAAABEQAABwAFAAAAAAAQAAAACBEAAAcABQAAAIA/EAAAAAGAAAAGAAUAAAAAAA=="
}
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

> 409 Response

```json
{
  "code": -1011,
  "message": "The job is not pending.",
  "statusCode": 409
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Invalid Value.",
  "statusCode": 410
}
```

### `GET /device/scanners/jobs/{jobuid}/next-page-info`

Get information of the next page in a scan job, provided its `jobuid`.

This will not return until the scanned page is ready. If the response code is `200`, you can keep calling this API until a code `204` response. Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes |none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |

#### Request Example

```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid, 'next-page-info'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation. Also returns the image url; if scanning to a document, also return document UID and page UID.|[`OutputInfo`]({{ site.api }}Interfaces.html#outputinfo)|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No more pages, scan done.|None|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|Job was deleted. Return 404 instead upon restart of the Dynamic Web TWAIN Service as that clears all job info.|Inline|

#### Response Examples

> 200 Response

```json
[
  {
    "extendedImageInfo": {},
    "imageId": 1,
    "imageInfo": {
      "BitsPerPixel": 24,
      "BitsPerSample": [
        8,
        8,
        8,
        0,
        0,
        0,
        0,
        0
      ],
      "Compression": 0,
      "ImageLayout": {
        "DocumentNumber": 1,
        "Frame": {
          "Bottom": 11,
          "Left": 0,
          "Right": 8.5,
          "Top": 0
        },
        "FrameNumber": 0,
        "PageNumber": 1
      },
      "ImageLength": 2200,
      "ImageWidth": 1700,
      "PixelType": 2,
      "Planar": false,
      "SamplesPerPixel": 3,
      "XResolution": 200,
      "YResolution": 200
    },
    "imageuid": "1951d65a72b1",
    "url": "https://127.0.0.1:18623/api/device/scanners/jobs/510dadf2-7e29-4172-80f1-49fa5d2ea0bf/next-page?page=1951d65a72b1"
  }
]
```

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Job was deleted.",
  "statusCode": 410
}
```

### `GET /device/scanners/jobs/{jobuid}/next-page`

Get the page in a scan job, provided its `jobuid`.

Use the `type` parameter to set the format of the image as either `jpeg` or `png`. This API will not return until the scanned page is ready. If the response code is `200`, you can keep calling this API until a code `204` response. Obtain the `jobuid` from the response of the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`jobuid`|path|`string`| yes | none |Unique identifier for the scan job, obtained from the [`POST /device/scanners/jobs`](#post-devicescannersjobs) scan job creation request. |
|`type`|query|`string`| no | - `image/png`: PNG<br/> - `image/jpeg`: JPEG |Default value `image/png` - the image format of the page, either `image/png` or `image/jpeg`.|

#### Request Example

Get the next page from a scan job as a `png`:

```js
const url = new URL("https://127.0.0.1:18623/api");
const jobuid = `B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86`;
const pathSegments = ['device', 'scanners', 'jobs', jobuid, 'next-page'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

const params = new URLSearchParams();
params.append(`type`, 'image/png');

url.search = params.toString();
let requestOptions = {
   method: 'GET',
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation. Return `image/png` or `image/jpeg` stream.|binary data stream|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No more pages, scan done.|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided job UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|
|410|[Gone](https://tools.ietf.org/html/rfc7231#section-6.5.9)|Job was deleted. Return 404 instead upon restart of the Dynamic Web TWAIN Service as that clears all job info.|[`Error`](#error)|

#### Response Examples

> 200 Response

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 404 Response

```json
{
  "code": -1034,
  "message": "The provided job UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

> 410 Response

```json
{
  "code": -1034,
  "message": "Job was deleted.",
  "statusCode": 410
}
```

## Document Management

### `POST /storage/documents`

Create a new document for storage.

The document is stored in the Dynamic Web TWAIN Service working directory, and all content is optionally encrypted with the supplied `password` string. The request returns a document `uid` upon successfully creating the document.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`CreateDocumentOptions`|body|[`CreateDocumentOptions`](#createdocumentoptions)| no | none ||

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Successful operation.|[`DocumentInfo`](#documentinfo)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

<!--#### Responses Data Schema

HTTP Status Code **201**

|Name|Type|Required|Restrictions|Title|Description|
|---|---|---|---|---|---|
|uid|string|true|none|Document UID.|
|pages|`[uid]`|true|none|Array of page UIDs.|
|» `uid`|string|true|none|Page UID.| -->

#### Request Example

Create a new document with a password:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['storage', 'documents'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

let raw = JSON.stringify({ password: 'myPassword' });

let requestOptions = {
   method: 'POST',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Response Examples

> 201 Response

```json
{
  "uid": "190807444d76",
  "pages": []
}
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports POST.",
  "statusCode": 405
}
```

### `GET /storage/documents/{documentuid}`

Get info of a document stored in the working directory of the Dynamic Web TWAIN Service, provided the `documentuid`.

This information consists of the `documentuid` and an array of page `uid`. If the document is password-encrypted, this request must provide the password for access. Obtain the `document` from the response of the [`POST storage/documents`](#post-storagedocuments) document creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`documentuid`|path|`string`| yes | none |The UID of the document.|
|`X-DICS-DOC-PASSWORD`|header|`string`| no | length <= 32 characters |The password of the document (32 characters max).|

#### Request Example

Get document information for an encrypted document:

```js
const url = new URL("https://127.0.0.1:18623/api");
const documentuid = `190807444d76`;
const pathSegments = ['storage', 'documents', documentuid];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-DOC-PASSWORD", "myPassword");

let requestOptions = {
   method: 'GET',
   headers: myHeaders,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation|[`DocumentInfo`](#documentinfo)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|none|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided document UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

<!--#### Responses Data Schema

HTTP Status Code **201**

|Name|Type|Required|Restrictions|Title|Description|
|---|---|---|---|---|---|
|uid|string|true|none|Document UID.|
|pages|`[uid]`|true|none|Array of page UIDs.|
|» `uid`|string|true|none|Page UID.|  -->

#### Response Examples

> 200 Response

```json
{
  "uid": "190807444d76",
  "pages": [
    {
      "uid": "190817548d70"
    },
    {
      "uid": "190817648270"
    }
  ]
}
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 403 Response

```json
{
  "code": -1043,
  "message": "The password is not valid.",
  "statusCode": 403
}
```

> 404 Response

```json
{
  "code": -1040,
  "message": "The provided UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, DELETE.",
  "statusCode": 405
}
```

### `DELETE /storage/documents/{documentuid}`

Delete a stored document.

Delete a document stored in the working directory of the Dynamic Web TWAIN Service. If the document is password-encrypted, this request must provide the password for access. Obtain the `document` from the response of the [`POST storage/documents`](#post-storagedocuments) document creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`documentuid`|path|`string`| yes |none|The UID of the document.|
|`X-DICS-DOC-PASSWORD`|header|`string`| no |length <= 32 characters|The password of the document (32 characters max).|

#### Request Example

Delete an encrypted document:

```js
const url = new URL("https://127.0.0.1:18623/api");
const documentuid = `190807444d76`;
const pathSegments = ['storage', 'documents', documentuid];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-DOC-PASSWORD", "myPassword");

let requestOptions = {
   method: 'DELETE',
   headers: myHeaders,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|Successful operation.|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The password is not valid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided document UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

#### Response Examples

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 403 Response

```json
{
  "code": -1043,
  "message": "The password is not valid.",
  "statusCode": 403
}
```

> 404 Response

```json
{
  "code": -1040,
  "message": "The provided document UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET, DELETE.",
  "statusCode": 405
}
```

### `GET /storage/documents/{documentuid}/content`

Get pages of a stored document, provided its `documentuid`.

Get pages of a document stored in the working directory of the Dynamic Web TWAIN Service. By default this API retrieves the pages as a single `PDF`, but can also provide a multi-page `TIFF` file, or retrieve pages separately as`JPEG` or `PNG` files. This API can select multiple pages by page `uid` or page index. If no pages are specified and the format is either `PDF` or `TIFF`, it retrieves all pages in the document as one file. The API can also specify file attributes such as file encryption password and compression level, as well as file metadata such as creation date, author name, and key words. If the document is password-encrypted, this request must provide the password for access. Obtain the `document` from the response of the [`POST storage/documents`](#post-storagedocuments) document creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`documentuid`|path|`string`| yes |none|The UID of the document.|
|`type`|query|`string`| no | - `image/jpeg`: JPEG<br/> - `image/png`: PNG<br/> - `image/tiff`: TIFF<br/> - `application/pdf`: PDF |Default value `application/pdf` - output mime type.|
|`quality`|query|`integer(int32)`| no | - 0 <= `quality` <= 100 if `compression` is `6`<br/> - Empty if `compression` is not `6` |Default value `80` - compression from 0 to 100, higher is more compression. This is only valid for the PDF `jpeg/jpeg2000` compression method.|
|`pages`|query|`string`| no | - Comma-separated integers: page indices<br/> - Comma-separated UIDs: page UIDs |Default value `''` - comma-separated page identifiers - either indices or `uid`, e.g. `pages=5,2,1` if using indices. If no pages are specified and the output `type` is either `image/png` or `image/jpeg`, only return the first page; if `type` is `image/tiff` or `application/pdf`, return all pages in the document.|
|`author`|query|`string`| no | none |Default value `''` - author name.|
|`compression`|query|`integer(int32)`| no | - `0`: `PDF_AUTO`<br/> - `2`: `PDF_FAX4`<br/> - `3`: `PDF_LZW`<br/> - `5`: `PDF_JPEG`<br/> - `6`: `PDF_JP2000`<br/> - `7`: `PDF_JBIG2`<br/> - `0`: `TIFF_AUTO`<br/> - `1`: `TIFF_NONE`<br/> - `2`: `TIFF_RLE`<br/> - `3`: `TIFF_FAX3`<br/> - `3`: `TIFF_T4`<br/> - `4`: `TIFF_FAX4`<br/> - `4`: `TIFF_T6`<br/> - `5`: `TIFF_LZW`<br/> - `7`: `TIFF_JPEG`<br/> - `32773`: `TIFF_PACKBITS` |Default value `0` - compression type for `PDF` and `TIFF`. The default value `0` corresponds to auto-compression. See the enumerations for [`TIFF`]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_tiffcompressiontype) and [`PDF`]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_pdfcompressiontype) for valid compression methods.|
|`pageType`|query|`integer(int32)`| no | - `0`: `Page_Default`<br/> - `1`: `Page_Custom`<br/> - `2`: `Page_A4`<br/> - `3`: `Page_A4_Reverse`<br/> - `4`: `Page_A3`<br/> - `5`: `Page_A3_Reverse`<br/> - `6`: `Page_Letter`<br/> - `7`: `Page_Letter_Reverse`<br/> - `8`: `Page_Legal`<br/> - `9`: `Page_Legal_Reverse` |Default value `0` - standard dimensions for the page. See [`EnumDWT_CapSupportedSizes`]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_capsupportedsizes) for more details.|
|`creator`|query|`string`| no | none |Default value `''` - creator name.|
|`creationDate`|query|`string`| no | none |Default value `''` - creation date.|
|`keyWords`|query|`string`| no | none |Default value `''` - key words.|
|`modifiedDate`|query|`string`| no | none |Default value `''` - modification date.|
|`producer`|query|`string`| no | none |Default value `''` - producer name.|
|`subject`|query|`string`| no | none |Default value `''` - subject.|
|`title`|query|`string`| no | none |Default value `''` - title.|
|`version`|query|`string`| no | none |Default value `1.5` - version.|
|`password`|query|`string`| no | length <= 32 characters |Default value `''` - PDF file encryption password. The file is unencrypted by default. Note that this is distinct from the document password given by `X-DICS-DOC-PASSWORD`.|
|`X-DICS-DOC-PASSWORD`|header|`string`| no | length <= 32 characters |The password of the document (32 characters max).|

#### Request Example

Get two pages (by page `uid`) of a password-protected document as a TIFF file. Set a file password and a compression level of 50%:

```js
const url = new URL("https://127.0.0.1:18623/api");
const documentuid = `190807444d76`;
const pathSegments = ['storage', 'documents', documentuid];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-DOC-PASSWORD", "myPassword");

let raw = JSON.stringify({
  pages: '190817548d70,190817648270',
  password: 'myFilePassword',
  quality: 50
  });

let requestOptions = {
   method: 'GET',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|binary data stream|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The password is not valid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided document UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

#### Response Examples

> 200 Response

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 403 Response

```json
{
  "code": -1043,
  "message": "The password is not valid.",
  "statusCode": 403
}
```

> 404 Response

```json
{
  "code": -1040,
  "message": "The provided document UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports GET.",
  "statusCode": 405
}
```

### `POST /storage/documents/{documentuid}/pages`

Insert pages into a stored document, provided its `documentuid`.

This API is used to insert scanned pages from a scan job to a document stored in the working directory of the Dynamic Web TWAIN Service. The API appends pages to the end of the document by default, though it can specify an insertion index. Obtain the `document` from the response of the [`POST storage/documents`](#post-storagedocuments) document creation request.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`documentuid`|path|`string`| yes | none |The UID of the document.|
|`X-DICS-DOC-PASSWORD`|header|`string`| no | length <= 32 characters |The password of the document (32 characters max).|
|`insertPos`|body|`number`| no | `0` < `insertPos` <= document page count |The insertion index that the new pages will be inserted in front of, hence it must be a positive integer. If this is not set or is invalid, insert the pages at the end of the document.|
|`source`|body|`string`| yes | Scan job URL |Image source URL from the scan job, e.g. `https://127.0.0.1:18623/api/device/scanners/jobs/dd40716d-48d1-4d32-89f7-1d53f9665d91/next-page?page=19522d0c5282`.|

#### Request Example:

Insert scanned pages from a scan job to the beginning of a stored document:

```js
const url = new URL("https://127.0.0.1:18623/api");
const documentuid = `190807444d76`;
const pathSegments = ['storage', 'documents', documentuid, 'pages'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-DOC-PASSWORD", "myPassword");

let raw = JSON.stringify({
  insertPos: 1,
  source: 'https://127.0.0.1:18623/api/device/scanners/jobs/dd40716d-48d1-4d32-89f7-1d53f9665d91/next-page?page=19522d0c5282',
  });

let requestOptions = {
   method: 'POST',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Page Inserted successfully.|[`DocumentInfo`](#documentinfo)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The password is not valid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided document UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

<!--#### Responses Data Schema

HTTP Status Code **201**

|Name|Type|Required|Restrictions|Title|Description|
|---|---|---|---|---|---|
|uid|string|true|none|Document UID.|
|pages|`[uid]`|true|none|Array of page UIDs.|
|» `uid`|string|true|none|Page UID.| -->

#### Response Examples

> 200 Response

```json
{
  "uid": "190807444d76",
  "pages": [
    {
      "uid": "190817548d70"
    },
    {
      "uid": "190818458d85"
    }
  ]
}
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 403 Response

```json
{
  "code": -1043,
  "message": "The password is not valid.",
  "statusCode": 403
}
```

> 404 Response

```json
{
  "code": -1040,
  "message": "The provided document UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports POST.",
  "statusCode": 405
}
```

### `DELETE /storage/documents/{documentuid}/pages/{param}`

Delete a page in a stored document, provided its `documentuid` and page `uid`/index.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`documentuid`|path|`string`| yes | none |The UID of the document.|
|`param`|path|`string`| yes | - None-negative integer less than page count: page index<br/> - valid page UID: page UID |UID of the page or 0-based page index.|
|`X-DICS-DOC-PASSWORD`|header|`string`| no | length <= 32 characters |The password of the document (32 characters max).|

#### Request Example:

Delete the third page stored in a password-encrypted document:

```js
const url = new URL("https://127.0.0.1:18623/api");
const documentuid = `190807444d76`;
const param = '2';
const pathSegments = ['storage', 'documents', documentuid, 'pages', param];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-DOC-PASSWORD", "myPassword");

let requestOptions = {
   method: 'DELETE',
   headers: myHeaders,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|Page removed successfully.|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|The password is not valid.|[`Error`](#error)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|The provided page UID is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed|[`Error`](#error)|

#### Response Examples

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 403 Response

```json
{
  "code": -1043,
  "message": "The password is not valid.",
  "statusCode": 403
}
```

> 404 Response

```json
{
  "code": -1040,
  "message": "The provided page UID is invalid.",
  "statusCode": 404
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports DELETE.",
  "statusCode": 405
}
```

## Document Processing

### `POST /process/read-barcode`

Create a new document process to read a barcode on a scanned page.

Barcode scanning requires a valid Barcode Reader Add-On license. Blank page detection is only supported on Windows.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`X-DICS-LICENSE-KEY`|header|`string`| yes | none |A DWT license key with the Barcode Reader and RESTful API module. Contact our [sales team](https://www.dynamsoft.com/company/contact/) for a full license, or get a [30-day free trial](https://www.dynamsoft.com/web-twain/downloads/).|
|`source`|body|`string`| yes |Scan job URL |Image source URL from the scan job, e.g. `https://127.0.0.1:18623/api/device/scanners/jobs/dd40716d-48d1-4d32-89f7-1d53f9665d91/next-page?page=19522d0c5282`.|
|`settings`|body|`string`| Valid barcode reading template JSON - see [`RuntimeSettings`]({{ site.api }}Interfaces.html#runtimesettings) for more details |no| Barcode reader template settings. Defaults to the `BestCoverage` setting by default. The basic settings are `BestCoverage`, `BestSpeed`, and `Balance`. Read the Barcode Reader Add-On guide for details on [basic settings]({{ site.extended-usage }}barcode-processing.html#built-in-modes) and advanced [scanning templates]({{ site.extended-usage }}barcode-processing.html#set-the-runtime-settings-using-json).|

#### Request Example:

Read a barcode on a page from a scan job with the "best speed" barcode reader setting:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['process', 'read-barcode'];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("X-DICS-LICENSE-KEY", "YOUR_LICENSE_KEY_HERE");

let raw = JSON.stringify({
  settings: '{"ImageParameter":{"Name":"BestSpeed","BarcodeFormatIds_2":["BF2_POSTALCODE","BF2_DOTCODE"],"DeblurLevel":3,"ExpectedBarcodesCount":512,"LocalizationModes":[{"Mode":"LM_SCAN_DIRECTLY"}],"TextFilterModes":[{"MinImageDimension":262144,"Mode":"TFM_GENERAL_CONTOUR"}]}}',
  source: 'https://127.0.0.1:18623/api/device/scanners/jobs/dd40716d-48d1-4d32-89f7-1d53f9665d91/next-page?page=19522d0c5282',
  });

let requestOptions = {
   method: 'POST',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[`BarcodeResult[]`](#barcoderesult)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|License is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

<!--#### Responses Data Schema

HTTP Status Code **200**

|Name|Type|Required|Restrictions|Title|Description|
|---|---|---|---|---|---|
|» result|boolean|true|none|is blank image or not|-->

#### Response Examples

> 200 Response

```json
[
  {
    "BarcodeFormat": 2,
    "BarcodeFormatString": "CODE_128",
    "LocalizationResult": {
      "ResultPoints": [
        "723, 274",
        "1021, 275",
        "1021, 375",
        "723, 374"
      ],
      "accompanyingTextBytes": [],
      "angle": 0,
      "barcodeFormat": 3147775,
      "barcodeFormatString": "OneD",
      "barcodeFormatString_2": "No Barcode Format in group 2",
      "barcodeFormat_2": 0,
      "confidence": 100,
      "documentName": "{B683937D-B327-4488-A2C0-499760CB6BF0}",
      "moduleSize": 2,
      "pageNumber": 1,
      "regionName": "",
      "resultCoordinateType": 1,
      "terminatePhase": 32,
      "x1": 723,
      "x2": 1021,
      "x3": 1021,
      "x4": 723,
      "y1": 274,
      "y2": 275,
      "y3": 375,
      "y4": 374
    },
    "barcodeBytes": [
      67,
      79,
      68,
      69,
      49,
      50,
      56
    ],
    "barcodeFormat": 2,
    "barcodeFormatString": "CODE_128",
    "barcodeFormatString_2": "No Barcode Format in group 2",
    "barcodeFormat_2": 0,
    "barcodeText": "CODE128",
    "detailedResult": {
      "checkDigitBytes": [],
      "moduleSize": 2,
      "startCharsBytes": [],
      "stopCharsBytes": []
    },
    "localizationResult": {
      "ResultPoints": [
        "723, 274",
        "1021, 275",
        "1021, 375",
        "723, 374"
      ],
      "accompanyingTextBytes": [],
      "angle": 0,
      "barcodeFormat": 3147775,
      "barcodeFormatString": "OneD",
      "barcodeFormatString_2": "No Barcode Format in group 2",
      "barcodeFormat_2": 0,
      "confidence": 100,
      "documentName": "{B683937D-B327-4488-A2C0-499760CB6BF0}",
      "moduleSize": 2,
      "pageNumber": 1,
      "regionName": "",
      "resultCoordinateType": 1,
      "terminatePhase": 32,
      "x1": 723,
      "x2": 1021,
      "x3": 1021,
      "x4": 723,
      "y1": 274,
      "y2": 275,
      "y3": 375,
      "y4": 374
    },
    "results": [
      {
        "accompanyingTextBytes": [],
        "barcodeFormat": 2,
        "barcodeFormatString": "CODE_128",
        "barcodeFormatString_2": "No Barcode Format in group 2",
        "barcodeFormat_2": 0,
        "bytes": [
          67,
          79,
          68,
          69,
          49,
          50,
          56
        ],
        "clarity": -1,
        "confidence": 100,
        "deformation": 0,
        "resultType": 0
      }
    ]
  }
]
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 403 Response

```json
{
  "code": -2800,
  "message": "The current product key is empty or invalid. Please contact the site administrator.",
  "statusCode": 403
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports POST.",
  "statusCode": 405
}
```

### `POST /process/check-blank`

Create a new document process to check if a scanned page is blank.

Blank page detection is **only supported on Windows**.

#### Parameters

|Name|Location|Type|Required|Restrictions|Description|
|---|---|---|---|---|---|
|`source`|body|`string`| yes |Scan job URL |Image source URL from the scan job, e.g. `https://127.0.0.1:18623/api/device/scanners/jobs/dd40716d-48d1-4d32-89f7-1d53f9665d91/next-page?page=19522d0c5282`.|
|`settings`|body|[`CheckBlankSettings`](#checkblanksettings)| no |none |Maximum and minimum blemish pixel height detection thresholds.|

#### Request Example:

Check if a page from a scan job is blank:

```js
const url = new URL("https://127.0.0.1:18623/api");
const pathSegments = ['process', `check-blank`];
url.pathname = `${url.pathname}/${pathSegments.join('/')}`;

let myHeaders = new Headers();
myHeaders.append("Content-Type", "application/json");

let raw = JSON.stringify({
  settings: {
    "minBlockHeight": 20,
    "maxBlockHeight": 30
  },
  source: 'https://127.0.0.1:18623/api/device/scanners/jobs/dd40716d-48d1-4d32-89f7-1d53f9665d91/next-page?page=19522d0c5282',
  });

let requestOptions = {
   method: 'POST',
   headers: myHeaders,
   body: raw,
   redirect: 'follow'
};

fetch(url, requestOptions)
   .then(response => response.text())
   .then(result => console.log(result))
   .catch(error => console.log('error', error));
```

#### Responses

|HTTP Status Code |Meaning|Description|Data Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Successful operation.|[OperationResult](#operationresult)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad request, e.g. parameter is invalid.|[`Error`](#error)|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method not allowed.|[`Error`](#error)|

#### Response Examples

> 200 Response

```json
{
  "result": true
}
```

> 400 Response

```json
{
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}
```

> 405 Response

```json
{
  "code": -2112,
  "message": "This endpoint only supports POST.",
  "statusCode": 405
}
```

## Data Schema

### `Error`

```json
{
  "cause": {
    "code": 3,
    "message": "The system cannot find the path specified."
  },
  "code": -2113,
  "message": "The parameter is not valid.",
  "statusCode": 400
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`statusCode`|`number`|true|HTTP status code|HTTP status code|
|`code`|`number(int32)`|true|none|[Dynamic Web TWAIN Service status code]({{ site.api }}appendix.html). `0` is the only successful code. All error codes are negative.|
|`message`|`string`|true|none|none|
|`cause`|`object`|false|none|If cause exists, shows the system error code and message.|
|» `code`|`number(int32)`|false|none|System error code.|
|» `message`|`string`|false|none|System error string of the code.|

### `ScannerType`

```json
16
```

One or a combination of:
- `0x10`: `TWAINSCANNER`
- `0x20`: `WIASCANNER`
- `0x40`: `TWAINX64SCANNER`
- `0x80`: `ICASCANNER`
- `0x100`: `SANESCANNER`
- `0x200`: `ESCLSCANNER`
- `0x400`: `WIFIDIRECTSCANNER`
- `0x800`: `WIATWAINSCANNER` 

[External documentation]({{ site.api }}Dynamsoft_Enum.html#dynamsoftdwtenumdwt_devicetype)

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`type`|`integer(int32)`|false|none|One or a combination of:<br/>  - `0x10`: `TWAINSCANNER`<br/> - `0x20`: `WIASCANNER`<br/> - `0x40`: `TWAINX64SCANNER`<br/> - `0x80`: `ICASCANNER`<br/> - `0x100`: `SANESCANNER`<br/> - `0x200`: `ESCLSCANNER`<br/> - `0x400`: `WIFIDIRECTSCANNER`<br/> - `0x800`: `WIATWAINSCANNER`|

### `Scanner`

```json
{
  "name": "TWAIN2 FreeImage Software Scanner",
  "type": 16,
  "device": "{\"deviceInfo\":{\"Manufacturer\":\"VFdBSU4gV29ya2luZyBHcm91cA==\",\"ProductFamily\":\"U29mdHdhcmUgU2Nhbg==\",\"ProductName\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\",\"ProtocolMajor\":2,\"ProtocolMinor\":1,\"SupportedGroups\":0,\"Version\":{\"Country\":1,\"Info\":\"Mi4xLjMgc2FtcGxlIHJlbGVhc2UgMzJiaXQ=\",\"Language\":2,\"MajorNum\":2,\"MinorNum\":1}},\"deviceType\":16,\"isSystemDefaultPrinter\":false,\"name\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\"}"
}

```

We also return websocket protocol info. but not list.

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`name`|`string`|true|none|Scanner name|
|`type`|[`ScannerType`](#scannertype)|true|none|one value of `ScannerType`|
|`device`|`string`|true|none|A json string of the scanner details.|

### `CreateScanJobOptions`

```json
{
  "autoRun": false,
  "device": "{\"deviceInfo\":{\"Manufacturer\":\"VFdBSU4gV29ya2luZyBHcm91cA==\",\"ProductFamily\":\"U29mdHdhcmUgU2Nhbg==\",\"ProductName\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\",\"ProtocolMajor\":2,\"ProtocolMinor\":1,\"SupportedGroups\":0,\"Version\":{\"Country\":1,\"Info\":\"Mi4xLjMgc2FtcGxlIHJlbGVhc2UgMzJiaXQ=\",\"Language\":2,\"MajorNum\":2,\"MinorNum\":1}},\"deviceType\":16,\"isSystemDefaultPrinter\":false,\"name\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\"}",
  "name": "TWAIN2 FreeImage Software Scanner",
  "checkFeederLoaded": true,
  "config": {
    "PixelType": 1,
    "Resolution": 300,
    "IfFeederEnabled": true,
    "IfDuplexEnabled": false,
    "IfGetImageInfo": true,
    "IfGetExtImageInfo": true,
    "extendedImageInfoQueryLevel": 0,
    "IfCloseSourceAfterAcquire": true,
    "XferCount": 11
  },
  "caps": {
    "exception": "ignore",
    "capabilities": [
      {
        "capability": 4355,
        "curValue": 500
      }
    ]
  },
  "settings": "Rfj6pIMTNkCu3BfDloGItBAAAAACEAAABgAFAAEAAAAQAAAAExAAAAYABQAAAAAAEAAAAAcQAAAGAAUAAQAAABAAAAArEQAABAAFABgAAAAQAAAAHBEAAAQABQAAAAAAEAAAAAABAAAEAAUAAAAAABwAAAAUEQAACAAFAPgqAAAAAAAANCEAAAAAAAAQAAAADBEAAAQABQACAAAAEAAAAB8RAAAEAAUAAAAAABAAAAABAQAABAAFAAIAAAAQAAAAIBEAAAQABQAAAAAAEAAAACIRAAAEAAUAAwAAABAAAAAQEQAABAAFAAAAAAAQAAAAAgEAAAQABQAAAAAAEAAAABgRAAAHAAUAAABIQxAAAAAZEQAABwAFAAAASEMQAAAAIxEAAAcABQAAAABDEAAAAAMRAAAHAAUAAAAAABAAAAABEQAABwAFAAAAAAAQAAAACBEAAAcABQAAAIA/EAAAAAGAAAAGAAUAAAAAAA=="
}

```

#### Attributes


|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
| `autoRun`| body| `boolean` | no | Default value `true` - run the scan job immediately after creation. If false, the job gets created but does not run. Rather, the job status is set to pending, the scanner gets locked (no other RESTful client can use the scanner until this job completes or gets canceled), and the image source opens automatically if the scanner is a twain source. We recommend settings this to `false` to prevent other machines from capturing the scan job.|
| `scannerFailureTimeout` | body     | `integer(int32)` | no       | Default value `15` - communication time-out with scanner for an operation (open source, set capability/settings, acquire image)in seconds, which resets upon successful completion of the operation. The operation fails if it exceeds the time-out without a response, e.g. trying to open a disconnected scanner, a paper jam, the user not interacting with an error dialog, etc. Therefore, we recommend setting a longer time-out if the user is not physically close to the scanner.          |
| `jobTimeout`            | body     | `integer(int32)` | no       | Time-out for the scan job in seconds. Default value is `0` which never times out. If you create a pending job, the scanner automatically locks. You can release the scanner by deleting the job or allowing the job to time out. The timer begins once the pending job is created, and the timer stops once the job starts running. The timer resets (if set) when the job is done (completed, canceled or fault). |
| `device`                | body     | `string`         | no       | JSON string of scanner info in `Device.device` returned by [`GET /device/scanners`](#get-devicescanners).  |
| `config`                | body     | `object`         | no       | Further scanner configurations, applied in the following order: `settings` -> `caps` -> `config`. |
| `caps`                  | body     | `object`         | no       | scanner capability setting  |
| `settings`              | body     | `string`         | no       | TWAIN-specific scanner settings, returned by `/device/scanners/twain/settings`. When both `caps` and `settings` exist, DWT applies `settings` first, then applies `caps` second.  |
| `checkFeederLoaded`     | body     | `boolean`        | no       | When `true`, detects if the feeder is loaded on TWAIN scanners with supported drivers. Default value `false`. May not be reliable for unsupported drivers. |



### `ScannerJob`

```json
{
  "jobuid": "B3701DC5-86D3-44B6-A8A1-FF0B5D43FD86",
  "status": "pending",
  "scanner": {
    "name": "TWAIN2 FreeImage Software Scanner",
    "type": 16,
    "device": "{\"deviceInfo\":{\"Manufacturer\":\"VFdBSU4gV29ya2luZyBHcm91cA==\",\"ProductFamily\":\"U29mdHdhcmUgU2Nhbg==\",\"ProductName\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\",\"ProtocolMajor\":2,\"ProtocolMinor\":1,\"SupportedGroups\":0,\"Version\":{\"Country\":1,\"Info\":\"Mi4xLjMgc2FtcGxlIHJlbGVhc2UgMzJiaXQ=\",\"Language\":2,\"MajorNum\":2,\"MinorNum\":1}},\"deviceType\":16,\"isSystemDefaultPrinter\":false,\"name\":\"VFdBSU4yIEZyZWVJbWFnZSBTb2Z0d2FyZSBTY2FubmVy\"}"
  }
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`jobuid`|`string`|true|none|none|
|`status`|`string`|true|- `pending`: pending<br/> - `running`: running<br/> - `completed`: completed<br/> - `faulted`: faulted<br/> - `canceled`: canceled|If the job is completed, the status will be `completed`; If faulted, the status will be `faulted`, e.g. failed to open source, scanner was locked by others. Possible job status transitions: <br />  1. `pending`->`running`->`completed`<br />  2. `pending`->`running`->`faulted`<br />  3. `pending`->`running`->`canceled`|
|`scanner`|[`Scanner`](#scanner)|true|none|We also return websocket protocol info. but not list.|

### `ScannerJobInfo`

```json
{
  "status": "pending",
  "code": "0",
  "message": "Successful"
}
```

#### Attributes

*Scanner Job Information*

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`status`|`string`|true|- `pending`: pending<br/> - `running`: running<br/> - `completed`: completed<br/> - `faulted`: faulted<br/> - `canceled`: canceled|Scanner job status.|
|`code`|`number`|true|none|error code|
|`message`|`string`|true|none|error message|

### `PageInfo`

```json
{
  "uid": "190817548d70"
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`uid`|`string`|true|none|page uid|

### `DocumentInfo`

```json
{
  "uid": "190807444d76",
  "pages": [
    {
      "uid": "190817548d70"
    }
  ]
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`uid`|`string`|true|none|document uid|
|`pages`|[[`PageInfo`](#pageinfo)]|true|none|pages info|

### `ServerSettingsInput`

```json
{
  "logLevel": 1
}

```

some settings only admin can change. can only update any of them.

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`logLevel`|`integer(int32)`|false|none|Log level of the DWT Service - `0` is disabled, `1` is debug + info + error, `30` is verbose.|

### `ServerSettings`

```json
{
  "logLevel": 1
}

```

Currently, only return log level.

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`logLevel`|`integer(int32)`|true|none|Log level of the DWT Service - `0` is disabled, `1` is debug + info + error, `30` is verbose.|

### `CreateDocumentOptions`

```json
{
  "password": ""
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`password`|`string`|false|none|length <= 32 characters |The password of the document (32 characters max).|

### `VersionInfo`

```json
{
  "version": "20240719",
  "compatible": true
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`version`|`string`|false|none|server api version.|
|`compatible`|`boolean`|false|none|server is compatible with the client.|

### `CheckBlankSettings`

```json
"settings": {
  "minBlockHeight": 20,
  "maxBlockHeight": 30
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`minBlockHeight`|`number`|true|0 < `minBlockHeight` <= `maxBlockHeight`|Minimum blemish pixel height detection threshold.|
|`maxBlockHeight`|`number`|true|`minBlockHeight` <= `maxBlockHeight`|Maximum blemish pixel height detection threshold.|

### `ScannerJobStatus`

```json
{
  "status": "running"
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`status`|`string`|true|none|scanner job status.|


### `OperationResult`

```json
{
  "result": true
}

```

#### Attributes

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`result`|`boolean`|true|none|is blank image or not|


### `BarcodeResult`

```json
{
    "BarcodeFormat": 2,
    "BarcodeFormatString": "CODE_128",
    "LocalizationResult": {
      "ResultPoints": [
        "723, 274",
        "1021, 275",
        "1021, 375",
        "723, 374"
      ],
      "accompanyingTextBytes": [],
      "angle": 0,
      "barcodeFormat": 3147775,
      "barcodeFormatString": "OneD",
      "barcodeFormatString_2": "No Barcode Format in group 2",
      "barcodeFormat_2": 0,
      "confidence": 100,
      "documentName": "{B683937D-B327-4488-A2C0-499760CB6BF0}",
      "moduleSize": 2,
      "pageNumber": 1,
      "regionName": "",
      "resultCoordinateType": 1,
      "terminatePhase": 32,
      "x1": 723,
      "x2": 1021,
      "x3": 1021,
      "x4": 723,
      "y1": 274,
      "y2": 275,
      "y3": 375,
      "y4": 374
    },
    "barcodeBytes": [
      67,
      79,
      68,
      69,
      49,
      50,
      56
    ],
    "barcodeFormat": 2,
    "barcodeFormatString": "CODE_128",
    "barcodeFormatString_2": "No Barcode Format in group 2",
    "barcodeFormat_2": 0,
    "barcodeText": "CODE128",
    "detailedResult": {
      "checkDigitBytes": [],
      "moduleSize": 2,
      "startCharsBytes": [],
      "stopCharsBytes": []
    },
    "localizationResult": {
      "ResultPoints": [
        "723, 274",
        "1021, 275",
        "1021, 375",
        "723, 374"
      ],
      "accompanyingTextBytes": [],
      "angle": 0,
      "barcodeFormat": 3147775,
      "barcodeFormatString": "OneD",
      "barcodeFormatString_2": "No Barcode Format in group 2",
      "barcodeFormat_2": 0,
      "confidence": 100,
      "documentName": "{B683937D-B327-4488-A2C0-499760CB6BF0}",
      "moduleSize": 2,
      "pageNumber": 1,
      "regionName": "",
      "resultCoordinateType": 1,
      "terminatePhase": 32,
      "x1": 723,
      "x2": 1021,
      "x3": 1021,
      "x4": 723,
      "y1": 274,
      "y2": 275,
      "y3": 375,
      "y4": 374
    },
    "results": [
      {
        "accompanyingTextBytes": [],
        "barcodeFormat": 2,
        "barcodeFormatString": "CODE_128",
        "barcodeFormatString_2": "No Barcode Format in group 2",
        "barcodeFormat_2": 0,
        "bytes": [
          67,
          79,
          68,
          69,
          49,
          50,
          56
        ],
        "clarity": -1,
        "confidence": 100,
        "deformation": 0,
        "resultType": 0
      }
    ]
  }

```