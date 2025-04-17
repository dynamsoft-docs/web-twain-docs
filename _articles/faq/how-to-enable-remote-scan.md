---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can i enable Remote Scan?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, resources
breadcrumbText: How can i enable Remote Scan?
description: How can i enable Remote Scan?
ignore: true
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How to enable Remote Scan?

Remote Scan means directly scanning documents from a remote document scanner to a web browser client of a client machine. No installation is required on the client machine, which makes it easy for all end users to utilize the web scanning feature of the Dynamic Web TWAIN SDK.

You can learn more detail about the feature via <a href="https://www.dynamsoft.com/blog/announcement/remote-scan-works-web-twain/" target="_blank">this blog</a>.

#### On Windows desktop where the scanner is physically connected

- Install `Dynamsoft Service`.
- Configure the Service by adding the following line to the file `DSConfiguration.ini` .

  ```
  Server=192.168.8.221
  ```

  > The file `DSConfiguration.ini` is located under C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_16\.
  > We are assuming the IP of this desktop is `192.168.8.221` and that the firewall will allow requests on the ports `18622` and `18623`.
  > From v16.2, you can do the same on this page http://127.0.0.1:18625/admin/

- Find the service `Dynamsoft Service` in Windows services list and restart it.

#### In your application

- Create a `WebTwain` instance to connect to that service and list all available scanners.

  ```html
  <select id="source"></select>
  ```

  ```javascript
  var host = "192.168.8.221",
    DWServiceObject;
  function createDWTForScan() {
    var dwtConfig = {
      WebTwainId: "remoteScan",
      Host: host,
      Port: "18622",
      PortSSL: "18623",
      UseLocalService: true,
    };
    Dynamsoft.DWT.CreateDWTObjectEx(
      dwtConfig,
      function (dwt) {
        DWServiceObject = dwt;
        console.log("service connected!");
        // List the available scanners
        DWServiceObject.GetSourceNamesAsync().then(
          function (devices) {
            for (var i = 0; i < devices.length; i++)
              document
                .getElementById("source")
                .options.add(new Option(devices[i], i));
          },
          function (error) {
            console.log(error);
          }
        );
      },
      function (error) {
        console.log(error);
      }
    );
  }
  ```

- Create another `WebTwain` instance to show and process the scanned documents.

  > As the `WebTwain` instance created in the last step is interacting with a Dynamsoft Service running remotely, it's recommended to only use it for scanning. Therefore, we create another `WebTwain` instance that receives the scanned data for further processing.

  ```html
  <div id="dwtcontrolContainer"></div>
  ```

  ```javascript
  var DWTObject;
  Dynamsoft.DWT.Containers = [
    { ContainerId: "dwtcontrolContainer", Width: "585px", Height: "513px" },
  ];
  Dynamsoft.DWT.ProductKey = "YOUR-PRODUCT-KEY";
  Dynamsoft.DWT.UseLocalService = false; //Create the `WebTwain` instance in WASM mode as it doesn't need to scan documents
  function Dynamsoft_OnReady() {
    DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
  }
  ```

- Use the first `WebTwain` instance, `DWServiceObject`, to scan documents.

  ```javascript
  function AcquireImage() {
    var OnAcquireImageSuccess,
      OnAcquireImageFailure = function () {
        DWServiceObject.CloseSource();
      };
    var deviceConfiguration = {
      SelectSourceByIndex: 0,
      IfShowUI: true,
      PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,
      Resolution: 300,
      IfFeederEnabled: false,
      IfDuplexEnabled: false,
      IfDisableSourceAfterAcquire: true,
      RemoteScan: true,
      ShowRemoteScanUI: true,
    };
    deviceConfiguration.SelectSourceByIndex =
      document.getElementById("source").selectedIndex;
    DWServiceObject.AcquireImage(
      deviceConfiguration,
      OnAcquireImageSuccess,
      OnAcquireImageFailure
    );
  }
  ```

  > We transfer the scanned documents to the second `WebTwain` instance, `DWTObject`, in the event `OnPostTransferAsync`.

  ```javascript
  DWServiceObject.RegisterEvent("OnPostTransferAsync", function (outputInfo) {
    DWServiceObject.ConvertToBlob(
      [DWServiceObject.ImageIDToIndex(outputInfo.imageId)],
      Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
      function (result, indices, type) {
        DWTObject.LoadImageFromBinary(
          result,
          function () {
            console.log("LoadImageFromBinary success");
            DWServiceObject.RemoveImage(
              DWServiceObject.ImageIDToIndex(outputInfo.imageId)
            );
          },
          function (errorCode, errorString) {
            console.log(errorString);
          }
        );
      },
      function (errorCode, errorString) {
        console.log(errorString);
      }
    );
  });
  ```

