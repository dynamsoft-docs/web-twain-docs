---
layout: default-layout
noTitleIndex: true
needAutoGenerateSidebar: true
title: In which cases would I use local.dynamsoft.com instead of 127.0.0.1?
keywords: Dynamic Web TWAIN, CERT INVALID, local.dynamsoft.com
breadcrumbText: In which cases would I use local.dynamsoft.com instead of 127.0.0.1?
description: In which cases would I use local.dynamsoft.com instead of 127.0.0.1?
---

View all FAQs about [Project Deployment and End-user Installation](
https://www.dynamsoft.com/web-twain/docs/faq/#project-deployment-and-end-user-installation)

# In which cases would I use local.dynamsoft.com instead of 127.0.0.1?

By default, we use "127.0.0.1" for service connection. **127.0.0.1** uses a self-signed certificate because it is an internal IP address, if your environment requires high level security, self-signed certificates may not be accepted. In this case we also provide a 3rd party authority issued certificate - **local.dynamsoft.com**, as an official domain which uses a VeriSign'ed certificate.  

Please note: all official certificates issued by 3rd party **come with an expiry date** - generally one year. This means that each year the certificate will need to be updated if local.dynamsoft.com is used.

