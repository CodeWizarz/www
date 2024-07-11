---
layout: sec_direction
title: "Category Direction - API Security"
description: "API Security is focused on securing APIs through DAST API scanning and API fuzz testing."
canonical_path: "/direction/secure/dynamic-analysis/api-security/"
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

Thank you for visiting this category direction page on API Security Testing at GitLab. This page belongs to the Dynamic Analysis group of the Secure stage and is maintained by [Sara Meadzinger](https://gitlab.com/smeadzinger).

This direction page is a work in progress and everyone can contribute:

 - Please comment and contribute in the linked [issues](https://gitlab.com/gitlab-org/gitlab/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AAPI%20Security) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email or on a video call. If you're a GitLab user and have direct knowledge of your need for API Security, we'd especially love to hear from you.

### Overview

API Security is a broad category that incorporates everything from API discovery and management to DAST API and API fuzz testing to active API defense. GitLab's initial focus in API Security will be on DAST API scanning and API fuzz testing. As the category matures, we will explore expanding into API discovery and management and active API defense.

> GitLab was recently named as a [Challenger in the 2022 Magic Quadrant for Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/).

API Security currently supports REST, GraphQL, and SOAP APIs.

As API security has historically been the domain of security teams, rather than developers, testing the API in its running state often is overlooked during the development process. Since this type of testing requires an application to be deployed, the attack surface of the running application is usually not evaluated until the application has passed through the development cycle and is deployed to a staging server (or worse, to production!). Testing this late in the SDLC means that developers have little to no time to respond to any vulnerabilities that are found and trade-offs must be made between fixing vulnerabilities and releasing on time. This can lead to vulnerabilities being released into production either as a calculated risk or with no knowledge of the vulnerability at all. 

We see API security testing as an ideal collaboration point between established security teams and developers, leading to finding and fixing vulnerabilities earlier in the SDLC and reducing the number of vulnerabilities released to production. By integrating API security into their pipelines and leveraging review apps to dynamically test applications, developers can be more conscious of the security impact of their code on the running application. This awareness enables them to take the initiative to fix these issues before merging features into the default branch. Similarly, the security team member can take a proactive, rather than reactive, approach to security by reviewing pipeline results or running on-demand scans and creating issues for any vulnerability found earlier in the SDLC. All of this allows these teams to work together to reduce the overall risk of deploying new code to a production application.

### Goal

Our goal is to provide API Security scanning as part of the standard development process. This means that API security is executed every time a new review app is available or a build is deployed to a server. 

Since API Security requires a running application, we can provide results for feature branches leveraging [Review Apps](https://docs.gitlab.com/ee/ci/review_apps/), temporary environments that run the modified version of the application. We can also provide results for applications running on other servers, such as staging or development environments, either through a CI/CD pipeline scan or a manually-triggered on-demand scan.

API Security results can be consumed in the merge request, where new vulnerabilities are shown. A full report is available in the pipeline details page.

API Security results are also a part of the [Security Dashboard](https://docs.gitlab.com/ee/user/application_security/security_dashboard/), where Security Teams can check the security status of their projects.

We also want to ensure that the production environment is always secure by allowing users to run an on-demand API Security scan on a deployed app even if there is no change in the code. On-demand scans will allow for out-of-band security testing and issue reproduction, without needing any code changes or merge requests to start a scan.

### Roadmap

- [API Security scanner for DAST](https://gitlab.com/groups/gitlab-org/-/epics/4254)
- [API Discovery](https://gitlab.com/groups/gitlab-org/-/epics/7539)
  - [Java Spring Boot Rest API Discovery](https://gitlab.com/gitlab-org/gitlab/-/issues/362659)
- [API Security gRPC support](https://gitlab.com/gitlab-org/gitlab/-/issues/244492)
- [API Security support for dotenv based dynamic environments](https://gitlab.com/gitlab-org/gitlab/-/issues/247641)
- [API Security x-request-id header](https://gitlab.com/gitlab-org/gitlab/-/issues/329722)
- [API Security parameter dependency generation](https://gitlab.com/gitlab-org/gitlab/-/issues/368627)
- [API Security sample data generation for XML](https://gitlab.com/gitlab-org/gitlab/-/issues/320842)
- [API Security Authentication improvements](https://gitlab.com/groups/gitlab-org/-/epics/3932)

## What's Next & Why

We are integrating the Peach API Security scanner into DAST to give us an immediate and major improvement in DAST API scanning coverage, configuration, and confidence. As soon as the API Security scanner is integrated, we will gain capabilities that will increase the number and type of APIs that we are able to scan. The new scanner allows for specifying API endpoints via Postman collections and HAR files, adding onto the OpenAPI specification we support currently. It also gives access to scan GraphQL and SOAP APIs, rather than being limited to REST APIs. Improved authentication support for more authentication methods is another major improvement that we will gain with the integration of the new scnner. This scanner was released as a beta feature in GitLab 14.1 and we are actively working on issues to release it as a GA feature.
- [API Security scanner for DAST](https://gitlab.com/groups/gitlab-org/-/epics/4254)

Moving past the GA of the API Security scanner, we want to address one of the biggest pain points in getting started with API Security testing - the lack of proper API specifications or definitions. While many organizations recognize the need to scan their APIs for security vulnerabilities, they often don't have a full API specification or definition (or any specification or definition at all) that they can use to configure the test. Since APIs cannot be discovered by crawling it in the same way you'd crawl a web application, API testing has to start (at a minimum) with an input of which API endpoints are available. Even better is being able to tell the test what methods the endpoint accepts and having example data to seed the test inputs. Currently, our API Security tests accept multiple inputs to help define the API that needs to be tested. OpenAPI specifications, Postman collections, and HAR files all provide the basis on which our tests are run. However, with our current capabilities, you need to provide those to the test yourself, rather than relying on a feature in GitLab to generate them. We want to be able to use the source code that is housed in GitLab to automatically build a specification as a step during the build process. This would be a separate job within a pipeline that output the specification as an artifact. After the artifact is available, it could be used to automatically configure an API scan, rather than relying on you manually adding the spec yourself. As the first step, we are going to focus on Java Spring Boot projects and automatically building REST API specifications for these projects.
- [API Discovery](https://gitlab.com/groups/gitlab-org/-/epics/7539)
  - [Java Spring Boot Rest API Discovery](https://gitlab.com/gitlab-org/gitlab/-/issues/362659)
  - [Automated OpenAPI specification generation](https://gitlab.com/gitlab-org/gitlab/-/issues/213552)

## Competitive Landscape

- [Synopsys](https://www.synopsys.com/software-integrity/security-testing/api-security-testing.html)
- [Netsparker](https://www.netsparker.com/)
- [StackHawk](https://www.stackhawk.com/)
- [Salt Security](https://salt.security/)
- [Imperva](https://www.imperva.com/products/api-security/)
- [Mulesoft](https://www.mulesoft.com/platform/enterprise-integration)

We have an advantage of being able to provide testing results before the app is deployed into the production environment, by using Review Apps. This means that we can provide API security scan results for every single commit. The easy integration of API security scanning early in the software development life cycle is a unique position that GitLab has in the API Security market. Integrating other tools at this stage of the SDLC is typically difficult, at best.

## Analyst Landscape

We want to engage analysts to make them aware of the security features already available in GitLab. They also perform analysis of vendors in the space and have an eye on the future. We will blend analyst insights with what we hear from our customers, prospects, and the larger market as a whole to ensure we’re adapting as the landscape evolves. 

* [2022 Gartner Magic Quadrant: Application Security Testing](https://about.gitlab.com/analysts/gartner-ast22/)
* [Gartner Application Security Testing Reviews](https://www.gartner.com/reviews/market/application-security-testing)
* [2019 Forester State of Application Security](https://www.forrester.com/report/The+State+Of+Application+Security+2019/-/E-RES145135)

## Top Vision Item(s)

- [API Security scanner for DAST](https://gitlab.com/groups/gitlab-org/-/epics/4254)
