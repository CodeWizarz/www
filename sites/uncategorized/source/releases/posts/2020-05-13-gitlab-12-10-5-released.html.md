---
title: "GitLab Patch Release: 12.10.5 and 12.9.7"
categories: releases
author: John T Skarbek
author_gitlab: skarbek
author_twitter: gitlab
description: "GitLab releases 12.10.5 and 12.9.7"
tags: patch releases, releases
---

Today we are releasing version 12.10.5 and 12.9.7 for GitLab Community Edition and Enterprise Edition.

With the release of GitLab
[12.10.2 and 12.9.5](https://about.gitlab.com/releases/2020/04/30/security-release-12-10-2-released/)
we fixed a security issue that allowed code owner validations to be bypassed if
a change was pushed through the [Web IDE](https://docs.gitlab.com/ee/user/project/web_ide/)
and [File Editor](https://docs.gitlab.com/ee/user/project/repository/web_editor.html)
web interfaces. However, we were notified by customers that fixing that bug
broke a legitimate workflow that was unintentionally made possible by the bug.

To accommodate customers that depended on code owners not explicitly being a
member of the project, such as being in the project's parent group or added as
a shared group to the project (see [this issue](https://gitlab.com/gitlab-org/gitlab/-/issues/32432)
for the ongoing development), we are adding the `skip_web_ui_code_owner_validations` feature
flag:

- *Disable the flag* to fix the security issue and apply code owner validations
  for changes done through the web interface. This is the default behavior.

  **Note:** this could break your approval workflow if it relies on code owners
  being in the parent group of a project without being in the project itself,
  even for changes that are pushed through the `git` command-line interface.

- *Enable the flag* to allow code owners to be in a parent group without being
  in the project explicitly. In this state however, changes pushed through the
  Web IDE or File Editor web interfaces will not require code owner validation.

  **Note:** while the code owner approval requirements can be bypassed, the
  author of the merge request does not gain the ability to merge the request if
  they weren’t already a maintainer. This does not also grant the ability for
  the author of code changes to push their changes using the Web IDE or File
  Editor if they did not already have permissions to do so. You may want to
  review your project member permissions and protected branch settings to
  mitigate any security or compliance issues that may result from enabling this
  feature flag.


## Important notes on upgrading

This version does not include any new migrations, and should not require any
downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-reconfigure`](http://docs.gitlab.com/omnibus/update/README.html) file,
which is only used for [updates](https://docs.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## GitLab subscriptions

Access to GitLab Starter, Premium, and Ultimate features is granted by a paid [subscription](/pricing/).

Alternatively, [sign up for GitLab.com](https://gitlab.com/users/sign_in)
to use GitLab's own infrastructure.
