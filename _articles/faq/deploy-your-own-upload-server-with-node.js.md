---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to deploy your own upload server with Node.js?
keywords: Dynamic Web TWAIN, Document Saving, Upload
breadcrumbText: How to deploy your own upload server with Node.js?
description: How to deploy your own upload server with Node.js?
date: 2024-06-14 10:24:21 +0800
last_modified: 2024-09-19 08:47:35 +0800
---

# Document Saving

## How to Deploy an Upload Server Using Node.js

Dynamic Web TWAIN is a client-side JavaScript SDK. However, it does need to interact with the server when performing operations like uploading and downloading. This article introduces how to deploy an upload server using backend Node.js code.<br>

Please select your frontend language:

<div class="multi-panel-switching-prefix"></div>

- [Javascript](#Javascript)
- [Angular](#Angular)
- [React-Javascript](#React-Javascript)
- [React-TypeScript](#React-TypeScript)
- [Vue-Javascript](#Vue-Javascript)
- [Vue-Typescript](#Vue-Typescript)

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-JavaScript.zip">DynamicWebTWAIN-JavaScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![javascript.png](/assets/imgs/javascript.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure that Node.js is installed. The recommended version is v20.13.1.

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-nodejs.zip">server-side Node.js code</a>, unzip it. Under the &quot;Upload&quot; folder, there is a file &quot;server.js&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Run the server-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the server-side Sample directory: </p>
<pre><code>cd [path]/Upload
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Modify the client-side upload function 
 In <code>{path}\Sample\Scripts\online_demo_operation.js</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>function Upload() {
  if (DWTObject &amp;&amp; DWTObject.HowManyImagesInBuffer &gt; 0) {
    //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
    var strUrl = &quot;http://localhost:2020/Upload&quot;;
    var imgAry = [DWTObject.CurrentImageIndexInBuffer];
    DWTObject.HTTPUpload(
      strUrl, 
      imgAry, 
      Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
      Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
      &quot;WebTWAINImage.png&quot;, 
      onUploadSuccess, 
      onUploadFailure);
  } else {
    alert(&quot;There is no image in buffer.&quot;);
  }
}

function onUploadSuccess() {
  alert(&quot;Upload successful&quot;);
}

function onUploadFailure(errorCode, errorString, sHttpResponse) {
  alert(sHttpResponse.length &gt; 0 ? sHttpResponse : errorString);
}
</code></pre>
<ol start="4">
<li><p>Copy the &quot;Sample&quot; directory to the web server. </p>
</li>
<li><p>Navigate to <code>http://{server-path}/Sample/index.html</code> in your browser to access the sample.</p>
</li>
</ol>
<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-Angular.zip">DynamicWebTWAIN-Angular.zip</a>. After unzipping it, the directory structure is shown in the image below.

![angular.png](/assets/imgs/angular.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure that Node.js is installed. The recommended version is v20.13.1.

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-nodejs.zip">server-side Node.js code</a>, unzip it. Under the &quot;Upload&quot; folder, there is a file &quot;server.js&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Run the server-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the server-side Sample directory: </p>
<pre><code>cd [path]/Upload
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Modify the client-side upload function 
 In <code>{path}\Sample\src\app\components\tools\dwtService.ts</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>Upload(): Promise&lt;any&gt; {
  return new Promise((res, rej) =&gt; {
    if (this._dwtObject &amp;&amp; this._dwtObject.HowManyImagesInBuffer &gt; 0) {
      //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
      let strUrl = &quot;http://localhost:2020/Upload&quot;;
      let imgAry = [this._dwtObject.CurrentImageIndexInBuffer];
      this._dwtObject.HTTPUpload(
        strUrl, 
        imgAry, 
        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
        &quot;WebTWAINImage.png&quot;, 
        ()=&gt;{
          res();
        }, (errCode, errString, responseStr) =&gt; { 
          rej({
            code: errCode,
            message: errString
          });
        });
     } else {
      rej({
        code: -1,
        message: &quot;There is no image in buffer.&quot;
      });
    }
  }
}
</code></pre>
<ol start="4">
<li><p>Run the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Navigate to <code>http://localhost:4200</code> in your browser to launch the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-React-JavaScript.zip">DynamicWebTWAIN-React-JavaScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![react.png](/assets/imgs/react.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure that Node.js is installed. The recommended version is v20.13.1.

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-nodejs.zip">server-side Node.js code</a>, unzip it. Under the &quot;Upload&quot; folder, there is a file &quot;server.js&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Run the server-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the server-side Sample directory: </p>
<pre><code>cd [path]/Upload
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Modify the client-side upload function 
 In <code>{path}\Sample\src\components\tools\dwtService.js</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>Upload() {
  return new Promise((res, rej) =&gt; {
    if (this._dwtObject &amp;&amp; this._dwtObject.HowManyImagesInBuffer &gt; 0) {
      //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
      let strUrl = &quot;http://localhost:2020/Upload&quot;;
      let imgAry = [this._dwtObject.CurrentImageIndexInBuffer];
      this._dwtObject.HTTPUpload(
        strUrl, 
        imgAry, 
        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
        &quot;WebTWAINImage.png&quot;, 
        ()=&gt;{
          res();
        }, (errCode, errString, responseStr) =&gt; { 
          rej({
            code: errCode,
            message: errString
          });
        });
     } else {
      rej({
        code: -1,
        message: &quot;There is no image in buffer.&quot;
      });
    }
  }
}
</code></pre>
<ol start="4">
<li><p>Run the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Navigate to <code>http://localhost:4200</code> in your browser to launch the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-React-TypeScript.zip">DynamicWebTWAIN-React-TypeScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![react-typescript.png](/assets/imgs/react-typescript.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure that Node.js is installed. The recommended version is v20.13.1.

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-nodejs.zip">server-side Node.js code</a>, unzip it. Under the &quot;Upload&quot; folder, there is a file &quot;server.js&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Run the server-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the server-side Sample directory: </p>
<pre><code>cd [path]/Upload
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Modify the client-side upload function 
 In <code>{path}\Sample\src\components\tools\dwtService.ts</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>Upload(): Promise&lt;any&gt; {
  return new Promise((res, rej) =&gt; {
    if (this._dwtObject &amp;&amp; this._dwtObject.HowManyImagesInBuffer &gt; 0) {
      //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
      let strUrl = &quot;http://localhost:2020/Upload&quot;;
      let imgAry = [this._dwtObject.CurrentImageIndexInBuffer];
      this._dwtObject.HTTPUpload(
        strUrl, 
        imgAry, 
        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
        &quot;WebTWAINImage.png&quot;, 
        ()=&gt;{
          res();
        }, (errCode, errString, responseStr) =&gt; { 
          rej({
            code: errCode,
            message: errString
          });
        });
     } else {
      rej({
        code: -1,
        message: &quot;There is no image in buffer.&quot;
      });
    }
  }
}
</code></pre>
<ol start="4">
<li><p>Run the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Navigate to <code>http://localhost:4200</code> in your browser to launch the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-Vue-JavaScript.zip">DynamicWebTWAIN-Vue-JavaScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![vue.png](/assets/imgs/vue.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure that Node.js is installed. The recommended version is v20.13.1.

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-nodejs.zip">server-side Node.js code</a>, unzip it. Under the &quot;Upload&quot; folder, there is a file &quot;server.js&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Run the server-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the server-side Sample directory: </p>
<pre><code>cd [path]/Upload
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Modify the client-side upload function 
 In <code>{path}\Sample\src\components\tools\dwtService.js</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>Upload() {
  return new Promise((res, rej) =&gt; {
    if (this._dwtObject &amp;&amp; this._dwtObject.HowManyImagesInBuffer &gt; 0) {
      //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
      let strUrl = &quot;http://localhost:2020/Upload&quot;;
      let imgAry = [this._dwtObject.CurrentImageIndexInBuffer];
      this._dwtObject.HTTPUpload(
        strUrl, 
        imgAry, 
        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
        &quot;WebTWAINImage.png&quot;, 
        ()=&gt;{
          res();
        }, (errCode, errString, responseStr) =&gt; { 
          rej({
            code: errCode,
            message: errString
          });
        });
     } else {
      rej({
        code: -1,
        message: &quot;There is no image in buffer.&quot;
      });
    }
  }
}
</code></pre>
<ol start="4">
<li><p>Run the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Navigate to <code>http://localhost:4200</code> in your browser to launch the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-Vue-TypeScript.zip">DynamicWebTWAIN-Vue-TypeScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![vue-typescript.png](/assets/imgs/vue-typescript.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure that Node.js is installed. The recommended version is v20.13.1.

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-nodejs.zip">server-side Node.js code</a>, unzip it. Under the &quot;Upload&quot; folder, there is a file &quot;server.js&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Run the server-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the server-side Sample directory: </p>
<pre><code>cd [path]/Upload
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Modify the client-side upload function 
 In <code>{path}\Sample\src\components\tools\dwtService.ts</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>Upload(): Promise&lt;any&gt; {
  return new Promise((res, rej) =&gt; {
    if (this._dwtObject &amp;&amp; this._dwtObject.HowManyImagesInBuffer &gt; 0) {
      //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
      let strUrl = &quot;http://localhost:2020/Upload&quot;;
      let imgAry = [this._dwtObject.CurrentImageIndexInBuffer];
      this._dwtObject.HTTPUpload(
        strUrl, 
        imgAry, 
        Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
        Dynamsoft.DWT.EnumDWT_UploadDataFormat.Binary, 
        &quot;WebTWAINImage.png&quot;, 
        ()=&gt;{
          res();
        }, (errCode, errString, responseStr) =&gt; { 
          rej({
            code: errCode,
            message: errString
          });
        });
     } else {
      rej({
        code: -1,
        message: &quot;There is no image in buffer.&quot;
      });
    }
  }
}
</code></pre>
<ol start="4">
<li><p>Run the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to start the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Run the application:</p>
<pre><code>npm start
</code></pre>
</li>
<li><p>Navigate to <code>http://localhost:4200</code> in your browser to launch the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

### Online Demo

<p><a href="https://demo.dynamsoft.com/web-twain/">https://demo.dynamsoft.com/web-twain/</a></p>