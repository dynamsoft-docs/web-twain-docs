---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK API - Appendix
keywords: Dynamic Web TWAIN, Documentation, API Appendix
breadcrumbText: API Appendix
description: Dynamic Web TWAIN SDK Documentation API Appendix Page
---

# Web TWAIN Appendix

## Error List

| Error Code | Error Message |
|:-|:-|
|0 | Successful |
|-1001 | General failure |
|-1002 | Not enough memory to perform operation |
|-1003 | Source Manager unable to find the specified Source |
|-1004 | Source is connected to maximum supported number of applications |
|-1005 | Source or Source Manager reported an error to the user and handled the error |
|-1006 | Capability not supported by Source or operation is not supported on capability, or capability had dependencies on other capabilities and cannot be operated upon at this time |
|-1009 | Unrecognized operation triplet |
|-1010 | Data parameter out of supported range |
|-1011 | Operation out of expected sequence |
|-1012 | Unknown destination in DSM_Entry |
|-1013 | Capability not supported by source |
|-1014 | Operation not supported by capability |
|-1015 | Capability has dependency on other capability and cannot be operated upon at this time |
|-1016 | File System operation is denied (file is protected) |
|-1017 | Operation failed because file already exists |
|-1018 | File not found |
|-1019 | Operation failed because directory is not empty |
|-1020 | The feeder is jammed |
|-1021 | The feeder detected multiple pages |
|-1022 | Error writing file |
|-1023 | The device went offline prior to or during this operation |
|-1030 | Can not open Source Manager "TWain_32.dll" is missing or is in use by another application |
|-1031 | Sequence error. The operation can not be performed upon the current Source Manager or Source state |
|-1032 | User cancelled the operation |
|-1033 | Invalid Enumerations |
|-1034 | Invalid value |
|-1035 | There is no image |
|-1036 | Error reading file |
|-1070 | BMP file or format error |
|-1071 | JPEG file or format error |
|-1073 | Only 24-bit true color and 8-bit gray-scaled images are supported for JPEG compression |
|-1080 | General TIFF error |
|-1081 | TIFF format error or not supported |
|-1090 | BMP format error or not supported |
|-1100 | PNG format error or not supported |
|-1110 | Unrecognized file extension |
|-1200 | PDF format error or not supported |
|-2000 | Can not initiate the internet session |
|-2001 | HTTP request error |
|-2002 | HTTP server error |
|-2003 | HTTP process: Description (Status Code) |
|-2004 | FTP download file is too large |
|-2007 | The system is busy, some operations are not completed. Please try later |
|-2137 | Cross-Origin Resource Sharing (CORS) policy is blocking the access. Please contact the Administrator to configure 'Access-Control-Allow-Origin'.|
|-2207 | The Dynamic Web TWAIN Service installed on your computer is outdated and no longer works with the JavaScript code on the website |
|-2208 | The connection with the local Dynamic Web TWAIN Service encountered a problem and has been reset |
|-2209 | The HTML5 (Chrome&Firefox) edition does not support this method or property |
|-2300 | Http upload error: the HTTP Server cannot empty |
|-2301 | Network error |
|-2302 | The result format is invalid |
|-2303 | Upload cancelled |
|-2304 | Http download error: the url is invalid |
|-2305 | User cancelled the operation |
|-2306 | Upload Error: the upload file cannot be empty |
|-2307 | The width or height you entered is invalid |
|-2308 | The Dynamic Web TWAIN Service has been stopped |
|-2309 | The LocalFile is empty in the Function |
|-2310 | The Enumerations is out of range |
|-2311 | The RemoteFile is empty in Barcode Download Function |
|-2312 | The file length is empty |
|-2313 | The size of the images you are about to upload has exceeded the allowed size |
|-2314 | The parameter cannot be empty |
|-2315 | The Enumerations is out of range |
|-2316 | The RemoteFile is empty in Webcam Download Function |
|-2317 | The RemoteFile is empty in Pdf Download Function |
|-2318 | Invalid destination file |
|-2319 | Invalid source file |
|-2320 | Invalid file |
|-2321 | The Enumerations is out of range |
|-2322 | The left or top or right or bottom you entered is invalid |
|-2325 | The current product key is empty or invalid, please contact the site administrator |
|-2326 | The current product key has expired, please contact the site administrator |
|-2327 | The current product key does not support Chrome, please contact the site administrator |
|-2328 | The current product key does not support Firefox, please contact the site administrator |
|-2329 | The current product key does not support IE, please contact the site administrator |
|-2330 | The current product key does not support Edge, please contact the site administrator |
|-2331 | The current product key is a trial version key but your local Dynamic Web TWAIN Service is in full version, please uninstall your local version first and access this page again to install the correct version. If the issue persists, please contact the site administrator |
|-2332 | The current product key is a full version key but your local Dynamic Web TWAIN Service is in trial version, please uninstall your local version first and access this page again to install the correct version. If the issue persists, please contact the site administrator |
|-2333 | The current product key is missing the core license, please contact the site administrator |
|-2334 | The current product key does not include a license for reading 1D barcode, please contact the site administrator |
|-2335 | The current product key does not include a license for reading QRcode barcode, please contact the site administrator |
|-2336 | The current product key does not include a license for reading PDF417 barcode, please contact the site administrator |
|-2337 | The current product key does not include a license for reading DataMatrix barcode, please contact the site administrator |
|-2338 | The current product key does not support Webcam, please contact the site administrator |
|-2339 | The current product key does not support pdf rasterizer, please contact the site administrator |
|-2342 | The domain of your current site does not match the domain bound in the current product key, please contact the site administrator |
|-2343 | The current product key does not support your browser, please contact the site administrator |
|-2344 | The current product key does not support Windows OS, please contact the site administrator |
|-2345 | The current product key does not support MAC OS, please contact the site administrator |
|-2346 | The current product key does not support Linux OS, please contact the site administrator |
|-2347 | The current product key does not support your OS, please contact the site administrator |
|-2348 | The current product key is invalid because it's generated with the licenses of a different major version |
|-2349 | The current product key does not include a license for reading barcode, please contact the site administrator |
|-2350 | The indices cannot be empty |
|-2351 | You cannot upload more than one image when the format is BMP, JPG or PNG |
|-2352 | The indices are out of range |
|-2353 | The header name being used is a protected keyword and is not allowed |
|-2354 | The header name cannot be empty |
|-2355 | The header name cannot be null |
|-2356 | The header name cannot be undefined |
|-2357 | The header name you entered is invalid |
|-2358 | The type of the parameter indices must be an Array |
|-2359 | The Enumerations is out of range |
|-2360 | The Enumerations is null or undefined |
|-2361 | You cannot convert more than one image to base64 string when the format is BMP, JPG or PNG |
|-2362 | Convert to base64 failed |
|-2367 | Invalid value for the parameter segmentUploadThreshold |
|-2368 | Invalid value for the parameter moduleSize |
|-2369 | The module for Dynamic Web TWAIN has failed to download |
|-2370 | The current product key is invalid, please contact the site administrator |
|-2372 | You cannot convert more than one image to binary when the format is BMP, JPG or PNG |
|-2395 | The module for Dynamic Web TWAIN failed to download.|
|-2399 | Invalid imageId.|
|-2612 | The devices must be an Array. |
|-2614 | The Dynamic Web TWAIN Service has been restarted. |
|-2615 | User cancelled the operation. |
|-2616 | Invalid image format type. |
|-2618 | Only single index selection is allowed when enumImageType is set to BMP, JPG or PNG. |
|-2619 | Only single index selection is allowed when enumImageFormatType is set to url. |
|-2621 | Dynamsoft.DWT.Containers was not set. |
|-2622 | Please do not set enumImageType to "IT_MULTIPAGE_PDF", "IT_MULTIPAGE_TIF" or "IT_ALL". |
|-2800 | Please make sure the Dynamic Web TWAIN Service has been installed. |
|-2801 | Invalid response data was returned from the Dynamic Web TWAIN Service. |
|-2802 | The file dynamsoft.webtwain.config.js timed out while loading. |
|-2803 | Loading the WebTwain JavaScript source files has failed. |
|-2804 | Loading the WebTwain css files has failed. |
|-2805 | Error: The "WebTwainId" is not a string. |
|-2806 | Error: The argument passed to the parameter "containerId" is not a string. |
|-2807 | Error: The element specified by the id XXX doesn't exist. |
|-2812 | Error: Duplicate ID detected while creating a Dynamic Web TWAIN object. |
|-2813 | Error: The ID of the target DIV for the new DWT object is invalid. |
|-2814 | Error: The Dynamic Web TWAIN module is not installed. |
|-2815 | Error: Duplicate ContainerId detected while creating a Dynamic Web TWAIN object. |
|-2817 | The Connection from the insecure (HTTP) web page failed for HTST. |
|-2818 | The Dynamic Web TWAIN Service SSL certificate has expired. |
|-2819 | The Dynamic Web TWAIN Service SSL certificate is invalid. |
|-2820 | The Connection from the insecure (HTTP) web page to the local "Dynamic Web TWAIN Service" failed! |
|-2821 | The Dynamsoft Service is not ready, please try again later. |
|-2822 | The WebTwain JavaScript lts.js load failed. |
|-2823 | The http url redirected. |
|-2824 | The Connection from the web page failed. Please make sure the Dynamic Web TWAIN Service is running. |
|-2825 | Failed to setup the Default Dynamic Web TWAIN Service. |
|-2827 | Failed to get Machine ID. |
|-2828 | Invalid PDF Convert Mode Value. |
|-2829 | The type of the PDF password must be a string. |
|-2830 | The PDF resolution must be a positive number. |
|-2831 | The PDF max width must be a positive number. |
|-2832 | The PDF max height must be a positive number. |
|-2833 | The PDF render grayscale must be a boolean. |
|-2834 | The PDF reader options is invalid. |
|-2835 | Failed to load CSS file "{filename}". |
|-2839 | The DocumentCombiner object has been disposed.|
|-2840 | The file type only supports PDF or TIFF.|
|-2841 | Add failed, the filetype of the Blob is different from the filetype specified in the createDocumentCombiner parameter.|
|-2843 | The blob cannot be empty.|
|-2844 | Only Blob of JPEG, PNG, BMP, TIFF and PDF image types can be saved.|
|-2845 | Only Blob of JPEG, PNG, BMP, TIFF and PDF image types can be uploaded.|
|-2846 | The uid cannot be empty.|
|-2847 | The uid is invalid.|
|-2848 | The capability value is out of range.|
|-2849 | The password must not exceed 32 characters in length.|
|-2850 | The password is not a string.|
|-2851 | The password must not exceed 32 characters in length.|
|-2852 | The password is not a string.|
|-2853 | The imageId cannot be empty.|
|-2854 | The imageId does not exist.|
|-2855 | The blob cannot be empty.|
|-2856 | Invalid blob value.|
|-2901 | Source document does not exist. Please check the document name or create the document before performing this operation. |
|-2902 | Target document does not exist. Please check the document name or create the document before performing this operation. |
|-2905 | This API is not supported on the current operating system. Please contact your system administrator. |
|<= -3000 | See ErrorString property for details |

