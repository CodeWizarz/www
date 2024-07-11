---
release_number: "12.1"
title: "GitLab 12.1 released with Parallel Merge Trains and Merge Requests for Confidential Issues"
author: Luca Williams
author_gitlab: tipyn
author_twitter: tipyn2903
image_title: '/images/12_1/flamducks.jpg'
description: "GitLab 12.1 released with Parallel Merge Trains, MRs for Confidential Issues, Automated Let's Encrypt certificates for GitLab Pages and much more!"
twitter_image: '/images/tweets/gitlab-12-1-released.png'
categories: releases
layout: release
featured: yes
header_layout_dark: true
---

With GitLab 12.1 we are excited to announce new features
that are unique to GitLab, such as Parallel Merge Trains
and Merge Requests for Confidential issues - along with
long-awaited features like managed Let's Encrypt certificates
for GitLab Pages. Read on to learn more!

## Keep the master branch green at high velocity
{:.intro-header}

Keeping the master branch green is critical for Continuous Delivery. When the production build breaks, it means your new code isn't going live, which impacts users and revenue. The only way to be 100% sure the master branch stays green when new code merges is to run the pipeline using the latest version of the master branch. For teams that have a high volume of merges, this can be difficult or even impossible. In the time it takes the pipeline to complete on one code change, other changes can get merged to master with the potential for conflict. The only way to mitigate this is to queue and sequence the changes so that once a production pipeline starts, other code doesn't get merged ahead of that change. This is why we came up with [Merge Trains](https://docs.gitlab.com/ee/ci/merge_request_pipelines/pipelines_for_merged_results/merge_trains/index.html), and shipped the [first iteration](/releases/2019/06/22/gitlab-12-0-released/#sequential-merge-trains)
in Gitlab 12.0.

Merge Trains make use of GitLab's "[Pipelines for Merged Results](https://docs.gitlab.com/ee/ci/merge_request_pipelines/pipelines_for_merged_results/index.html)" feature. With Pipelines for Merged Results enabled, GitLab automatically creates a separate ref that contains the result of merging the source and target branch. The Merge Request pipeline runs on that result ref rather than just running on the source branch. This way, you know if your code is safe to merge into master or not without needing to rebase continually.

Building on this functionality, Merge Trains then make sure that merges are put in the proper order once they are set to merge into the target branch. The **merge** button in the MR is replaced with a **start/add to merge train** button that adds that merge to the Merge Train queue. Merges are processed in the proper order even if they are coming in at a rapid pace.

Initially, Merge Train pipelines executed sequentially. The previous MR
in the train needed to complete before the pipeline for the next
MR would start, this kept master green, but could slow
things down, especially for projects with long-running pipelines.
Now with GitLab 12.1, we’ve improved Merge Trains to
[run in parallel](#parallel-execution-strategy-for-merge-trains).
Up to four pipelines execute simultaneously including the ref from the previous Merge Request in the train based on the assumption that all
previous Merge Request succeeds. This way, the pipelines only need to re-run if a previous Merge Request fails. Executing Merge Train pipelines in parallel significantly speeds up the process. You can get started with Merge Trains today by enabling Pipelines for Merged Results and enjoy CD with an always-green master branch.

## Iterate privately on sensitive updates
{:.intro-header}

Working publicly in the open is a powerful vehicle for collaboration.
Open source projects with public code, and issue trackers know the benefits of enabling people to contribute regardless of their location. At GitLab we think transparency grants so many benefits that we don’t just make our issues and code public,
but our [business processes](/handbook/values/#transparency)
as well.

Alongside all the things that work great when they are out in
the open are [a few things that are better kept private](/handbook/communication/confidentiality-levels/#not-public). A typical scenario for many public projects is the need to keep security vulnerabilities private while they are being worked on to mitigate risk. Previously, GitLab supported
Confidential Issues in public projects but if you wanted to
create a confidential merge request you needed to coordinate
in a separate, private code repository.

Now, [Merge Requests for Confidential Issues](#merge-requests-for-confidential-issues) is making this a lot easier. Clicking on the
**Create Confidential Merge Request** button on a Confidential Issue allows users to select a private fork within which to create the new branch and merge request, this keeps everything under wraps until
it’s appropriate to reveal it by merging the code from the private
fork back into the upstream public project.

## Get automatic HTTPS certs for Pages using Let’s Encrypt
{: .intro-header}

GitLab Pages is a great way to publish web content, from landing
pages and documentation to project artifacts and reports. Of course,
securing your traffic with HTTPS is a must, but keeping track of
the process to procure, provision, and renew certs can be daunting.
It's even more challenging if you are managing a large number of domains. Not having built-in, supported certificate management meant that many organizations operating at scale wanted to use GitLab Pages, but couldn't.

Many of you in the GitLab community have told us how valuable
[automated Let’s Encrypt certificates for GitLab Pages](#automatic-https-for-pages-with-lets-encrypt) would be.
Today, we’re happy to say this highly-requested feature is
available for use. Now, getting secured web traffic to all of
your GitLab Pages custom domains and subdomains is as simple as
clicking a toggle in your Pages settings.

## And much more!
{: .intro-header}

There are such a lot of great features shipping with GitLab 12.1 that
we couldn’t possibly highlight them all. [Git object deduplication](#git-object-deduplication), and Deploy Boards for Kubernetes clusters
at the [Group](#deploy-boards-for-group-level-kubernetes-clusters)
and [Instance](#deploy-boards-for-instance-level-kubernetes-clusters) level are just a few of the improvements in this release. Keep reading below to get details on every feature along with links to the docs.
