---
title: "Comparing confusing terms in GitHub, Bitbucket, and GitLab (2017)"
categories: company
author: Marcia Ramos
author_twitter: XMDRamos
author_gitlab: marcia
description: "Learn the differences between GitLab, GitHub, and Bitbucket's terminology."
image_title: '/images/blogimages/comparing-confusing-terms-in-github-bitbucket-and-gitlab-cover.jpg'
twitter_image: '/images/tweets/comparing-confusing-terms-in-github-bitbucket-and-gitlab.png'
tags: inside GitLab
---

Developers rely on multiple platforms to manage repositories, depending on
client and project needs.
They might contribute to a community project on GitHub, while working on one
client's on premises GitLab instance and another client's project in Mercurial
on Bitbucket.
Confusion can arise when you switch between platforms.
In this post, we have a handy reference guide to explain
some potentially confusing terms, especially if you're new
to GitLab.

<!--more-->

This article was originally written by [Heather McNamee](https://twitter.com/nearlythere) and [published by GitLab](/blog/2016/01/27/comparing-terms-gitlab-github-bitbucket/) on Jan 26th, 2016.
Updated by Marcia Ramos on Sep 11th, 2017.
{:.note}

## Migrating to GitLab

Since GitLab's [8.4 Release](/releases/2016/01/22/gitlab-8-4-released/), we have improved
[migration support](https://docs.gitlab.com/ee/user/project/import/)
for those coming from diverse platforms to GitLab.

GitLab imports your repositories, wikis, issues, pull requests, and milestones
from [GitHub](https://docs.gitlab.com/ee/user/project/import/github.html),
as well as from [Bitbucket](https://docs.gitlab.com/ee/user/project/import/bitbucket.html).

While most terminology is shared
between the platforms, some differences lead to confusion
for users.
Git-specific terms like commits, push, pull, fetch, merge and so forth are the same.
Common features most repository managers have are also the same: such as users, issues, webhooks, milestones, etc.

## Pull requests vs merge requests

Some features have different names. For example a “pull request” in GitHub and Bitbucket is called a “merge request” in GitLab.

We figured since you're often making a request to `merge` a feature branch into the master branch, we call this a
"merge request" and you'll hear us talk about MRs and not PRs.

Read through this page for a full [comparison between MRs and PRs](/competition/github/).

If you’re brand new to GitLab, we’ve made this handy cheat sheet to help you orient yourself and clear things up.

![The Import Project UI in GitLab showing you can import from GitHub, Bitbucket, etc](/images/blogimages/gitlab-terminology.png){:.shadow}

## Teams, repositories, organizations?

From teams to repositories to organizations, there’s potential for fresh confusion.
In GitHub, *repositories* contain the Git/SVN repository, and the project assets
such as issues, contribution metrics, etc.
However users often refer to repos as *projects* interchangeably.

So in GitLab, we call that container a **[Project](https://docs.gitlab.com/ee/user/project/)**.
That includes the Git [repository](https://docs.gitlab.com/ee/user/project/repository/),
[issues](https://docs.gitlab.com/ee/user/project/issues/),
[merge requests](https://docs.gitlab.com/ee/user/project/merge_requests/),
[milestones](https://docs.gitlab.com/ee/user/project/milestones/),
and much more.

## Creating a new project in GitLab

When you set up a project, you can, among many other options:

- Choose [project features](https://docs.gitlab.com/ee/user/project/#project-39-s-features).
- Set the project avatar and its visibility level (Private, Internal or Public).
You can have as many private projects as you want.
- Build, test, and deploy your app with [GitLab CI/CD](/features/continuous-integration/).
- Collaborate on code with [merge requests](https://docs.gitlab.com/ee/user/project/merge_requests/) and [Review Apps](https://docs.gitlab.com/ee/ci/review_apps/).
- [Integrate](https://docs.gitlab.com/ee/user/project/integrations/project_services.html)
with third-party applications

It's important to make this distinction because you import a **project** in
GitLab, regardless of whether that is called a **repository** elsewhere. In
GitLab, the repository is *part* of a project.
{:.alert .alert-info}

![The Import Project UI in GitLab showing you can import from GitHub, Bitbucket, etc](/images/blogimages/comparing-confusing-terms-in-github-bitbucket-and-gitlab-project.png){:.shadow}

## Projects, organizations, and groups

This is where it could get confusing.
Now Bitbucket groups multiple repositories into *Projects*, multiple projects into teams,
and teams in Bitbucket are analogous to an *Organization* in GitHub.

In GitLab, we call this a **[Group](https://docs.gitlab.com/ee/user/group/)**.

This allows you to collect several projects together and also invite
members (other users) to collaborate. Those members can then configure their own [group-level notifications](https://docs.gitlab.com/ee/user/profile/notifications.html#group-notifications).

Projects can be stored in only one group at once.
However, you can [share a project with other groups](https://docs.gitlab.com/ee/user/project/members/share_project_with_groups.html) in [GitLab Enterprise Edition Starter](/pricing/).
And even those settings can be [locked at the group level](https://docs.gitlab.com/ee/user/group/#share-with-group-lock-ees-eep) so you can avoid
someone sharing a private project to other groups, for example.

The confusion is understandable, especially if, like many developers,
you work with a number of clients each on different platforms.

I hope this has cleared up confusion. If you have any questions, please create a
[new issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/new) or
tweet at us [@GitLab](https://twitter.com/gitlab)!

----

[Cover image](https://www.pexels.com/photo/ask-blackboard-chalk-board-chalkboard-356079/) licensed under [CC0](https://www.pexels.com/photo-license/).
{:.note}