The following is the complete code, note that we are referencing the library from the CDN "unpkg" for simplicity.

```html
<script
  type="text/javascript"
  src="https://unpkg.com/dwt@16.2.4/dist/dynamsoft.webtwain.min.js"
></script>
<select id="source"></select>
<input type="button" value="Scan" onclick="AcquireImage();" />
<div id="dwtcontrolContainer"></div>
<script type="text/javascript">
  var DWTObject;
  window.onload = function () {
    Dynamsoft.DWT.Containers = [
      { ContainerId: "dwtcontrolContainer", Width: "585px", Height: "513px" },
    ];
    Dynamsoft.DWT.ProductKey = "YOUR_PRODUCT_KEY";
    Dynamsoft.DWT.UseLocalService = false; //Create the `WebTwain` instance in WASM mode as it doesn't need to scan documents
    Dynamsoft.DWT.ResourcesPath = "https://unpkg.com/dwt@16.2.4/dist";
    Dynamsoft.DWT.Load();
  };
  function Dynamsoft_OnReady() {
    DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
    createDWTForScan();
  }
  var host = "192.168.8.221",
    DWServiceObject;
  function createDWTForScan() {
    var dwtConfig = {
      WebTwainId: "remoteScan",
      Host: host,
      Port: "18622",
      PortSSL: "18623",
      UseLocalService: true,
    };
    Dynamsoft.DWT.CreateDWTObjectEx(
      dwtConfig,
      function (dwt) {
        DWServiceObject = dwt;
        console.log("service connected!");
        DWServiceObject.GetSourceNamesAsync().then(
          function (devices) {
            for (var i = 0; i < devices.length; i++)
              document
                .getElementById("source")
                .options.add(new Option(devices[i], i));
          },
          function (error) {
            console.log(error);
          }
        );

        DWServiceObject.RegisterEvent(
          "OnPostTransferAsync",
          function (outputInfo) {
            DWServiceObject.ConvertToBlob(
              [DWServiceObject.ImageIDToIndex(outputInfo.imageId)],
              Dynamsoft.DWT.EnumDWT_ImageType.IT_PNG,
              function (result, indices, type) {
                DWTObject.LoadImageFromBinary(
                  result,
                  function () {
                    console.log("LoadImageFromBinary success");
                    DWServiceObject.RemoveImage(
                      DWServiceObject.ImageIDToIndex(outputInfo.imageId)
                    );
                  },
                  function (errorCode, errorString) {
                    console.log(errorString);
                  }
                );
              },
              function (errorCode, errorString) {
                console.log(errorString);
              }
            );
          }
        );
      },
      function (error) {
        console.log(error);
      }
    );
  }
  function AcquireImage() {
    var OnAcquireImageSuccess,
      OnAcquireImageFailure = function () {
        DWServiceObject.CloseSource();
      };
    var deviceConfiguration = {
      SelectSourceByIndex: 0,
      IfShowUI: true,
      PixelType: Dynamsoft.DWT.EnumDWT_PixelType.TWPT_RGB,
      Resolution: 300,
      IfFeederEnabled: false,
      IfDuplexEnabled: false,
      IfDisableSourceAfterAcquire: true,
      RemoteScan: true,
      ShowRemoteScanUI: true,
    };
    deviceConfiguration.SelectSourceByIndex =
      document.getElementById("source").selectedIndex;
    DWServiceObject.AcquireImage(
      deviceConfiguration,
      OnAcquireImageSuccess,
      OnAcquireImageFailure
    );
  }
</script>
```
