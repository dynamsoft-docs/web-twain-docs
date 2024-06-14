---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to deploy your own upload server with ASP.NET?
keywords: Dynamic Web TWAIN, Document Saving, Upload
breadcrumbText: How to deploy your own upload server with ASP.NET?
description: How to deploy your own upload server with ASP.NET?
permalink: /faq/deploy-your-own-upload-server-with-asp.net.html
---

# Document Saving

## How to Deploy an Upload Server Using ASP.NET

Dynamic Web TWAIN is a client-side JavaScript SDK. However, it does need to interact with the server when performing operations like uploading and downloading. This article introduces how to deploy an upload server using backend ASP.NET code.<br>

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

![javascript.png]({{site.assets}}imgs/javascript.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

Please ensure your web server supports ASP.NET(C#).

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-ASPNET.zip">server-side ASP.NET code</a>, unzip it and copy the aforementioned &quot;Upload&quot; directory to the &quot;Sample&quot; directory. Under the &quot;Upload&quot; root folder, there is a file &quot;SaveToFile.aspx&quot;. This is the backend page that accepts the uploaded data. </p>
</li>
<li><p>Modify the client-side upload function in <code>{path}\Sample\Scripts\online_demo_operation.js</code>, modify the &quot;URL&quot; parameter of <a href="https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#httpupload">HTTPUpload()</a> to match the actual path of the upload server you deployed. The &quot;URL&quot; parameter accepts both absolute and relative paths.</p>
<p> Refer to the following code snippet:</p>
</li>
</ol>
<pre><code>function Upload() {
    if (DWObject &amp;&amp; DWObject.HowManyImagesInBuffer &gt; 0) {
      //Path to the server-side script. You can adjust it according to the actual path of the upload server you deployed.
      var strUrl = &quot;http://{server-path}/Sample/Upload/SaveToFile.aspx&quot;;
      var imgAry = [DWObject.CurrentImageIndexInBuffer];
      DWObject.HTTPUpload(
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
<ol start="3">
<li><p>Copy the &quot;Sample&quot; directory to the IIS website or other web server services.</p>
</li>
<li><p>Navigate to <code>http://{server-path}/Sample/index.html</code> in your browser to access the sample.</p>
</li>
</ol>
<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-Angular.zip">DynamicWebTWAIN-Angular.zip</a>. After unzipping it, the directory structure is shown in the image below.

![angular.png]({{site.assets}}imgs/angular.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

<ol>
<li><p>Please ensure that Node.js is installed. The recommended version is v20.13.1.</p>
</li>
<li><p>Please ensure your web server supports ASP.NET(C#).</p>
</li>
</ol>

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-ASPNET.zip">server-side ASP.NET code</a>, unzip it and copy the &quot;Upload&quot; directory to the &quot;Sample\src\public&quot; directory. Under the &quot;Upload&quot; folder, there is a file &quot;SaveToFile.aspx&quot;. This is the backend page that accepts the uploaded data. </p>
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
      let strUrl = &quot;http://{server-path}/dist/Upload/SaveToFile.aspx&quot;;
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
<ol start="3">
<li><p>Build the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to build the project:</p>
<p> 1).  Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2).  Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3).  Build the project:</p>
<pre><code>npm run build
</code></pre>
</li>
<li><p>Copy the &quot;Sample/dist&quot; directory, which is built, to the web server.</p>
</li>
<li><p>Navigate to <code>http://{server-path}/dist/index.html</code> in your browser to access the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-React-JavaScript.zip">DynamicWebTWAIN-React-JavaScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![react.png]({{site.assets}}imgs/react.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

<ol>
<li><p>Please ensure that Node.js is installed. The recommended version is v20.13.1.</p>
</li>
<li><p>Please ensure your web server supports ASP.NET(C#).</p>
</li>
</ol>

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-ASPNET.zip">server-side ASP.NET code</a>, unzip it and copy the &quot;Upload&quot; directory to the &quot;Sample\public&quot; directory. Under the &quot;Upload&quot; folder, there is a file &quot;SaveToFile.aspx&quot;. This is the backend page that accepts the uploaded data. </p>
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
      let strUrl = &quot;http://{server-path}/dist/Upload/SaveToFile.aspx&quot;;
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
<ol start="3">
<li><p>Build the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to build the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Build the project:</p>
<pre><code>npm run build
</code></pre>
</li>
<li><p>Copy the &quot;Sample/dist&quot; directory, which is built, to the web server.</p>
</li>
<li><p>Navigate to <code>http://{server-path}/dist/index.html</code> in your browser to access the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-React-TypeScript.zip">DynamicWebTWAIN-React-TypeScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![react-typescript.png]({{site.assets}}imgs/react-typescript.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

<ol>
<li><p>Please ensure that Node.js is installed. The recommended version is v20.13.1.</p>
</li>
<li><p>Please ensure your web server supports ASP.NET(C#).</p>
</li>
</ol>

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-ASPNET.zip">server-side ASP.NET code</a>, unzip it and copy the &quot;Upload&quot; directory to the &quot;Sample\public&quot; directory. Under the &quot;Upload&quot; folder, there is a file &quot;SaveToFile.aspx&quot;. This is the backend page that accepts the uploaded data. </p>
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
      let strUrl = &quot;http://{server-path}/dist/Upload/SaveToFile.aspx&quot;;
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
<ol start="3">
<li><p>Build the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to build the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Build the project:</p>
<pre><code>npm run build
</code></pre>
</li>
<li><p>Copy the &quot;Sample/dist&quot; directory, which is built, to the web server.</p>
</li>
<li><p>Navigate to <code>http://{server-path}/dist/index.html</code> in your browser to access the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-Vue-JavaScript.zip">DynamicWebTWAIN-Vue-JavaScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![vue.png]({{site.assets}}imgs/vue.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

<ol>
<li><p>Please ensure that Node.js is installed. The recommended version is v20.13.1.</p>
</li>
<li><p>Please ensure your web server supports ASP.NET(C#).</p>
</li>
</ol>

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-ASPNET.zip">server-side ASP.NET code</a>, unzip it and copy the &quot;Upload&quot; directory to the &quot;Sample\public&quot; directory. Under the &quot;Upload&quot; folder, there is a file &quot;SaveToFile.aspx&quot;. This is the backend page that accepts the uploaded data. </p>
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
      let strUrl = &quot;http://{server-path}/dist/Upload/SaveToFile.aspx&quot;;
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
<ol start="3">
<li><p>Build the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to build the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Build the project:</p>
<pre><code>npm run build
</code></pre>
</li>
<li><p>Copy the &quot;Sample/dist&quot; directory, which is built, to the web server.</p>
</li>
<li><p>Navigate to <code>http://{server-path}/dist/index.html</code> in your browser to access the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

This article assumes that you have downloaded and unzipped this sample: <a href="https://download2.dynamsoft.com/Samples/DWT_OnlineDemo/DynamicWebTWAIN-Vue-TypeScript.zip">DynamicWebTWAIN-Vue-TypeScript.zip</a>. After unzipping it, the directory structure is shown in the image below.

![vue-typescript.png]({{site.assets}}imgs/vue-typescript.png)

<p>Note: The &quot;Sample&quot; directory mentioned in the steps below refers to the &quot;Sample&quot; directory shown in the image.</p>

### Prerequisite:

<ol>
<li><p>Please ensure that Node.js is installed. The recommended version is v20.13.1.</p>
</li>
<li><p>Please ensure your web server supports ASP.NET(C#).</p>
</li>
</ol>

### Steps:

<ol>
<li><p>Download the <a href="https://download2.dynamsoft.com/Samples/DWT_onlineDemo/DynamicWebTWAIN-ASPNET.zip">server-side ASP.NET code</a>, unzip it and copy the &quot;Upload&quot; directory to the &quot;Sample\public&quot; directory. Under the &quot;Upload&quot; folder, there is a file &quot;SaveToFile.aspx&quot;. This is the backend page that accepts the uploaded data. </p>
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
      let strUrl = &quot;http://{server-path}/dist/Upload/SaveToFile.aspx&quot;;
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
<ol start="3">
<li><p>Build the client-side project</p>
<p> Open your terminal or Command Prompt and execute the following three commands to build the project:</p>
<p> 1). Navigate to the Sample directory: </p>
<pre><code>cd [path]/Sample
</code></pre>
<p> 2). Install the dependencies: </p>
<pre><code>npm install
</code></pre>
<p> 3). Build the project:</p>
<pre><code>npm run build
</code></pre>
</li>
<li><p>Copy the &quot;Sample/dist&quot; directory, which is built, to the web server.</p>
</li>
<li><p>Navigate to <code>http://{server-path}/dist/index.html</code> in your browser to access the sample.</p>
</li>
</ol>

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

### Online Demo

<p><a href="https://demo.dynamsoft.com/web-twain/">https://demo.dynamsoft.com/web-twain/</a></p>