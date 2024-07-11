---
title: "GitLab 2016 year in review"
author: Connor Shea
author_twitter: connorjshea
author_gitlab: connorshea
categories: company
image_title: '/images/blogimages/2016-year-in-review/gitlab-2016-in-review-cover.png'
description: 'We’re proud to announce that we closed 2016 with the entire idea-to-production workflow, as promised! These are the highlights!'
twitter_image: '/images/tweets/gitlab-2016-year-in-review.png'
---

At GitLab, we believe the best approach to software delivery is to ship quickly and often.
By building a team and a [company culture](/company/culture/) that values iteration over perfection, we
are able to ship new improvements and features every month!

So it should come as no surprise that in 2016, we shipped 12 new versions of GitLab!
Included in those releases were major new features like [Issue Boards] and
[Cycle Analytics], and the completion of our idea-to-production [vision](/blog/2016/09/13/gitlab-master-plan/#vision).

<!-- more -->

For a visual of how far we’ve come, take a look at these two screenshots.

An issue for GitLab Community Edition on January 22, 2016 (8.4):

![Screenshot of an issue from GitLab 8.4 on January 22, 2016](/images/blogimages/2016-year-in-review/gitlab-8-4.png)

An issue for GitLab Community Edition on January 3, 2017 (8.15):

![Screenshot of an issue from GitLab 8.15 on January 3, 2017](/images/blogimages/2016-year-in-review/gitlab-8-15.png)

## January: 8.4

> [GitLab 8.4 Release Post](/releases/2016/01/22/gitlab-8-4-released/)

We kicked off the year with our 50th release of GitLab.

### Build Artifacts

A browser was added for [Build Artifacts](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html). Artifacts are the output resulting from builds, and can be used to provide binaries for a piece of software, the compiled content of a static site, or the results of a test coverage checker.

### File Finder

We introduced a [File Finder](https://docs.gitlab.com/ee/user/project/repository/file_finder.html), a much-requested addition contributed by the community! It helps find any file in a repository using "fuzzy" search.

### Elasticsearch (EE Starter)

Improved repository search was added for [Enterprise Edition Starter](/stages-devops-lifecycle/) with [Elasticsearch](https://docs.gitlab.com/ee/integration/elasticsearch.html). This made searching projects' code, issues, and merge requests faster and more useful.

## February: 8.5

> [GitLab 8.5 Release Post](/releases/2016/02/22/gitlab-8-5-released/)

### Todos

February saw the release of GitLab 8.5 with the introduction of [Todos](https://docs.gitlab.com/ee/user/todos.html) – our take on a more useful notification system.

### GitLab Geo (EE Premium)

Also included in February's release was an alpha version of GitLab Geo. GitLab Geo is available for [GitLab Enterprise Edition Premium](/stages-devops-lifecycle/) and allows companies with offices around the world to mirror their GitLab instance in multiple places. This makes downloading large repositories much faster for all team members, no matter where they are.

### Custom Domains and custom TLS certs for GitLab Pages

[GitLab Pages](https://pages.gitlab.io/) added support for custom domains and custom TLS certificates. This allows users to host their static sites on custom domains without giving up the added security of HTTPS. While GitLab Pages is an Enterprise Edition-only feature right now, [we'll be bringing it to all versions in an upcoming release](/releases/2016/12/24/were-bringing-gitlab-pages-to-community-edition/).

## March: 8.6

> [GitLab 8.6 Release Post](/releases/2016/03/22/gitlab-8-6-released/)

### Confidential Issues

[Confidential issues](https://docs.gitlab.com/ee/user/project/issues/confidential_issues.html) are issues visible only to members of a project with sufficient permissions. Confidential issues can be used by open source projects and companies alike to keep security vulnerabilities private or prevent surprises from leaking out.

### Subscribing to Labels

[Label subscriptions](https://docs.gitlab.com/ee/user/project/labels.html#subscribe-to-labels) send any newly-labeled issues to your inbox so you can keep up-to-date with issues and merge requests relevant to you.

## April: 8.7

> [GitLab 8.7 Release Post](/releases/2016/04/22/gitlab-8-7-released/)

### License Templates

[License templates](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#template-dropdowns) were
introduced, providing users with a quick way to fill in LICENSE files for new projects.
License templates can also be added [using the API](https://docs.gitlab.com/ee/api/templates/licenses.html).

### Due Dates

[Due dates](https://docs.gitlab.com/ee/user/project/issues/due_dates.html) were added for issues. They can be used to keep track of deadlines and make sure features are shipped on time.

### Cherry Picking

[Cherry picking](https://docs.gitlab.com/ee/user/project/merge_requests/cherry_pick_changes.html) is [a feature in Git](https://git-scm.com/docs/git-cherry-pick) that takes individual commits or sets of commits from one branch and adds them to another. It’s most commonly used to backport bug fixes or security patches from the default branch to older, stable branches. GitLab 8.7 added cherry picking to the user interface and lets users do more of their work without switching to the command line.

## May: 8.8

> [GitLab 8.8 Release Post](/releases/2016/05/22/gitlab-8-8-released/)

### Pipelines

With GitLab 8.8, GitLab CI gained the concept of [Pipelines](https://docs.gitlab.com/ee/ci/pipelines/index.html), collections of builds that are executed in stages. Pipelines allow for better organization and parallelization.

### GitLab Container Registry

[GitLab Container Registry](https://docs.gitlab.com/ee/user/packages/container_registry/index.html) was a huge addition to our offering with GitLab CI. If you’ve used [Docker](https://www.docker.com/), you probably know what a container registry is. Container registries are used to host and provide Docker containers for testing and deployment of software. Integrating the container registry means that uploading and download Docker images is easy and fast, especially for local instances.

Read [the full blog post](/blog/2016/05/23/gitlab-container-registry/) on the GitLab Container Registry for more information.

### `.gitignore` templates

Following the introduction of License templates in 8.7, 8.8 provides [`.gitignore` templates](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#template-dropdowns) as well. [`.gitignore` files](https://git-scm.com/docs/gitignore) tell git not to track certain directories or kinds of files to help keep the repository clean. We provide templates for various languages and frameworks to prevent users from committing secrets or large log files to the repository. `.gitignore` templates can also be added [using the API](https://docs.gitlab.com/ee/api/templates/gitignores.html).

## June: 8.9

> [GitLab 8.9 Release Post](/releases/2016/06/22/gitlab-8-9-released/)

### File Locking (EE Premium)

[File Locking](https://docs.gitlab.com/ee/user/project/file_lock.html) is an EE Premium feature that can be used to prevent binary files from being overwritten. This is useful for many use cases, like game development with models, art assets, and sound files or on a website when editing a graphic. File Locking also works for non-binary files.

### Environments

With GitLab 8.9 you can now define [Environments](https://docs.gitlab.com/ee/ci/environments/index.html). Environments allow you to track deployments and quickly understand things like "what's running in staging?"

![Environments](/images/8_9/environments.png){:.shadow}

For more information, see [our blog post on Environments and Deployments](/blog/2021/02/05/ci-deployment-and-environments/).

### Priority Labels

With GitLab 8.9, labels can be starred and added to a priority list.
[Prioritized labels](https://docs.gitlab.com/ee/user/project/labels.html#prioritize-labels)
are like any other label, but sorted by priority. This allows you to easily
sort issues and merge requests by priority.

![Priority Labels](/images/8_9/plabels2.png){:.shadow}

### Redesigned Navigation

With 8.9 we replaced the often-confusing sidebar paradigm with a new tabbed header. We've been really happy with this change, and think it was a huge improvement over our past iterations.

![Redesigned Navigation](/images/8_9/look3.png)

### Universal Two Factor (U2F)

Universal Two Factor (U2F) is a form of [Two-Factor Authentication](https://docs.gitlab.com/ee/user/profile/account/two_factor_authentication.html) that uses physical keys (usually via USB) for authentication. GitLab 8.9 added support for the U2F device standard.

See [our blog post](/blog/2016/06/22/gitlab-adds-support-for-u2f/) for more information.

## July: 8.10

> [GitLab 8.10 Release Post](/releases/2016/07/22/gitlab-8-10-released/)

### Wildcard Branch Protection

Our branch protection feature was improved with [Wildcard Branch Protection](https://docs.gitlab.com/ee/user/project/protected_branches.html), allowing repositories to protect branches based on their names, for example `release-*` protects any branch which starts with `release-`.

![Wildcard Branch Protection](/images/8_10/wc1.png){:.shadow}

### Manual actions for CI

[Manual actions](https://docs.gitlab.com/ee/ci/environments/index.html#manually-deploying-to-environments) were introduced for CI. This addition allows users to maintain fine-grained control over how they handle things like deployments to staging or production, rather than deploying automatically upon a pipeline's completion.

![Manual Actions for CI](/images/8_10/ci_manual1.png){:.shadow}

For more information, read the post "[Continuous Integration, Continuous Delivery, and Continuous Deployment with GitLab](/blog/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/)".

## August: 8.11

> [GitLab 8.11 Release Post](/releases/2016/08/22/gitlab-8-11-released/)

GitLab 8.11 was probably the most exciting release of the year, bringing with it a number of major features and improvements.

### Issue Boards

[Issue Boards](/stages-devops-lifecycle/issueboard/) are another way of tracking project issues. Similar to existing kanban board software, [issue boards integrate](https://docs.gitlab.com/ee/user/project/issue_board.html) with the issues you already have in GitLab and organize themselves based on project labels. If you're already using labels to track progress on issues, issue boards shouldn't take more than a minute to set up.

![Issue Boards](/images/8_11/issue_boards.gif){:.shadow}

### Merge Conflict Resolution

Merge conflicts frequently happen in large projects with lots of developers. They cause friction and slow down the pace of development, which is why we introduced [Merge Conflict Resolution](https://docs.gitlab.com/ee/user/project/merge_requests/resolve_conflicts.html) into the GitLab web interface. With Merge Conflict Resolution, users can resolve simple conflicts right from GitLab.

![Merge Conflict Resolution](/images/8_11/resolve_mc.gif){:.shadow}

### Merge Request Discussion Resolution

With [Discussion Resolution](https://docs.gitlab.com/ee/user/discussions/index.html), each comment and discussion on merge request diffs can be resolved. Longer threads can be resolved all at once or just comment-by-comment. Discussion resolution can help prevent feedback from slipping through the cracks on larger merge requests.

![Resolve Discussions](/images/8_11/resolve_discussion.png){:.shadow}

### Pipeline Graphs

[Pipeline Graphs](https://docs.gitlab.com/ee/ci/pipelines/index.html) are an awesome visual representation of a project's Pipeline, they help users understand the way their pipelines are run.

![Pipeline Graph](/images/8_11/pipeline_graph2.png){:.shadow}

### Slash Commands

With the addition of [Slash Commands](https://docs.gitlab.com/ee/user/project/quick_actions.html), comments can be used to modify the status, author, assignee, due date, milestone, and labels of a merge request or issue, among other things. This feature gives users more power over their issues and merge requests without ever leaving the keyboard or needing to memorize keyboard shortcuts.

![Slash Commands](/images/8_11/slash-commands.gif){:.shadow}

### Koding Integration

8.11 introduces [integration](/blog/2016/07/26/koding-and-gitlab-integrated/) with [Koding](https://docs.gitlab.com/ee/user/project/koding.html), an online IDE. Koding allows users to develop and test your project without ever leaving the browser. Note that Koding integration isn't currently supported on GitLab.com, only self-managed GitLab instances.

## September: 8.12

> [GitLab 8.12 Release Post](/releases/2016/09/22/gitlab-8-12-released/)

### Cycle Analytics

The headline feature of 8.12 was [Cycle Analytics](/stages-devops-lifecycle/value-stream-analytics/), a new way of [tracking software development](https://docs.gitlab.com/ee/user/analytics/value_stream_analytics.html) using the data GitLab gathers as you use it. Cycle Analytics is the last step of the [GitLab Workflow](/topics/version-control/what-is-gitlab-flow/).

See [our feature highlight blog post](/blog/2016/09/21/cycle-analytics-feature-highlight/) for more information.

![Cycle Analytics](/images/8_12/cycle_analytics.png){:.shadow}

### Global Code Search (EE Starter)

Code search was improved for [Enterprise Edition Starter](/stages-devops-lifecycle/) in GitLab 8.12 with the addition of Global Code Search. This allows users to search across all the repositories on an instance, and is especially useful for microservice-based architectures and for reusing code from existing projects.

### Merge Request Versions

With [Merge Request Versions](https://docs.gitlab.com/ee/user/project/merge_requests/versions.html) you can view previous states of a merge request: compare between a previous commit and the target branch or even between versions, showing you what has changed between certain commits.

![Merge Request Versions](/images/8_12/mr_versions.png){:.shadow}

## October: 8.13

> [GitLab 8.13 Release Post](/releases/2016/10/22/gitlab-8-13-released/)

### Multiple Issue Boards (EE Starter)

Issue Boards were improved for [EE Starter](/stages-devops-lifecycle/) users by allowing [more than one issue board](https://docs.gitlab.com/ee/user/project/issue_board.html#multiple-issue-boards) for a given project. This is great for large projects with more than one team, or in situations where a repository is used to host the code of multiple products.

![Multiple Issue Boards](/images/8_13/m_ib.gif){:.shadow}

### Merge Conflict Editor

Building on Merge Conflict Resolution introduced in 8.11, the Merge Conflict Resolution tool [gained an Editor](https://docs.gitlab.com/ee/user/project/merge_requests/resolve_conflicts.html#merge-conflict-editor). This allows more complex merge conflicts, which require the user to manually modify a file in order to resolve a conflict, to be solved right form the GitLab interface.

![Merge Conflict Editor](/images/8_13/inlinemergeconflictresolution.gif){:.shadow}

## November: 8.14

> [GitLab 8.14 Release Post](/releases/2016/11/22/gitlab-8-14-released/)

### Time Tracking Beta

With the introduction of the [Time Tracking Beta](https://docs.gitlab.com/ee/user/project/time_tracking.html), companies that need time tracking tools can use them right from within GitLab.

![Time Tracking](/images/8_14/time.gif){:.shadow}

### Chat Commands

We introduced [Chat Commands](https://docs.gitlab.com/ee/user/project/integrations/mattermost_slash_commands.html). Chat commands allow you to interact with your GitLab instance from Mattermost.

### Review Apps

A new addition to GitLab CI in this release was [Review Apps](/stages-devops-lifecycle/review-apps/). Review Apps can be used to [deploy merge requests from your GitLab instance to a dev or staging environment for testing](https://docs.gitlab.com/ee/ci/review_apps/index.html). At GitLab, we use these for testing [about.gitlab.com](https://gitlab.com/gitlab-com/www-gitlab-com) as well as [docs.gitlab.com](https://gitlab.com/gitlab-org/gitlab-docs).

For more information on Review Apps, see [our feature highlight blog post](/blog/2016/11/22/introducing-review-apps/).

## December: 8.15

> [GitLab 8.15 Release Post](/releases/2016/12/22/gitlab-8-15-released/)

Rounding off the year with GitLab 8.15, we finished the base of our [idea-to-production](/blog/2016/09/13/gitlab-master-plan/) toolset. Moving on to 2017, we'll build on our current product to make it easier to use and more powerful.

### Auto Deploy

[Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/stages.html) is an easy way to configure GitLab CI for the deployment of your application. Right now it supports deployment to OpenShift, with more templates coming in future releases.

### Web Terminal

The addition of the [Web Terminal](https://docs.gitlab.com/ee/ci/environments/index.html#web-terminals) brings more power to the GitLab web interface. If you deploy to your environments with the help of a deployment service (e.g. Kubernetes), GitLab can open a terminal session to your environment and let you debug on your staging or – if you so dare – production site.

![Web Terminal](/images/8_15/terminal_gif.gif){:.shadow}

### LaTeX Support

[LaTeX support](https://docs.gitlab.com/ee/user/markdown.html#math) was added in 8.15 to improve GitLab for scientists, mathematicians, and anyone else who wanted to use [LaTeX](https://en.wikipedia.org/wiki/LaTeX) in their issues or merge requests. LaTeX support was contributed by the community.

![LaTeX math in a comment](/images/8_15/math.png){:.shadow}

## Looking forward

As always, if you found this post interesting and want to contribute to the project, we’d be happy to have you! Take a look around the [Accepting merge requests](https://gitlab.com/gitlab-org/gitlab-ce/issues?scope=all&state=opened&utf8=%E2%9C%93&label_name%5B%5D=Accepting+merge+requests) label in the GitLab CE project, and download the [GitLab Development Kit](https://gitlab.com/gitlab-org/gitlab-development-kit) to get started. If you have any questions feel free to reach out on Twitter, in the GDK issue tracker, or in our IRC channel.

What improvements do you want to see this year?

{::options parse_block_html="true" /}

<!-- Links -->

[issue boards]: /stages-devops-lifecycle/issueboard/
[cycle analytics]: /product/cycle-analytics/
