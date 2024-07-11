---
release_number: "9.1"
title: "GitLab 9.1 released with Service Desk, Canary Deployments, and Burndown Charts"
author: Victor Wu
author_gitlab: victorwu
author_twitter: victorwu416
image_title: '/images/9_1/9_1-cover-image.jpg'
description: "GitLab 9.1 Released with Service Desk, Canary Deployments, Burndown Charts, and much more!"
twitter_image: '/images/tweets/gitlab-9-1-released.png'
categories: releases
extra_css:
  - release-posts.css
extra_js:
  - release-posts_former_ce_ee.js
---

{::options parse_block_html="true" /}

<section class="release-post-section">
GitLab is designed to provide you *actionable feedback* in different stages of your
application lifecycle, and on different timescales.

With 9.1, GitLab introduces [Canary Deployments](#canary-deployments-eep). This allows you
to deploy new code to a small portion of your fleet, providing you an opportunity
to revert with minimal impact if something goes wrong. If a problem is detected, you
can quickly revert, minimizing the impact on your users. This is *immediate production feedback*.

<!-- more -->

As you expand your software products, GitLab's new [Service Desk](#service-desk-eep)
feature in 9.1 enables your growing user base to send emails to your team via a dedicated
address per project for any kind of feedback or support. These show up as GitLab confidential
issues in your project. Commenting on them responds back to the original email sender,
creating a brand new *integrated user feedback channel* right inside GitLab.

GitLab 9.1 also introduces [Burndown Charts](#burndown-charts-ees), giving you *team development feedback*.
As a team, you can now visualize and track the pace of issue completion throughout
a milestone, giving you information to continuously make improvements in your processes
over time.

[Heroku recently blogged](https://twitter.com/sytses/status/854453516672225280) that GitLab CI (fully integrated into GitLab itself) has now
surpassed Travis CI in popularity based on Stack Overflow question popularity.
Google Trends also [shows the same](https://trends.google.com/trends/explore?q=Travis%20CI,GitLab%20CI).
In addition, GitLab is now [used by two-thirds of the self-managed market](http://blog.bitrise.io/2017/01/27/state-of-app-development-in-2016.html#self-hosted).
Thank you for the support! 👏 🙏

[Join us for an upcoming event!](/events/){:.btn .btn-lg .btn-red .webcast-button}
{:.text-center}
</section>

<section class="mvp gray-section">
<div class="release-post-section">

![mvp-badge](/images/mvp_badge.png)

## This month's Most Valuable Person ([MVP](/community/mvp/)) is [Maxim Rydkin](https://gitlab.com/innerwhisper)

Maxim [created a configuration setting](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9362) to
[automatically cancel pending pipelines if they are redundant](#auto-cancel-redundant-pipelines-ce-ee).
This is extremely helpful for when you push a change to GitLab, but want to quickly
push another small tweak shortly after.
This helps reduce time and precious system resources by canceling the unnecessary
pipelines.
Thank you Maxim!
</div>
</section>

<section class="release-post-section">
## Service Desk eep

Service Desk is a powerful new feature that allows your team to connect directly with
any external party through email right inside of GitLab; no external tools required.
The ongoing and bi-directional conversation ensures that any user feedback is not
corrupted, helping you build the right features to solve your user's real problems.

Your customers or anyone in contact with the people in your project can email bugs,
feature requests, or any other general feedback directly into your GitLab project.
In turn, any GitLab users can respond straight from the project.

As Service Desk is built right into GitLab itself, the complexity and inefficiencies
of multiple tools and external integrations are eliminated, significantly shortening
the cycle time from feedback to software update.

![Service Desk 1](/images/9_1/service_desk_issue.png){: .shadow}

Simply turn on the feature in a project's settings, and you are provided a unique
email address to share with your users. Every time a user emails in feedback to that
address, GitLab automatically creates a confidential issue in that project. Subsequently,
your team adds comments to the issue, which automatically emails back the user. The
user can continue to follow up with responses in the email thread, and the entire
conversation is reflected inside the comment thread of the confidential issue.

Your team stays inside that one confidential issue the whole time, enabling you to
leverage all the exiting powerful features of GitLab issue management as part of your
regular development workflows.

![Service Desk 2](/images/9_1/service_desk_setting.png){: .shadow}

Pro tip: Once you've deployed a new feature or bug fix to address a user's feedback,
simply leave a comment in the confidential issue to inform the user that you've solved
their problem.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Service Desk](https://docs.gitlab.com/ee/user/project/service_desk.html) in our docs.
</section>

----

<section class="release-row">
<div class="column">
## Canary Deployments eep

When embracing [Continuous Delivery](https://en.wikipedia.org/wiki/Continuous_delivery),
a company needs to decide what type of deployment strategy to use. One of the most
popular strategies is Canary Deployments, where a small portion of the fleet is
updated to the new version first. This subset, the canaries, then serve as the proverbial
[canary in the coal mine](https://en.wiktionary.org/wiki/canary_in_a_coal_mine).
If there is a problem with the new version of the application, only a small percentage
of users are affected and the change can either be fixed or quickly reverted.

With GitLab 9.1 we are proud to announce first class support for
Canary Deployments on Kubernetes. For projects using
[Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/stages.html),
get started in less than a minute by simply switching to the updated Auto Deploy template.
Documentation is also available to walk through [adding a canary stage](https://docs.gitlab.com/ee/user/project/deploy_boards.html#canary-deployments) for those
who have written their own pipelines. As the pipeline executes Deploy Boards will
clearly mark canary pods, enabling quick and easy insight into the status of
each environment and deployment.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Canary Deployments](https://docs.gitlab.com/ee/user/project/deploy_boards.html#canary-deployments) in our docs.
</div>
<div class="column">
![image](/images/9_1/canary_deployments.png){: .shadow}
</div>
</section>

----

<section class="release-row image-left">
<div class="column text-column">
## Burndown Charts ees eep

We envision GitLab increasingly being able to help you to track and manage your work.
With this release, we are introducing burndown charts for projects.
This visualization helps you see how many issues are still incomplete as you progress
through a milestone, day by day.
You can see the remaining amount of issues (and even cumulative issue weight) "burndown"
over time, allowing you to make decisions earlier (on say, resources and scope) if
you see risks emerging from the chart.

Any project milestone has a burndown chart as long as the milestone's start date
and due date are set.
It's conveniently located on the milestone page itself and indicates how many issues
(associated with that milestone) were or are still open for a given day in the milestone period.
The burndown chart can also be toggled to display the cumulative open issue weight for a given day.

When using this feature, make sure your weights have been properly assigned, since
an open issue with no weight would contribute zero to the cumulative value.
We also took this opportunity to revamp the milestone page itself, simplifying the
look and feel to be more in line with the rest of GitLab.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Burndown Charts](https://docs.gitlab.com/ee/user/project/milestones/#burndown-charts) in our docs.
</div>
<div class="column image-column">
![Burndown Chart](/images/9_1/burndown_chart.png){: .shadow}
</div>
</section>

----

<section class="release-row">
<div class="column">
## Protected Tags ce ees eep

Tags can quickly get out of hand and, depending on your workflow, you might want to control who can create or update tags. Protected Tags in GitLab 9.1 does just that, making it easy to prevent tags from being created or updated.

Using a very similar approach to [protected branches](https://docs.gitlab.com/ee/user/project/protected_branches.html), you can now control this easily for any of your projects. Much like protected branches, you can define who is able to create tags and use wildcard matching on your rules too.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [protected tags](https://docs.gitlab.com/ee/user/project/protected_tags.html#protected-tags) in our docs.
</div>
<div class="column">
![Restrict Tags](/images/9_1/protect-tags.png){: .shadow}
</div>
</section>

----

<section class="release-row image-left">
<div class="column text-column">
## Recent Searches ce ees eep

To quickly access frequent searches in issues and merge requests, we've added a convenient
dropdown menu that stores your most recent ones.
They are stored locally in your browser, with no manual configuration required.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Recent Searches](https://docs.gitlab.com/ee/user/search/#search-history) in our docs.
</div>
<div class="column image-column">
![Recent Searches](/images/9_1/recent_searches.png){: .shadow}
</div>
</section>

----

<section class="release-row">
<div class="column">
## Discussions in Merge Requests and Issues ce ees eep

In merge requests, you've been able to start resolvable discussions by commenting
on a code diff. Starting in this release, you can start a resolvable discussion
in the main comment thread itself, without referring to any specific line of code.

This is very useful if you have concerns about the entire merge request, and want
to leverage the existing features of
[discussion resolution](https://docs.gitlab.com/ee/user/discussions/#resolvable-discussions).

In this release, we've applied this threaded concept to issue comments too.

Collaboration in issues are meant to be a free-flowing exchange of ideas.
So, we've chosen to simply implement discussions in issues (without the
concept of resolvability).

It will allow collaboration within GitLab to be even more flexible, but still
provide the structure for organization and review of ideas.

Since collaboration also happens in commits and snippets, the same feature is
also available in those places too.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [discussions in merge requests and issues](https://docs.gitlab.com/ee/user/discussions/) in our docs.
</div>
<div class="column">
_Resolvable discussions in merge requests:_
![Merge Request Resolvable Discussion](/images/9_1/merge_request_resolvable_discussion.png){: .shadow}

_Discussions in issues:_
![Issue Discussion](/images/9_1/issue_discussion.png){: .shadow}
</div>
</section>

----

<section class="release-row image-left">
<div class="column text-column">
## Resolve Merge Request Discussion with New Issue ce ees eep

In merge requests, you've been able to [resolve all discussions at once by
creating a new issue](https://docs.gitlab.com/ee/user/discussions/#move-all-unresolved-discussions-in-a-merge-request-to-an-issue).
This is extremely helpful to defer problems but not lose track of them.

In this release, we are providing more flexibility and granularity. You can now
resolve one individual discussion into a new issue, allowing you defer some problems
for later, and focus on the ones you need to solve now for this merge request.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [resolving merge requests discussions with a new issue](https://docs.gitlab.com/ee/user/discussions/#moving-a-single-discussion-to-a-new-issue) in our docs.
</div>
<div class="column image-column">
![Issue From Unresolved Discussion](/images/9_1/issue_from_unresolved_discussion.png){: .shadow}
</div>
</section>

----

<section class="release-row">
<div class="column">
## Microsoft Teams Integration ce ees eep

We want GitLab to be the most complete solution to get from idea to production
as quickly as possible. This means integrating into where conversation happens
and ideas are formed, be it Mattermost, Slack or Microsoft's new Teams solution.

Our first integration with Microsoft Teams introduces the ability to add
notifications for actions that happen on GitLab into a room on Microsoft
Teams using [Office 365 Connectors](https://msdn.microsoft.com/en-us/microsoft-teams/connectors).

Any time you push to a project, create or update an issue or merge request
you can be notified in Teams. Want the output of your CI Pipeline - yip, that too!

You'll get a beautiful card in your room with all of the details on the
action performed, and links to jump into GitLab and find out more about
what's been happening.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Microsoft Teams Integration](https://docs.gitlab.com/ee/user/project/integrations/microsoft_teams.html) in our docs.
</div>
<div class="column">
![Microsoft Teams](/images/9_1/microsoft-teams.png){: .shadow}
</div>
</section>

----

<section class="release-row image-left">
<div class="column text-column">
## Easier File Templates ce ees eep

For a long time, we've had the ability to create file templates in GitLab.
For example, if you wanted to create a file for configuring Continuous Integration,
you could use a [.gitlab-ci.yml](https://docs.gitlab.com/ee/ci/yaml/) file. These
templates are now much easier to use in GitLab 9.1.

When creating a new file or editing a file, you will now see a list of all
template types and template options as you can see in the screenshot below.
Changing a file template will replace the entire contents of the file in the editor,
but don't worry, you can always undo this and get back to where you were!

</div>
<div class="column image-column">
![Easier Templates](/images/9_1/easier-templates.png){: .shadow}
</div>
</section>

----

<section class="release-row">
<div class="column">
## Issue Title Auto Update ce ees eep

As you use GitLab with a large number of users, data is constantly changing. With
this release, issue titles automatically update with no page refresh necessary.

Many parts of the issue page and GitLab as a whole need improvements in this regard,
and we plan to do work on these in the coming releases.
</div>
<div class="column">
![Issue Title Auto Update](/images/9_1/issue_title_realtime_update.gif){: .shadow}
</div>
</section>
----
<section class="release-row image-left">
<div class="column text-column">
## Application Monitoring UX Improvements ce ees eep

A number of minor changes have been made to application monitoring workflow, polishing the experience and making it easier to use.
We now have a beautiful getting started screen, can report additional troubleshooting information, and linked the performance charts to name just a few!
</div>
<div class="column image-column">
![Monitoring UX Improvements](/images/9_1/monitoring_ux.png){: .shadow}
</div>
</section>

<div class="release-post-section text-center zero-bottom-margin">
## Other Improvements in GitLab 9.1
</div>

<section class="release-row align-top divider">
<div class="column">
### Simplified Approvals Settings ees eep

Merge request approvals allow you to block merges until the specified qualified users
or groups (and the number of them) have signed off (approved) them.
This is a crucial step of code review in many organizations.
As we continue to iterate on new functionality, we are simplifying the interface in
the project settings with this release, laying a foundation for high usability for
more powerful features in the future.

![Approvals](/images/9_1/approvals.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/) in our docs.

### Improvements to Disaster Recovery in Alpha eep

GitLab 9.1 ships with improvements to the Disaster Recovery feature
that we've released in [GitLab 9.0 in Alpha](/releases/2017/03/22/gitlab-9-0-released/#disaster-recovery-alpha-eep).

We've made it easier for [developers to work on the feature itself](https://gitlab.com/gitlab-org/gitlab-development-kit/merge_requests/270).
We've also reduced the number of [steps required to set up Geo](https://gitlab.com/gitlab-org/gitlab-ee/issues/1664).

Finally, we've added support for replicating the following types of files saved on disk: issue, merge request, and comment attachments, as well as user, group, and project avatars. We plan to [continue working actively on Disaster Recovery](https://gitlab.com/gitlab-org/gitlab-ee/issues/846) in the coming releases.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Disaster Recovery in Alpha](https://docs.gitlab.com/ee/administration/geo/disaster_recovery/index.html#gitlab-geo-disaster-recovery) in our docs.

### Pipeline mini-graph added to Commit View ce ees eep

Pipeline mini-graphs now show in the system information box in commit views. Previously they were only shown in merge request views.

![Pipeline mini-graph](/images/9_1/mini_graph.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [pipelines](https://docs.gitlab.com/ee/ci/pipelines/index.html#pipelines) in our docs.

### Notifications for Successful Pipeline now Off by Default ce ees eep

We have changed the behavior of pipeline notifications in GitLab 9.1,
to reduce chatter and allow users additional control.
Notifications for successful pipelines will now be off by default,
and can be re-enabled by setting the notification level to Custom and
selecting `Successful pipeline`.
Additionally when selecting custom notifications for successful pipelines,
only the initiator of the pipeline will receive an email.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [pipeline notifications](https://docs.gitlab.com/ee/user/profile/notifications.html#notification-events) in our docs.

### System Note Icons ce ees eep

As we add more features into GitLab, the historical view of system actions
recorded in the discussion threads of issues and merge requests becomes
increasingly important to know what has changed recently and further in the past.

With this release, we are introducing icons next to system notes, to allow you to
easily demarcate system actions versus user comments. And this also allows you
to scan quickly through a long discussion thread and get a quick high-level
sense of how an object has evolved over time.

![System Notes](/images/9_1/system_notes.png)

### Usage Ping ce ees eep

We’ve added the [usage ping](https://docs.gitlab.com/ee/administration/settings/usage_statistics.html#usage-ping),
already present in GitLab Enterprise Edition since version
[8.10](/releases/2016/07/22/gitlab-8-10-released/#usage-ping-ee-only),
to **GitLab Community Edition**.

In the coming months, this will enable you to see
how your cohort usage compares to that of everyone else using GitLab.
[See the issue on this effort](https://gitlab.com/gitlab-org/gitlab-ce/issues/30469) and
[the background of this project](https://gitlab.com/gitlab-org/gitlab-ce/issues/31192).
You can see the exact payload that is being sent every week in **admin** > **cohorts**.
You can opt-out in **admin** > **settings**.

![Usage Ping optout](/images/9_1/usage_ping_optout.png){: .shadow}

![Usage Ping JSON](/images/9_1/usage_ping_json.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [usage ping](https://docs.gitlab.com/ee/administration/settings/usage_statistics.html#usage-ping) in our docs.

### Issue Boards Focus Mode ees eep

[Issue Boards](/stages-devops-lifecycle/issueboard/) are a great solution for planning and managing issues that are being
worked together by a team, allowing you to track them as they move from stage to stage
in your workflow.

With this release, we are introducing focus mode in Issue Boards, which hides the
navigation UI when toggled on.

This is helpful for co-located teams, when many folks are looking at a large screen
together during a collaboration session.
Just click the button at the top right of a board to toggle it on and off.

![Issue Board Focus Mode](/images/9_1/issue_board_focus_mode.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Issue Boards](https://docs.gitlab.com/ee/user/project/issue_board.html) in our docs.

### Projects with Multiple Docker Images ce ees eep

In some situations, developers can create multiple containers based upon
the same code base. This can occur when building a container in an earlier stage
to be consumed in a later stage, or when packaging different versions of dependencies.

As part of GitLab 9.1 the Container Registry now supports multiple image names
for a single project, allowing a simple way to store a project's multiple containers.

For example storing both `registry.example.com/group/project/core:latest` and
`registry.example.com/group/project/dependencies:latest` is now supported.

Thanks [André Guedes](https://gitlab.com/andrebsguedes) for the fantastic contribution!

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Container Registry](https://docs.gitlab.com/ee/user/packages/container_registry/index.html#gitlab-container-registry) in our docs.

<!-- end of left column -->
</div>
<div class="column">

### Auto-cancel Redundant Pipelines ce ees eep

In situations where a number of commits occur within a short time period,
it is possible for multiple pipelines to be queued for the same branch.
Since pipelines are generally processed on a first come first serve basis,
pipelines will be ran for older commits first, even if they've already been
replaced. This can introduce delays in determining if the current branch is
passing tests, and is an inefficient use of CI runners.

With GitLab 9.1, pipelines for older commits (specifically non-HEAD commits)
can now be automatically cancelled when a new pipeline is triggered for the
same branch; efficiently processing the queue and reducing the delay
in running the new (HEAD) pipeline.

Only pending pipelines that haven't started running yet will be auto-cancelled.
Any pipeline running when a new push comes in will continue to run until it finishes normally.

If you want to enable this behavior, you can turn it on in the project's CI/CD Pipelines settings. Auto-cancellation will be on by default in a subsequent release.

![Redundant Pipelines Cancelled](/images/9_1/cancel_pipelines.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [automatically cancelling redundant pipelines](https://docs.gitlab.com/ee/user/project/pipelines/settings.html#auto-cancel-pending-pipelines) in our docs.

### Scheduled Pipelines Triggers ce ees eep

With GitLab 9.1, we have added alpha support for scheduling a pipeline to run on a periodic basis. For example a daily pipeline can be run to check upstream dependencies, or to create a nightly package for broader testing. To configure a scheduled pipeline add a [Pipeline Trigger](https://docs.gitlab.com/ee/ci/triggers/), edit it, and then enable `Schedule trigger`. Scheduling is set using the [cron format](https://en.wikipedia.org/wiki/Cron).

![Scheduled Pipeline Trigger](/images/9_1/ci_schedule_trigger.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [scheduled pipeline triggers](https://docs.gitlab.com/ee/ci/pipelines/schedules.html) in our docs.

### Improved Support for Jobs with Large Log Sizes ce ees eep

As part of our continued focus on improving performance, we have made
optimizations to how large job logs are handled. GitLab 9.1 will now only
display the last 500kb of a log when viewing a job, significantly improving
the responsiveness of the page and reducing bandwidth consumption.

Because errors in a CI job typically occur near the end, it is often unnecessary
to send and display the entire log. This is especially important for larger
projects like Android, where a single job log can exceed 60mb. If further
analysis is needed, the complete log can always be downloaded by
clicking on the **Download** button.

### Auto Deploy Enhancements ce ees eep

Along with support for [canary deployments](#canary-deployments-eep), we have made two other important enhancements to [Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/stages.html). First, we have added alpha support for applications that require a database, by automatically [provisioning PostgreSQL](https://docs.gitlab.com/ee/topics/autodevops/stages.html#postgresql-database-support) by default. Variables can be used to customize the credentials and database name, or if you'd like you can disable Postgres by setting `DISABLE_POSTGRES` to `yes`. Experimental support for [private projects](https://docs.gitlab.com/ee/topics/autodevops/stages.html#private-project-support) has also been added, allowing Kubernetes to authenticate and download the app's container from the GitLab Container Registry.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about Auto Deploy's [private project](https://docs.gitlab.com/ee/topics/autodevops/stages.html#private-project-support) and [PostgreSQL database](https://docs.gitlab.com/ee/topics/autodevops/stages.html#postgresql-database-support) support, and important limitations, in our docs.=

### Pipeline list now refreshes automatically ce ees eep

As part of our on-going commitment to ensure our user experience is delightful, we have updated the pipeline overview page to refresh automatically. We will continue to update additional worfklows in subsequent releases, reducing the need to manually refresh.

![Pipeline List Auto Refresh](/images/9_1/pipeline_refresh.png){: .shadow}

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [pipelines](https://docs.gitlab.com/ee/ci/pipelines/index.html#pipelines) in our docs.

### Elasticsearch Improvements ees eep

GitLab 9.1 EE introduces an experimental [repository indexer](https://gitlab.com/gitlab-org/gitlab-elasticsearch-indexer).
This is a complete rewrite that's four times faster! To enable it, just check the
box in the admin panel:

![Elasticsearch Indexer](/images/9_1/elasticsearch_indexer.png){: .shadow}

Send us your feedback - it should become the default indexer in the next few releases.
In addition, admins and auditors can now make use of global search functionality when
Elasticsearch is enabled, and code search results are highlighted again.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Elasticsearch](https://docs.gitlab.com/ee/integration/elasticsearch.html#enable-elasticsearch) in our docs.

### GitLab Runner 9.1 changes ce ees eep

We're also releasing GitLab Runner 9.1 today.

#### Most interesting changes

* Extended verify command with runner selector ([merge request](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/532))
* Add log_level option to config.toml ([merge request](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/524))
* Fix cache containers discovering regression ([merge request](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/534))
* Cleanup and rename docker machine provider metrics ([merge request](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/531))
* Add histogram metrics for docker machine creation time ([merge request](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/533))

List of all changes can be found in GitLab Runner's [CHANGELOG](https://gitlab.com/gitlab-org/gitlab-runner/blob/v9.1.0/CHANGELOG.md).

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [GitLab Runners](https://docs.gitlab.com/runner/) in our docs.

### Performance Improvements ce ees eep

Making GitLab fast is always a priority.
Every release we are addressing performance improvements that make GitLab faster and
more reliable.
This will not only make self-managed GitLab CE and EE much faster, but also improve
the speed and reliability of [GitLab.com](https://gitlab.com) for everyone.

In GitLab 9.1 we've nearly halved the amount of time taken to view a [list of projects](https://gitlab.com/gitlab-org/gitlab-ce/issues/27390) and [merge requests](https://gitlab.com/gitlab-org/gitlab-ce/issues/27166), improved availability of [contribution analytics](https://gitlab.com/gitlab-org/gitlab-ce/issues/22940), made [importing GitHub projects](https://gitlab.com/gitlab-org/gitlab-ce/issues/28183) faster and more reliable and have taken big steps towards upgrading GitLab with [zero downtime](https://gitlab.com/gitlab-org/gitlab-ce/issues/26130).

Take a look at our full list of [performance improvements](https://gitlab.com/groups/gitlab-org/issues?scope=all&state=closed&utf8=%E2%9C%93&milestone_title=9.1&label_name%5B%5D=performance) in GitLab 9.1 and we've got a huge number of performance issues we will be addressing in [9.2](https://gitlab.com/groups/gitlab-org/issues?label_name%5B%5D=performance&milestone_title=9.2&scope=all&state=all) to keep making GitLab faster and more reliable.

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [GitLab Performance Monitoring](https://docs.gitlab.com/ee/administration/monitoring/performance/index.html#gitlab-performance-monitoring) in our docs.

### Omnibus Package Improvements ce ees eep

#### SUSE Linux Enterprise Server 12.2
GitLab is now available on SUSE Linux Enterprise Server 12.2.
[Read through the instructions](/downloads-ee/#sles122)
to install.

#### GitLab Mattermost 3.7.3

GitLab 9.1 includes [Mattermost 3.7.3](https://about.mattermost.com/), an open
source Slack-alternative providing workplace messaging for web, PC and phone
with archiving and search. Improvements this month include next generation
iOS and Android Apps in beta, new CLI integrations, and much more.
This version includes [security updates](http://about.mattermost.com/security-updates/)
and upgrade is recommended.

Mattermost 3.7.3 was also included in GitLab 9.0.4. Anyone on GitLab 9.0.4 or
later should have the patch already.

#### Other Improvements

* GitLab now ships with Git 2.11
([issue](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1903)).
* You can use Terraform configuration to spin up a GitLab instance on Google
Compute Engine (GCE) ([issue](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1521)). Support for spinning up gitlab-runner is being worked on
([issue](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2175)).
* Google Cloud Storage can now be used as the backend for the Container Registry
([issue](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/2076)).

<i class="fas fa-book" aria-hidden="true"></i>
Learn more about [Omnibus GitLab ](https://docs.gitlab.com/omnibus/) in our docs.

<!-- end of right column -->
</div>
</section>

----

<section class="release-post-section">
## Deprecations
{:.text-center}

### Ubuntu 12.04 Package

GitLab 9.1 will be the last release with support for Ubuntu 12.04 packages, as Ubuntu
12.04 will reach [its End of Life in April 28th](http://fridge.ubuntu.com/2017/03/15/ubuntu-12-04-precise-pangolin-reaches-end-of-life-on-april-28-2017/). GitLab 9.2
will continue to be available on Ubuntu 14.04 and 16.04.

Due: **May 22nd**, 2017.

### OpenSUSE 13.2

GitLab 9.1 will also be the last release with support for OpenSUSE 13.2 packages, as it
has reached its End of Life [earlier this year](https://en.opensuse.org/Lifetime#Discontinued_distributions).
GitLab 9.2 will continue to be available on OpenSUSE 42.1.

Due: **May 22nd**, 2017.

</section>

----

<section class="release-post-section">
## Upgrade Barometer
{:.text-center}

To upgrade to GitLab 9.1, no downtime is required.

However there are some migrations that might take significant time depending on
your installation size:

- A new column is added to the users table which might take some time if you
have a lot of users.
- The old cache directory is removed, which might take some time if there were a
lot of uploaded files.

Starting with GitLab 9.1.0 it's possible to upgrade to a newer version of GitLab
without having to take your GitLab instance offline. However, for this to work
there are the following requirements:

1. You can only upgrade 1 release at a time. For example, if 9.1.15 is the last
   release of 9.1 then you can safely upgrade from that version to 9.2.0.
   However, if you are running 9.1.14 you first need to upgrade to 9.1.15.
2. You have to use [post-deployment migrations](https://docs.gitlab.com/ee/development/database/post_deployment_migrations.html).
3. You are using PostgreSQL. If you are using MySQL you will still need downtime
   when upgrading.

This applies to major, minor, and patch releases unless stated otherwise in a
release post.

A new version of our API was released in [GitLab 9.0](/releases/2017/03/22/gitlab-9-0-released/#api-v4).
While existing calls to API v3 will continue to work until August 2017, we
advise you to make any necessary changes to applications that use the v3 API.
[Read the documentation](https://docs.gitlab.com/ee/api/v3_to_v4.html) to learn
more.

#### Note

We assume you are upgrading from the latest version. If not, then also consult
the upgrade barometers of any intermediate versions you are skipping.
If you are upgrading from a GitLab version prior to 8.0 *and* you have CI
enabled, you have to upgrade to GitLab 8.0
[first](/releases/2015/09/22/gitlab-8-0-released/).

New configuration options have been introduced in the omnibus-gitlab packages.
To check what changed compared to your `/etc/gitlab/gitlab.rb` configuration
file, run `sudo gitlab-ctl diff-config`.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](https://docs.gitlab.com/omnibus/update/README.html).

### End of Deploy Boards Free Trial

To celebrate the launch of [Deploy Boards in GitLab 9.0](/releases/2017/03/22/gitlab-9-0-released/#deploy-boards-eep),
we offered a free trial to our Enterprise Edition Starter customers for the 9.0 release.
With the release of 9.1, Deploy Boards is now available only to Enterprise
Edition Premium customers. EEP customers should have already received an email
from GitLab Support with a new license key enabling this feature. If not,
please contact [GitLab Support](/support/).
</section>

<section class="gray-section">
<div class="release-row align-top">
<div class="column">
### Changelog

Please check out the changelog to see all the named changes:

- [GitLab CE](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/CHANGELOG.md)
- [GitLab EE](https://gitlab.com/gitlab-org/gitlab-ee/blob/master/CHANGELOG.md)

### Installing

If you are setting up a new GitLab installation please see the
[download GitLab page](/install/).

### Updating

Check out our [update page](/update/).
</div>
<div class="column">
### GitLab Products

We offer four different [products](/stages-devops-lifecycle/) for you and your company:

- {: #ce} **GitLab Community Edition (CE)**: [Open source](https://gitlab.com/gitlab-org/gitlab-ce), self-managed solution of GitLab. Ideal for personal projects or small teams with minimal user management and workflow control needs. Every feature available in GitLab CE, is also available on GitLab Enterprise Edition (Starter and Premium), and GitLab.com.
- {: #ee} **[GitLab Enterprise Edition](/pricing/) (EE)**: [Open core](https://gitlab.com/gitlab-org/gitlab-ee/), self-hosted, fully featured solution of GitLab. Available in two different subscriptions:
  - {: #ees} **GitLab Enterprise Edition Starter (EES)**: Ideal for co-located teams who need additional security and workflow controls for their professional projects.
  - {: #eep} **GitLab Enterprise Edition Premium (EEP)**: Ideal for distributed teams who need advanced workflow controls, premium features, High Availability, and Premium Support.
- {: #gitlab-dot-com} **[GitLab.com](/pricing/) **: SaaS GitLab solution, with [free and paid subscriptions](/pricing/#gitlab-com). GitLab.com is hosted by GitLab, Inc. Ideal for individuals who want to get their projects up and running quickly. Administrated by GitLab (users don't have access to admin settings).

</div>
</div>
</section>

<section class="release-post-section">
[Cover image](https://www.pexels.com/photo/hot-air-balloons-landscape-adventure-aviation-7342/) licensed under [CC0](https://www.pexels.com/photo-license/).
{:.note .text-center}
</section>

<style>
  .badge-container a {
    margin-right: 3px;
  }
</style>
