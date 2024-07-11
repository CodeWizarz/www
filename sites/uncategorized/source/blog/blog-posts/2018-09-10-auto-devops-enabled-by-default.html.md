---
title: "Auto DevOps will be enabled by default as part of GitLab’s 11.3 release"
author: Daniel Gruesso
author_gitlab: danielgruesso
author_twitter: danielgruesso
categories: company
description: "GitLab 11.3 will bring the power of Auto DevOps to every user"
tags: features, news, releases
featured: yes
---

[Auto DevOps](/stages-devops-lifecycle/auto-devops/) was made generally available in GitLab’s 11.0 release and, while it has had great adoption,
we want all of GitLab's users to take advantage of its great features. From Auto Build to Auto Monitoring,
Auto DevOps brings valuable benefits out of the box.

At GitLab, one of our product values is to [default to on](/handbook/product/product-principles/#configuration-principles).
When we introduce a new configurable feature we know to be of great value, we will default to ON so that everyone can
benefit from it. While Auto DevOps supports projects using the most popular programming languages, there may be some
specialized projects for which additional configuration is required. Therefore, before we
enable it for everyone, we want to ensure we will not be running Auto DevOps pipelines for projects
that are not supported. To that end, we will [disable auto devops automatically](https://gitlab.com/gitlab-org/gitlab-ce/issues/39923)
if a pipeline fails. GitLab will notify the project owner of this attempt so they can make the necessary configuration
changes to work with auto devops if desired.

We will initially enable this feature gradually on gitlab.com and monitor its performance. Barring any
issues, we will enable it as part of our 11.3 release for self-managed customers on September 22nd, 2018.

We hope that everyone will benefit from the great features Auto DevOps brings. You can read more
about [Auto DevOps here](https://docs.gitlab.com/ee/topics/autodevops).
