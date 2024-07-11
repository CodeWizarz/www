---
layout: markdown_page
title: "GitLab Documentation Roadmap"
canonical_path: "/direction/manage/foundations/gitlab_docs/"
---

- TOC
{:toc}

## GitLab Documentation Site

|                       |                               |
| -                     | -                             |
| Maturity              | N/A |
| Content Last Reviewed | `2023-1-23`                  |
| Maintained by | [Susan Tacker](https://gitlab.com/susantacker)|

## Overview

Our goal is to provide documentation that is accurate, helpful, and easy to use. It should help users perform their jobs efficiently and be easy to browse or search for the information you need. As open source documentation, it should be easy to contribute to the documentation itself. 

All standards and practices for contributing documentation are in the [GitLab Documentation guidelines](https://docs.gitlab.com/ee/development/documentation/) section of the docs site.


## Target audience

Who uses the docs site? 

**GitLab Users:** GitLab administrators and users on self-managed and SaaS require clear and comprehensive documentation. The percentage of visitors who are not GitLab administrators continues to increase year over year, and the percentage of people who use the docs site daily continues to grow at an average rate of 3% per year. 

**GitLab Team Members:** GitLab team members are both contributors to and consumers of the documentation. While the [Technical Writing](https://about.gitlab.com/handbook/product/ux/technical-writing/) team owns the documentation, [anyone can and does contribute](https://docs.gitlab.com/ee/development/documentation/contribute.html) to the docs.

The percentage of new-to-GitLab users and first-time docs site users continues to grow sharply. We focus many docs site efforts on people who could benefit from easy-to-find, basic "how-to" information.

## Challenges to address

UX research highlights key opportunities for improving the GitLab documentation site:

- `/help` and [docs.gitlab.com](https://docs.gitlab.com/) are different sites with different experiences of similar content, which confuses users
- People struggle to find the information they’re looking for on docs.gitlab.com:
  - More than 1800 pages of content
  - The docs site word count has more than doubled since May of 2020
  - Most documentation is feature oriented, not process oriented
  - Search isn't always helpful
- Some basic tutorial information that people want is either missing or too difficult to locate, and the percentage of new users is growing
- Users want more contextual _why_ information


The [Documentation Roadmap epic](https://gitlab.com/groups/gitlab-org/-/epics/4602) lists ongoing projects to help improve the docs site experience.

## Where we are headed

Our current focus is on [improving the /help experience](https://gitlab.com/groups/gitlab-org/-/epics/7738), but we currently have a [blocker around our use of GitLab Pages](https://gitlab.com/gitlab-org/gitlab/-/issues/384875). We are also focused on [upgrading the search experience on the docs site](https://gitlab.com/groups/gitlab-org/-/epics/9420) to provide more accurate search results.

## What's next and why

As outlined in the [Documentation Roadmap](https://gitlab.com/groups/gitlab-org/-/epics/4602) and in quarterly OKRs, we've prioritized a number of improvements to address the challenges listed above.

- We refactor documentation pages to adhere to a Concept, Task, Reference, Troubleshooting content design, a recognizable industry standard. 
- We identify gaps in the documentation, such as Tutorials, and work to provide the docs that users need.
- We participate in [GitLab Hackathons](https://about.gitlab.com/community/hackathon/) to collaborate with contributors and address issues identified by docs testing.   

## What's not planned right now

The Technical Writing team is not currently investing in localization of the documentation.

## Maturity plan

<!-- It's important your users know where you're headed next. The maturity plan
section captures this by showing what's required to achieve the next level. The
section should follow this format:

This category is currently at the XXXX maturity level, and our next maturity target is YYYY (see our [definitions of maturity levels](https://about.gitlab.com/direction/maturity/)).

- Link to maturity epic if you are using one, otherwise list issues with maturity::YYYY labels) -->


Currently, the GitLab Documentation Site category is a *non-marketing category*, which means its maturity does not get tracked.


<!--
### User success metrics
- What specific user behaviors are indicate that users are trying these features, and solving their problems?
- How will users discover these features?
-->


<!--
### Why is this important?
- Why is GitLab building this feature?
- What impact will it have on the broader devops workflow?
- How confident are we? What is the effort?
-->

### Competitive Landscape
<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](https://about.gitlab.com/handbook/product/product-processes/#customer-meetings). We’re not aiming for feature parity with competitors, and we’re not just looking at the features competitors talk
about, but we’re talking with customers about what they actually use, and
ultimately what they need.-->

* [Stripe's documentation](https://stripe.com/docs) is considered the gold standard of documentation sites
* [Algolia](https://www.algolia.com/doc/) has excellent documentation and information architecture


<!--

### Top Strategy Item(s)
What's the most important thing to move your strategy forward?-->
