---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN Core Concepts - Scanner
keywords: Dynamic Web TWAIN, Documentation, Scanner
breadcrumbText: Scanner
description: This page gives a general introduction to document scanners, which Dynamic Web TWAIN interacts with.
---

# Scanner

Scanners are the major object which Dynamic Web TWAIN interacts with. We are going to give a brief introduction to it, focusing on what matters to Dynamic Web TWAIN.

## Scanner Types

### Flatbed Scanner

A flatbed scanner is a type of scanner that provides a glass bed (platen) on which the object to be scanned lies motionless. The scanning element moves vertically from under the glass, scanning either the entirety of the platen or a predetermined portion.

![Epson v850](/assets/imgs/core-concepts/Epson_V850_scanner_open_20230920.jpg)

Most of the flatbed scanners work in a reflective way, which shines white light onto the object to be scanned and reads the intensity and color of light that is reflected from it. Some flatbed scanners also have transparency adapters available, which work in a different way. The light directly passes the scanned object like films and slides for scanning. In the scanning app, you can select whether to use the transparent unit or not.

### Sheetfed Scanner

A sheetfed scanner, also known as a document feeder, is a type of scanner that uses motor-driven rollers to move one single sheet of paper at a time past a stationary scanning element (can be two for duplex scanning). Unlike flatbed scanners, sheetfed scanners are not equipped to scan bound material such as books or magazines, nor are they suitable for any material thicker than plain printer paper. They are designed to scan multiple documents at a time, which is much faster than flatbed scanners.

![ScanSnap iX500](/assets/imgs/core-concepts/ScanSnap_iX500_029_(8703118513).jpg)

### All-in-One Scanner

All-in-one scanners have both document feeder and flatbed. Many multi-function printers (MFP) also have such a design.

![Ricoh 5055](/assets/imgs/core-concepts/500px-Ricoh_5055_MFP.jpg)

### Camera-Based Scanner

Some scanners use digital cameras to capture a document all at once, usually having a overhead design.

![CZUR ET Series](/assets/imgs/core-concepts/ET_Series_Book_Scanner.png)

Different from the above scanners which scan a line at a time in a controlled environment, camera-based scanners are faster and scans various materials, but may have issues like perspective distortion and shadows.

Camera-based scanners can now only scan documents, but also other objects. For example, Webcams and intraoral cameras are also supported by Dynamic Web TWAIN.

## Special Scanners

There are also scanners for special use cases.

### Check Scanners

Check scanners are equipped with a MICR unit, which reads magnetic ink character on checks.

![Epson TM-S1000](/assets/imgs/core-concepts/A41A266001_Scanners_Epson%20TM-S1000_PT.png)

Dynamic Web TWAIN can not only get the scanned image, but also the MICR result.

### Scanners with Imprinter

Many scanners can be used together with a printer. When scanning, it also prints on the scanned sheets.

![fi-7160](/assets/imgs/core-concepts/FI-7160.2.jpg)

## Connectivity 

Most scanners use USB for connection, while some old scanners still use SCSI.

Modern scanners can also be connected with network.

## Application Programming Interface

There are standardized application programming interface for scanners. They are:

* TWAIN – An API used by most scanners.
* Windows Image Acquisition (WIA) – An API provided by Microsoft.
* SANE (Scanner Access Now Easy) – A free/open-source API for accessing scanners.
* ImageCaptureCore – An API provided by Apple.
* Image and Scanner Interface Specification (ISIS) – Created by Pixel Translations, which is used by large, departmental-scale, machines.
* eSCL – A RESTful API to perform driverless document scanning.
