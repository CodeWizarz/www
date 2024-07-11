---
title: "GitLab 8.17 released"
categories: releases
author: Job van der Voort
author_gitlab: JobV
author_twitter: Jobvo
image_title: '/images/unsplash/fireworks.png'
description: >
  GitLab 8.17 released with GitLab Pages in GitLab CE and Squash on Merge
---

For many years, content management systems (CMS) have been used
to manage simple websites. The advent of static sites allows organizations to
no longer worry about having to secure, update and maintain an underlying CMS.
Static websites are fast, yet powerful and
[seen as the next big thing in publishing to internet][smashing-link].

GitLab 8.17 allows anyone to easily create and collaborate on a static website
through [GitLab Pages][pages], now available in GitLab Community Edition.

<!-- more -->

----

In addition to Pages moving to CE, we've made improvements to Issue
Boards, added an audit user role, added the ability to squash commits on merge
and much more!

[smashing-link]: https://www.smashingmagazine.com/2015/11/modern-static-website-generators-next-big-thing/

This month's [MVP](/community/mvp/) is [Horacio Sanson](https://gitlab.com/Sanson).
[Last release](/releases/2017/01/22/gitlab-8-16-released/),
Horacio added PlantUML support for Asciidoc; this release,
[he added it](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8588) for
Markdown, too!
Thanks Horacio!

## GitLab Pages in Community Edition

