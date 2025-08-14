---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I change the display language of all messages from English to another language?
keywords: Dynamic Web TWAIN, UI Customization, display language, language
breadcrumbText: How can I change the display language of all messages from English to another language?
description: How can I change the display language of all messages from English to another language?
date: 2021-12-08 03:32:59 +0800
last_modified: 2024-05-14 09:50:13 +0800
---

# UI Customization

## How can I change the display language of all messages from English to another language?

You can customize the display language in <strong>dynamsoft.webtwain.config.js</strong> by changing the values of the properties of the <strong>Dynamsoft.DWT.CustomizableDisplayInfo</strong> object.

```javascript
Dynamsoft.DWT.CustomizableDisplayInfo = {
  errorMessages: {
    // launch
    ERR_MODULE_NOT_INSTALLED:
      "Error: The Dynamic Web TWAIN module is not installed.",
    ERR_BROWSER_NOT_SUPPORT: "Error: This browser is currently not supported.",
    ERR_CreateID_MustNotInContainers:
      "Error: Duplicate ID detected for creating Dynamic Web TWAIN objects, please check and modify.",
    ERR_CreateID_NotContainer:
      "Error: The ID of the DIV for creating the new DWT object is invalid.",
    ERR_DWT_NOT_DOWNLOADED:
      "Error: Failed to download the Dynamic Web TWAIN module.",

    // image view
    limitReachedForZoomIn: "Error: You have reached the limit for zooming in",
    limitReachedForZoomOut: "Error: You have reached the limit for zooming out",

    // image editor
    insufficientParas: "Error: Not enough parameters.",
    invalidAngle: "Error: The angle you entered is invalid.",
    invalidHeightOrWidth: "Error: The height or width you entered is invalid.",
    imageNotChanged: "Error: You have not changed the current image.",
  },

  // launch
  generalMessages: {
    checkingDWTVersion: "Checking WebTwain version ...",
    updatingDService: "Dynamic Web TWAIN Service is updating ...",
    downloadingDWTModule: "Downloading the Dynamic Web TWAIN module.",
    refreshNeeded: "Please REFRESH your browser.",
    downloadNeeded: "Please download and install the Dynamic Web TWAIN.",
    DWTmoduleLoaded: "The Dynamic Web TWAIN module is loaded.",
  },

  customProgressText: {
    // html5 event
    upload: "uploading...",
    download: "Downloading...",
    load: "Loading...",
    decode: "Decoding...",
    decodeTIFF: "Decoding tiff...",
    decodePDF: "Decoding pdf...",
    encode: "Encoding...",
    encodeTIFF: "Encoding tiff...",
    encodePDF: "Encoding pdf...",

    // image control
    canvasLoading: "Loading ...",
  },

  // image editor
  buttons: {
    titles: {
      previous: "Previous Image",
      next: "Next Image",
      print: "Print Image",
      scan: "Acquire new Image(s)",
      load: "Load local Image(s)",
      rotateleft: "Rotate Left",
      rotate: "Rotate",
      rotateright: "Rotate Right",
      deskew: "Deskew",
      crop: "Crop Selected Area",
      cut: "Cut Selected Area",
      changeimagesize: "Change Image Size",
      flip: "Flip Image",
      mirror: "Mirror Image",
      zoomin: "Zoom In",
      originalsize: "Show Original Size",
      zoomout: "Zoom Out",
      stretch: "Stretch Mode",
      fit: "Fit Window",
      fitw: "Fit Horizontally",
      fith: "Fit Vertically",
      hand: "Hand Mode",
      rectselect: "Select Mode",
      zoom: "Click to Zoom In",
      restore: "Restore Original Image",
      save: "Save Changes",
      close: "Close the Editor",
      removeall: "Remove All Images",
      removeselected: "Remove All Selected Images",
    },
  },

  dialogText: {
    dlgRotateAnyAngle: [
      "Angle :",
      "Interpolation:",
      "Keep size",
      "  OK  ",
      "Cancel",
    ],
    dlgChangeImageSize: [
      "New Height :",
      "New Width :",
      "Interpolation method:",
      "  OK  ",
      "Cancel",
    ],
    saveChangedImage: [
      "You have changed the image, do you want to keep the change(s)?",
      "  Yes  ",
      "  No  ",
    ],
    selectSource: [
      "Select Source:",
      "Select",
      "Cancel",
      "There is no source available!",
    ],
  },
};
```

For the Dynamic Web TWAIN Service (also called "Dynamsoft Service") installation message below, you can customize the display language by searching for `Dynamsoft._show_install_dialog` in dynamsoft.webtwain.install.js, and changing the display language accordingly.

![install dialog](/assets/imgs/Initialization-1.png)
