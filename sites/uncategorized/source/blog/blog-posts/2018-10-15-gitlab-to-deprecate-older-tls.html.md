---
title: "GitLab to deprecate support for TLS 1.0 and TLS 1.1 by end of 2018"
author: Melissa Farber
author_gitlab: mfarber
description: Support for TLS 1.0 and 1.1 will be disabled on December 15th, 2018
categories: company
image_title: '/images/default-blog-image.png'
tags: security
---

We are focused on improving our security posture at GitLab and are always working to evolve our security processes. Part of that evolution is the incorporation of stronger cryptographic standards into our environment, and the deprecation of those that have been rendered out-dated or proven to be prone-to-attacks. In an effort to continue to raise that bar, we are announcing our plan to discontinue support for Transport Layer Security (TLS) 1.0 and 1.1 on GitLab.com and in our GitLab API by December 15, 2018. To that end, we have published this [public issue](https://gitlab.com/gitlab-com/security/issues/202) that will be used to track progress of this initiative and provide updates to the GitLab community.

Currently, GitLab.com supports TLS 1.0 and TLS 1.1. There have been many serious security issues reported with TLS 1.0 and TLS 1.1, including but not limited to [Heartbleed](http://heartbleed.com/).

In addition, from a security compliance standpoint, the Payment Card Industry (PCI) DSS 3.1 standard mandates the migration away from these weaker cryptographic standards. This mandate is to exclude Secure Sockets Layer (SSL) 3.0, TLS 1.0, and some ciphers supported by TLS 1.1 from protocols supporting strong cryptography.
Our intent in making this announcement and creating the [public issue](https://gitlab.com/gitlab-com/security/issues/202) is to minimize any potential operational disruptions to GitLab.com customers while deprecating TLS 1.0 and TLS 1.1. This post is the first of three that we will publish during this interim period prior to disabling support for TLS 1.0 and 1.1 on December 15th, 2018.
As always, we will continue to monitor TLS 1.0 and 1.1 vulnerabilities and will adapt our timeline as required to mitigate protocol-level issues if they arise.  In addition to the monthly blog posts on the status of this initiative, updates to timelines will be posted to our Twitter feed and tracked in [public issues](https://gitlab.com/gitlab-com/security/issues/202). Additionally, GitLab.com users who have opted to receive [security alert emails](/company/preference-center/) from GitLab will receive status updates regarding the this deprecation process.

If you have any questions, please reach out to the Security team by emailing security@gitlab.com

## Identified client incompatibilities

The majority of traffic should be unaffected by the deprecation of support for versions 1.0 and 1.1. Currently, the nof requests to GitLab.com are using up-to-date clients with support for TLS1.2. Whereas there are a few remaining clients that we believe will be affected (see below) most of these can be updated to work with TLS 1.2.

### Git-Credential-Manager-for-Windows prior to 1.14.0
Versions prior to 1.14.0 of Git-Credential-Manager-for-Windows do not support TLSv1.2. This can be addressed by updating to v1.14.0.    

### Git on Red Hat 5, < 6.8, and < 7.2
Users running Red Hat 5 are advised to upgrade to a newer version of the operating system as Red Hat does not have a point release planned for 5 that supports TLS 1.2. Git clients shipped with Red Hat 6 and 7 did not support TLSv1.2, which can be remediated by updating to versions 6.8 and 7.2 respectively.

### JGit / Java releases < JDK 8
Versions of the JDK 6 and prior do not support TLSv1.2. We advise users of JDK <= 6 to upgrade to a newer version of the JDK.

### Visual Studio
The latest version of Visual Studio 2017 supports TLSv1.2. Users not running the latest version are advised to upgrade.