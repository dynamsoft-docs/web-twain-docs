---
layout: default-layout
needAutoGenerateSidebar: true
noTitleIndex: true
title: Dynamic Web TWAIN SDK License
keywords: Dynamic Web TWAIN, Documentation, License
breadcrumbText: License
description: Dynamic Web TWAIN SDK Documentation License Page
permalink: /general-usage/license.html
redirect_from:
   - /about/license.html
---

# License

## Trial License

### Request trial license

You can request a trial license of Dynamic Web TWAIN via our <a href="https://www.dynamsoft.com/customer/license/trialLicense?product=dwt" target="_blank">customer portal</a> or [contacting support](https://www.dynamsoft.com/company/contact/).

### Update trial license

You can set the new key via the `ProductKey` API.

1. Open `dynamsoft.webtwain.config.js` from your local project or search `ProductKey` to locate the code for license setting.

2. Update `ProductKey` in the code.

   ```javascript
   Dynamsoft.DWT.ProductKey = 't0076lQAAAGNcO61He******'; // update the ProductKey with yours
   ```

3. Refresh your scan page and try again.

## Full license

You can find all the full licenses you own via our <a href="https://www.dynamsoft.com/customer/license/fullLicense" target="_blank">customer portal</a>.

Depending on the type of full license you are using, you can add/update the full license via the `ProductKey` API (available for Dynamic Web TWAIN v17.0+).

### Update ProductKey

If you are using a **ProductKey**, you can search `ProductKey` to locate the code for license setting which resides in the `dynamsoft.webtwain.config.js` file for most cases.

``` javascript
Dynamsoft.DWT.ProductKey = 't0076lQAAAGNcO61He******'; // update the ProductKey with yours
```

If you have multiple license keys, separate them with semicolons like below:

``` javascript
Dynamsoft.DWT.ProductKey = 't0076lQAAAGNcO61He******;t0076lQAAAGNcO61He******';
```

## License Agreement

View the <a href="https://www.dynamsoft.com/Products/WebTwain_license.aspx" target="_blank">Dynamic Web TWAIN License Agreement</a>.
