---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How can I change the certificate of the Dynamic Web TWAIN Service?
keywords: Dynamic Web TWAIN, Security, change certificate, service
breadcrumbText: How can I change the certificate of the Dynamic Web TWAIN Service?
description: How can I change the certificate of the Dynamic Web TWAIN Service?
---

# Security

## How can I change the certificate of the Dynamic Web TWAIN Service?

To replace the default certificate, the steps are:

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

- Generate a certificate for `127.0.0.1`
- Install that certificate
- Use that certificate to generate public /private keys (pem)
- Rename these two keys to `server.pem` (public) and `server_key.pem` (private)
- Replace the old keys in `C:\Program Files (x86)\Dynamsoft\Dynamic Web TWAIN Service {version number}\cert`
- Restart the service

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

- Generate a certificate for `127.0.0.1`
- Install that certificate
- Use that certificate to generate public /private keys (pem)
- Rename these two keys to `server.pem` (public) and `server_key.pem` (private)
- Replace the old keys in `C:\Windows\SysWOW64\Dynamsoft\DynamsoftServicex64_{version number}\cert`
- Restart the service

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>