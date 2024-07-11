---
layout: sec_direction
title: "Category Direction - Dynamic Application Security Testing"
description: "Dynamic application security testing (DAST) is a process of testing an application or software product in an operating state. Learn more here!"
canonical_path: "/direction/secure/dynamic-analysis/dast/"
---

- TOC
{:toc}
## Secure

| | |
| --- | --- |
| Stage | [Secure](/direction/secure/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-07-18` |

## Description
### Introduction and how you can help

Thank you for visiting this category direction page on Dynamic Application Security Testing (DAST) at GitLab. This page belongs to the Dynamic Analysis group of the Secure stage and is maintained by [Sara Meadzinger](https://gitlab.com/smeadzinger).

This direction page is a work in progress and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ADAST) and [epics](https://gitlab.com/groups/gitlab-org/-/epics/2912) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email or on a video call. If you're a GitLab user and have direct knowledge of your need for DAST, we'd especially love to hear from you.

### Overview

Dynamic application security testing (DAST) is a process of testing an application or software product in an operating state. 

> GitLab was recently named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).

When an application has been deployed and started, DAST connects to the published service via its standard web port and performs a scan of the entire application. It can enumerate pages and verify if well-known attack techniques, like cross-site scripts or SQL injections are possible. DAST will also scan REST APIs using an OpenAPI specification as a guide for testing the API endpoints.

DAST doesn't need to be language specific, since the tool emulates a web client interacting with the application, as an end user would.

As DAST has historically been the domain of security teams, rather than developers, testing the application in its running state has often been overlooked during the development process. Since this type of testing requires an application to be deployed, the attack surface of the running application is usually not evaluated until the application has finished the development cycle and is deployed to a staging server (or worse, to production!). Testing this late in the SDLC means that developers have little to no time to respond to any vulnerabilities are found and trade-offs must be made between fixing vulnerabilities and releasing on time. This can lead to vulnerabilities being released into production either as a calculated risk or with no knowledge of the vulnerability at all. 

We see the area of dynamic application security testing as an ideal collaboration point between established security teams and developers, leading to finding and fixing vulnerabilities earlier in the SDLC and reducing the number of vulnerabilities released to production. By integrating DAST into their pipelines and utilizing review apps, developers can be more conscious of the security impacts their code has on the running application. This awareness can enable them to take initiative and fix these before merging their features into the default branch. For the security team member, being able to create issues for any vulnerability found earlier in the SDLC (either by reviewing pipeline results or running on-demand scans) allows them to take a proactive approach to security, rather than reactive. All of this allows these teams to work together to reduce the overall risk of deploying new code to a production application.

### Goal

Our goal is to provide DAST as part of the standard development process. This means that DAST is executed every time a new commit is pushed to a branch. We also include DAST as part of [Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/).

Since DAST requires a running application, we can provide results for feature branches leveraging [Review Apps](https://docs.gitlab.com/ee/ci/review_apps/), temporary environments that run the modified version of the application. We can also provide results for applications running on other servers, such as staging or development environments, either through a CI/CD pipeline scan or a manually triggered on-demand scan.

DAST results can be consumed in the merge request, where new vulnerabilities are shown. A full report is available in the pipeline details page.

DAST results are also a part of the [Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/), where Security Teams can check the security status of their projects.

We also want to ensure that the production environment is always secure by allowing users to run an on-demand DAST scan on a deployed app even if there is no change in the code. On-demand scans will allow for out-of-band security testing and issue reproduction, without needing any code changes or merge requests to start a scan.

### Roadmap

- [On-demand DAST improvements](https://gitlab.com/groups/gitlab-org/-/epics/6778)
  - [Runner tags for on-demand tests](https://gitlab.com/gitlab-org/gitlab/-/issues/345430)
- [DAST Pre-flight validation](https://gitlab.com/groups/gitlab-org/-/epics/7069)
- [Browser-based scanner for DAST](https://gitlab.com/groups/gitlab-org/-/epics/4248)
  - [Browser-based passive vulnerability checks](https://gitlab.com/groups/gitlab-org/-/epics/5779)
  - [Browser-based active vulnerability checks](https://gitlab.com/groups/gitlab-org/-/epics/5780)


## What's Next & Why

### Browser-based DAST

Looking at traditional DAST scanning, it is almost always accomplished using a proxy that analyzes HTTP responses and injects code into HTTP requests. Because of where the DAST analyzer sits within the test setup, it is usually very difficult (if not impossible) to accurately and adequately test applications that have been written with modern JavaScript framework. Among all the apps that fall into this category, single-page applications are particularly susceptible to this problem and have caused a lot of headaches for a lot of DAST testers.

After evaluating these problems, we have begun to integrate a new browser-based scanner into the DAST analyzer. At this time, the browser-based scanner is in beta and includes browser-based crawling capabilities as well as scanning for passive vulnerabilities. We are currently working to expand the browser-based features to include active vulnerability scanning. This new browser-based crawler and scanner will provide significantly expanded application coverage for modern web applications, especially where single-page and JavaScript-heavy applications are concerned. Rather than approaching applications only from a proxy perspective, as most existing DAST scanners do, we will be able to work with modern apps in their native environment - the browser. By viewing web applications as complex JavaScript applications, rather than legacy HTML apps, we will be able to find and test more pages, forms, and permutations of the application than a traditional, proxy-only DAST scanner.

As a part of the beta, we will deliver new features on a regular basis. During the passive vulnerability check phase of the project, we were delivering ~2-3 passive checks in each GitLab release. Currently, the focus is on building up the active vulnerability checks. Since these checks actively run malicious code against an application to determine whether it is vulnerable or not, they tend to be much more involved and difficult to implement. While our progress may be slower than with the passive vulnerability checks, we will still deliver new checks on a regular basis. As each check is finished, it will be integrated into the beta, so that any scan run with the browser-based scanner will automatically use the new browser-based checks. Any checks that are not yet implemented in the browser-based scanner will continue to run in the legacy proxy-based scanner until they are finished and moved into the new scanner.

#### Browser-based DAST Principles
Browser-based DAST inherits GitLab's [product principles](https://about.gitlab.com/handbook/product/product-principles/#our-product-principles) and builds on them.

  - *Too many false positives distract from true positives* - A product that provides too many false positives trains users to ignore results. Aim to under report in favor of accuracy as opposed to over-reporting.

  - *Focus testing for modern vulnerabilities* - Many well-known vulnerabilities have long been patched. The software should focus its testing time looking for modern vulnerabilities instead of testing for vulnerabilities that are unlikely to exist. 

#### Related epics and issues
  - [Browser-based scanner for DAST](https://gitlab.com/groups/gitlab-org/-/epics/4248)
  - [Browser-based passive vulnerability checks](https://gitlab.com/groups/gitlab-org/-/epics/5779)
  - [Browser-based active vulnerability checks](https://gitlab.com/groups/gitlab-org/-/epics/5780)

### Further Roadmap

  - [On-demand DAST improvements](https://gitlab.com/groups/gitlab-org/-/epics/6778)

Now that we have validated our Complete maturity, we will turn our attention to growing the options for the on-demand section. In addition to providing more configuration options and eventually reaching parity with all the possible configuration options provided by using environment variables in the `.gitlab-ci.yml` file, we will also be looking at ways to enable more scan types to use on-demand features. Our goal is that on-demand provide a fully feature alternate to CI/CD scans for users who want an easy, graphical way to enable scans, separate from MRs and code changes. By expanding these options, we hope to provide better opportunities for the integration of security teams with development teams, by allowing security teams autonomy to run scans outside of pipelines.

  - [DAST pre-flight validation](https://gitlab.com/groups/gitlab-org/-/epics/7069)

Configuration validation can be very difficult with DAST, especially when authentication is in the picture. We want to make it easier to validate and debug your DAST config before ever starting a test. We plan to run a short test to make sure that we can connect to your application, log in, crawl a few pages, and not run into any issues. If we do run into any problems, we'll report back with debug files to help determine what the problem is and how you can fix it. This will be an optional step, but will be very useful for anyone whose application might have some peculiarities or uncommon features.

## Maturity Plan
 - [Complete to Lovable](https://gitlab.com/groups/gitlab-org/-/epics/3207)

## Competitive Landscape

- [CA Veracode](https://www.veracode.com/products/dynamic-analysis-dast)
- [Microfocus Fortify WebInspect](https://software.microfocus.com/en-us/products/webinspect-dynamic-analysis-dast/overview)
- [IBM AppScan](https://www.ibm.com/security/application-security/appscan)
- [Rapid7 AppSpider](https://www.rapid7.com/products/appspider)
- [Detectify](https://detectify.com/)

We have an advantage of being able to provide testing results before the app is deployed into the production environment, by using Review Apps. This means that we can provide DAST results for every single commit. The easy integration of DAST early in the software development life cycle is a unique position that GitLab has in the DAST market. Integrating other tools at this stage of the SDLC is typically difficult, at best.

## Analyst Landscape

We want to engage analysts to make them aware of the security features already available in GitLab. They also perform analysis of vendors in the space and have an eye on the future. We will blend analyst insights with what we hear from our customers, prospects, and the larger market as a whole to ensure we’re adapting as the landscape evolves. 

* [2022 Gartner Magic Quadrant: Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/)
* [Gartner Application Security Testing Reviews](https://www.gartner.com/reviews/market/application-security-testing)
* [2019 Forester State of Application Security](https://www.forrester.com/report/The+State+Of+Application+Security+2019/-/E-RES145135)

## Top Customer Success/Sales Issue(s)

- [Full list of DAST issues with the "customer" label](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=customer&label_name[]=Category%3ADAST)

## Top user issue(s)

- [Full list of DAST issues](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ADAST)

## Top internal customer issue(s)

- [Full list of DAST issues with the "internal customer" label](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3ADAST&label_name[]=internal%20customer)

## Top Vision Item(s)

- [Browser-based scanner for DAST](https://gitlab.com/groups/gitlab-org/-/epics/4248)
- [Scheduled on-demand DAST scans](https://gitlab.com/groups/gitlab-org/-/epics/4876)
