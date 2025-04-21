---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title:  How do I know which SDK version I am using?
keywords: Dynamic Web TWAIN, Dynamic Web TWAIN Service, SDK version
breadcrumbText:  How do I know which SDK version I am using?
description:  How do I know which SDK version I am using?
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How do I know which SDK version I am using?


### Introduction

Due to Dynamic Web TWAIN being a long-standing and popular product among enterprises, customers who have integrated Dynamic Web TWAIN may be using various versions. To provide better technical support, customers will need to provide the SDK version number they are using to help support team understand the situation more accurately. This article will outline several methods to assist users in finding the current SDK version they are using.


### Resolution

* Method 1

    > If you are not using NPM to manage Dynamic Web TWAIN resources, you can try to find and open the "**dynamsoft.webtwain.config.js**" file in your project. At the very top of the file, you can see the version number noted by Dynamsoft in the comments.
    <br>
    ![config_comment](/assets/imgs/config-comment.png)
    
    > If you are using NPM to manage Dynamic Web TWAIN resources, you can try to find and open the "**dynamsoft.webtwain.min.js**" file in your project. At the very top of the file, you can see the version number noted by Dynamsoft in the comments.
    <br>
    ![min_comment](/assets/imgs/min-comment.png)

* Method 2
    > For versions 17.0 and above, you can retrieve the current SDK version by running the code "`Dynamsoft.DWT.JSVersion`".

    > For versions prior to 17.0, you can obtain the current SDK version by executing the code "`Dynamosft.WebTwainEnv.JSVersion`"

* Method 3
    > Let's take Windows as a example, to find the version of Dynamic Web TWAIN Service (also called "Dynamsoft Service") on Windows, you can follow these steps:

    > 1. Open the Control Panel.
    > 2. In the Control Panel, click on the "Uninstall a Program" option.
    > 3. Look for "Dynamic Web TWAIN Service" in the list of installed programs.
    > 4. The version of Dynamic Web TWAIN Service should be displayed in the program list.
    <br>
    ![panel](/assets/imgs/panel.png)

If you need further assistance, please contact [Dynamsoft Support](https://www.dynamsoft.com/contact/).
