---
layout: default-layout
needAutoGenerateSidebar: true
needGenerateH3Content: true
noTitleIndex: true
title: Dynamic Web TWAIN Core Concepts - TWAIN
keywords: Dynamic Web TWAIN, Documentation, TWAIN, Concept
breadcrumbText: TWAIN
description: This page gives a general introduction to TWAIN, the document scanning API that Dynamic Web TWAIN exposes to the browser environment.
---

# TWAIN

TWAIN is a standard for interacting with image devices, like document scanners and cameras. It was created by a small group of software and hardware companies in response to the need for a proposed specification for the imaging industry. Without TWAIN, we have to program for every device. With TWAIN, we only need to create an application that knows TWAIN and it can have access to thousands of TWAIN-compatible devices.

## Architecture

The architecture of TWAIN consists of four layers:

* Application - Dynamic Web TWAIN executes at this layer.
* Protocol - There is a Source Manager working between the application and the Sources. 
* Acquisition - The software elements written to control acquisitions are called Sources and reside 
primarily in this layer.
* Device - This is the location of traditional low-level device drivers.

## Files

The following files are required to use TWAIN.

### Source Manager

The implementation of the Source Manager differs between the supported systems:

* On Windows
   * The Source Manager is a Dynamic Link Library (TWAINDSM.DLL or twain_32.dll for old TWAIN versions).
   * The Source Manager can manage simultaneous sessions between an application and many 
Sources.
* On Macintosh: The Source Manager is a Mach-O framework (TWAIN.framework, TWAINDSM.framework).
* On Linux
   * The Source Manager is a shared library (/usr/local/lib/libtwaindsm.so).
   * The Source Manager can manage simultaneous sessions between an application and many 
Sources.

Normally, the system has the libraries built-in. Dynamsoft have the DLLs included in its Windows installer by default.

### Source

The implementation of the Source is the same as the implementation of the Source Manager:

* On Windows: The Source is a Dynamic Link Library (DLL) with a .ds extension. You can find the files after installing the driver under "C:\Windows\twain_32" and "C:\Windows\twain_64".
* On Macintosh: The Source is implemented as a bundle (preferably Mach-O) with a .ds extension.
* On Linux: The Source is a shared library (.so) with a .ds extension.

## TWAIN Capabilities

One of TWAIN's benefits is it allows applications to easily interact with a variety of acquisition
devices. This is done using TWAIN capabilities.

TWAIN capabilities are divided into three groups:

* **CAP_xxxx**: Capabilities whose names begin with CAP are capabilities that could apply to any 
general Source. Such capabilities include use of automatic document feeders, identification of 
the creator of the data, etc.
* **ICAP_xxxx**: Capabilities whose names begin with ICAP are capabilities that apply to image 
devices. The "I" stands for image.
* **ACAP_xxxx**: Capabilities whose names begin with ACAP are capabilities that apply to 
devices that support audio. The "A" stands for audio.

Here are some capabilities for example:

* **CAP_DEVICEONLINE**: If TRUE, the physical hardware (e.g., scanner, digital camera, image database, etc.) that represents the image source is attached, powered on, and communicating.
* **CAP_FEEDERENABLED**: If TRUE, Source must acquire data from the document feeder acquire area and other feeder capabilities can be used.
* **ICAP_AUTOMATICBORDERDETECTION**: Turns automatic border detection on and off.

You can use this online demo to get and set the capabilities with Dynamic Web TWAIN: <https://demo.dynamsoft.com/web-twain/capabilities>.

You can learn more about TWAIN by reading its specifications: <https://github.com/twain/twain-specification>.

## Other Document Scanning APIs

Through time, Dynamic Web TWAIN added support for other APIs as well: WIA, SANE, ICA and eSCL. They can be used with the same set of JavaScript APIs.

Here is a table of the APIs and platforms Dynamic Web TWAIN supports.


|           | Windows | macOS | Linux |
|-----------|---------|-----|-------|
| **TWAIN** | X       | X   |       |
| **WIA**   | X       |     |       |
| **ICA**   |         | X   |       |
| **SANE**  |         |     | X     |
| **eSCL**  | X       | X   | X     |




