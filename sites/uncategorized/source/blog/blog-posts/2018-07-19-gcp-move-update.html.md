---
title: "Update on our planned move from Azure to Google Cloud Platform"
author: David Smith
author_gitlab: dawsmith
author_twitter: dsmith8641
categories: engineering
image_title: '/images/blogimages/gitlab-gke-integration-cover.png'
description: "GitLab.com is migrating to Google Cloud Platform August 11 – here’s what this means for you now and in the future."
tags: google, cloud native, GKE, kubernetes
ee_cta: false
twitter_text: "We're moving @gitlab from Azure to @GCPcloud"
---

NOTE to users in Crimea, Cuba, Iran, North Korea, Sudan, and Syria: GitLab.com may
not be accessible after the migration to Google. Google has informed us that
there are legal restrictions that are imposed for those countries. See this
[U.S. Department of the Treasury link](http://www.treasury.gov/resource-center/sanctions/Programs/Pages/Programs.aspx)
for more details. At this time, we can only recommend that you download
your code or export relevant projects as a backup. See [this issue](https://gitlab.com/gitlab-com/migration/issues/649)
for more discussion.
{: .alert .alert-warning}

Update as of August 1: There will be a short maintenance window on Saturday, August 4 at 13:00 UTC. We will perform a test of approximately 1 hour.  This will help us verify some of our fixes to make sure the switchover goes as planned.
{: .alert .alert-info}

Update as of July 27: There will be a short maintenance window on Saturday, July 28 at 13:00 UTC. We will perform a short test of approximately 5 minutes.  This will help us verify some of our fixes to make sure our Chef runs work correctly with GitLab.com inaccessible.
{: .alert .alert-info}

Update as of July 24: Following our dry run of the migration on Saturday, July 21, we have rescheduled the migration with a new target date of Saturday, August 11. You can read through [our findings document](https://docs.google.com/document/d/1Y7Cv4BHmHw8djtDBex8opUGs8t0wWmgrueaCocKfYxs/edit?usp=sharing) for all the details.
{: .alert .alert-info}

Improving the performance and reliability of [GitLab.com](/pricing/)  has been a top priority for us. On this front we've made some incremental gains while we've been planning for a large change with the potential to net significant results: running GitLab as a [cloud native](/topics/cloud-native/) application on Kubernetes.

The next incremental step on our cloud native journey is a big one: migrating from Azure to Google Cloud Platform (GCP). While Azure has been a great provider for us, GCP has the best Kubernetes support and we believe will the best provider for our long-term plans. In the short term, our users will see some immediate benefits once we cut over from Azure to GCP including encrypted data at rest on by default and faster caching due to GCP's tight integration with our existing CDN.

## Upcoming maintenance windows for the GCP migration

As an update to [our earlier blog post on the migration](/blog/2018/06/25/moving-to-gcp/), this is a short post to let our community know we are planning on performing the migration of GitLab.com the weekend of ~~July 28~~ August 11 (this has been rescheduled following our dry run on July 21). We have a maintenance window coming up that we would like to make sure everybody knows about.

### What you need to know:

During the maintenance windows, the following services will be unavailable:

* SaaS website ([GitLab.com](https://gitlab.com/) will be offline, but [about.gitlab.com](https://about.gitlab.com/) and [docs.gitlab.com](https://docs.gitlab.com/) will still be available)
* Git ssh
* Git https
* registry
* CI/CD
* Pages

### Maintenance window - Dry run - Saturday, July 21 at 13:00 UTC

As a further update to our testing, we are planning to take a short maintenance window this weekend on Saturday, July 21 at 13:00 UTC to do final readiness checks.
This maintenance window should last one hour.

2018-07-23 UDPATE: Here are the [finding from the maintenance window](https://docs.google.com/document/d/1Y7Cv4BHmHw8djtDBex8opUGs8t0wWmgrueaCocKfYxs/edit). We've decided to push our target date from July 28th to August 11th to comfortably address several issues. We will likely do a small maintenance window on Saturday, July 28th, and another full practice on Saturday, August 4th.

### Maintenance window - Short test - Saturday, July 28 at 13:00 UTC

We will perform a short test of approximately 5 minutes.  This will help us verify some of our fixes to make sure our Chef runs work correctly with GitLab.com inaccessible.


### Maintenance window - Dry run - Saturday, August 4 at 13:00 UTC

We will repeat the dry run exercise again to have a chance to verify our changes to the switchover plan.


### Maintenance window - Actual switchover - Saturday, ~~July 28~~ August 11 at 10:00 UTC

On the day of the migration, we are planning to start at 10:00 UTC.  The time window for GitLab.com to be in maintenance is currently planned to be two hours.  Should any times for this change, we will be updating on the channels listed below. When this window is completed GitLab.com will be running out of GCP.

* [GitLab Status page](https://status.gitlab.com/)
* [GitLab Status Twitter](https://twitter.com/gitlabstatus)

### GitLab Pages and custom domains

If you have a custom domain on [GitLab Pages](https://about.gitlab.com/stages-devops-lifecycle/pages/):

* We will have a proxy in place so you do not have to change your DNS immediately.  
* GitLab Pages will ultimately go to 35.185.44.232 after the July 28 migration.  
* Do not change your DNS to this new address until we have successfully completed the migration.
* We will post an update to our blog about when the cutoff will be for changing DNS from our Azure address to GCP for GitLab Pages.

Should you need support during the migration, please reach out to [GitLab Support](https://about.gitlab.com/support/).

Wish us luck!
