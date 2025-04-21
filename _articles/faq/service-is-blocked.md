---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title:  The scanner's UI or the system's file dialog does not open when scanning
keywords: Dynamic Web TWAIN, Dynamic Web TWAIN Service, scanner UI, file dialog
breadcrumbText:  The scanner's UI or the system's file dialog does not open when scanning
description:  The scanner's UI or the system's file dialog does not open when scanning
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# The scanner's UI or the system's file dialog does not open when scanning

### Symptom

Dynamic Web TWAIN Service (also called "Dynamsoft Service") is installed successfully, but when attempting to scan or load files, the scanner's UI or the system's file dialog does not open. You may also see the error, "The pipe is being closed."

### Cause

**Cause One**

This can be due to permissions, firewall, or other programs (e.g. anti-virus) blocking connections to the Dynamic Web TWAIN Service.
To determine if Dynamic Web TWAIN Service is blocked by another process, open Task Manager and go to the Details Tab.
Typically, before opening the scan page, you will see three Dynamic Web TWAIN Service processes listed: two under SYSTEM and one under the user account.<br>
![service blocked-1](/assets/imgs/service-blocked-1.png)<br>
When you open the scan page, two new processes are created under the user account.<br>
![service blocked-2](/assets/imgs/service-blocked-2.png)<br>
If these two processes are not under the user account, we can confirm that Dynamic Web TWAIN Service is being blocked by another process.

**Cause Two**

The issue occurs when the allocated memory address exceeds the 32-bit limit. In this situation, it becomes impossible to access resources under the current user's permissions, such as save/load operations. Notably, 32-bit scanning and memory uploads remain unaffected. This issue is present in all versions before 18.2.

### Resolution

#### Resolution for Cause 1

To determine which process is blocking Dynamic Web TWAIN Service, please follow the steps below.

1. Collect <a href="/web-twain/docs/faq/general-troubleshooting-steps.html#how-to-enable-and-collect-verbose-log" target="_blank">verbose log</a>

2. Open the file wts.log and search for the string "GetConnectionProcessID" to locate the line:
*GetConnectionProcessID:: connection client 1960 process is xxxxx.*

[xxxxx] indicates the connection process id, which will identify a process in Task Manager. This process should should typically be a browser process.

![service blocked-3](/assets/imgs/service-blocked-3.png)

However, if the identified PID is not a browser process as expected, the PID will typically be the process which is blocking Dynamic Web TWAIN Service.

If you need further assistance, please contact Dynamsoft Support.

#### Resolution for Cause 2

Please contact [Dynamsoft](https://www.dynamsoft.com/contact/) for patched installer.
