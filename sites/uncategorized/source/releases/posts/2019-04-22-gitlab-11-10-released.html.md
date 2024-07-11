---
release_number: "11.10"
title: "GitLab 11.10 released with Pipelines on the Operations Dashboard, Pipelines for Merged Results, and Multi-line Merge Request Suggestions"
author: Eric Brinkman
author_gitlab: ebrinkman
author_twitter: ericbrinkman
image_title: '/images/11_10/11_10-cover-image.jpg'
description: "GitLab 11.10 released with Pipelines on the Operations Dashboard, Pipelines for Merged Results, Multi-line Merge Request Suggestions, and much more!"
twitter_image: '/images/tweets/gitlab-11-10-released.png'
categories: releases
layout: release
featured: yes
release_number_dark: true
---

### Easily see pipeline health across projects

GitLab continues to add features to provide visibility into
the DevOps lifecycle. This release enhances the
[Operations Dashboard](https://docs.gitlab.com/ee/user/operations_dashboard/)
with a powerful feature that provides an overview of pipeline status.

This is handy even when looking at a single project's pipeline,
but is especially valuable when using [multi-project pipelines](https://docs.gitlab.com/ee/ci/multi_project_pipelines.html) - common
when you have a microservices architecture and you
need to run a pipeline to test and deploy code housed in
multiple different project repositories. Now you can get
instant visibility at a glance into the health of all of
your [pipelines on the Operations Dashboard](#pipelines-on-the-operations-dashboard),
no matter where they run.

### Run pipelines against merged results

Over time it’s possible for your source and target branches to diverge, 
which can result in the scenario where both source and target pipelines pass, 
but the combined output fails. Now, you can [run pipelines against the merged result](#pipelines-for-merged-results)
prior to merging. This allows you to quickly catch errors that would only
surface if you had rebased often, allowing for much quicker resolution of pipeline failures 
and more efficient usage of [GitLab Runners](https://docs.gitlab.com/runner/).

### Further streamline collaboration

With GitLab 11.10, we provide even more features to simplify
collaboration and developer workflows. In a [previous release](/releases/2018/12/22/gitlab-11-6-released/#suggested-changes),
we introduced merge request suggestions, allowing a reviewer
to suggest a one-line change in a merge request comment that
can be readily committed from within the comment thread
interface. Our users loved it and wanted more. Now, you can
suggest a [multi-line change](#suggest-changes-to-multiple-lines),
specifying which existing lines to remove, and introducing multiple
lines of additions. Thank you for contributing improvement suggestions!

### And so much more...

So many great features are available in this release, like
[Scoped Labels](#scoped-labels),
a more thorough [Container Registry cleanup](#more-thorough-container-registry-cleanup),
[Composable Auto DevOps](#composable-auto-devops),
and the ability to [purchase additional CI Runner minutes](#purchase-add-on-ci-runner-minutes).
Read on to learn about them all!
