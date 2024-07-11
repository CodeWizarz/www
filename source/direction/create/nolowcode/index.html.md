---
layout: markdown_page
title: "Direction - No-Code and Low-Code"
description: This is the direction page for No/Low-Code in GitLab.
canonical_path: "/direction/create/nolowcode/"
---

Last reviewed: 2022-06-15

- TOC
{:toc}

## No-Code and Low-Code

### Introduction and how you can help

This is the direction page for No/Low-Code in GitLab. It is not officially a part of any DevOps stage nor is it an official category. Sarah Waldner, the Group Manager of Product for the Create stage, maintains this page and the vision.

Like most other category direction pages, this page will be continuously updated based on market dynamics, new data points, and customer conversations.

- Please share feedback directly via email, Twitter, or on a video call.

### Overview

<!-- A good description of what your category is today or in the near term. If there are
special considerations for your strategy or how you plan to prioritize, the
description is a great place to include it. Provide enough context that someone unfamiliar
with the details of the category can understand what is being discussed. -->

#### Introduction

GitLab's mission is to build software so that **everyone can contribute**. Most applications are currently written by developers who have backgrounds in popular web application frameworks such as [Ruby on Rails](https://rubyonrails.org/). 

Out of 23.4 million developers worldwide in 2019, IDC said 1.76 million of them are low coders, representing 7.5% of the total. There were also 810,000 no-code developers worldwide last year, according to IDC’s Market Perspective: Low-Code and No-Code Developer Census, 2019: Growth Begins in Earnest report. Gartner, per its 2019 Magic Quadrant for Low-Code Platforms estimates that "by 2024, low-code application development will be responsible for more than 65% of application development activity."

