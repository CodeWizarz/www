---
layout: markdown_page
title: "Category Direction - GitLab Pages"
description: GitLab Pages allows you to create a statically generated website from your project that is automatically built using GitLab CI and hosted on our infrastructure.
canonical_path: "/direction/plan/knowledge/pages/"
---

- TOC
{:toc}

## GitLab Pages

| | |
| --- | --- |
| Stage | [plan](/direction/dev/#plan) |
| Maturity | [Complete](/direction/maturity/) |
| Content Last Reviewed | `2023-10-10` |

### Introduction and how you can help

Thanks for visiting the Pages direction page for GitLab. GitLab Pages allows you to create a statically generated website from your project that is automatically built using GitLab CI and hosted on our infrastructure. This category belongs to the [Knowledge](/handbook/product/categories/#knowledge-group) group of the Plan stage. This direction page is maintained by Product Manager in Plan Stage, Matthew Macfarlane ([E-Mail](mailto:mmacfarlane@gitlab.com)). More information about the Knowledge group's priorities and direction can be found on the [Knowledge group direction page](/direction/plan/knowledge/).

This direction page is a work in progress, and everyone can contribute:

- [Issue List](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3APages)
- [Category Maturity Epic](https://gitlab.com/groups/gitlab-org/-/epics/7766)
- [Documentation](https://docs.gitlab.com/ee/user/project/pages/) 

### Overall Prioritization

GitLab Pages is a popular feature that exists at the intersection of multiple stages of the DevSecOps lifecycle. The long-term vision for Pages is to provide an experience that guides and supports you through Create, Verify, Package, and Release to host static assets on the web, regardless of your level of development experience. 

We are currently, as of 2023-10-10, prioritizing [Multiple-version Pages support](https://gitlab.com/groups/gitlab-org/-/epics/10914) and [Pages without DNS wildcard](https://gitlab.com/gitlab-org/gitlab/-/issues/17584).

Down the line, we'll continue to evaluate bigger opportunities such as making content management and collaboration easier for non-developer personas.

## Long-term vision

The deprecated Static Site Editor was conceived as a way to lower the barrier to collaborating on static site content. Publishing a site to Pages is one thing, but collaborating on content with Product Managers, Designers, Marketing Managers, Technical Writers, and executives without requiring a deep understanding of the underlying technologies or programming languages would open the doors for _everyone to contribute_.

The WYSIWYG Markdown editing experience introduced with the Static Site Editor has evolved into a [shared editing component](/direction/plan/knowledge/content_editor/) that can be used in many places across Gitlab. With the deprecation of the Static Site Editor as a standalone feature, the vision for managing and contributing to static sites in an intuitive and accessible way will be carried forward by the Pages category. 

A future state of Pages could be described as a lightweight content management system (CMS), abstracting away the repository and git terminology in favor of WYSIWYG editing and more accessible publishing workflows. Others like [Netlify CMS](https://www.netlifycms.org/), [TinaCMS](https://tina.io/), and [Stackbit](https://www.stackbit.com/) have successfully bridged the gap between git-backed repositories of static assets and visual editing workflows accessible to all. The ideal user journey may look something like: 

- You, a developer, create a new project on GitLab from a template pre-configured to publish to Pages.
- You configure the domains, visibility permissions, customize the project's theme, and populate the initial content in the repository.
- You preview the site and merge your branch into `main`.
- The site publishes automatically to Pages after the build is complete.
- You invite your colleague to collaborate on the content.
- Your colleague, a Product Manager unfamiliar with Markdown, opens a page in a WYSIWYG editor and adds their contribution.
- The changes are available to preview immediately and your colleague is confident in their contribution so they submit for review.
- You review the changes, accept them, and merge them into `main`, triggering another Pages deploy. 
- The new page is published in seconds!

## Maturity Plan

This category is currently at the "Complete" maturity level, and our next maturity target is "Lovable" (see our [definitions of maturity levels](/direction/maturity/)). The key features and deliverables necessary to promote Pages are captured in the [Lovable Maturity epic](https://gitlab.com/groups/gitlab-org/-/epics/8511).

However, the assessment of this maturity level was made prior to our [new process for measuring maturity](/handbook/product/ux/category-maturity/category-maturity-scorecards/). We will be [conducting a category maturity assessment](https://gitlab.com/gitlab-org/gitlab/-/issues/360965) to validate the current maturity level and understand more about what is necessary to get it to the next level. Our goal is to conduct this measurement in FY24 or FY25, depending upon our available capacity.

## Competitive Landscape

We are invested in supporting the process of developing and deploying code from a single place as a convenience for our users. Other providers, such as [Netlify](https://www.netlify.com/), deliver a more comprehensive solution. There are project templates available that offer the use of [Netlify for static site CI/CD](https://gitlab.com/pages?filter=netlify), while also still taking advantage of GitLab for repository, merge requests, issues, and everything else. GitLab offers configurable redirects, a well-loved featured of Netlify, made available in [gitlab-pages#24](https://gitlab.com/gitlab-org/gitlab-pages/-/issues/24).

We are seeing a rise in [JAMStack](https://jamstack.org/) and static site generators partnering in the media. This trend toward API-first, affirms our modernization effort of Pages, reinforcing our cloud native installation maturity plan. 

GitHub also offers hosting of static sites with [GitHub Pages](https://pages.github.com/). Key differentiators between the two are: 

- GitHub Pages configuration and deployment is more "automatic" in that it doesn't require you to edit a CI configuration file.
- GitHub Pages has limits placed on bandwidth, builds, and artifact size where GitLab currently does not.

## Top Customer Issue(s) and Top Customer Success/Sales Issue(s)

The most popular customer issues are:

1. [Multiple-version Pages support](https://gitlab.com/groups/gitlab-org/-/epics/10914): This feature would allow you to publish from multiple branches simultaneously. There is a work around described in [#33822](https://gitlab.com/gitlab-org/gitlab/-/issues/33822) but it is not a complete solution for use cases like our own GitLab Documentation Site. We are currently working on this issue.
1. [Pages without DNS wildcard](https://gitlab.com/gitlab-org/gitlab/issues/17584): Creating Gitlab pages today requires admins to setup wildcard DNS records and SSL/TLS certificates. Some services and/or corporate security policies forbid wildcard DNS records, preventing users from using Gitlab Pages. We are currently working on this issue.
1. [Review Apps for GitLab Pages](https://gitlab.com/gitlab-org/gitlab/-/issues/16907): Review Apps provide an automatic live preview of your environment. Extending this support to Pages domains would increase collaboration and accelerate feedback loops.
1. [Redirect to custom domains](https://gitlab.com/gitlab-org/gitlab/-/issues/14243): Adding granular control over redirects to custom domains, if they exists, would improve efficiency and search engine optimization.

## Top Internal Customer Issue(s)

GitLab Pages is dogfooded extensively across GitLab, most prominently as the hosting platform for [docs.gitlab.com](https://docs.gitlab.com). Our top internal customer issue is [support for versions](https://gitlab.com/groups/gitlab-org/-/epics/10914), which we are currently addressing. [Review Apps for GitLab Pages](https://gitlab.com/gitlab-org/gitlab/-/issues/16907) is another important feature for internal usage as the GitLab Internal Handbook is hosted on Pages and would benefit from having Review Apps integrated with the MR workflow.

## Top Vision Item(s)

Adding Review Apps for Pages ([gitlab#16907](https://gitlab.com/gitlab-org/gitlab/issues/16907)) will allow for more sophisticated development flows involving testing and review of Pages deployments. Enhancing the maturity of deployment would integrate Pages more critically within projects and groups. 

Another vision item being investigated is to leverage JAMstack for Pages. The primary goal would be to ([enhance the user experience](https://gitlab.com/groups/gitlab-org/-/epics/2179)) and allow easy to set up Pages from the UI without expanding APIs. Lastly, in combination with [feature flags](/direction/release/feature_flags/), Pages can be used to ([support A/B testing](https://gitlab.com/gitlab-org/gitlab/issues/14122)). 