Hardcoded static websites take a long time to set up and maintain for everyone
but the invested web developer. Static Site Generators are the best solution to
[this problem][pages-ssgs-1]. [GitLab Pages][pages] allows you to
[host static websites][post-pages-setup] straight from GitLab, with
[any Static Site Generator][pages-ssgs]. Previously this functionality was only
available on GitLab.com and GitLab Enterprise Edition. After receiving
[over 100 votes](https://gitlab.com/gitlab-org/gitlab-ce/issues/14605)
we decided to move GitLab Pages to GitLab Community Edition.

Static websites are much faster than their dynamic counterparts (CMS), this
makes them great for high volume public marketing and documentation sites or
even as a way to easily visualize data from your continuous integration suite.

The [GitLab Pages documentation][pages-docs] covers everything from getting
started with different Static Site Generators to advanced CI and SSL
configurations. To learn how to set up GitLab Pages to your own GitLab instance,
read through the [admin documentation] or watch the [video tutorial].

[admin documentation]: https://docs.gitlab.com/ee/administration/pages/
[pages-ssgs]: /blog/2016/06/17/ssg-overview-gitlab-pages-part-3-examples-ci/
[pages-ssgs-1]: /blog/2016/06/03/ssg-overview-gitlab-pages-part-1-dynamic-x-static/
[pages]: https://pages.gitlab.io/
[post-pages-setup]: /blog/2016/04/07/gitlab-pages-setup/
[pages-docs]: https://docs.gitlab.com/ee/user/project/pages/
[video tutorial]: https://youtu.be/dD8c7WNcc6s

## Easily Search and Add Issues to Issue Boards

Prior to 8.17, the Backlog list in the [Issue Board][board] contained issues
that you had not yet added to your workflow (the "main" area of the board).
Finding issues to add was somewhat difficult given that small area, and you
could only add them one by one. Most of the time, you didn't even need to see
the Backlog list at all, and it was just hanging around taking up valuable
screen real estate.

![Add issues modal in board in GitLab 8.17](/images/8_17/board_modal.png){: .shadow}

With 8.17, you now add issues through a dedicated modal window.
Click the `Add issues` button at the top-right, and you get an expansive modal
to search and filter for issues you care about.
Select one or many issues, and even choose the list where you want to put them
in before adding them to the board, saving just a few more clicks and drags.
To remove an issue from your board, select it to bring up the sidebar, and hit
`Remove from board`.

Take a look at the [Issue Board documentation][board-doc] to learn more.

[board]: /stages-devops-lifecycle/issueboard/
[board-doc]: https://docs.gitlab.com/ee/user/project/issue_board.html

![Remove issue from board in GitLab 8.17](/images/8_17/board_remove.png){: .shadow}

## Squash and Merge (EE)

To improve code collaboration, we suggest teams share their merge requests as
soon as possible in [WIP form][wip].
This naturally results in many commits as the merge request evolves.
With 8.17, you can now squash your commits together into a single commit, as
part of merging, giving you a much cleaner Git history.
Simply select the option in the merge request itself.

[See our documentation to learn more about squash and merge.][squash-doc]

[wip]: https://docs.gitlab.com/ee/user/project/merge_requests/drafts.html
[squash-doc]: https://docs.gitlab.com/ee/user/project/merge_requests/squash_and_merge.html

![Squash and merge in GitLab 8.17](/images/8_17/squash_edit_form.png){: .shadow}

## Copy and Paste GitLab Markdown

[GitLab Flavored Markdown (GFM)][gfm-doc] is a powerful system, but
transcribing formatted text to it may be a little bit difficult for newcomers to
Markdown. You may find yourself going to the edit mode of an issue description
or comment to just copy the plaintext GFM, paste it in another GitLab textarea,
make some changes, before submitting it.

With 8.17, you can simply copy any issue / merge request description / comment
(i.e. GFM textarea) in regular view mode, and paste it in another GFM textarea.
All the formatting is carried over automatically. This even includes links and
images. Pro tip: Now you can quickly learn from GFM experts by copying their
issues and merge requests.

[gfm-doc]: https://docs.gitlab.com/ee/user/markdown.html#gitlab-flavored-markdown-gfm

![Copy and paste GitLab markdown in GitLab 8.17](/images/8_17/gitlab_markdown_copy_paste.gif){: .shadow}

## Link from Merge Request interface to Environment

GitLab Review Apps are great for previewing changes in a merge request by providing a link to a temporary environment running the changes. But when a change is buried in your application's interface, you still have to navigate to a specific place to see an actual change.

With the new ability to [deep link files in a merge request to live previews of those files][environment-link-doc],
you can now jump directly to the URL that shows off the changes in a given file.

Using the new `.gitlab/route-map.yml` file, you can map routes to their
respective URLs to allow for easy preview of specific changes. This is more
difficult for dynamic apps built with frameworks like Rails or Django, but for
static sites this is perfect.

For example, this is [the current `route-map.yml` for about.gitlab.com][www-gitlab-com-route-yml]:

```yml
# Team data
- source: 'data/team.yml' # data/team.yml
  public: 'team/' # team/
# Blogposts
- source: /source\/posts\/([0-9]{4})-([0-9]{2})-([0-9]{2})-(.+?)\..*/ # source/posts/2017-01-30-around-the-world-in-6-releases.html.md.erb
  public: '\1/\2/\3/\4/' # 2017/01/30/around-the-world-in-6-releases/
# HTML files
- source: /source\/(.+?\.html).*/ # source/index.html.haml
  public: '\1' # index.html
# Generators
- source: /source\/(.*)\/template\..*/ # source/direction/template.html.md.erb
  public: '\1/' # direction/
# Other files
- source: /source\/(.*)/ # source/images/blogimages/around-the-world-in-6-releases-cover.png
  public: '\1' # images/blogimages/around-the-world-in-6-releases-cover.png
```

![Go directly from source files to public pages on the environment](/images/8_17/gitlab_environment_link.png){: .shadow}

[environment-link-doc]: https://docs.gitlab.com/ee/ci/environments/index.html#go-directly-from-source-files-to-public-pages-on-the-environment
[www-gitlab-com-route-yml]: https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/.gitlab/route-map.yml

## Streamlining Project Settings and Navigation

We are continuing to streamline project settings and navigation, which we first
started in [8.16]. We've combined the existing `Runners`, `Variables`,
`Triggers`, and `CI/CD Pipelines` menu items into one item simply called
`CI/CD Pipelines`. Navigating to `CI/CD Pipelines` will show you one page with
all the settings that were previously spread across the 4 original pages.

As we work on merging settings together, we are also working to improve the UX of these pages in order to make it easier to navigate. [Contribute to the issue](https://gitlab.com/gitlab-org/gitlab-ce/issues/28451) and watch for updates in the upcoming releases!

[8.16]: /releases/2017/01/22/gitlab-8-16-released/

![Improved settings navigation in GitLab 8.17](/images/8_17/settings_new.png){: .shadow}

## Additional Pipeline Details Included in Merge Request Workflow

We have made improvements to the look and feel of the Merge Request workflow,
as well as included additional details on the CI/CD Pipeline status. You are
now able to easily review the progress of the entire Pipeline, and take action directly from the Merge Request summary. For example you could review a pipeline that needs attention, navigate to a failed job, and trigger a quick retry or manual action.

![Merge Request Pipeline Minigraph](/images/8_17/merge_request_minigraph.png){: .shadow}

## Redesigned Slack and Mattermost Issue Messages

The ChatOps message replies for [Slack][slack-chatops] and
[Mattermost][mattermost-chatops] have been improved. GitLab's replies will now
include additional details like assignee, current status, and more; all presented
in a cleaner interface. Searching GitLab or creating a new issue all within the
context of the channel you are working in has never been easier or prettier!

![Slack Issue Show](/images/8_17/slack_issue_show.png){: .shadow}

[slack-chatops]: https://docs.gitlab.com/ee/user/project/integrations/slack_slash_commands.html
[mattermost-chatops]: https://docs.gitlab.com/ee/user/project/integrations/mattermost_slash_commands.html

## Improving Terminology within CI/CD

We have clarified the terminology used to discuss parts of [CI/CD][cicd],
replacing the usage of `Build`. In 8.17, `Pipeline` will be used when referring
to the entire pipeline, and `Job` will be used for a specific action.

With the upcoming 9.0 release API v4 will utilize the new naming convention, with v3 remaining unchanged.

[cicd]: https://docs.gitlab.com/ee/ci/

## Monitoring GitLab with Prometheus

With 8.17 we are continuing to build upon our Prometheus integration initially
[released in 8.16][prom-8-16]. Three new exporters have been added to the
Omnibus package providing insight into Redis, Postgres, and GitLab service
metrics. Administrators will now be able to track the status of Sidekiq jobs, Redis, and important database metrics. It is now easier than ever to
ensure GitLab is feeling good and snappy!

Prometheus and its exporters [can be enabled][prom-doc] by editing `gitlab.rb`,
and will be enabled by default in 9.0.

[prom-8-16]: /releases/2017/01/22/gitlab-8-16-released/
[prom-doc]: https://docs.gitlab.com/ee/administration/monitoring/prometheus/index.html

## API v4 Beta

GitLab has a powerful API that allows you to do almost everything that you'd
otherwise do through the interface. For the last several years, our API has been
version 3 (v3). To be able to make changes to our existing API endpoints, while
maintaining support for your integrations, we're rolling out a new API version
next month (March 22nd, GitLab 9.0).

With this release, we're giving you access to the Beta of API v4. This will
allow you to upgrade your integrations so that they'll continue working
after we deprecate API v3. We'll continue working on API v4 and will introduce
other changes with GitLab 9.0, such as:

* Present related resource URI's within each API response (facilitating API
  navigation)
* Enable pagination for all endpoints
* Allow queries on issues and merge requests endpoints with IIDs (same as web
  version URL ids)

Keep track on [CE](https://docs.gitlab.com/ee/api/v3_to_v4.html) and
[EE](https://docs.gitlab.com/ee/api/v3_to_v4.html) v4 API changes docs for
further information.

### API v3 Deprecation

API v3 will be deprecated with GitLab 9.0. That means API v3 will only receive
bug and security fixes from that version on, but no further updates and will
not support new features.

We recommend that you update your integrations with GitLab's API to v4.

We plan to remove API v3 from GitLab in a future release, but not
before GitLab 9.3. For detailed information on the deprecation and removal of
API v3 [see our issue on GitLab.com](https://gitlab.com/gitlab-org/gitlab-ce/issues/20070).

## Audit Users (EE only)

Many large or regulated organizations require oversight across the entire
development environment. GitLab Enterprise Edition now features a great new
capability to assign an `Audit` role to a user. This role allows the user
read-only access to all projects, groups, users and other resources.

Unlike the `Administrator` role, Audit users don't have the ability to modify
projects settings or access the Admin Area, making it the perfect solution to
provide powerful, read-only access across the entire GitLab instance.

[Find out more][audit-docs] about how this role works and the capabilities it
allows.

[audit-docs]: https://docs.gitlab.com/ee/administration/auditor_users.html

## Configurable Mirror Synchronization Time (EE only)

[Repository mirroring] is a great feature in GitLab Enterprise Edition that
allows you to synchronize remote repositories with your repository on GitLab.
Previously, synchronization happened every hour; you can now [adjust this][sync]
for more fine-grained synchronization windows.

[Repository mirroring]: https://docs.gitlab.com/ee/user/project/repository/repository_mirroring.html
[sync]: https://docs.gitlab.com/ee/user/project/repository/repository_mirroring.html#pulling-from-a-remote-repository

## Amazing community contributions

For 8.17, we merged 62 merge requests from the community, including new
features, bug fixes, and backstage improvements!

The most noticeable contributed changes are as follows:

### New features & improvements

- Create a TODO for user who set auto-merge when a build fails or merge conflict occurs. ([!8056])
- Add a `/target_branch` slash command functionality for merge requests. ([!7216])
- Allow to search within project by commit hash. ([!8028])
- Add PlantUML support for Markdown. ([!8588])
- Allow to promote project labels to group labels. ([!7242])
- Add sorting pipeline for a commit. ([!8319])
- Add the ability to define a coverage regex in the `.gitlab-ci.yml`. ([!7447])
- Add system hook for when a project is updated (other than rename/transfer). ([!5711])
- Display project ID in project settings. ([!8572])
- Mark merge request as WIP when pushing WIP commits. ([!8124])
- Add hover style to copy icon on commit page header. ([!8619])
- Support unauthenticated LFS object downloads for public projects ([!8824])
- Force new password after password reset via API. ([!8933])

### Bugfixes

- Remove flash warning from login page. ([!8864])
- Fix tab index order on branch commits list page. ([!8489])
- Fix `Sort by Recent Sign-in` in Admin Area. ([!8637])
- Fix notifications when set at group level. ([!6813])
- Fix broken anchor links when special characters are used. ([!8961])
- Fix incorrect Sidekiq concurrency count in admin background page. ([!9359])
- Fix disable storing of sensitive information when importing a new repo. ([!8885])

[!5711]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/5711
[!6813]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/6813
[!7216]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7216
[!7242]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7242
[!7447]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7447
[!8028]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8028
[!8056]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8056
[!8124]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8124
[!8319]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8319
[!8489]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8489
[!8572]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8572
[!8588]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8588
[!8619]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8619
[!8637]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8637
[!8824]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8824
[!8864]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8864
[!8885]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8885
[!8933]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8933
[!8961]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/8961
[!9359]: https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/9359

## GitLab Runner

We are also releasing GitLab Runner 1.11 today. Most interesting changes:

- Add `post_build_script` to call scripts after user-defined build scripts [!460](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/460)
- Add the runner name to the first line of log output, after the version [!473](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/473)
- Add timezone support for OffPeak intervals [!479](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/479)
- Add ubuntu/yakkety to packages generation list [!458](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/458)
- Update targets on packages generation list (for Linux Mint, Ubuntu and Fedora) [!485](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/485)
- Reduce size of `gitlab-runner-helper` images [!456](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/456)
- Rename `Build (succeeded|failed)` to `Job (succeeded|failed)` [!459](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/459)
- Set `GIT_SUBMODULE_STRATEGY=SubmoduleNone` when `GIT_STRATEGY=GitNone` [!480](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/480)
- Fix crash on machine creation [!461](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/461)
- Fix race in `helpers/prometheus/log_hook.go: Fire()` method [!463](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/463)
- Fix missing `VERSION` on Mac build [!465](https://gitlab.com/gitlab-org/gitlab-runner/merge_requests/465)

To see the full list of all changes please read [the Runner's CHANGELOG file](https://gitlab.com/gitlab-org/gitlab-runner/blob/v1.11.0/CHANGELOG.md).

## Additional Changes

- Added `repository_storage` and `approvals_before_merge` fields to [API v3 Projects](https://docs.gitlab.com/ee/api/projects.html) (EE only).
- Moved the [License Breakdown](https://docs.gitlab.com/ee/administration/license.html) to the Admin Overview page (EE only).
- Email confirmation link will no longer automatically log you into your GitLab instance. This was changed due to security concerns, see [gitlab-org/gitlab-ce!7472](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7472) for details.

## Omnibus GitLab package changes

### PostgreSQL version upgrade

As mentioned [in the 8.15 release post](/releases/2016/12/22/gitlab-8-15-released/#postgresql-version-upgrade),
omnibus-gitlab packages are equipped with `gitlab-ctl pg-upgrade` tool.
This tool will upgrade the bundled PostgreSQL database version.

Please plan the upgrade ahead of GitLab 9.0 release (scheduled for Mar. 22, 2017).

The omnibus-gitlab packages for GitLab 9.0 will attempt to automatically upgrade
your database. Additionally, [default version of PostgreSQL](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1916)
will change for GitLab 9.0.

> [Read more about database upgrade in our docs](https://docs.gitlab.com/omnibus/settings/database.html#upgrade-packaged-postgresql-server)

> Ran into issues? Create an issue at the [omnibus-gitlab issue tracker](https://gitlab.com/gitlab-org/omnibus-gitlab/issues),
and reference it in the [upgrade problems meta issue.](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1783)

## Deprecations

### Git-Annex Support

We're [deprecating](https://gitlab.com/gitlab-org/gitlab-ee/issues/1648) support
for [Git-Annex](https://docs.gitlab.com/ee/administration/git_annex.html) available in
GitLab Enterprise Edition, and it will be completely removed in the upcoming
release, GitLab 9.0 (2017/03/22).

Read through the
[Git-Annex to Git-LFS migration guide](https://docs.gitlab.com/ee/topics/git/lfs/migrate_from_git_annex_to_git_lfs.html).

### Raspbian Wheezy package

8.17 will be [the last release](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1947)
with support for Raspbian Wheezy Raspberry Pi2 packages. GitLab 9.0 will continue
to be available on Raspbian Jessie.

### Change in package repository distribution for Raspberry PI

Due to a migration to new build infrastructure, several months ago Raspberry PI
packages [started being released](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1303)
under `debian` distribution of [raspberry pi2 repository](https://packages.gitlab.com/gitlab/raspberry-pi2/).
This was not the original intention and in the following months users needed to do
a [manual change in their package repository sources](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/1303#note_21058665)
to fetch the latest package.
With 9.0 we will deprecate the `debian` distribution and move back to `raspbian` which was the previous default.

### Standalone GitLab CI configuration

GitLab CI standalone was merged into GitLab application with version 8.0. We
shipped configuration that helped users migrate their infrastructure to the new situation.
With GitLab 9.0 omnibus-gitlab package, [we are removing](https://gitlab.com/gitlab-org/omnibus-gitlab/issues/792) all
support for standalone GitLab CI. If you still make use of configuration such as
`ci_external_url` and [redirecting traffic to the old address](https://docs.gitlab.com/ee/ci/index.html),
please update your configuration in time.

## Upgrade barometer

This release does not require downtime.

Some of the migrations could take some time and on larger instances, it may be
advisable to take approximately 15 minutes downtime to ease the load of the
database.

The slow migrations add columns with default values to `users` and `projects`.

_By default, GitLab will stop, run migrations and start again. See the note
below on changing this behavior._

### Upcoming changes to defaults in `.gitlab-ci.yml`

As part of our 9.0 release, we will be changing the default behavior of two
flags in [`.gitlab-ci.yml`][gitlab-ci-yml] to provide an improved standard experience.

* The [`cache:key`][cache-key] directive will default to a constant string. This
  means that the cache will now be shared across branches and stages, reducing
  build time making more efficient use of Runners. Note a cache is never shared
  across projects.
* The [`artifacts:expire_in`][artifacts-expire-in] default will be able to be
  controlled by the GitLab administrator. Previously unless a specific duration
  was set, artifacts would never expire. By enabling control over the default
  value, administrators can more easily manage artifacts that do not need to be
  stored indefinitely. Developers should set this value to their desired
  duration if an artifact should persist for a specific time.

[gitlab-ci-yml]: https://docs.gitlab.com/ee/ci/yaml/
[cache-key]: https://docs.gitlab.com/ee/ci/yaml/#cachekey
[artifacts-expire-in]: https://docs.gitlab.com/ee/ci/yaml/#artifacts-expire_in

### Note

We assume you are upgrading from the latest version. If not, then also consult
the upgrade barometers of any intermediate versions you are skipping. If you are
upgrading from a GitLab version prior to 8.0 *and* you have CI enabled, you have
to upgrade to GitLab 8.0 [first](/releases/2015/09/22/gitlab-8-0-released/).

New configuration options got introduced in the omnibus-gitlab packages. To
check what changed when compared to your `/etc/gitlab/gitlab.rb` configuration
file, run `sudo gitlab-ctl diff-config`.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

----

[Cover image](https://unsplash.com/?photo=5KvPQc1Uklk) by [Ryan Wong](https://unsplash.com/@provenwong), licensed under [CC0 1.0](https://unsplash.com/license)
{:.note}
