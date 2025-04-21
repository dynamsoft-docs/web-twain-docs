---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How to debug on Dynamic Web TWAIN online demo?
keywords: Dynamic Web TWAIN, Error Troubleshooting, debug, online demo
breadcrumbText: How to debug on Dynamic Web TWAIN online demo?
description: How to debug on Dynamic Web TWAIN online demo?
---

# Error Troubleshooting

## How to debug on Dynamic Web TWAIN online demo?

With the widespread application of the Dynamic Web TWAIN SDK in the market, more and more developers need an effective way to debug. Dynamsoft provides an official demo that enables developers to verify online whether their scanners and code can function properly. This article introduces how to utilize the browser developer tools to test the code through the Dynamic Web TWAIN online demo.

**Step 1:**

Visit Dynamic Web TWAIN Online Demo: [https://demo.dynamsoft.com/web-twain/](https://demo.dynamsoft.com/web-twain/)

**Step 2:**

Given that the demo is presented via the iframe element, to acquire the WebTwain instance, you need to make the following configurations.

![image1](/assets/imgs/debug_on_online_demo.png)

As an alternative, you can straightforwardly call the `top[0].DWTObject`.

**Step 3:**

You've now obtained the WebTwain instance.

![image2](/assets/imgs/get_dwtobject_instance.png)

And you can test the API as much as you want. Let's take the [ConvertToBase64](https://www.dynamsoft.com/web-twain/docs/info/api/WebTwain_IO.html#converttobase64) as an example. After you input the code into the console and press Enter to run this code snippet, it will convert the image at index 0 in the buffer (that is, the first image) into a Base64 string.

![image3](/assets/imgs/console_code_test.png)

Now that you've had the opportunity to preview how the DWT API operates in the web application, you can explore more features by reviewing the [API documentation]({{site.info}}api/). 