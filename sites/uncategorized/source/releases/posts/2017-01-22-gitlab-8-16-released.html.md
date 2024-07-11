---
title: "GitLab 8.16 released with auto deploy on Google Kubernetes Engine and Prometheus monitoring as part of GitLab"
categories: releases
author: Job van der Voort
author_twitter: Jobvo
author_gitlab: JobV
image_title: '/images/8_16/pic.jpg'
description: GitLab 8.16 Released with Time Tracking coming to Community Edition and new API, Deploy Keys with write-access, and monitoring with Prometheus
---

We’re on a mission to [make sure everyone can contribute](/company/mission/#mission). That means making [the tools in GitLab](/direction/#scope)
easy to use, easy to set up and easy to maintain. Along the way some of the major steps were the introduction of zero-setup continuous integration (CI), and auto deploy on Kubernetes in [GitLab 8.15](/releases/2016/12/22/gitlab-8-15-released/) last month. This month, we’re leaping into the new year with the
introduction of the next step.

<!--more-->

With GitLab 8.16 we’re not only making idea to production on Kubernetes _much_
more accessible by making it work on Google Cloud, we’re also leaping to the
next step in idea to production: monitoring. From this release onwards, we’ll
be shipping the powerful monitoring tool [Prometheus](https://prometheus.io/).

We found that if you deploy an application, you can't do so in a black hole.
You need to get feedback about the effects of the deployment. You can use this
feedback to revert deployments that cause problems and to get ideas about
future improvements. Adding Prometheus is the first step to make sure you get feedback about system, application, and business metrics as an integrated part of deployments done with GitLab.

This month's Most Valuable Person ([MVP](/community/mvp/)) is
[Markus Koller](https://gitlab.com/toupeira) for his contribution of
[more storage statistics](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7754).
Thanks Markus!

## From Cancun to Production on Google Kubernetes Engine (GKE)

Every nine months all GitLab team-members and their significant others are invited to [our summit](https://gitlab.com/summits/Summit-2017/).
This gives us the opportunity to bond in person and to share our ideas
and ambitions in an informal way. We've just returned from our summit in Cancún, Mexico,
where GitLab CEO Sid gave a keynote on the past, current and future of GitLab:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/xGxLi3PtxHM" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

This was an internal presentation meant for our team members. We share it because transparency is [one of our values](/handbook/values/). It is not a formal announcement, for example we're still evaluating the subscription plans for GitLab.com.

If you don't have the time to watch the full video, have a look at
[44:48][sid-challenge], where Sid gives a challenge to the present team:

> If you are the first one to present the idea to production demo working on Google Kubernetes Engine (GKE) on stage during the Summit, I will dance the Sid Shuffle from *Ice Age 4* on stage out of pure happiness.

If you're not familiar with the Sid shuffle, hold your breath. But first, the
context of the challenge:

[Last month][8.15-post] we showed you a glimpse of the future of development:
in a few minutes from a container scheduler without GitLab to deploying an app to a Kubernetes cluster from a
GitLab instance with auto-scaling CI. This powerful flow was only available
for people using Kubernetes in combination with Openshift, and [people asked](https://gitlab.com/gitlab-org/gitlab-ce/issues/25292) how they could replicate it.

Google Kubernetes Engine is a part of Google Cloud and can be used by anyone –
getting it to work there is a big win for everyone. Motivated by both the
potential for developers around the world and that of seeing Sid dancing,
GitLab's engineers worked hard to make it happen.

You can deploy GitLab 8.16 straight to Google Kubernetes Engine, it will have
auto-scaling CI, auto deploy to your own Kubernetes cluster, Mattermost,
use your private Docker registry and set up certificates using Let's Encrypt:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/3A8mdJl_icM" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

Below is a less polished video of this same demo being given during the summit and Sid being happy and dancing out of excitement. If you want to skip the demo please go to [28:29](https://www.youtube.com/watch?v=39chczWRKws#t=28m29s).

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/39chczWRKws" frameborder="0" allowfullscreen="true"> </iframe>
</figure>

### Details on deploying to GKE

You can do everything shown in the _second_ video
right now [by signing up at Google Cloud][g-cloud] and simply following our
[documentation on idea to production on Google Kubernetes Engine][i2p-gke].

For deploying to Kubernetes, [see our documentation on auto deploy](https://docs.gitlab.com/ee/topics/autodevops/stages.html).

[8.15-post]: /releases/2016/12/22/gitlab-8-15-released/
[g-cloud]: https://cloud.google.com/
[i2p-gke]: https://gitlab.com/gitlab-org/kubernetes-gitlab-demo/blob/master/README.md

We're working to make it even easier for [everyone to replicate idea to production](https://gitlab.com/gitlab-org/gitlab-ce/issues/25986).

[sid-challenge]: https://www.youtube.com/watch?v=xGxLi3PtxHM&feature=youtu.be&t=2688

## Monitoring GitLab with Prometheus

We have outlined an [extensive vision][prom-gitlab] for making world-class monitoring
easier for everyone, and with GitLab 8.16 we have taken our first step towards that goal. In this release we have included [Prometheus][prometheus] and its
[Node Exporter][node-exp] as part of our Omnibus package. This will provide
high-quality, time-series monitoring of your GitLab server's resources.

Both Prometheus and Node exporter are off by default for this release, but we
plan on having them on by default, starting with GitLab version 9.0 that is scheduled for March 22.
To enable monitoring now, simply [enable the features][prom-docs] and
reconfigure GitLab.

After you have enabled Prometheus you can visit `<your_domain_name>:9090` to access the Prometheus console, or connect a compatible dashboard tool such as Grafana.

In the coming months we'll be adding [more charts to the environments pages](https://gitlab.com/gitlab-org/gitlab-ce/issues/26905), for example to see how [a deployment affected memory usage](https://gitlab.com/gitlab-org/gitlab-ce/issues/26944).

[prom-gitlab]: /2017/01/05/prometheus-and-gitlab/
[prometheus]: https://prometheus.io
[node-exp]: https://github.com/prometheus/node_exporter
[prom-docs]: https://docs.gitlab.com/ee/administration/monitoring/prometheus/index.html

## Time Tracking in CE and API

We [introduced][8.14-post] time tracking in GitLab 8.14 Enterprise Edition.
Since its introduction, we've seen massive usage on GitLab.com; and many people
argued that time tracking can also be essential for smaller teams and not just
for enterprises. We heard you and have therefore decided to move time tracking
to GitLab Community Edition with this release.

On top of that, time tracking has now a proper API, which lets you achieve the
same actions you can do with the user interface. This means you can set
estimates and record time spent on issues and merge requests.

[8.14-post]: /releases/2016/11/22/gitlab-8-14-released/

> [Time tracking feature documentation](https://docs.gitlab.com/ee/user/project/time_tracking.html)

> Time tracking API documentation for [merge requests](https://docs.gitlab.com/ee/api/merge_requests.html#set-a-time-estimate-for-a-merge-request)
  and [issues](https://docs.gitlab.com/ee/api/issues.html#set-a-time-estimate-for-an-issue)

## GitLab Pages in 8.17

We [promised to bring GitLab Pages to CE](/releases/2016/12/24/were-bringing-gitlab-pages-to-community-edition/) and [started to work on this](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8463). We expect to ship this next month in GitLab 8.17.

## New issues search and filter interface

If you use issues, you probably have a lot of them.
So we've had the ability to search and filter issues based on different
attributes in GitLab. With 8.16, we've redesigned that interface to be more
natural and intuitive, and modernized the look along the way.
This will also allow us to expand search and filtering with more powerful
features in the future.

![Improved issue search and filters in GitLab 8.16](/images/8_16/issues_search_1.png){: .shadow}

We've started out with issues, but we're planning to bring the new design to
other parts of GitLab soon as well.

![Improved issue search and filters in GitLab 8.16](/images/8_16/issues_search_2.png){: .shadow}

## Removing your approval in EE merge requests

In GitLab Enterprise Edition Starter, you have been able to approve merge
requests. As an approver, clicking approve means that you've committed to that
action. But there are many scenarios where you may want to undo your approval.

![Unapprove merge requests in GitLab 8.16](/images/8_16/approve_merge_request.png){: .shadow}

Perhaps you saw something in the diff that you missed earlier.
Or maybe another approver brings up another point of discussion,
and so the approver wants to remove their approval in the meantime,
and reapply it later.

![Unapprove merge requests in GitLab 8.16](/images/8_16/unapprove_merge_request.png){: .shadow}

With GitLab 8.16 EE, you can now do that. You simply click in the merge request
widget to remove a previously made approval. As expected, system notes in the
merge request thread are recorded and notification emails are sent for both
approving and removing approvals.

![Unapprove merge requests in GitLab 8.16](/images/8_16/email_unapprove_merge_request.png){: .shadow}

Updated approvals are available in GitLab Enterprise Edition Starter, Premium
and on GitLab.com.

## Deploy keys with write access

[Deploy keys][deploy-key-docs] are ideal for giving limited read access to your repository from external sources, for instance for deploys.

We've added the ability to give deploy keys write access. This will allow the
holder of the key to push to your repository, which can be useful for all sorts
of things, such as setting a Git tag on deploys, pushing artifacts to the
repository and more.

By default, deploy keys are read-only and your existing keys are not changed.

Deploy keys with write access was contributed by [Ali Ibrahim](https://gitlab.com/aliibrahim). Thanks Ali!

[deploy-key-docs]: https://docs.gitlab.com/ee/ssh/

## Limit Shared Runner Usage (EE Starter/Premium)

Not only does GitLab CI scale up automatically based on demand,
shared Runners make it incredibly easy to offer CI to your entire organisation.
In fact, it's so easy to offer CI services that we saw a need arise to be able
to limit the usage of those shared resources.

![Limit build minutes usage in GitLab 8.16 EE](/images/8_16/bm1.png){: .shadow}

With GitLab 8.16 Enterprise Edition you can limit build minutes of shared
Runners per group. Once surpassed, pipelines will no longer execute on shared
Runners. This will allow you to prevent over-usage of shared resources when
using GitLab CI.

![Limit build minutes usage in GitLab 8.16 EE](/images/8_16/bm2.png){: .shadow}

> [Read more about the Shared Runners build minutes quota](https://docs.gitlab.com/ee/administration/settings/continuous_integration.html#shared-runners-build-minutes-quota)

## Introduce a new `/merge` slash command for merge requests

[Slash commands][slash-commands] are a very quick way of executing a number of operations on
issues and merge requests in GitLab. Simply type one of the commands in
the description or comment of an issue or merge request and the commands will
be executed on submission.

You can now even merge using a slash command. Type `/merge` and the merge
request will be merged when it's ready, given you have permission to do so.

GitLab has a large number of slash commands, [view them all here][slash-commands].

[slash-commands]: https://docs.gitlab.com/ee/user/project/quick_actions.html

## Streamlining project settings and navigation

Here at GitLab we iterate quickly. So every now and then we revisit and
streamline our settings and navigation to accommodate.

In GitLab 8.15, the project settings dropdown menu had
many items. Furthermore, it's confusing that the menu itself is
located far away from the rest of the tabbed navigation toward the center of
the page. In the next few releases, we will be streamlining that navigation,
and combining settings pages appropriately.

![Improved settings navigation in GitLab 8.16](/images/8_16/settings_new.png)

With 8.16 we are just starting, by combining the `Members` and `Groups` menu
items into just one, called `Members`. Navigating to that page will show the
two previous pages combined into one. Similarly, we combined `Webhooks` and
`Services` together into `Integrations`.

## Record and show last used date of SSH Keys

If you have uploaded several SSH keys, it can be hard to tell which
you've been using most recently.

GitLab will now report when a SSH has been used last. Find this information
in your profile, under keys: `/profile/keys`.

Thanks [Vincent Wong](https://gitlab.com/wingyu) for contributing this useful feature!

## Storage statistics

Okay, we admit it, we do our best to make it easy to use a lot of disk space:
You can use GitLab to store your build artifacts, your docker images,
LFS objects, Git objects, and more.

To make it a bit easier to see _where_ you are using all this disk space,
GitLab will now report per project and group how much space is being used
and by what (repository, artifacts (includes Docker images) or LFS).

![See how storage is being used in GitLab 8.16](/images/8_16/storage_usage.png){: .shadow}

Thanks to this month's MVP [Markus Koller](https://gitlab.com/toupeira) for contributing this feature!

## GitLab Runner

We are also releasing GitLab Runner 1.10 today. The most interesting changes:

- Add termination grace period for Kubernetes executor [!383](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/383)
- Add configuration options for Kubernetes resource requests [!391](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/391)
- Add poll interval and timeout parameters for Kubernetes executor [!384](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/384)
- Pass ImagePullSecrets for Kubernetes executor [!449](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/449)
- Add Namespace overwrite possibility for Kubernetes executor [!444](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/444)
- Add support for GIT_SUBMODULE_STRATEGY [!443](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/443)
- Add Prometheus metric that counts number of catched errors [!439](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/439)
- Update Docker Machine in official Runner images to v0.9.0 [!454](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/454)
- Add '--run-tagged-only' cli option for runners [!438](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/438)
- Add armv6l to the ARM replacements list for docker executor helper image [!446](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/446)

To see the full list of all changes please read [the Runner's CHANGELOG file](https://gitlab.com/gitlab-org/gitlab-runner/blob/v1.10.0/CHANGELOG.md).

## GitLab Mattermost 3.6

GitLab 8.16 includes [Mattermost 3.6](https://about.mattermost.com/mattermost-3-6), [an open source Slack-alternative](https://about.mattermost.com/) whose newest release offers improved multi-team deployment, an early version of emoji reactions, an improved command line interface and much more.

This version includes [security updates](http://about.mattermost.com/security-updates/) and upgrade is recommended.

## Amazing community contributions

For 8.16, we merged 50 merge requests from the community, including new
features, bug fixes, or even backstage improvements!

The most noticeable contributed changes are as follows (some were highlighted above):

- Allow to add deploy keys with write-access. [!5807]
- Allow to use `+` symbol in snippet filenames. [!6644]
- Order projects by latest activity in the "Go to a project" quick switcher. [!7737]
- Introduce a new `/merge` slash command for merge requests. [!7746]
- Add storage statistics for build artifacts, and LFS objects. [!7754]
- Log LDAP blocking/unblocking events to application log. [!8042]
- Allow to use ENV variables in the Redis config. [!8073]
- Record and show last used date of SSH Keys. [!8113]
- Add support for PlantUML diagrams in Asciidoc. [!8537]
- Expire related caches after changing HEAD. [!8584]
- Autoresize markdown preview. [!8607]

[!5807]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/5807
[!6644]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/6644
[!7737]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7737
[!7746]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7746
[!7754]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7754
[!8042]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8042
[!8073]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8073
[!8113]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8113
[!8537]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8537
[!8584]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8584
[!8607]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8607

## Omnibus GitLab package changes

### PostgreSQL version upgrade

As mentioned [in the 8.15 release post](/releases/2016/12/22/gitlab-8-15-released/#postgresql-version-upgrade),
omnibus-gitlab packages are equipped with `gitlab-ctl pg-upgrade` tool.
This tool will upgrade the bundled PostgreSQL database version.

Please plan the upgrade ahead of GitLab 9.0 release (scheduled for Mar. 22, 2017).

The omnibus-gitlab packages for GitLab 9.0 will prevent upgrades until the database
is upgraded.

> [Read more about database upgrade in our docs](https://docs.gitlab.com/omnibus/settings/database.html#upgrade-packaged-postgresql-server)


> Ran into issues? Create an issue at the [omnibus-gitlab issue tracker](https://gitlab.com/gitlab-org/omnibus-gitlab/issues),
and reference it in the [upgrade problems meta issue.](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1783)

### Reduced package size

When you download the omnibus-gitlab 8.16 package you might notice the reduced
package size. Do not be alarmed, this is intentional.
Even with the new addition of monitoring in the package, the size was reduced
by almost 50MB!
[We've been working](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1778)
and will continue working on further size optimizations of the package.

## Other changes

This release has more improvements, including security fixes. Please check out
[the changelog] to see all the named changes.

[the changelog]: https://gitlab.com/gitlab-org/gitlab-ce/blob/master/CHANGELOG.md

## Performance Changes

* Refactored note edit form to improve frontend performance on MR and Issues pages, especially pages with has a lot of discussions in it [8356](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8356)
* Reduce DB-load for build-queues by storing last_update in Redis [8084](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8084)

## Upgrade barometer

This release requires downtime.

This release migrates project related statistics to a separate table, removing
existing columns in the process. This migration process requires downtime,
and can take 10-15 minutes for large installations.

### Note

We assume you are upgrading from the latest version. If not, then also consult the upgrade barometers of any intermediate versions you are skipping.
If you are upgrading from a GitLab version prior to 8.0 *and* you have CI enabled, you have to upgrade to GitLab 8.0 [first](/releases/2015/09/22/gitlab-8-0-released/).

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

----

## Installation

If you are setting up a new GitLab installation please see the
[download GitLab page](/install/).

## Updating

Check out our [update page](/update/).

## Enterprise Edition

The mentioned EE-only features and things like LDAP group support can be found in GitLab Enterprise Edition Starter and Premium.
For a complete overview please have a look at [all GitLabs products](/stages-devops-lifecycle/).

Access to GitLab Enterprise Edition is included with a
[subscription](/stages-devops-lifecycle/).
No time to upgrade GitLab yourself?
A subscription also entitles you to our upgrade and installation services.

----
