---
title: "Introducing GitLab’s supply chain security direction and landscape"
author: Sam White
author_gitlab: sam.white
categories: company
image_title: '/images/blogimages/GitLab-Sec.png'
description: "Learn about software supply chain security at GitLab."
tags: security, DevOps, features
twitter_text: "Introducing GitLab’s supply chain security direction and landscape." 
featured: yes
postType: product 
---

_This blog post and linked pages contain information related to upcoming products, features, and functionality. It is important to note that the information presented is for informational purposes only. Please do not rely on this information for purchasing or planning purposes. As with all projects, the items mentioned in the blog post and linked pages are subject to change or delay. The development, release, and timing of products, features, or functionality remain at the sole discretion of GitLab, Inc._ 

We would like to introduce you to our software supply chain security [direction](/direction/supply-chain/) and landscape.

An emerging concern in the software development space is being able to document the entire supply chain and development progress by creating a chain of custody starting from code creation, build, test, package, and going through deployment. 

GitLab's software supply chain security (SSCS) vision includes everything needed to securely deliver and run software with a high degree of confidence that not only your software, but also its surrounding cloud-native infrastructure, has not been compromised. 

In the long-term, our strategy is to become a complete provider for all aspects of SSCS. Providing all of these aspects within a single application not only supports GitLab's broader Single Application Strategy but also provides numerous tangible benefits for users.

Among other things, using a single application:

1. Minimizes the number of different tools that need to be hardened and monitored.
1. Reduces the number of potential points of security failure as data is transferred between various tools.
1. Enables seamless interoperability.
1. Simplifies visibility and traceability for audits.

## GitLab SSCS Framework

GitLab has put together a framework describing the various aspects that are required to accomplish this based on feedback from customers and inspiration from common standards (such as [SLSA](https://slsa.dev/)), as well as thought leadership from industry analysts. Please note, however, that this framework is not necessarily representative of any other entity's opinion or perspective on the SSCS space.

We believe that there are five main aspects to consider when providing for a secure, end-to-end software supply chain.

1. **Source** - includes the controls needed to be confident that both internal and external source code is safe from vulnerabilities and has not been compromised in any way.
1. **Build** - includes rigorous requirements for the security and isolation of build environments as well as the automatic generation of provenance.
1. **Consumption** - includes the ability to validate authenticity and source of any executed binaries. Supports requirements for securing the underlying host infrastructure itself.
1. **Management Process** - spans across all other aspects of SSCS and includes both the tools and processes necessary to provide for ongoing visibility into SSCS continuous compliance requirements.
1. **Tool Security** - spans across all other aspects of SSCS and includes the adoption of best practices for managing the security of the underlying tools themselves.

You can learn more about the SSCS framework in our [direction](/direction/supply-chain/).

### GitLab helps keep your software supply chain secure

GitLab has [numerous capabilities that support continuous compliance](/blog/2022/02/09/gitlabs-newest-continuous-compliance-features-bolster-software/) and a secure software supply chain. Our newly released [“Guide to Software Supply Chain Security”](https://page.gitlab.com/resources-ebook-software-supply-chain-security.html) explains the urgency of protecting the supply chain now and also describes how this can be done while using GitLab.

GitLab is a platform that [plays well with others](/handbook/product/gitlab-the-product/#plays-well-with-others) and can work together with other best-in-class security tools to provide complete end-to-end chain of custody throughout the development and deployment process. GitLab's vision is to partner closely with leading technologies in this space to provide an integrated, turnkey experience for end users.

### What’s next

As a single DevOps platform, there are many opportunities to rise to the challenge of creating transparency around software components and artifacts. We welcome feedback on our [current position and vision](/direction/supply-chain/#current-position-and-vision) for the long-term direction of GitLab in SSCS. 

Here are a few of our near-term projects:

- GitLab's [Runner Core](/direction/verify/runner_core/#strategic-priorities---whats-next--why) team will be [analyzing](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/28217) what's required to use solutions like [in-toto](https://in-toto.io/) to generate provenance that aligns with the GitLab Runner architecture.
- Alongside this effort, the [Dependency Scanning Category](/direction/secure/composition-analysis/dependency-scanning/), is pursuing a more robust [vision for SBOM](https://gitlab.com/groups/gitlab-org/-/epics/858).
