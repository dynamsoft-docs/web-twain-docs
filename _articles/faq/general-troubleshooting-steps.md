---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: General troubleshooting steps
keywords: Dynamic Web TWAIN, Error Troubleshooting, general steps, verbose
breadcrumbText: General troubleshooting steps
description: General troubleshooting steps
date: 2021-12-03 23:26:46 +0800
last_modified: 2025-10-24 10:20:31 +0800
---

# Error Troubleshooting

## General Troubleshooting Steps

- Try our online demo and see if you can reproduce the issue.
- Check the console or network log and report any errors.
- Enable and collect verbose logs (detailed below).

## Enable and Collect Verbose Logs

1. Remove old log files in the `log` folder under the service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder).
2. Set the log level:
  - Option A (**only recommended for v18.0+**) - Single client machine troubleshooting: Add the line `LogLevel=14` to `DSConfiguration.ini` on the machine. Find the `DSConfiguration.ini` file in the **parent directory** of the log directory.
  - Option B - Single client machine troubleshooting: Go to the Dynamic Web TWAIN-integrated application, press F12 to open the development tools, switch to "console" tab, and enter the command `DWTObject.LogLevel = 1` to enable debugger mode.
  - Option C - Troubleshoot all client machines (application wide): set [`LogLevel`](/_articles/info/api/WebTwain_Util.md#loglevel) to 1 in your application code. This property should be set as soon as the `WebTwain` instance is created. For example, in the event `Dynamsoft_OnReady`
    ```javascript
    function Dynamsoft_OnReady() {
      DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
      DWTObject.LogLevel = 1;
    }
    ```
3. Perform a hard refresh (Ctrl + F5) on the application web page and attempt to reproduce the issue. To expedite issue identification, we would greatly appreciate it if you could create a `.txt` file that records the time when the issue occurred and place the file in the same log folder.
4. Zip the log folder and share with [Dynamsoft Support Team](/_articles/about/getsupport.md) via email.
5. **Please remember to either remove the `LogLevel` entry from the `DSConfiguration.ini` file or set `DWTObject.LogLevel` back to its default value (0) to disable the debugger mode**. Otherwise, verbose logging will affect operation speed.
