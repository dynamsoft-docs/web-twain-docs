# Directory

- Draft only, descriptors not part of page content
- Include/link relevant troubleshooting for each article at bottom
- Instructional articles provide templates and guides to use specified feature
- Instructional articles link to corresponding knowledge base article for complete explanation of relevant DWT component/feature

## [Introduction](https://www.dynamsoft.com/web-twain/docs/about/index.html)
- Documentation pre-amble
- Introduce product, features, use cases, platform support, etc.
- Lightly touch on other introductory sections

### [Use Cases]()
- Link to three most common use cases as prepared by marketing team
- Could just merge into [Introduction](#introduction)

### [Samples and Demos]()
- Link to DWT code gallery
- Link to finished samples from other guides

## [Hello World]()
- State implemented features
- Link to corresponding basic usage guides for explanation - [initialization](#initializing-dwt), [acquiring images](#acquiring-images-from-devices-scanners), etc.
- Include quick installation
- Use existing finished Hello World (end result includes scanning, uploading, and editing images - visually impactful features)
- Consider moving installation and initialization to Hello World instead of within Hello World Scanning Pages
- ### [Scanning Images]()
- ### [Uploading Images to Server]()
- ### [Setting Scan Parameters]()
- ### [Editing Images]()

## [Developer Guide]()

### [General Usage]()
- Originally called Fundamental Features, implies this is prerequisite knowledge that requires more understanding of the product, renamed basic "Basic" to imply this is easy and sufficient to use on its own
- Lay out article dependencies - first article is necessary for all others, but no need for strict reading order past first article
- Alternatively: Basic Usage Guide

#### [Initializing DWT]()
- Replaces "Initiate DWT Object"
- Alternative titles: DWT Initialization, SDK Initialization, Initializing the SDK
- KB [DWT Initialization](#dwt-initialization) and maybe [DWT Resource Files](#dwt-resource-files)

#### [Importing Images]()
- Introduce getting images from scanners and from files into DWT
- Link to webcam add-on
    ##### [Selecting Imaging Devices (Scanners)]()
    - KB [Imaging Devices](#imaging-devices)
    ##### [Acquiring Images from Devices (Scanners)]()
    - KB [Imaging Devices](#imaging-devices)
    ##### [Loading Local Image Files]()
    - KB [Imaging Devices](#imaging-devices)
    ##### [Loading Network Image Files]()
    - KB [Networking Features](#networking-features)

#### [Creating the UI]()
-  Toggling basic UI options
-  Possibly just one section if editing article is a stub
    ##### [Building the Thumbnail Viewer]()
    - KB [`WebTwain` `Viewer`](#the-webtwain-viewer)
    ##### [Building the Editor]()
    - Currently only mentions simple geometric transformations, may seek to include others. Otherwise this may be a stub article
    - Article is dependent on viewer article (recommend as prerequisite)
    - KB [Image Manipulation](#image-manipulation)

#### [Processing Images]()
- Manipulating and processing received image data
- Include link to barcode reader add-on
  ##### [Editing Images]()
  - Rotation, crop, maybe link to blank page detection
  - KB [Image Manipulation](#image-manipulation)
  ##### [Managing the Image Buffer]()
  - Reordering, tagging images, removing blank pages, etc.
  - KB [Data Handling](#data-handling)

#### [Exporting Images]()
- Link to `FileUploader` for advanced use cases
- ##### [Uploading to Web Server]()
  - KB [Networking Features](#networking-features)
- ##### [Saving to Local File System]()
  - KB [Data Handling](#data-handling) 

### [Advanced Usage]()
- Originally "Advanced Features"
- Reframed to prioritize application over theory

#### [Using DWT in Web Frameworks]()
- Quick intro to web frameworks and their benefits
- Mention installation and license key
- In each framework page, link to finished project on github
- KB [DWT Initialization](#dwt-initialization), [DWT Resource Files](#dwt-resource-files)
  ##### [Angular]()
  ##### [React]()
  ##### [Vue]()

#### [Configuring System Messages]()
- Note special use case of customizing messages with translated messages for language localization purposes
- KB [DWT Resource Files](#dwt-resource-files)

#### [Initializing DWT without UI]()
- KB [DWT Initialization](#dwt-initialization)

#### [Configuring Scan Settings]()
- KB [Imaging Devices](#imaging-devices)

#### [Retaining Native Scanning Parameters]()
- Unclear about purpose/inclusion in previous draft
- KB [Imaging Devices](#imaging-devices)

#### [Configuring the Dynamsoft Service]()
- End user installation, port configuration, origin access control, etc.
- KB [The Dynamsoft Service](#the-dynamsoft-service)

#### [Configuring the Editor]()
- KB [Image Manipulation](#image-manipulation)

#### [Configuring the Thumbnail Viewer]()
- KB [The `WebTwain` `Viewer`](#the-webtwain-viewer)

#### [Uploading Images in Segments]()
- Unclear about contents, currently only one API has references to segmented upload
- KB [Networking Features](#networking-features)

#### [Scanning with Multiple Users with Citrix (Enhanced Mode)]()
- High performance mode for many users, within Citrix remote desktop
- Use descriptive name instead of Enhanced Mode
- KB [Enhanced Mode](#enhanced-mode)

#### [Scanning with Remote Scanner]()
- KB [Remote Scan](#remote-scan)

#### [Uploading From Background]()
- Using the `FileUploader` for large upload from the background service
- KB [The `FileUploader`](#the-fileuploader)

#### [Exporting Binary Image Data]()
- ConvertToBlob and ConvertToBase64
- Previous deleted topic: Get Image Data
- KB [Data Handling](#data-handling)

#### [Sorting Images By Tags]()
- KB [Image Manipulation](#image-manipulation)

#### [Sorting Images By Documents]()
- Creating a document with image selection, getting image id from selected document
- KB [Image Manipulation](#image-manipulation)

#### [Using Advanced Image Editor Configurations]()
- KB [The `WebTwain` `Viewer`](#the-webtwain-viewer)

#### [Encrypting and Caching Images Locally]()
- Local encrypted image storage/caching
- KB [Data Handling](#data-handling)

#### [Using DWT With Other Dynamsoft Products]()
- Unfamiliar with content

#### [Add-ons]()
- Introduce each add-on
- Installation and setup
- Possibly move to subsection of Knowledge Base, and then leave corresponding user guides?
  - May incentivize purchase, but may leave customers frustrated if they don't expect that it's an add-on
  - Title could indicate required add-on, i.e. Scanning From Camera (Webcam Add-on)
- KB [Licensing](#licensing)

#### [PDF Rasterizer]()

#### [Barcode Reader]()

#### [Webcam]()

### [Configuration Management]()
- Not finalized title
- Additional instructional section that includes:
  - License key management
  - Version upgrades
  - SDK installation
  - Deployment/production-related tasks
- Some of these instructions are out of place when placed with guides on SDK features

#### [Installing DWT]()
- Windows, Linux, MacOS
- Using the installer vs. npm
- Using license keys
- KB [DWT Resource Files](#dwt-resource-files)

#### [Deploying to Server]()
- KB [Resource Files](#dwt-resource-files)

#### [Upgrading DWT]()
- Standard, npm, and yarn installation
- Cover license key instructions as well
- KB [Licensing](#licensing)

## [References]()

### [Knowledge Base]()
- Knowledge base articles that are not guides
- Supplementary information for guides
- Alternatively: Reference Guide, References

#### [Platform Support]()
- Supported operating systems, web frameworks, environments, drivers, etc.

#### [DWT Resource Files]()
- Use content from resource file FAQ

#### [DWT Initialization]()
- Details about runtime behavior
- Rename, too similar to name of guide

#### [The Dynamsoft Service]()
- May need to talk about the whole data flow behind DWT here
- Link to TWAIN specification for further reading
    ##### [The `FileUploader`]()
    - High performance file uploading through the Dynamsoft Service
    ##### [Enhanced Mode]()
    - Should mention/contrast against Service mode (typical behavior)

#### [The `WebTwain` Object]()
- Describe its relationship with the Dynamsoft Service
    ##### [The `WebTwain` `Viewer`]()
    - General UI behavior, could be put under `WebTwain`

#### [Imaging Devices]()
- Describe device acquisition, connection to the Dynamsoft Service, device driver, device interface, etc.

#### [Image Manipulation]()
- Includes image editing, markup, colors, compression, etc.
- Alternative: The Image Buffer
- Probably unnecessary because very little content not covered by guides and API reference

#### [Data Handling]()
- Current content of "File Types" in introduction
- May be split into inbound data, outbound data, buffered data, and cached data

#### [Networking Features]()
- Connection between server and web app, web app and dynamsoft service, dynamsoft service and data sources, dynamsoft service and server

#### [Licensing]()
- In-depth explanation of license types and behaviors

### [API Reference]()
- May need to **slightly** tweak sub-heading organization
- Considering moving under Knowledge Base
- Not sure if sub-headings should be pre-expanded, may be too crowded

### [FAQ]()
- Have a drop down menu with all the subsections visible first heading to the FAQ page

## Additional notes

- Certain FAQ articles contain novel info, and are used frequently enough that they should be their own guides outright, so they will be moved in to basic or advanced guides
- Basic Usage and Advanced Usage could be put under a common "User Guide" section, but this may be too much nesting
- Not sure where to put add-on guides - integrated with usage sections or in their own section? May need a knowledge base article dedicated to add-ons
- Group some advanced usage guides together? Particularly FileUploader, Enhanced Mode, Remote Scan, Segmented Upload