---
title: "Private Runner upgrade required for users of Merge Request Pipelines in GitLab 11.10"
categories: news
author: Jason Yavorksa
author_gitlab: jyavorska
author_twitter: j4yav
description: "All users of Merge Request Pipelines must ensure they are using GitLab Runners > version 11.8."
tags: patch releases, releases
postType: product
twitter_text: "Private Runner upgrade required for users of Merge Request Pipelines in @gitlab 11.10"
---

The 11.10 release, shipping April 22, introduces a [Premium tier](/pricing/premium/) improvement
for [MR Pipelines](https://docs.gitlab.com/ee/ci/merge_request_pipelines/index.html) where we now
build the [combined ref (source + target branch)](https://docs.gitlab.com/ee/ci/merge_request_pipelines/index.html#combined-ref-pipelines)
as part of the merge request pipeline.

Users of MR Pipelines with private GitLab Runners of version 11.8 or older
must upgrade to 11.9 or newer, or you will run into the issue described in [gitlab-ee#11122](https://gitlab.com/gitlab-org/gitlab-ee/issues/11122),
where you receive the error message `Your runner is outdated, please upgrade your runner`. You can upgrade by
following the instructions on the [Runner installation guide](https://docs.gitlab.com/runner/#install-gitlab-runner).
Users of GitLab's shared Runner fleet are not impacted by this issue.

Please let us know in the comments if you run into any issues.
