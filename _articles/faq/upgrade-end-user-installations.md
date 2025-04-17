---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: How do I upgrade the end-user installation for all end users once I upgrade my project?
keywords: Dynamic Web TWAIN, Project Deployment and End-user Installation, upgrade
breadcrumbText: How do I upgrade the end-user installation for all end users once I upgrade my project?
description: How do I upgrade the end-user installation for all end users once I upgrade my project?
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# How do I upgrade the end-user installation for all end users once I upgrade my project?

By default once your application with the upgraded version has been deployed, end-users will be prompted to install the newer version of the Dynamic Web TWAIN Service (also called "Dynamsoft Service").

In a controlled environment Dynamic Web TWAIN can be distributed to all clients in one go just like other similar programs. <a href="https://docs.microsoft.com/en-us/troubleshoot/windows-server/group-policy/use-group-policy-to-install-software" target="_blank">Group Policy</a> is one such technology.

You can install Dynamic Web TWAIN Service silently using the following commands:

<div class="multi-panel-switching-prefix"></div>

- [v19.0+](#19plus)
- [Versions below 19.0](#19min)

<div class="multi-panel-start"></div>

- Windows

```javascript
msiexec /i "/path/to/DynamicWebTWAINServiceSetup.msi" /qn

```

- macOS

```javascript
// Install
sudo installer -pkg /path/to/DynamicWebTWAINServiceSetup.pkg -target /Applications
// Stop service
sudo launchctl unload /Library/LaunchAgents/com.dynamsoft.dynamicwebtwainservicex64.plist
// Start service
launchctl load /Library/LaunchAgents/com.dynamsoft.dynamicwebtwainservicex64.plist

```

• Linux

```javascript
sudo dpkg -i /path/to/DynamicWebTWAINServiceSetup.deb

// or

sudo rpm -i path/to/DynamicWebTWAINServiceSetup.rpm
```

<div class="multi-panel-end"></div>

<div class="multi-panel-start"></div>

- Windows

```javascript
msiexec /i "/path/to/DynamsoftServiceSetup.msi" /qn

```

- macOS

```javascript
// Install
sudo installer -pkg /path/to/DynamsoftServiceSetup.pkg -target /Applications
// Stop service
sudo launchctl unload /Library/LaunchAgents/com.dynamsoft.dynamsoftservicex64.plist
// Start service
launchctl load /Library/LaunchAgents/com.dynamsoft.dynamsoftservicex64.plist

```

• Linux

```javascript
sudo dpkg -i /path/to/DynamsoftServiceSetup.deb

// or

sudo rpm -i path/to/DynamsoftServiceSetup.rpm
```

<div class="multi-panel-end"></div>

<div class="multi-panel-switching-end"></div>

> Note - If you are upgrading from version 14, end-users may need to uninstall the previous version manually before reinstallation.
