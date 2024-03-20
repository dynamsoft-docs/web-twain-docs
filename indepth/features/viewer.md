---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Viewer
keywords: Dynamic Web TWAIN, Documentation, Viewer
breadcrumbText: Viewer
description: Dynamic Web TWAIN SDK Documentation Viewer Page
permalink: /indepth/features/viewer.html
---

# Viewer

`Dynamic Web TWAIN` has a `Viewer` component to help visualize the data in the buffer. By default, it is created with basic settings for each `WebTwain` instance. However, it can be customized to fit different usage scenarios.

## Create the Viewer

### Built-in viewer that comes with the WebTwain instance

As mentioned in [creating the WebTwain instance]({{site.indepth}}features/initialize.html#creating-the-webtwain-instance), a new `WebTwain` instance (or a new `Dynamic Web TWAIN` object) usually comes with an already-bound viewer which is an instance of the `Viewer` component. This viewer uses the default settings and normally is enough to handle the data visualization.

#### Customize the Built-in Viewer

The viewer is created inside a given `HTMLDivElement` specified by its `id` . 

If a `WebTwain` instance is created with a built-in viewer, you can specify the initial size of the viewer during the creation. For example, the following configuration specifies a *585px by 513px* viewer to be created in the `HTMLDivElement` with the `id` "dwtcontrolContainer1".

``` javascript
Dynamsoft.DWT.Containers = [{
    ContainerId: 'dwtcontrolContainer1',
    Width: '585px',
    Height: '513px'
}]
```
### Create a viewer and bind a viewer-less WebTwain Instance

#### Create a Viewer-less WebTwain Instance

If you want to further customize the viewer, you can use [ `Dynamsoft.DWT.CreateDWTObjectEx()` ]({{site.indepth}}features/initialize.html#-dynamsoftwebtwainenvcreatedwtobjectex-) to create a `WebTwain` instance that doesn't come with a viewer.

#### Bind a Viewer

 You can then bind and customize the viewer before showing it with the APIs [ `bind()` ]({{site.info}}api/WebTwain_Viewer.html#bind) and [ `show()` ]({{site.info}}api/WebTwain_Viewer.html#show). For example, the following code shows a viewer with thumbnails

``` javascript
var DWObject = null;
Dynamsoft.DWT.CreateDWTObjectEx({
        WebTwainId: 'dwtcontrol'
    },
    function(obj) {
        DWObject = obj;
        DWObject.Viewer.bind(document.getElementById('dwtcontrolContainer'));
        DWObject.Viewer.height = 600;
        DWObject.Viewer.width = 800;
        var thumbnailViewer = DWObject.Viewer.createThumbnailViewer();
        thumbnailViewer.show();
        DWObject.Viewer.show();
    },
    function(err) {
        console.log(err);
    }
);
```

## Use the Viewer

You can use the `Viewer` in the following ways

### Navigate through all images

You can use the mouse, the arrow keys or the APIs [`first()`]({{site.info}}api/WebTwain_Viewer.html#first), [`next()`]({{site.info}}api/WebTwain_Viewer.html#next), [`previous()`]({{site.info}}api/WebTwain_Viewer.html#previous), [ `last()` ]({{site.info}}api/WebTwain_Viewer.html#last) and [`gotoPage()`]({{site.info}}api/WebTwain_Viewer.html#gotopage) to navigate through the images in buffer.

### Show one or multiple images in one view

You can change the view mode to show one or multiple images. The API is [`setViewMode()`]({{site.info}}api/WebTwain_Viewer.html#setviewmode).

### Fit one image to the view

The image in the viewer can fit to the width or height of the viewer or both. The API is [`fitWindow()`]({{site.info}}api/WebTwain_Viewer.html#fitwindow).

### Show the image in its actual size

You can show the image in its actual size by setting [`zoom`]({{site.info}}api/WebTwain_Viewer.html#zoom) to 1. This is only supported when the view mode is set to -1 x -1.

### Zoom in to see more details of an image

To do this, you just set a bigger or smaller value to  [`zoom`]({{site.info}}api/WebTwain_Viewer.html#zoom). This is only supported when the view mode is set to -1 x -1.

### Select an area

You can use the API [`setSelectedAreas()`]({{site.info}}api/WebTwain_Viewer.html#setselectedAreas).

## Unbind the Viewer

You can call the method [`unbind()`]({{site.info}}api/WebTwain_Viewer.html#unbind) on a `WebTwain` instance to unbind and destroy its viewer.

## The Image Editor

The Image Editor is a built-in UI that contains the most commonly used editing functions. If you don't want to build your own specific UI, you can give it a try and see if it meets your requirements.
