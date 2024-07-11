---
layout: markdown_page
title: "Category Direction - Organization"
description: ""
canonical_path: "/direction/enablement/tenant-scale/organization/"
---

- TOC
{:toc}

## Organization

| | |
| --- | --- |
| Stage | [Data Stores](/direction/enablement/) |
| Maturity | [Planned](/direction/maturity/) |
| Content Last Reviewed | `2023-07-21` |

## Introduction and how you can help

Thanks for visiting this category direction page on Organizations at GitLab.
The Organization category is part of the [Tenant Scale group](https://about.gitlab.com/handbook/product/categories/#tenant-scale-group) within the [Enablement](https://about.gitlab.com/direction/enablement/) section and is maintained by [Christina Lohr](https://about.gitlab.com/company/team/#lohrc). 

This vision and direction is constantly evolving and everyone can contribute:
* Please comment in the linked [issues](https://gitlab.com/groups/gitlab-org/-/issues/?sort=popularity&state=opened&label_name%5B%5D=Category%3AOrganization&label_name%5B%5D=group%3A%3Atenant%20scale&first_page_size=100) and [epics](https://gitlab.com/groups/gitlab-org/-/epics?state=opened&page=1&sort=start_date_desc&label_name[]=Category:Organization&label_name[]=group::tenant+scale). Sharing your feedback directly on GitLab.com or submitting a merge request to this page are the best ways to contribute to our strategy.
* Please share feedback directly via [email](https://gitlab.com/lohrc), or [schedule a video call](https://calendly.com/christinalohr/30min). If you're a GitLab user and have direct feedback about your needs for the organization, we'd love to hear from you.
* Please open an issue using the ~"Category:Organization" label, or reach out to us internally in the #g_tenant-scale Slack channel.

## Overview

The Organization category focuses on creating a better experience for organizations to manage their GitLab implementation.
This includes making administrative capabilities that previously only existed for self-managed users available to our SaaS users as well, such as management of users and groups and supporting cascading settings.
The result of this effort will be a more intuitive user experience for all our users towards more aligned behaviors throughout our product.

#### Opportunities

Iterating on Organizations will allow us to solve a number of problems with the current SaaS experience:
1. Enables grouping of top-level groups. For example, the following top-level groups would belong to the Organization GitLab:
    - https://gitlab.com/gitlab-org/
    - https://gitlab.com/gitlab-com/
1. Allows different Organizations to be isolated. Top-level groups of the same Organization can interact with each other but not with groups in other Organizations, providing clear boundaries for an Organization, similar to a self-managed instance. An Organization should feel like a self-contained space where an enterprise can work independently of the rest of Gitlab.com. Users in a group owned by an enterprise should be able to complete all their day to day activities without leaving their Organization. Isolation should have a positive impact on performance and availability as things like user dashboards can be scoped to Organizations.
1. Allows integration with Cells. Isolating Organizations makes it possible to allocate and distribute them across different Cells.
1. Removes the need to define hierarchies. An Organization is a container that could be filled with whatever hierarchy/entity set makes sense (Organization, top-level groups, etc.)
1. Enables centralized control of user profiles. With an Organization-specific user profile, administrators can control the user’s role in a company, enforce user emails, or show a graphical indicator that a user as part of the Organization. An example could be adding a “GitLab employee” stamp on comments.
1. Organizations bring an on-premise-like experience to SaaS (GitLab.com). The Organization admin will have access to instance-equivalent Admin Area settings with most of the configuration controlled at the Organization level.

### Strategy and themes

The video below contains a high-level overview of what the Organization is trying to accomplish, some initial design considerations, and how Organizations build the foundation for Cells.

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/ltFRc05cnbc" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

Today, GitLab's features exist at 3 levels:

| Level | Description | Example |
| ------ | ------ | ------ |
| Instance | Features for the entire instance. These are generally admin features (restricted to the admin panel or via a config like `gitlab.rb`), but not always ([Operations Dashboard](https://docs.gitlab.com/ee/user/operations_dashboard/)). | [LDAP](https://docs.gitlab.com/ee/administration/auth/ldap/#configuration-core-only), [admin-level push rules](https://docs.gitlab.com/ee/administration/admin_area.html#admin-area-sections) |
| Group | Features configured and used at the group-level. These generally inherit behavior or objects down into subgroups (like epics, settings, or memberships). | [Epics](https://docs.gitlab.com/ee/user/group/epics/) |
| Project | Features used at the project level. | [Requirements Management](https://docs.gitlab.com/ee/user/project/requirements/) |

This leads to a few problems:
* 3 ways to build a feature lead to follow-on requests to build a feature at some other level (see meta issues like [group level things](https://gitlab.com/gitlab-org/gitlab/-/issues/17836)) and additional engineering effort.
* Restricts the audience, especially with instance-level features. Many of these features are admin-only, which is a tiny percentage of most users on an instance. If we make a feature instance level, we're locking ourselves into a few thousand self-managed users and locking out GitLab.com users.
* Poor UX. Inconsistencies between the features available at the project and group levels create navigation and usability issues. Moreover, there isn't a dedicated place for organization-level features, so cool features like the Operations Dashboard and the Security Dashboard get relegated to the "More" dropdown in the top Navigation Bar.

While it would be ideal to have one way to build a new feature, most GitLab functionality should exist at the group or organization level rather than the instance level at a minimum.

We should extract features from the Admin Area into a new object called [Organization](https://docs.gitlab.com/ee/architecture/blueprints/organization/index.html) that acts as an umbrella to all the projects and groups it contains. 

### Goals

The Organization focuses on creating a better experience for organizations and enterprises to manage their GitLab experience. By introducing Organizations and [Cells](../cell/index.html.md) we can improve the reliability, performance and availability of our SaaS Platforms.

* Wider audience: Many instance-level features are admin only. We do not want to lock out users of GitLab.com in that way. We want to make administrative capabilities that previously only existed for self-managed users available to our SaaS users as well. This also means we would give users of GitLab.com more independence from GitLab.com admins in the long run. Today, there are actions that self-managed admins can perform that GitLab.com users have to request from GitLab.com admins.
* Improved user experience: Inconsistencies between the features available at the project and group levels create navigation and usability issues. Moreover, there isn’t a dedicated place for Organization-level features.
* Aggregation: Data from all groups and projects in an Organization can be aggregated.
* An Organization includes settings, data, and features from all groups and projects under the same owner (including personal namespaces).
* Cascading behavior: Organization cascades behavior to all the projects and groups that are owned by the same Organization. It can be decided at the Organization level whether a setting can be overridden or not on the levels beneath.

#### Near term goals

Over the next few months, we are focussing on delivering an [Organization MVC](https://gitlab.com/groups/gitlab-org/-/epics/10649). The MVC serves as a foundation for [Cells](../cell/index.html.md) and for other teams to add functionality that is needed at the Organization level. The Organization MVC will contain the following functionality:

* Instance setting to allow the creation of multiple Organizations. This will be enabled by default on GitLab.com, and disabled for self-managed GitLab.
* Every instance will have a default organization. Initially, all users will be managed by this default Organization.
* Organization Owner. The creation of an Organization appoints that user as the Organization Owner. Once established, the Organization Owner can appoint other Organization Owners.
* Organization users. A user is managed by one Organization, but can be part of multiple Organizations. Users are able to navigate between the different Organizations they are part of.
* Setup settings. Containing the Organization name, ID, description, README, and avatar. Settings are editable by the Organization Owner.
* Setup flow. Users are able to build an Organization on top of an existing top-level group. New users are able to create an Organization from scratch and to start building top-level groups from there.
* Visibility. Options will be public and private. A nonuser of a specific Organization will not see private Organizations in the explore section. Visibility is editable by the Organization Owner.
* Organization settings page with the added ability to remove an Organization. Deletion of the default Organization is prevented.
Groups. This includes the ability to create, edit, and delete groups, as well as a Groups overview that can be accessed by the Organization Owner.
* Projects. This includes the ability to create, edit, and delete projects, as well as a Projects overview that can be accessed by the Organization Owner.

#### Mid term goals

Once established, we want to focus on improving workflows and functionality for users of the organiztion by addressing the following gaps:

* Internal visibility will be made available on Organizations that are part of GitLab.com. Currently, `internal` visibility is only available on self-managed GitLab, and the only way for customers of GitLab.com to shield their content is to set the visibility of all of their groups and projects to `private`. This setting is often too restrictive for users to easily find their way around an Organization. By making `internal` visibility available, administrators can enable their users to safely explore projects without having to supervise their membership.

## 1 year plan

Within the next year, we are planning to release the [Organization MVC](https://docs.gitlab.com/ee/architecture/blueprints/organization/index.html#organization-mvc).
We have defined an [iteration plan](https://docs.gitlab.com/ee/architecture/blueprints/organization/index.html#iteration-plan) that outlines how we intend to arrive at the Organization MVC.

### What we are currently working on

Our immediate focus is to release an [Organization prototype](https://docs.gitlab.com/ee/architecture/blueprints/organization/index.html#iteration-1-organization-prototype-fy24q3) containing:

- [Organization creation](https://gitlab.com/groups/gitlab-org/-/epics/11191)
- [Organization group overview](https://gitlab.com/groups/gitlab-org/-/epics/11188)
- [Organization project overview](https://gitlab.com/groups/gitlab-org/-/epics/11189)
- [Organization front page](https://gitlab.com/groups/gitlab-org/-/epics/11187)
- [Organization navigation](https://gitlab.com/groups/gitlab-org/-/epics/11190)

### What we recently completed



### What is not planned right now

* We are currently not considering making the Organization part of the namespace framework.
