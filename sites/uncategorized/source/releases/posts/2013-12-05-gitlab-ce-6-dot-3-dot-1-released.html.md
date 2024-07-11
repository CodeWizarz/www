---
title: "GitLab 6.3.1 security release"
description: "Learn more about GitLab Security Release 6.3.1 for Community Edition (CE)"
canonical_path: "/releases/2013/12/05/gitlab-ce-6-dot-3-dot-1-released/"
date: 2013-12-05
author: Jacob Vosmaer
categories: releases
community: true
---
### GitLab 6.3.1 security release
We have just released GitLab Community Edition 6.3.1 and GitLab Enterprise Edition 6.3.1 in response to this week's [Ruby on Rails security update 3.2.16](http://weblog.rubyonrails.org/2013/12/3/Rails_3_2_16_and_4_0_2_have_been_released/).
We advise all our users to upgrade to GitLab Community Edition 6.3.1 or GitLab Enterprise Edition 6.3.1 immediately.

<!--more-->

Ruby on Rails security update 3.2.16 addresses four security issues, including [denial of service through memory exhaustion](https://groups.google.com/d/msg/ruby-security-ann/A-ebV4WxzKg/KNPTbX8XAQUJ).

Versions affected: all

Versions fixed: GitLab Community Edition 6.3.1, GitLab Enterprise Edition 6.3.1

### Releases
GitLab Community Edition 6.3.1 is available at [GitLab Cloud](https://gitlab.com/gitlab-org/gitlab-ce) and [GitHub](https://github.com/gitlabhq/gitlabhq).
GitLab Enterprise Edition 6.3.1 is available for subscribers at [GitLab Cloud](https://gitlab.com).
Update instructions can be [found](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/doc/update/patch_versions.md) [here](https://about.gitlab.com/update/).

### Workarounds
Users who cannot upgrade can address the DoS vulnerability by applying a patch based on the workaround provided by Rails in `/home/git/gitlab` with `git am` and restarting GitLab.
