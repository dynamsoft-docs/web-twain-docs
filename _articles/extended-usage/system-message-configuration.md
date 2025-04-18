---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Configuring System Messages
keywords: Dynamic Web TWAIN, UI Customization, display language, language, message configuration, system messages, translation, translating, localization
breadcrumbText: Configuring System Messages
description: Configuring System Messages
---

# Configuring System Messages

DWT provides various system messages during all parts of runtime. Some of these messages are errors which are useful for debugging/reporting purposes, such as indicating that the [Dynamic Web TWAIN Service](/_articles/faq/what-does-dynamsoft-service-do-on-end-user-machine.md) has not been installed on end user's system. Other messages provide information directly to the end user, such as labelling the image source selection prompt overlay (scanner selection).

These system messages are configurable. Notably, we recommend changing these system messages for the purposes of translating the default English messages to other localizations.

## Configuring the `CustomizableDisplayInfo` Object

Most system messages are configurable with the `Dynamsoft.DWT.CustomizableDisplayInfo` object, which may be modified within the **`dynamsoft.webtwain.config.js`** configuration resource file. This resource file has a commented-out definition of the object, which contains the default system messages. To alter the default messages, simply un-comment the object and change its properties:

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
      restore: "Restore Orginal Image",
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

The messages are grouped into categories:

- `errorMessages` mainly contains loading/instantiation error messages.
- `customProgressText` are loading messages that appear during processes such as data IO and image encoding/decoding.
- `buttons` `Viewer` editor/DDV element tooltip labels?
- `dialogText` provides confirmation messages and the source selection message to the user. 

## Configuring the `_show_install_dialog()` Function

The `Dynamsoft._show_install_dialog()` function defined in the `dynamsoft.webtwain.install.js` resource file generates the [Dynamic Web TWAIN Service](/_articles/faq/what-does-dynamsoft-service-do-on-end-user-machine.md) installation dialog box, pictured here:

![install dialog]({{site.assets}}imgs/Initialization-1.png)

As the dialog box contains instructions for installing the Dynamic Web TWAIN Service, consider altering the message strings for localization purposes. Generally we discourage directly modifying the resource files, but this dialogue function contains styling and messaging which may be tailored the web application itself. Try not to alter the platform detection logic too greatly, as this may interfere with the Dynamic Web TWAIN Service installation procedure. Please contact the [support team](/_articles/about/getsupport.md) for any further questions.