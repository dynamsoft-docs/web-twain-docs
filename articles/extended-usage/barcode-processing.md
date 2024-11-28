---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Features - Read Barcode
keywords: Dynamic Web TWAIN, Documentation, Read Barcode
breadcrumbText: Read Barcode
description: Dynamic Web TWAIN SDK Documentation Read Barcode Page
permalink: /extended-usage/barcode-processing.html
redirect_from: /indepth/features/barcode.html
---

# Barcode Reader

With the increasing use of barcode reading in document management systems, the Barcode Reader add-on for Dynamic Web TWAIN presents an easy and seamless way of integrating one of the industry's best barcode reading components into your document management system. In this section, we will show you how to get started with the add-on and demonstrate how it can be used as a batch document classifier or separator.

> NOTE
>  
> Barcode reading can be performed on the client side as well as the server side. For `Dynamic Web TWAIN` , we only consider client-side reading. If you are interested in reading on the server side, you can contact [Dynamsoft Support]({{site.about}}getsupport.html).

## Environment

* Windows

## How to use

### Step one - Include the add-on

To include this add-on is to reference the necessary JavaScript file which is included in the [resources files]({{site.faq}}what-are-the-resources-files.html).

> If you are using the [dwt package](https://www.npmjs.com/package/dwt), the barcode reader is already included in the main JavaScript file ( `dynamsoft.webtwain.min.js` or `dynamsoft.webtwain.min.mjs` ) which means you can skip this step.

``` html
<script src="Resources/addon/dynamsoft.webtwain.addon.barcodereader.js"> </script>
```

### Step two - Start the reading

Now that the add-on has been referenced, we can call [`decode()`]({{site.info}}api/Addon_BarcodeReader.html#initruntimesettingswithstring) to start reading barcode(s).

``` javascript
function readBarcodes(imageIndex) {
    if (DWTObject) {
        DWTObject.Addon.BarcodeReader.decode(imageIndex)
            .then(function(textResults) {
                console.log(textResults)
            }, function(error) {
                console.log(error)
            });
    } else {
        console.log('DWTObject is not initialized yet');
    }
}
```

Note that the barcode reading does take a bit of time, so it'll help to add an indicator as mentioned in [Loading Bar and Backdrop]({{site.indepth}}features/ui.html#loading-bar-and-backdrop)

``` javascript
function readBarcodes(imageIndex) {
    if (DWTObject) {
        // Add an indicator
        Dynamsoft.DWT.OnWebTwainPreExecute();
        DWTObject.Addon.BarcodeReader.decode(imageIndex)
            .then(function(textResults) {
                // Remove the indicator
                Dynamsoft.DWT.OnWebTwainPostExecute();
                console.log(textResults)
            }, function(error) {
                // Remove the indicator
                Dynamsoft.DWT.OnWebTwainPostExecute();
                console.log(error)
            });
    } else {
        console.log('DWTObject is not initialized yet');
    }
}
```

### Step three - Check the result

Check the structure of the resulting object [here]({{site.info}}api/Addon_BarcodeReader.html#decode). The following code prints out the text contained in the barcode(s)

``` javascript
Dynamsoft.DWT.OnWebTwainPreExecute();
DWTObject.Addon.BarcodeReader.decode(imageIndex)
    .then(function(textResults) {
        // Remove the indicator
        Dynamsoft.DWT.OnWebTwainPostExecute();
        for (var i = 0; i < textResults.length; i++) {
            console.log(textResults[i].BarcodeText);
        }
    }, function(error) {
        // Remove the indicator
        Dynamsoft.DWT.OnWebTwainPostExecute();
        console.log(error)
    });
```

## Runtime Settings

Most of the time, you simply need to use the default decode method to read most of the barcode images out there. However, you may encounter some barcodes that fail to be read and sometimes you might want to limit which barcode types the reader should pick up, and more.

The runtime settings of the add-on gives you access to a wide array of customizable parameters, all of which you can check out with the method [ `getRuntimeSettings()` ]({{site.info}}api/Addon_BarcodeReader.html#getruntimesettings) and change with the method [ `updateRuntimeSettings()` ]({{site.info}}api/Addon_BarcodeReader.html#updateruntimesettings). Now to demonstrate a few typical customization scenarios:

### Specify the Barcode Type(s) to Read

By default, the add-on will read all the supported barcode types from the image. (See the `Supported Symbologies` [here](https://www.dynamsoft.com/Products/Barcode-Types.aspx))

If your license only covers a subset of the full list or you want to read specific barcode types, you can use `barcodeFormatIds` and `barcodeFormatIds2` to specify the barcode format(s). For example, to enable only 1D barcode reading, you can use the following code snippet:

``` javascript
DWTObject.Addon.BarcodeReader.getRuntimeSettings()
    .then(function(runtimeSettings) {
        runtimeSettings.barcodeFormatIds = Dynamsoft.DBR.EnumBarcodeFormat.BF_ONED;
        return DWTObject.Addon.BarcodeReader.updateRuntimeSettings(runtimeSettings);
    }, function(error) {
        console.log(error);
    })
    .then(function(runtimeSettings) {
        // Add an indicator
        Dynamsoft.DWT.OnWebTwainPreExecute();
        return DWTObject.Addon.BarcodeReader.decode(imageIndex);
    }, function(error) {
        console.log(error);
    })
    .then(function(textResults) {
        // Remove the indicator
        Dynamsoft.DWT.OnWebTwainPostExecute();
        for (var i = 0; i < textResults.length; i++) {
            console.log(textResults[i].BarcodeText);
        }
    }, function(error) {
        // Remove the indicator
        Dynamsoft.DWT.OnWebTwainPostExecute();
        console.log(error)
    });
```

### Specify maximum barcode count

By default, the add-on will read as many barcodes as it can. To increase the recognition efficiency, you can use `expectedBarcodesCount` to specify the maximum number of barcodes to recognize according to your scenario.

``` javascript
// No matter how many barcodes are on the image, stop reading as soon as one barcode is found
runtimeSettings.expectedBarcodesCount = 1;
DWTObject.Addon.BarcodeReader.updateRuntimeSettings(runtimeSettings);
```

### Specify a scan Region

By default, the add-on will search the whole image for barcodes. This can lead to poor performance especially when dealing with high-resolution images. You can speed up the recognition process by restricting the scanning region. To specify a region, you will need to define an area. The following code shows how to define the region.

``` javascript
// The following reads the center of the image (50% vertically and horizontally)
runtimeSettings.region.regionTop = 25;
runtimeSettings.region.regionBottom = 75;
runtimeSettings.region.regionLeft = 25;
runtimeSettings.region.regionRight = 75;
runtimeSettings.region.regionMeasuredByPercentage = 1;
DWTObject.Addon.BarcodeReader.updateRuntimeSettings(runtimeSettings);
```

### Set the runtime settings using JSON

So far, we edited the values of specific runtime settings via accessing each individual setting and adjusting its value. However, the add-on also provides the developer the ability to set everything at once using a JSON string. The method is called [ `initRuntimeSettingsWithString()` ]({{site.info}}api/Addon_BarcodeReader.html#initruntimesettingswithstring).

> Some advanced features, such as dedicated configuration of a binarization mode, are only possible when using the method `initRuntimeSettingsWithString()` .

Here is a JSON template for your reference:

``` javascript
var settings = {
    "ImageParameter": {
        "BarcodeFormatIds": ["BF_ALL"],
        "BinarizationModes": [{
            "BlockSizeX": 0,
            "BlockSizeY": 0,
            "EnableFillBinaryVacancy": 1,
            "ImagePreprocessingModesIndex": -1,
            "Mode": "BM_LOCAL_BLOCK",
            "ThreshValueCoefficient": 10
        }],
        "DeblurLevel": 9,
        "Description": "",
        "ExpectedBarcodesCount": 0,
        "GrayscaleTransformationModes": [{
            "Mode": "GTM_ORIGINAL"
        }],
        "ImagePreprocessingModes": [{
            "Mode": "IPM_GENERAL"
        }],
        "IntermediateResultSavingMode": {
            "Mode": "IRSM_MEMORY"
        },
        "IntermediateResultTypes": ["IRT_NO_RESULT"],
        "MaxAlgorithmThreadCount": 4,
        "Name": "runtimesettings",
        "PDFRasterDPI": 300,
        "Pages": "",
        "RegionDefinitionNameArray": null,
        "RegionPredetectionModes": [{
            "Mode": "RPM_GENERAL"
        }],
        "ResultCoordinateType": "RCT_PIXEL",
        "ScaleDownThreshold": 2300,
        "TerminatePhase": "TP_BARCODE_RECOGNIZED",
        "TextFilterModes": [{
            "MinImageDimension": 65536,
            "Mode": "TFM_GENERAL_CONTOUR",
            "Sensitivity": 0
        }],
        "TextResultOrderModes": [{
                "Mode": "TROM_CONFIDENCE"
            },
            {
                "Mode": "TROM_POSITION"
            },
            {
                "Mode": "TROM_FORMAT"
            }
        ],
        "TextureDetectionModes": [{
            "Mode": "TDM_GENERAL_WIDTH_CONCENTRATION",
            "Sensitivity": 5
        }],
        "Timeout": 10000
    },
    "Version": "3.0"
};
```

For a JSON object like `settings` above, you should make it a string first as shown in the code below

``` javascript
var JSONString = JSON.stringify(settings);
DWTObject.Addon.BarcodeReader.initRuntimeSettingsWithString(JSONString)
.then(function(){
    return DWTObject.Addon.BarcodeReader.decode(imageIndex);
},function(error) {
    console.log(error)
})
.then(function(textResults) {
    if (textResults.length == 0) {
        console.log("No barcode found");
    } else {
        for (var i = 0; i < textResults.length; i++) {
            console.log(textResults[i].BarcodeText);
        }
    }
}, function(error) {
    console.log(error)
})
```

### Built-in modes

If you are not sure how to change the `RuntimeSettings` , the add-on also comes with three built-in modes for you to choose from

* `speed` : fast but may miss some barcodes
* `coverage` : slow but covers most barcodes
* `balance` : between `speed` and `coverage`

<!-- The following shows their differences

| Parameter | `speed` | `balance` | `coverage` | `default` |
| :-: | :-: | :-: | :-: | :-: |
| `deblurLevel` |  `3` 	|  `5` 	|  `9` | `9` |
| `barcodeFormatIds_2` |  `32505858` 	|  `32505858` 	|  `32505858` | `0` |
| `expectedBarcodesCount` |  `512` 	|  `512` 	|  `512` | `0` |
| `grayscaleTransformationModes` | `[2, 0, 0, 0, 0, 0, 0, 0]` 	| `[2, 0, 0, 0, 0, 0, 0, 0]` 	 | `[2, 1, 0, 0, 0, 0, 0, 0]` | `[2, 0, 0, 0, 0, 0, 0, 0]` |
| `textFilterModes` | `[0, 0, 0, 0, 0, 0, 0, 0]` 	 | `[2, 0, 0, 0, 0, 0, 0, 0]` 	 | `[2, 0, 0, 0, 0, 0, 0, 0]` | `[2, 0, 0, 0, 0, 0, 0, 0]` |
| `localizationModes` | `[2, 32, 64, 0, 0, 0, 0, 0]` 	 | `[2, 4, 32, 64, 0, 0, 0, 0]` 	 | `[2, 16, 4, 8, 32, 64, 0, 0]` | `[2, 16, 4, 8, 0, 0, 0, 0]` |
| `scaleDownThreshold` | `2300` 	| `2300` 	| `214748347` | `2300` |
-->

To use one of these modes, simply call `updateRuntimeSettings()`

``` javascript
DWTObject.Addon.BarcodeReader.updateRuntimeSettings('coverage').then( /*---*/ );
```

[Try](https://demo.dynamsoft.com/Samples/dwt/Scan-Documents-and-Read-Barcode/ReadBarcode.html) or [download](https://www.dynamsoft.com/handle-sample?demoSampleId=66&type=2&productId=1000001&link=https%3a%2f%2fdownload2.dynamsoft.com%2fSamples%2fDWT%2fScan-Documents-and-Read-Barcode.zip) an official demo.

### Reset settings

You can always go back to the default settings with the method [ `resetRuntimeSettings()` ]({{site.info}}api/Addon_BarcodeReader.html#resetruntimesettings).

## Use barcode to classify and separate documents

Using pages with barcodes as document separators and classifying images with the barcode on it are two popular usage scenarios.

### As document separators

The following code reads all images and use those with barcodes to separate images into different documents.

``` javascript
// `aryIndices` consists of multiple arrays each of which represents a document
var aryIndices = [],
    bBarcodeFound = false,
    ProcssedImagesCount = 0;
j;

function ReadBarcode(index) {
    DWTObject.Addon.BarcodeReader.decode(index)
        .then(function(results) {
                ProcssedImagesCount++;
                if (results.length === 0) {
                    console.log('no barcode found on image index ' + index);
                    if (bBarcodeFound === true) {
                        // If a barcode was found earlier, this image belongs to the current document
                        bBarcodeFound = false;
                        if (aryIndices.length === 0)
                            aryIndices.push([index]);
                        else
                            aryIndices[aryIndices.length - 1].push(index);
                    } else {
                        // If no barcode has been found yet, this image belongs to the first document
                        if (aryIndices.length === 0)
                            aryIndices.push([index]);
                        else
                            aryIndices[aryIndices.length - 1].push(index);
                    }
                } else {
                    console.log('barcode found on image index ' + index);
                    if (ProcssedImagesCount === DWTObject.HowManyImagesInBuffer) {
                        //If it is the last image, no need to set this flag to true nor create a new document
                        bBarcodeFound = false;
                    } else {
                        bBarcodeFound = true;
                        // Found a barcode, create a new one
                        if (aryIndices.length === 0)
                            aryIndices.push([]);
                        else if (aryIndices[aryIndices.length - 1].length != 0)
                            aryIndices.push([]);
                    }
                }
                if (ProcssedImagesCount === DWTObject.HowManyImagesInBuffer) {
                    // Print out the indice arrays, each array represents a document
                    console.log(aryIndices);
                    aryIndices = [];
                } else
                    /*
                     * Read the next image
                     */
                    ReadBarcode(index + 1);
            },
            function(errorMsg) {
                console.log(errorMsg);
            }
        );
}
ReadBarcode(0);
```

### As document classifier

The following code reads all barcodes from all images and puts images which have the same barcode into one document. Images without any barcodes are put into another separate document.

``` javascript
// `aryIndices` consists of multiple arrays each of which represents a document
var aryIndices = {
        'noBarcode': []
    },
    ProcssedImagesCount = 0;

function ReadBarcode(index) {
    var j,
        bBarcodeFound = false;
    DWTObject.Addon.BarcodeReader.decode(index).then(function(results) {
            ProcssedImagesCount++;
            if (results.length === 0) {
                console.log('no barcode found on image index ' + index);
                aryIndices.noBarcode.push(index);
            } else {
                console.log('barcode found on image index ' + index);
                var barcodeOnThisImage = [],
                    allKeys = [];
                for (j = 0; j < results.length; j++) {
                    var result = results[j];
                    var barcodeText = result.barcodeText;
                    // Record all barcodes found on this image
                    if (barcodeOnThisImage.indexOf(barcodeText) === -1)
                        barcodeOnThisImage.push(barcodeText);
                }

                Dynamsoft.Lib.each(aryIndices, function(value, key) {
                    allKeys.push(key);
                });

                for (j = 0; j < allKeys.length; j++) {
                    var oKey = allKeys[j];
                    if (barcodeOnThisImage.indexOf(oKey) != -1) {
                        barcodeOnThisImage.splice(barcodeOnThisImage.indexOf(oKey), 1);
                        var _value = aryIndices[oKey];
                        if (_value.indexOf(index) === -1) {
                            _value.push(index);
                            aryIndices[oKey] = _value;
                        }
                    }
                }
                for (j = 0; j < barcodeOnThisImage.length; j++) {
                    aryIndices[barcodeOnThisImage[j]] = [index];
                }
            }
            if (ProcssedImagesCount === DWTObject.HowManyImagesInBuffer) {
                ProcssedImagesCount = 0;
                var aryTemp = [];
                Dynamsoft.Lib.each(aryIndices, function(value, key) {
                    aryTemp.push(value);
                });
                aryIndices = aryTemp;
                console.log(aryIndices);
                aryIndices = {
                    'noBarcode': []
                };
            } else
                /*
                 * Read the next image
                 */
                ReadBarcode(index + 1);

        },
        function(errorMsg) {
            console.log(errorMsg);
        }
    );
}
ReadBarcode(0);
```

[Try](https://demo.dynamsoft.com/Samples/dwt/Scan-Documents-and-Separate-them-by-Barcode/Scan-Separate-Barcode.html) or [download](https://www.dynamsoft.com/handle-sample?demoSampleId=102&type=2&productId=1000001&link=https%3a%2f%2fdownload2.dynamsoft.com%2fSamples%2fDWT%2fScan-Documents-and-Separate-them-by-Barcode.zip) the official demo.