<!-- |-2826 | Failed to connect the Dynamic Web TWAIN Service on [' + name + ']. | -->

## Dynamsoft License Server Error List

| Error Code | Error Message                                                                    |
| :--------- | :------------------------------------------------------------------------------- |
| -20100     | The standby DLS refuses to provide service while the main DLS is working.        |
| -20100     | DLS refuses to provide service while under construction.                         |
| -20101     | The handshake code you are using does not exist on the Dynamsoft License Server. |
| -20102     | Session password is incorrect.                                                   |
| -20103     | AppDomain for handshake is not matched.                                          |
| -20104     | No item matched. Please check your handshake and client settings.                |
| -20105     | License item does not exist.                                                     |
| -20106     | Product is not matched.                                                          |
| -20107     | Version mismatch.                                                                |
| -20108     | DeploymentType is not matched.                                                   |
| -20109     | Edition is not matched.                                                          |
| -20111     | License has expired.                                                             |
| -20111     | License for this ip has expired.                                                 |
| -20112     | License has not yet taken effect.                                                |
| -20113     | This license item "+item.getLicenseItemId()+" has been invalid.                  |
| -20114     | AppDomain for licenseItem is not matched.                                        |
| -20115     | ChargeWay for licenseItem is not matched.                                        |
| -20120     | License has exceeded its limit.                                                  |
| -20151     | Cloned device detected.                                                          |
