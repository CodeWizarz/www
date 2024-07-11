---
title: "Introducing Patroni as the Postgres Failover Manager on GitLab.com"
author: Gerardo Lopez-Fernandez
author_gitlab: glopezfernandez
categories: engineering
image_title: '/images/blogimages/gitlab-gke-integration-cover.png'
description: "GitLab.com is introducing Patroni as the Postgres Failover Manager on GitLab.com."
tags: postgres, patroni, failover, high-availability, availability, infrastructure
ee_cta: false
twitter_text: "We're introducing Patroni as the Postgres Failover Manager on GitLab.com"
---

## Upcoming Maintenance Windows for Patroni Deployment

We are writing this post to let our community know we are planning on performing the work necessary 
to deploy [Patroni](https://github.com/zalando/patroni) as the Postgres Failover Manager on GitLab.com over two weekends: a dry-run to test
our migration plan and tools on Saturday, Dec 8, 2018, and the actual deployment on Saturday, December
15, 2018.

During the maintenance windows, the following services will be unavailable:

* SaaS website ([GitLab.com](https://gitlab.com/) will be offline, but [about.gitlab.com](https://about.gitlab.com/) and [docs.gitlab.com](https://docs.gitlab.com/) will still be available)
* Git ssh
* Git https
* registry
* CI/CD
* Pages

### Maintenance Window - Dry run - Saturday, December 8 at 13:00 UTC

We will perform testing and validation of our deployment procedures and tools during this maintenance
window to do final readiness checks. This maintenance window should last 30 minutes.

### Maintenance Window - Actual Cutover - Saturday, December 15 at 13:00 UTC

On the day of the cutover, we are planning to start at 13:00 UTC.  The time window for GitLab.com to be
in maintenance is currently planned to be 30 minutes. Should any times for this change, we will be updating
on the channels listed below. When this window is completed GitLab.com will be running Patroni.

* [GitLab Status page](https://status.gitlab.com/)
* [GitLab Status Twitter](https://twitter.com/gitlabstatus)

