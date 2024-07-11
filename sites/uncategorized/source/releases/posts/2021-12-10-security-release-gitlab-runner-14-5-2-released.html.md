---
title: "GitLab Runner Critical Security Release: 14.5.2, 14.4.2, and 14.3.4"
description: "Learn more about the Critical Security Release: 14.5.2, 14.4.2, and 14.3.4 for GitLab Runner."
canonical_path: "/releases/2021/12/10/security-release-gitlab-runner-14-5-2-released/"
categories: releases
author: Vitor Meireles De Sousa
author_gitlab: vdesousa
image_title: '/images/blogimages/security-cover-new.png'
tags: security
---

Today we are releasing versions 14.5.2, 14.4.2, and 14.3.4 for GitLab Runner.

These versions contain important security fixes and we strongly recommend that all GitLab Runner installations for both GitLab.com and self-managed instances be upgraded to one of them immediately. This critical security release is for two security vulnerabilities that have been assigned a CVSS with medium severity, but that have a critical impact on GitLab.com users.

GitLab.com Shared Runners are already running the patched version.

We estimate that the number of self-managed GitLab Runner installations vulnerable to these exploits to be small due to a very specific combination of settings required to take advantage of this vulnerability. Even so, again: we strongly recommend that all GitLab Runner installations be upgraded to one of these versions immediately. 

We are dedicated to ensuring all aspects of GitLab that are exposed to customers or that host customer data are held to the highest security standards. As part of maintaining good security hygiene, it is highly recommended that all customers upgrade to the latest security release for their supported version. You can read more [best practices in securing your GitLab instance](/blog/2020/05/20/gitlab-instance-security-best-practices/) in our blog post.

### Recommended Action
We strongly recommend that all installations running a version affected by the issues described below are upgraded to the latest version as soon as possible.

## Table of Fixes

|Title|Severity|
|---|---|
|[Specially crafted docker images can exhaust resources on managers](#Specially-crafted-docker-images-can-exhaust-resources-on-managers)|medium|
|[Golang vulnerability CVE-2021-44717: don’t close fd 0 on ForkExec error](#Golang-vulnerability-CVE-2021-44717-dont-close-fd-0-on-ForkExec-error)|medium|

## Specially crafted docker images can exhaust resources on managers

An uncontrolled resource consumption vulnerability in GitLab Runner affecting all versions starting from 13.7 before 14.3.4, all versions starting from 14.4 before 14.4.2, all versions starting from 14.5 before 14.5.2, allows an attacker triggering a job with a specially crafted docker image to exhaust resources on a runner manager. This is a medium severity issue (`CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H`, 6.5). It is now mitigated in the latest release and is assigned [CVE-2021-39939](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39939).

This vulnerability was discovered internally by the GitLab team.

### Temporary workaround

A temporary workaround, in cases when GitLab Runner can't be updated immediately, would be to disable the `FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR` feature flag in Runner's `config.toml` configuration file. This will turn off the vulnerable feature and make it impossible for users to turn it on from the job level.

1. Open the `config.toml` file of the Runner that you want to update.

1. In each `[[runners]]` section add:

    ```toml
    [runners.feature_flags]
      FF_DISABLE_UMASK_FOR_DOCKER_EXECUTOR = false
    ```

1. Save the file and exit.

After that, the runner's process should detect the change and start applying the configuration within a minute. For this configuration change, restarting the GitLab Runner process is not required.

## Golang vulnerability CVE-2021-44717: don’t close fd 0 on ForkExec error

All previous versions of GitLab Runner were susceptible to [Golang security issue CVE-2021-44717: don’t close fd 0 on ForkExec error](https://groups.google.com/g/golang-announce/c/hcmEScgc00k?pli=1), which could result in misdirected I/O such as writing network traffic intended for one connection to a different connection, or content intended for one file to a different one. This is a medium severity issue (`CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:U/C:H/I:N/A:N`, 5.3). It is now mitigated in the latest release and is assigned [CVE-2021-39947](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-39947).

This vulnerability was discovered internally by the GitLab team.

### Temporary workaround

A temporary workaround, in cases when GitLab Runner can't be updated immediately, would be to increase the file descriptor limit set for the runner process. However, this is dependent on how it's specifically configured and deployed.

Please keep in mind that updating the file descriptors limit requires restarting the runner process. To do that without interrupting any running jobs one should send a `SIGQUIT` signal to the runner process. This will initiate a graceful shutdown, during which the runner will not accept any new jobs but will finish all the jobs that were already started before exiting.

The ability to determine the best value for the file descriptors limit will vary depending on the load that the runners are handling and their specific configuration. Setting the limit at 50 for each potential job that can run concurrently on the runner manager is a good starting point. However, to find the best value we highly recommend monitoring the runner process and the number of file descriptors that it uses and adjust as needed depending on the specific needs.

## Updating

To update GitLab, see the [update page](/update/).
To update Gitlab Runner, [find your installation method and steps for updating here](https://docs.gitlab.com/runner/install/).

## Receive Security Release Notifications

To receive security release blog notifications delivered to your inbox, visit our [contact us](https://about.gitlab.com/company/contact/) page.
To receive release notifications via RSS, subscribe to our [security release RSS feed](https://about.gitlab.com/security-releases.xml) or our [RSS feed for all releases](https://about.gitlab.com/all-releases.xml).
