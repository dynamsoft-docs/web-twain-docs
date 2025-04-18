---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Why is my scanner not shown or not responding in the browser?
keywords: Dynamic Web TWAIN, Capture/ Image Source, scanner not shown, scanner not responding
breadcrumbText: Why is my scanner not shown or not responding in the browser?
description: Why is my scanner not shown or not responding in the browser?
---

# Capture/Image Source

## Why is my scanner not shown or not responding in the browser?

### Symptom

Sometimes when you are using a scanning page built with Dynamic Web TWAIN, you will encounter an issue where your scanner is not shown, not responding or shown as busy in the browser.

### Causes

1. The scanner is not connected to the machine or the scanner driver is not installed.
   Especially when you are using **64-bit Internet Explorer** but you don't have the 64-bit scanner (TWAIN) driver installed on the machine.

2. The Browser doesn't have enough permission to access the scanner driver.
   This mostly happens on **Windows 7/Vista/2008 OS** where high security level is applied to **Internet Explorer**. It would also happen in Firefox 4+ and Safari.

### Solution

1. Make sure the driver of the scanner is installed and the scanner is running and properly connected to the machine. You should be able to see the scanner in the Windows' Scanners and Cameras Wizard. And you can use Twacker to check if the driver is TWAIN compatible.

   In addition, if you are using 64-bit Internet Explorer, please make sure you have a 64-bit TWAIN driver of the scanner installed.

2. **For Firefox, Safari, etc.**, please go to C:\Windows\twain_32 and you should be able to find that your scanner driver has a sub-folder there. In order to show the scanner as an available source, you need to copy the dlls in the sub-folder and paste them to the folder C:\Windows\System32 (or C:\Windows\SysWOW64 on a 64-bit OS).

   For Internet Explorer, you can try one of the following tricks:
     1. Add the website to the zone of trusted sites.
       IE | Tools | Internet Options | Security | Trusted Sites.
       
     2. Turn Protected Mode off.
        To turn off the protected mode of IE, you can go to Tools | Internet Options | Security and uncheck "Enable Protected Mode (requires restarting Internet Explorer)" option.

        FYI, Protected Mode helps protect users from attack by running an IE process with greatly restricted privileges. It uses the Windows Vista integrity mechanism to run the        Internet Explorer process at low integrity.

        But with Protected Mode turned on, you may encounter problems when running Dynamic Web TWAIN applications.
     
     3. To temporarily elevate permissions of IE.
        Click Start, point to All Programs, right-click IE, and then select Run as Administrator (with Administrator permissions).

