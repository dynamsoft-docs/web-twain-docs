---
layout: default-layout
needAutoGenerateSidebar: true
needGenerateH3Content: true
title: Dynamic Web TWAIN SDK API Reference - Uploader APIs
keywords: Dynamic Web TWAIN, Documentation, API Reference, Uploader APIs
breadcrumbText: File Uploader
description: Dynamic Web TWAIN SDK Documentation API Reference Uploader APIs Page
permalink: /info/api/Dynamsoft_FileUploader.html
---

# FileUploader Module

The File Uploader is an independent component that is dedicated to file uploading. [>> HTTP with the File Uploader]({{site.indepth}}/features/output.html#http-with-the-file-uploader)

## Dynamsoft.FileUploader

### Init()

Initialize and create a FileUploader instance.

**Syntax**

```typescript
Init(
    URL: string,
    successCallback: (uploadManager: UploadManager) => void,
    failureCallback: (errorCode: number, errorString: string) => void
): void;
```

**Parameters**

`URL`: Specify a path to retrieve the FileUploader library.

`successCallback`: A callback function that is executed if the request succeeds.
- `uploadManager`: A FileUploader instance. Please refer to [`UploadManager`](#uploadmanager).

`failureCallback`: A callback function that is executed if the request fails.
- `errorCode`: The error code.
- `errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Example**

```javascript
var dsUploadManager;
Dynamsoft.FileUploader.Init(
  "",
  function (obj) {
    dsUploadManager = obj;
  },
  function () {}
);
```

**Usage notes**

The FileUploader library is installed with Dynamsoft Service by default, therefore, `URL` can be left empty "".

## UploadManager

**Methods**

|                       |
| :-------------------- | :-------------------------------------- | --------------------------------------------------------- |
|  [`CreateJob()`](#createjob)  |  [`Run()`](#run)  |   [`Cancel()`](#cancel) |
| [`CancelAllUpload()`](#cancelallupload) | | |


### CreateJob()

Create an upload job. 

**Syntax**

```typescript
CreateJob(): Job;
```

Please refer to [`Job`](#job).

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### Run()

Start uploading (processing the specified job).

**Syntax**

```typescript
Run(job: Job): boolean;
```

**Parameters**

`job`: Specify the job.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### Cancel()

Cancel a job.

**Syntax**

```typescript
Cancel(job: Job): boolean;
```

**Parameters**

`job`: Specify the job.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### CancelAllupload()

Cancel all jobs.

**Syntax**

```typescript
CancelAllUpload(): boolean;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage notes**

[`Cancel()`](#cancel) or [`CancleAllUpload()`](#cancelallupload) should be called in the event [`OnUploadTransferPercentage`](#onuploadtransferpercentage).

**Example**

```javascript
var dsUploadManager;
Dynamsoft.FileUploader.Init(
  "",
  function (obj) {
    dsUploadManager = obj;
    var job = dsUploadManager.CreateJob();
    job.OnUploadTransferPercentage = FileUpload_OnUploadTransferPercentage;
    dsUploadManager.Run(job);

    function FileUpload_OnUploadTransferPercentage(job, iPercentage) {
      console.log("job cancelled!");
      dsUploadManager.Cancel(job);
    }
  },
  function () {}
);
```

## Job

**Properties**

|                               |                            |                           |
| ----------------------------- | -------------------------- | ------------------------- |
| [`BlockSize`](#blocksize)     | [`FileName`](#filename)    | [`FormField`](#formfield) |
| [`HttpHeader`](#httpheader)   | [`HttpVersion`](#httpversion) | [`ServerUrl`](#serverurl) |
| [`SourceValue`](#sourcevalue) | [`ThreadNum`](#threadnum)   | [`Version`](#version)|

**Events**

|                                                             |
| :---------------------------------------------------------- | :------------------------------ | ------------------------------- |
| [`OnUploadTransferPercentage`](#onuploadtransferpercentage) | [`OnRunSuccess`](#onrunsuccess) | [`OnRunFailure`](#onrunfailure) |


### BlockSize

Specify the block size (in bytes). By default, it's 10240.

**Syntax**

```typescript
BlockSize: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### FileName

Specify the file name.

**Syntax**

```typescript
FileName: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### FormField

Specifies extra fields to be uploaded in the same HTTP post.

**Syntax**

```typescript
FormField: FormField;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage notes**

Use the `Add()` method of the Object to add fields for uploading, check out the sample code for more information.

```typescript
/**
 * @param key Specify the key of the field.
 * @param value Sepcify the value of the field.
 */
Add(
    key: string,
    value: string
): void;
```

**Example**

```javascript
job.FormField.Add("customField", "FormFieldValue");
```

### HttpHeader

Specifies headers in the the HTTP Post Request of the upload job. For example: `job.HttpHeader["Content-Type"] = "text/plain";`

**Syntax**

```typescript
HttpHeader: object;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage notes**

By default, HttpHeader is an empty object. If left as it is, default headers are used. Otherwise, the headers set by this property will be added to the HTTP Post Request or replace existing ones with the same names.

### HttpVersion

Return the Http version.

**Syntax**

```typescript
readonly HttpVersion: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### ServerUrl

Specifies the target of the HTTP Post Request of the upload job. This typically is a file on the server. For example: `job.ServerUrl = 'http://www.dynamsoft.com/ScanAndUpload/Actions/SaveToFile.aspx';`

**Syntax**

```typescript
ServerUrl: string;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>


### SourceValue

Specifies the files to be uploaded and the name for it. The files are specified by URLs which can be created with the method [`GenerateURLForUploadData()`]({{site.info}}api/WebTwain_Util.html#generateurlforuploaddata). This object has a method Add to add file to the job.

**Syntax**

```typescript
SourceValue: SourceValue;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Usage notes**

Use the `Add()` method of the Object to add data for uploading.

```typescript
/**
  * @param source A URL to specify the content of the file.
  * Normally it's generated by {GenerateURLForUploadData()}
  * @param name Specify the name of the file.
  * @param key Specify the key of the file in the request. This key can be used to retrieve the file content in server-side scripts.
  */
Add(
    source: string,
    name: string,
    key?: string
): void;
```

**Example**

```javascript
job.SourceValue.Add(url, fileName);
```

### ThreadNum

Specify the number of threads (<=4) for the upload.

**Syntax**

```typescript
ThreadNum: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### Version

Return the version of the job.

**Syntax**

```typescript
readonly Version: number;
```

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

### OnUploadTransferPercentage

The event is triggered during the execution of an upload job. It has a parameter which specifies the percentage of the completion of the job.

**Syntax**

```typescript
.OnUploadTransferPercentage = function(job: Job , sPercentage: number){};
```

**Parameters**

`job`: A job object.

`sPercentage`: The percentage of the completion of the job.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Example**

```javascript
job.OnUploadTransferPercentage = FileUpload_OnUploadTransferPercentage;
function FileUpload_ OnUploadTransferPercentage (job, sPercentage){
    console.log(sPercentage);
}
```

### OnRunSuccess

The event is triggered when an upload job completes successfully.

**Syntax**

```typescript
.OnRunSuccess = function(job: Job){};
```

**Parameters**

`job`: A job object.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Example**

```javascript
job.OnRunSuccess = FileUpload_OnRunSuccess;
function FileUpload_OnRunSuccess(job) {
  alert(" upload completed ");
}
```

### OnRunFailure

The event is triggered when an upload job completes successfully.

**Syntax**

```typescript
.OnRunFailure = function(
    job: Job,
    errorCode: number,
    errorString: string
){};
```

**Parameters**

`job`: A job object.

`errorCode`: The error code.

`errorString`: The error string.

**Availability**

<div class="availability">
<table>

<tr>
<td align="center">ActiveX</td>
<td align="center">H5(Windows)</td>
<td align="center">H5(macOS/TWAIN)</td>
<td align="center">H5(macOS/ICA)</td>
<td align="center">H5(Linux)</td>
</tr>

<tr>
<td align="center">not supported</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
<td align="center">v14.0+</td>
</tr>

</table>
</div>

**Example**

```javascript
job.OnRunFailure = FileUpload_OnRunFailure;
function FileUpload_OnRunFailure(job, errorCode, errorString) {
  alert(errorString);
}
```