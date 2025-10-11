---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I change the certificate of the Dynamic Web TWAIN Service?
keywords: Dynamic Web TWAIN, Security, change certificate, service
breadcrumbText: How can I change the certificate of the Dynamic Web TWAIN Service?
description: How can I change the certificate of the Dynamic Web TWAIN Service?
date: 2021-11-29 18:33:59 +0800
last_modified: 2025-10-11 15:56:45 +0800
---

# Security

## How can I change the certificate of the Dynamic Web TWAIN Service?

To replace the default certificate, the steps are:

- Generate a certificate for `127.0.0.1` with an RSA private key
- Rename the certificate to `server.pem` and the private key to `server_key.pem`
- Replace the old keys in the `cert` folder in the [service's installation folder](/_articles/extended-usage/dynamsoft-service-configuration.md#installation-folder)
- Restart the service

You can also pack the two files into a zip file and use the [configuration page](/_articles/extended-usage/dynamsoft-service-configuration.md#web-setup) to update.

## Appendix

### How to Generate the Certificate with acme.sh?

Run the following command to apply for an SSL certificate.

```bash
acme.sh --issue -d <your-domain> --keylength 2048
```

Then, you can find the certificate named `fullchain.cer` and the private key named `your-domain.key` in the output folder.

### What are the Files in the cert Folder

* default keys
  * server.pem
  * server_key.pem
* keys for [local.dynamsoft.com](/_articles/faq/failed-to-load-resource.md) (encrypted)
  * server.pem.ldsc
  * server_key.pem.ldsc
* keys for [Remote Scan](https://www.dynamsoft.com/remote-scan/docs/introduction/)'s proxy server after installation (encrypted)
  * server.pem.ldwtc
  * server_key.pem.ldwtc