The phrase [citizen developer](https://www.forbes.com/sites/johneverhard/2019/01/22/the-pros-and-cons-of-citizen-development/#43c2cf5b84fd) has begun to surface, indicating an individual without a professional background, who is utilizing Low/No-Code platforms to create applications for customers or internal for business process.

It's important that GitLab is able to serve all application development teams as well as citizen developers as this trend continues to grow and as such, we need to be forward thinking about how to provide a good experience for Low/No-Code developers inside of GitLab.

#### What is Low-Code and No-Code?
Low-Code and No-Code platforms are most commonly defined as platforms that enable individuals to visually code by dragging and dropping pre-written code blocks and connecting them together to create an application. This [article](https://www.outsystems.com/blog/posts/low-code-vs-no-code/) has a fantastic synopsis of the difference between low-code and no-code platforms. There are many differences in how these platform categories, but the primary one is a no code platform doesn't allow coding for augmenting any components, and a low code platform does.

The primary benefit for adopting a low or no-code platform is speed of application delivery as well as the democratization of the application development process. With a low/no-code approach, apps can be built more quickly with less specialized skillsets, which lowers the barrier of entry of development and deployment of the application. In short, more people are able to contribute to application development, whether that's a traditional web app or an internal business process, and they are able to develop faster than before.

Platforms like ServiceNow and Salesforce are also popular because of their low-code capabilities. They often employ visual coding experiences and excellent support for code completion, syntax highlighting, and code hints. In some cases, the low-code functionality is limited to experiences inside of the application. For example, the primary use case for using Salesforce's low-code capabilities is to create applications and/or views inside of Salesforce.

#### Target Audience

**Low-Code:** Target users are professional developers who are primarily looking for efficiency gains but also citizen developers who have a basic knowledge with writing code. Low-code platforms often require coding to introduce pieces of functionality the platform may not have. In low-code platforms some coding is ok, but limits are not.

**No-Code:** Target users are the citizen developers who will not be writing any code and are primarily looking to develop applications per their needs, most commonly internal business process automation. With no-code platforms, you are limited to the capabilities that the platform provides you. In no-code platforms some coding is not ok, but limits are. 

In a sense, no-code platforms can be thought of as a subset of low-code platforms, which is how Gartner has also defined them in their 2019 Magic Quadrant.

#### What's Next & Why

Our immediate next step is to validate our thoughts in this space and speak to some customers to assess what problems could be solved inside of GitLab related to this space.

While we likely aren't ready to pursue any specific features into GitLab yet, we are evaluating several open source low-code tools to include in GitLab in this [epic](https://gitlab.com/groups/gitlab-org/-/epics/2353). We should likely start with a low-code solution that will be targeted to professional developers already using GitLab. Starting with a no-code framework likely won't get us the usage we'd need for rapid feedback in an acceptable time period.

The bulk of low/no-code platforms are proprietary systems such as Salesforce and Appian, so we will need to investigate more if we can integrate with these tools, or build our own based on an open-source product. For example, applications developed for on ServiceNow and Salesforce may need to be deployed or versioned and GitLab would be an excellent complementary solution for these platforms.

There are two workstreams for us to puruse:
1. Integrations - create a great experience for someone using a popular framework today to augment that experience with GitLab. E.g. deploy an app written in ServiceNow using GitLab.
1. Creation of Low-Code Applications - provide a low code experience inside of GitLab. Handle all facets of application creation, providing users with off the shelf components, visual editing with drag and drop capabilties, and extensibility for components we don't provide. Ensure version control happens on top of our git functionality and seamlessly connect to CI/CD, Secure, and Ops capabilities in GitLab.

### Competitive Landscape

<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](https://about.gitlab.com/handbook/product/product-processes/#customer-meetings). We’re not aiming for feature parity with competitors, and we’re not just looking at the features competitors talk
about, but we’re talking with customers about what they actually use, and
ultimately what they need.-->

Per the 2020 Gartner Magic Quadrant for Low-Code, the following vendors made the report:

| Leaders    | Challengers   | Visionaries             | Niche       |
|------------|---------------|-------------------------|-------------|
| Salesforce | Oracle (APEX) | Pega                    | AgilePoint  |
| Microsoft  |               | Zoho                    | Quick base  |
| Outsystems |               | Betty Blocks            | Creatio     |
| Mendix     |               | Oracle (Visual Builder) | Kintone     |
| Appian     |               |                         | Newgen      |
| ServiceNow |               |                         | AuraQuantic |
|            |               |                         | ProntoForms |
|            |               |                         | TrackVia    |

It's important to note that platforms such as Salesforce Lightning are included in the market definition of low-code and these platforms are primarily used for delivering customer-related applications and extensions to other SaaS products.

Additionally, there are several open source low code tools (examples in alphabetic order):

- [Budibase](https://github.com/Budibase/budibase) (14.3k :star:, JavaScript/TypeScript/Svelte, GPLv3)
- [Corteza](https://github.com/cortezaproject/corteza-server) (500 :star:, Go, Apache-2.0)
- [formsflow](https://github.com/AOT-Technologies/forms-flow-ai) (150 :star:, Java/Python, different licenses)
- [Huginn](https://github.com/huginn/huginn) (29.6k :star:, Ruby, MIT license)
- [Nodered](https://nodered.org/) (10.7k :star:, Node.js:, Apache 2.0)
- [n8n.io](https://n8n.io/) (9.7k :star: Node.js based, Apache plus Commons Cause)

On June 29, 2021, [GitHub announced the Technical Preview](https://github.blog/2021-06-29-introducing-github-copilot-ai-pair-programmer/) of [GitHub Copilot](https://copilot.github.com/) which has mostly gained interest as a solution that is akin to a low-code platform. There was a notable level of concern that GitHub used public repositories with potentially incompatible licenses to train the AI. GitHub publicly [responded](https://copilot.github.com/#faq-why-was-github-copilot-trained-on-data-from-publicly-available-sources) in their copilot FAQ.


### Analyst Landscape

<!-- What analysts and/or thought leaders in the space talking about, what are one or two issues
that will help us stay relevant from their perspective.-->

What they are saying:

- The global low-code development platform market size is projected to grow from USD 13.2 billion in 2020 to USD 45.5 billion by 2025, at a Compound Annual Growth Rate (CAGR) of 28.1% during the forecast period. [source](https://www.marketsandmarkets.com/Market-Reports/low-code-development-platforms-market-103455110.html#:~:text=%5B161%20Pages%20Report%5D%20The%20global,28.1%25%20during%20the%20forecast%20period.)
- By 2024, low-code application development will be responsible for more than 65% of application development activity. (Gartner 2019 MQ)
- By 2024, three-quarters of large enterprises will be using at least four low-code development tools for both IT application development and citizen development initiatives. (Gartner 2019 MQ)
- TuringBots may write most enterprise applications by 2030. Important to call out as this may augment the low/no-code landscape. [source](https://drive.google.com/file/d/1tz2GnKn78Dgm8k5xWPl2Jy-OxOJPYxRr/view)

Reports of Interest:
* [Gartner: 2020 Magic Quadrant for Enterprise Low-Code Application Platforms](https://www.gartner.com/document/3991199)
* [Gartner: 2020 Critical Capabilities for Enterprise Low-Code Application Platforms](https://www.gartner.com/document/3991223)
* [Forrester: Testing in Low-Code Development](https://www.forrester.com/report/We+Must+Address+Testing+In+LowCode+Development/-/E-RES162135?objectid=RES162135)
