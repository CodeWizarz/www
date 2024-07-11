---
layout: markdown_page
title: "Category Direction - Groups & Projects"
description: "Groups are a fundamental building block (a small primitive) in GitLab for project organization and managing access to these resources at scale. Learn more!"
canonical_path: "/direction/enablement/tenant-scale/groups-&-projects/"
---

- TOC
{:toc}

## Groups & Projects

| | |
| --- | --- |
| Stage | [Data Stores](/direction/enablement/) |
| Maturity | [Complete](/direction/maturity/) |
| Content Last Reviewed | `2023-07-21` |

## Introduction and how you can help
Thanks for visiting this category direction page on Groups & Projects at GitLab. The Groups & Projects category is part of the [Tenant Scale group](https://about.gitlab.com/handbook/product/categories/#tenant-scale-group) within the [Enablement](https://about.gitlab.com/direction/enablement/) section and is maintained by [Christina Lohr](https://about.gitlab.com/company/team/#lohrc). 

This vision and direction is constantly evolving and everyone can contribute:
* Please comment in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=group%3A%3Atenant%20scale&label_name%5B%5D=Category%3AGroups%20%26%20Projects&first_page_size=100) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=group::tenant+scale&label_name[]=Category:Groups+&+Projects). Sharing your feedback directly on GitLab.com or submitting a merge request to this page are the best ways to contribute to our strategy.
* Please share feedback directly via [email](https://gitlab.com/lohrc), or [schedule a video call](https://calendly.com/christinalohr/30min). If you're a GitLab user and have direct feedback about your needs for Groups & Projects, we'd love to hear from you.
* Please open an issue using the ~"Category:Groups & Projects" label, or reach out to us internally in the #g_tenant-scale Slack channel.

## Overview

Groups are a fundamental building block (a [small primitive](https://about.gitlab.com/handbook/product/product-principles/#prefer-small-primitives)) in GitLab that serve to:
- Group users to manage project authorization at scale
- Create collections of users for security features like [code owners](https://docs.gitlab.com/ee/user/project/codeowners/#code-owners) and [protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html#protected-environments).
- Organize related projects together
- House features that cover multiple projects like epics, contribution analytics, and the security dashboard

## Strategy and Themes
<!-- Capture the main problems to be solved in market (themes). Describe how you intend to solve these with GitLab (strategy). Provide enough context that someone unfamiliar with the details of the category can understand what is being discussed. -->

In 2023, our goal is to make improvements by extending Groups & Projects to help enterprise organizations thrive on GitLab.com. We will accomplish that by iterating on existing constructs and streamlining workflows to guide users to intended usage patterns.

#### Challenges

Historically, enterprise customers have gravitated toward self-managed GitLab as their favored solution.
With the proliferation of cloud services, enterprises are looking for options to use GitLab with managed infrastructure.
We need to provide a SaaS platform that can safely and securely house our customers while reducing the load and cost of having to manage and configure their own infrastructure.

#### Opportunities

Iterating on Groups & Projects will allow us to solve a number of problems with the current SaaS experience:
* **Flexible hierarchies** - We need to offer additional configuration options to allow enterprises to represent different [types of organizations](https://creately.com/blog/diagrams/types-of-organizational-charts/) using Groups, Subgroups and Projects.


## 1 year plan
<!--
1 year plan for what we will be working on linked to up-to-date epics. This section will be most similar to a "road-map". Items in this section should be linked to issues or epics that are up to date. Indicate relative priority of initiatives in this section so that the audience understands the sequence in which you intend to work on them. 
 -->

* Improving membership management by overhauling the Members page to clearly display:
  * All invited members and groups, including their permissions.
* [Consolidating groups and projects](https://gitlab.com/groups/gitlab-org/-/epics/6473). As part of this effort we are:
  * [Migrating basic project functionality to namespaces](https://gitlab.com/groups/gitlab-org/-/epics/6585) as a baseline for making functionality available at the group level. This includes functionality like starring, archiving, transfer or deletion.
  * Unifying members and member actions on the UI and API level by [consolidating memberships](https://gitlab.com/groups/gitlab-org/-/epics/8010).

### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->
The Tenant Scale group is currently focusing on the [Organization](../organization/index.html.md) and [Cell](../cell/index.html.md) categories. This means that we are currently only considering improvements to Groups & Projects that benefit the maturity of either of these categories. 

As a result of the ongoing consolidation efforts, we will be able to make existing project functionality available at the group level. The first iterations of this will include:
* [Making archiving available at the group level](https://gitlab.com/gitlab-org/gitlab/-/issues/382051)
* [Allowing to star groups and subgroups](https://gitlab.com/groups/gitlab-org/-/epics/9298)

In addition, the new namespace framework also enables us to [move functionality from the admin level to the group level](https://gitlab.com/groups/gitlab-org/-/epics/7314):
* As a first iteration of this, we will focus on [migrating settings](https://gitlab.com/groups/gitlab-org/-/epics/4419), so that group and project owners can have more control over their members.
* We are planning further investments into [group sharing](https://gitlab.com/groups/gitlab-org/-/epics/8184) to align the behaviour between groups and projects. Part of this effort will be to [provide more visibility into group shares](https://gitlab.com/groups/gitlab-org/-/epics/9059) and to add an [invitation flow](https://gitlab.com/groups/gitlab-org/-/epics/9025) for group shares.

### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->

### What is not planned right now

* The Tenant Scale team will not be responsible for migrating all features from a group or project to a namespace. We are [building a framework](https://gitlab.com/groups/gitlab-org/-/epics/6473) and are [documenting the process](https://docs.gitlab.com/ee/development/organization/index.html#consolidate-groups-and-projects) for features to be migrated. We collaborate with the respective teams to migrate existing functionality to namespaces.
* Since we are focused on consolidating groups and projects at this time, we don't plan to make significant improvements to them, as this would create redundant work. Instead, we will have targeted initiatives on specific product areas such as the group and project dashboard to improve the experience holistically between groups and projects.

## Target Audience
Groups and Projects are used by all GitLab users, no matter what role. However, there are some heavier users of Group and Project functionality: 

* [Sidney (Systems Adminstrator)](https://about.gitlab.com/handbook/product/personas/#sidney-systems-administrator) is often overseeing the GitLab implementation of their organization and manages access to Groups and Projects. Sidney is often involved in setting up and maintaining a Project and Group hierarchy that best represents the organizational structure of the company they work at.
* [Delaney (Development Team Lead)](https://about.gitlab.com/handbook/product/personas/#delaney-development-team-lead) is primarily managing and coordinating the development team efforts within their team. Delaney often manages access to a specific subset of Groups and Projects representing their team or department.
* [Sasha (Software Developer)](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer) is primarily writing code, but uses Groups and Projects to collaborate with team mates. Sasha needs to understand who the members of a specific Group or Project are to involve the right team members when submitting merge requests or reviewing code.

## Top user issue(s)

Here is a list of the [top user upvoted issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=popularity&state=opened&label_name%5B%5D=group%3A%3Atenant%20scale&label_name%5B%5D=Category%3AGroups%20%26%20Projects&first_page_size=100) with descending popularity:
* [Create an option to archive/unarchive Groups](https://gitlab.com/gitlab-org/gitlab/-/issues/15967)
* [Share private project via URL](https://gitlab.com/gitlab-org/gitlab/-/issues/15549)
* [Add support for subgroups in personal namespace](https://gitlab.com/gitlab-org/gitlab/-/issues/16734)