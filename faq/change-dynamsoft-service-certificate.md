---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I change the certificate of the Dynamsoft Service?
keywords: Dynamic Web TWAIN, Security, change certificate, service
breadcrumbText: How can I change the certificate of the Dynamsoft Service?
description: How can I change the certificate of the Dynamsoft Service?
permalink: /faq/change-dynamsoft-service-certificate.html
---

# Security

## How can I change the certificate of the Dynamsoft Service?

To replace the default certificate, the steps are:

- Generate a certificate for `127.0.0.1`
- Install that certificate
- Use that certificate to generate public /private keys (pem)
- Rename these two keys to `server.pem` (public) and `server_key.pem` (private)
- Replace the old keys in `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{versionnumber}\cert`
- Restart the service

<!-- NOTE: For v17.2 or higher versions, you can use the new API <a href="{{site.info}}api/Dynamsoft_WebTwainEnv.html#updatecert" target="_blank">UpdateCert</a> to automatically update the client side certificate. -->
