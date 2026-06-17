---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: General troubleshooting steps
keywords: Dynamic Web TWAIN, Error Troubleshooting, general steps, verbose
breadcrumbText: General troubleshooting steps
description: Step-by-step guide for collecting verbose logs and reporting issues to Dynamsoft Support.
date: 2021-12-03 23:26:46 +0000
last_modified: 2026-06-15 00:00:00 +0000
---

# Error Troubleshooting

## General Troubleshooting Steps

Before contacting support, complete the following steps:

1. Try the [Dynamic Web TWAIN online demo](https://demo.dynamsoft.com/web-twain/) to check whether the issue is reproducible outside your own application.
2. Open the browser developer tools (F12) and check the **Console** and **Network** tabs for errors. Note any error messages.
3. Enable verbose logging and collect the log files as described below.

## Enable and Collect Verbose Logs

1. Remove old log files in the `log` folder under the service's [installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder).
2. Set the log level using one of the options below:
   - **Option A (recommended) — Single client machine (no coding required):** Use the Dynamic Web TWAIN Service information page.
      1. Open [http://127.0.0.1:18625/](http://127.0.0.1:18625/) in a browser on the client machine.
      2. Under **Detailed information**, locate the **Log** row.
      3. Click **(change)** to enable verbose logging.
      > [!NOTE]
      > If **(change)** is not available, enable Web Setup by setting `EnableWebSetup=TRUE` in `DSConfiguration.ini` (admin privileges required), then restart the Dynamic Web TWAIN Service. See [Web Setup](/_articles/extended-usage/dynamsoft-service-configuration.md#web-setup).

     ![DWT Service page — click (change) to enable verbose logging](/assets/imgs/dwt-service-log-change.png)

   - **Option B — Single client machine:** Add the line `LogLevel=14` to `DSConfiguration.ini` on the machine. The `DSConfiguration.ini` file is in the **parent directory** of the log folder.

   - **Option C — All client machines (application-wide):** Set [`LogLevel`](/_articles/info/api/WebTwain_Util.md#loglevel) to `1` in your application code. This should be set as early as possible when the `WebTwain` instance is created — for example, in the `Dynamsoft_OnReady` event:
     ```javascript
     function Dynamsoft_OnReady() {
       DWTObject = Dynamsoft.DWT.GetWebTwain("dwtcontrolContainer");
       DWTObject.LogLevel = 1;
     }
     ```
3. Perform a hard refresh (**Ctrl + F5**) on the application page and reproduce the issue.
4. Optionally, create a `.txt` file noting the exact time the issue occurred and place it in the same log folder — this helps pinpoint the relevant log entries faster.
5. Zip the log folder and share it with the [Dynamsoft Support Team](/_articles/about/getsupport.md).

> [!IMPORTANT]
> After collecting the logs, disable verbose logging — leaving it enabled will affect scanning performance.
> - **Option A**: Click **(change)** again on the service page.
> - **Option B**: Remove the `LogLevel` line from `DSConfiguration.ini`.
> - **Option C**: Set `DWTObject.LogLevel` back to `0` in your application code.
