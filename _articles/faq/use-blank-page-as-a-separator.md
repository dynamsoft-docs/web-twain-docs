---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to use a blank page as a separator?
keywords: Dynamic Web TWAIN, document classification, separator
breadcrumbText: How to use a blank page as a separator?
description: How to use a blank page as a separator?
date: 2022-01-26 13:39:43 +0800
---

# Document Saving

## How to use a blank page as a separator?

### Scenario

You are scanning in multiple documents with a blank page separating them and would like to save each set of documents separately.

### Solution

In order to do this we will scan in all the sheets, then use [IsBlankImageExpress](/_articles/info/api/WebTwain_Buffer.md#isblankimageexpress){:target="_blank"} to detect whether or not it is blank. If the sheet is blank we will then remove it from the buffer and save the previous set of sheets. In order to accomplish this task we are going to use the event OnPostAllTransfers, which fires after all scans are complete in order to check whether or not any pages are blank.

```javascript
function Dynamsoft_OnReady() { 
    DWTObject = Dynamsoft.DWT.GetWebTwain('dwtcontrolContainer'); // Get the Dynamic Web TWAIN object that is embedded in the div with id 'dwtcontrolContainer' 
    if (DWTObject) { 
        DWTObject.IfShowUI = false;
        DWTObject.IfAutoDiscardBlankpages = false;
        DWTObject.RegisterEvent('OnPostAllTransfers', CheckBlankPage); //Register the OnPostAllTransfers event that will be called after all scanning is complete 
    } 
}

function AcquireImage() {
    if (DWTObject) {
        DWTObject.SelectSource(function () {					
            var OnAcquireImageSuccess = function () {
                DWTObject.CloseSource();
            };
            
            var OnAcquireImageFailure = function (ec, es) {
                DWTObject.CloseSource();
                alert(es);
            };

            DWTObject.OpenSource();
            DWTObject.IfDisableSourceAfterAcquire = false;	// Scanner source will be disabled/closed automatically after the scan. 
            DWTObject.AcquireImage(OnAcquireImageSuccess, OnAcquireImageFailure);
        }, function () {
            console.log('SelectSource failed!');
        });
    }
}

function OnSuccess() {
    console.log('successful');
}

function OnFailure(errorCode, errorString) {
    alert(errorString);
}

function CheckBlankPage() { //Function for checking a blank page, called when OnPostAllTransfers is triggered
    if (DWTObject) { //Ensure there is a DWTObject
        var startindex = 0; // Assume it starts from the first page in the buffer.
        for (var i = 0; i < DWTObject.HowManyImagesInBuffer; i++) { //Go through each image in the buffer.
            if (DWTObject.IsBlankImageExpress(i)) {
                DWTObject.RemoveImage(i); // remove the blank page from the buffer.
                if (i != 0) {
                    var imageRecord = [];
                    i--; //decrement i for the removed image
                    var selectedCount = i - startindex + 1;

                    for (var j = 0; j < selectedCount; j++) { //loop to select all images from previous blank to current
                        imageRecord.push(j + startindex);
                    }

                    if (selectedCount > 0) { //save images as long as there are some in the selection
                        DWTObject.SelectImages(imageRecord);
                        DWTObject.IfShowFileDialog = true;
                        DWTObject.SaveSelectedImagesAsMultiPagePDF("C:\\....", OnSuccess, OnFailure); //PLEASE CHANGE THIS FILE PATH (The first parameter)
                    }

                    startindex = i + 1; //set the start index for next search 1 higher than current page
                }
            } else if (i == DWTObject.HowManyImagesInBuffer - 1) { //the last few images are not blank
                var selectedCount = i - startindex + 1; // set how many images are selected
                var imageRecord = [];

                for (var j = 0; j < selectedCount; j++) { //loop to select all images from previous blank to current
                    imageRecord.push(j + startindex);
                }

                if (selectedCount > 0) { //save images as long as there are some in the selection
                    DWTObject.SelectImages(imageRecord);
                    DWTObject.IfShowFileDialog = true;
                    DWTObject.SaveSelectedImagesAsMultiPagePDF("C:\\...", OnSuccess, OnFailure); //PLEASE CHANGE THIS FILE PATH (The first parameter)
                }
            }
        }
    }
}
```

If your application is having a hard time detecting blank pages(there is some areas around the edge of the blank page with non-blank spots) or you are using coloured pages you may want to use the pages standard deviation instead. You may use the following Snippet instead. 

**Using Page Standard Deviation:**

```javascript
function CheckBlankPage(){ //Function for checking a blank page, called when OnPostAllTransfers is triggered 
    if(DWTObject){//Ensure there is a DWTObject 
        for(var i = 0; i < DWTObject.HowManyImagesInBuffer;i++){//Go through each image in the buffer. 
            if(DWTObject.IsBlankImageExpress(i)){}//Make Blank Image run, but do not use the result 
            if(DWTObject.BlankImageCurrentStdDev < 15.0){//set a standard deviation for the program to use
                //......
            } 
        } 
    } 
}
```
