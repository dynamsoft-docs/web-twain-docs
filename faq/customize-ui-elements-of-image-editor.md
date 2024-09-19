---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: Can I customize UI elements of the built-in image editor?
keywords: Dynamic Web TWAIN, UI Customization, customize, ui elements
breadcrumbText: Can I customize UI elements of the built-in image editor?
description: Can I customize UI elements of the built-in image editor?
permalink: /faq/customize-ui-elements-of-image-editor.html
---

# UI Customization

## Can I customize UI elements of the built-in image editor?

Yes, you can perform various customizations on the image editor. Some of such customizations are shown below as examples.

### Can I change the language of the Editor?

Yes, as shown in the sample code below, you can use the parameters `titles` and `dialogText` to specify the language used in the editor.

```javascript
 titles: {
            'previous': 'Previous Image',
            'next': 'Next Image',
            'print': 'Print Image',
            'scan': 'Scan Documents',
            'load': 'Load Local Images'
 }
```

```javascript
 dialogText: {
        dlgRotateAnyAngle: ['Angle :', 'Interpolation:', 'Keep size', '  OK  ', 'Cancel'],
        dlgChangeImageSize: ['New Height :', 'New Width :', 'Interpolation method:', '  OK  ', 'Cancel'],
        saveChangedImage: ['You have changed the image, do you want to keep the change(s)?', '  Yes  ', '  No  '],
        selectSource: ['Select Source:', 'Select', 'Cancel', 'There is no source available']
    }
```

### Can I remove or add buttons on the toolbar of the Editor?

While you can use `visibility` (as shown in the sample code below) to remove a default button(s), currently you cannot add a custom button.

```javascript
visibility: {
            'scan': true,
            'load': true,
            'print': false,
            'removeall': true
}
```

You can see the print icon is hidden in the image below.

![image]({{site.assets}}imgs/hideicon.png)

### Can I specify where and how big the Editor is?

Yes, as shown in the sample code below, you can use the parameter `element` to specify where the editor is created and then use `width` and `height` to specify its size.

```javascript
element: document.getElementById("imageEditor"),
width: 600,
height: 400,
```

### Can I change the colors of the Editor?

Yes, as shown in the sample code below, the parameters `border` , `topMenuBorder` , `innerBorder` and `background` can be used to specify the style, including the color of the editor.

```javascript
border: '5px solid rgb(0,128,0)',
topMenuBorder: '',
innerBorder: '',
background: "rgb(255, 255, 255)",
```

![image]({{site.assets}}imgs/colorchange.png)

Complete code is as below.

```javascript
// Customize the editor
var editorSettings = {
  /* Show the editor within the DIV 'imageEditor'*/
  element: document.getElementById("imageEditor"),
  width: 600,
  height: 400,
  border: "10px solid rgb(0,128,0)",
  topMenuBorder: "",
  innerBorder: "",
  background: "rgb(255, 255, 255)",
  promptToSaveChange: true,
  buttons: {
    titles: {
      previous: "Previous Image",
      next: "Next Image",
      print: "Print Image",
      scan: "Scan Documents",
      load: "Load Local Images",
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
    visibility: {
      scan: true,
      load: true,
      print: true,
      removeall: true,
      removeselected: true,
      rotateleft: true,
      rotate: true,
      rotateright: true,
      deskew: true,
      crop: true,
      cut: true,
      changeimagesize: true,
      flip: true,
      mirror: true,
      zoomin: true,
      originalsize: true,
      zoomout: true,
      stretch: true,
      fit: true,
      fitw: true,
      fith: true,
      hand: true,
      rectselect: true,
      zoom: true,
      restore: true,
      save: true,
      close: true,
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
      "There is no source available",
    ],
  },
};

var imageEditor = DWTObject.Viewer.createImageEditor(editorSettings);
imageEditor.show();
```
