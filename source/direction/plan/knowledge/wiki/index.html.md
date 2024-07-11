---
layout: markdown_page
title: "Category Direction - Wiki"
description: "GitLab Wikis are a great way to share documentation and organize information via built-in functionality. View further information here!"
canonical_path: "/direction/plan/knowledge/wiki/"
---

- TOC
{:toc}

## Wiki

| | |
| --- | --- |
| Stage | [Plan](/direction/plan/) |
| Maturity | [Viable](/direction/maturity/) |
| Content Last Reviewed | `2023-10-10` |

### Introduction and how you can help
<!-- Introduce yourself and the category. Use this as an opportunity to point users to the right places for contributing and collaborating with you as the PM -->

Thanks for visiting the Wiki category direction page in GitLab. This page belongs to the [Knowledge](/handbook/product/categories/#knowledge-group) group of the Plan Stage and is maintained by Matthew Macfarlane ([E-Mail](mailto:mmacfarlane@gitlab.com)). More information about the Knowledge group's priorities and direction can be found on the [Knowledge group direction page](/direction/plan/knowledge/).

This strategy is a work in progress, and everyone can contribute to it:

 - Please comment and contribute in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name%5B%5D=Category%3AWiki) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=Category%3AWiki) on this page. Sharing your feedback directly on GitLab.com is the best way to contribute to our strategy and vision.
 - Please share feedback directly via email, Twitter, or on a video call. If you're a GitLab user and have direct knowledge of your need for Wiki, we'd especially love to hear from you.

### Overview
<!-- A good description of what your category is today or in the near term. If there are
special considerations for your strategy or how you plan to prioritize, the
description is a great place to include it. Provide enough context that someone unfamiliar
with the details of the category can understand what is being discussed. -->

The GitLab Wiki is a great place to store documentation and organize information. Each GitLab project and group includes a Wiki. Premium and Ultimate customers have access to the group-level Wiki for consolidating documentation across multiple projects or teams.

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/LzFRBMGl2SA?start=541" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

### Where we are headed
<!-- Describe the future state for your category. What problems will you solve?
What will the category look like once you've achieved your strategy? Use narrative
techniques to paint a picture of how the lives of your users will benefit from using this
category once your strategy is fully realized -->

We want the wiki to serve as a single source of truth for project or group-level documentation that is approachable and easily accessibly by anyone. As we look to future plans, we will be exploring ways to encourage collaboration across all personas by improving the editing and navigation experience.

Specifically, we are looking to better integrate the Wiki experience with the rest of GitLab. One immediate opportunity is to better integrate with Issues and Epics. We are looking to better understand how users could benefit from a closer integration between the Wiki. 

