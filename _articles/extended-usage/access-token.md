---
layout: default-layout
needAutoGenerateSidebar: true
title: Dynamic Web TWAIN SDK Guide - Access Token
keywords: Dynamic Web TWAIN, Documentation, Deployment, Dynamic Web TWAIN Service, access token
description: "How to set up an access token to control the use of Dynamic Web TWAIN's APIs, including the REST API."
---

# Access Token

You can enable access token to avoid the APIs of Dynamic Web TWAIN Service being called by unknown applications for better security.

It can control the access via the JavaScript library and the REST APIs. Currently, only Windows is supported.

## How to Use

1. Configure the service to enable token validation. Open CMD as administrator to run the following command.

   1. Set a password for the service, which is required to enable token validation.

      ```
      "C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service 19\DynamicWebTWAINService.exe" Config --init 
      ```

   2. Enable token validation.

      ```
      "C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service 19\DynamicWebTWAINService.exe" Config global.token_policy required
      ```

   3. Restart the service to make the changes effective.

2. Generate a token for the client to use. You can define its expiry duration. By default, the token never expires. Restart the service to make the changes effective.

   ```
   "C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service 19\DynamicWebTWAINService.exe" Config --create-token "{\"duration\":864000}" 
   ```

3. Use the token.

   * Using the JavaScript library, you need to set `Dynamsoft.DWT.Token` with the token you just generated.
   * Using the REST API, you need to set the header to use the token.

      ```js
      const myHeaders = new Headers();        
      myHeaders.append("Authorization", "Bearer " + accessToken); 
      const response = await fetch(url, {"method":"GET",  headers: myHeaders});
      ```

## Disable Password and Token Validation
     
Open `DSConfiguration.ini` under the service's installation folder and delete "Auth=XXX". Then restart the service.

## Change Password

Run the following to change the password.

```
"C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service 19\DynamicWebTWAINService.exe" Config --change-password
```

## Access to the Configuration Page

When the password is enabled, you need to enter the password to access <https://127.0.0.1:18623/>.






