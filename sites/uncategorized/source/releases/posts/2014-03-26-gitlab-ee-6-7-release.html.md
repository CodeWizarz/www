---
title: GitLab Enterprise Edition 6.7 Release
description: "Learn more about GitLab Release 6.7 for Enterprise Edition (EE)"
canonical_path: "/releases/2014/03/26/gitlab-ee-6-7-release/"
date: March 26, 2014
author: Jacob Vosmaer
categories: releases
---
Today we announce the release of [GitLab Enterprise Edition](/pricing/) 6.7.0.
GitLab is an open source code hosting and project management application.
In addition to the [improvements in GitLab Community Edition 6.7](/releases/2014/03/21/gitlab-6-dot-7-released/), GitLab Enterprise Edition 6.7.0 contains the following improvements.

<!--more-->

### Git hooks
GitLab EE now lets you define project rules that can block commits from being pushed.
In GitLab EE 6.7 we have added the following rules:

- Disallow tag removal via git push (`git push origin :mytag`)
- Validate commit messages with regular expressions

[![screenshot](/images/6_7_ee/git_hooks.png)](/images/6_7_ee/git_hooks.png)

Please [contact us](/company/contact/) if you have a need for different hooks.

### LDAP Improvements

- Add support for Active Directory nested LDAP groups:
  GitLab's LDAP group synchronization now also detects nested members of Active Directory groups.
- Improve LDAP sign-in speed by reusing connections to the LDAP server

### Bug fixes

- Fix the save button in the admin group edit screen

Our [subscribers](https://www.gitlab.com/subscription/) can download GitLab 6.7 Enterprise Edition from [GitLab Cloud](https://gitlab.com).

_Update (28 March 2014):_ We have released GitLab Enterprise Edition 6.7.1 which fixes a bug for some LDAP platforms.