### Target audience and experience
<!-- An overview of the personas (https://about.gitlab.com/handbook/product/personas/#user-personas) involved in this category. An overview
of the evolving use cases and user journeys as the category progresses through minimal,
viable, complete and lovable maturity levels. -->
Our primary persona is Sasha, the [Software Developer](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer), but all personas can use Wikis for storing information and everyone should be able to quickly and easily contribute to a wiki page. As the wiki matures, we may need to investigate other, non-developer personas as our research found they are frequent users of wikis.

### What's next & why
<!-- This is almost always sourced from the following sections, which describe top
priorities for a few stakeholders. This section must provide a link to an issue
or [epic](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) for the MVC or first/next iteration in the category.-->

We have recently [drafted](https://gitlab.com/gitlab-org/plan-stage/knowledge-group/-/issues/12) Jobs to Be Done (JTBD) for the category in order to best drive the Wiki forward. We also have a backlog of feature requests that help inform us on what users are looking for both immediately and in the near term.

### What is not planned right now
<!-- Often it's just as important to talk about what you're not doing as it is to
discuss what you are. This section should include items that people might hope or think
we are working on as part of the category, but aren't, and it should help them understand why that's the case.
Also, thinking through these items can often help you catch something that you should
in fact do. We should limit this to a few items that are at a high enough level so
someone with not a lot of detailed information about the product can understand
the reasoning-->

We know that our new WYSIWYG Markdown editor can support real-time collaborative editing, but we may need an entirely new backend to support collaborative editing of Wiki pages. Ideally, we want to solve the problem of collaborative note taking, be highly approachable for everyone, but also offer the tremendous benefits of storing the content in a portable plain text format that can be cloned, viewed and edited locally (properties of Git). However, we are not actively working on a new architecture that can support this experience.

### Maturity plan

Wiki transitioned from Create Stage to Plan Stage in GitLab in early FY24. The future direction of Wiki, as a result of this transition, is being evaluated. Prior to this change Wiki was in [Maintenance Mode](https://docs.gitlab.com/ee/administration/maintenance_mode/).

### Competitive landscape
<!-- The top two or three competitors, and what the next one or two items we should
work on to displace the competitor at customers, ideally discovered through
[customer meetings](https://about.gitlab.com/handbook/product/product-processes/#customer-meetings). We’re not aiming for feature parity with competitors, and we’re not just looking at the features competitors talk
about, but we’re talking with customers about what they actually use, and
ultimately what they need.-->

We compete with the following knowledge management tools (not and exclusive list):

- [Confluence](https://www.atlassian.com/software/confluence)
- [Notion](https://www.notion.so/)
- [Google Docs](https://docs.google.com/)

We've heard from customers that managing wikis with tens of thousands of pages can be challenging. And while a full-featured product like Confluence has advanced features and integrations, the GitLab wiki would be a stronger competitor if we fixed some low-hanging fruit related to [page title and redirects](https://gitlab.com/groups/gitlab-org/-/epics/3192).

<!-- ### Analyst Landscape -->
<!-- What analysts and/or thought leaders in the space talking about, what are one or two issues
that will help us stay relevant from their perspective.-->

<!-- TBD -->

### Recent Accomplishments

- In 15.10 Knowledge Group [released](https://gitlab.com/gitlab-org/gitlab/-/issues/20305/?_gl=1*17d6cyx*_ga*MTU5MDI5ODc5NS4xNjY1NTkyMzcy*_ga_ENFH3X7M5Y*MTY4MDcyMDIxOC4zOTUuMS4xNjgwNzIxMTIzLjAuMC4w) the capability to easily create and edit diagrams in wikis by using the diagrams.net GUI editor. This feature is available in the Markdown editor and the content editor, and was implemented in close collaboration with the GitLab wider community.

### Top customer success/sales issue(s)
<!-- These can be sourced from the CS/Sales top issue labels when available, internal
surveys, or from your conversations with them.-->

- [Decouple wiki page slugs, filename, and titles](https://gitlab.com/groups/gitlab-org/-/epics/3192)
- [Improve AsciiDoc, RDoc and reStructuredText support in Wikis](https://gitlab.com/groups/gitlab-org/-/epics/701)
- [Improve wiki navigation](https://gitlab.com/groups/gitlab-org/-/epics/700)

### Top user issue(s)
<!-- This is probably the top popular issue from the category (i.e. the one with the most
thumbs-up), but you may have a different item coming out of customer calls.-->

- [Markdown Export to PDF](https://gitlab.com/gitlab-org/gitlab/issues/13932) (362 Upvotes)
- [Make it possible to edit wiki through CI](https://gitlab.com/gitlab-org/gitlab/-/issues/16261) (195 Upvotes)

### Top dogfooding issues
<!-- These are sourced from internal customers wanting to [dogfood](/handbook/values/#dogfooding)
the product.-->

GitLab does not have any organization-wide wikis, but some teams do use them for various purposes.

The [Knowledge Team utilizes the GitLab Wiki](https://gitlab.com/gitlab-org/plan-stage/knowledge-group/-/wikis/Knowledge-Group-Home) for Opportunity Mapping via the recent introduction of diagrams.net. More information can be found on this integration via our Unfiltered channel.

### Top strategy item(s)
<!-- What's the most important thing to move your strategy forward?-->

Our top strategy items are aligned with what our customers are asking for. We have good data backing our need to fulfill the following asks:

- [Decouple wiki page slugs, filename, and titles](https://gitlab.com/groups/gitlab-org/-/epics/3192)
- [Improve AsciiDoc, RDoc and reStructuredText support in Wikis](https://gitlab.com/groups/gitlab-org/-/epics/701)
- [Improve wiki navigation](https://gitlab.com/groups/gitlab-org/-/epics/700)
