---
layout: handbook-page-toc
title: "Workflows for working with community contributions"
description: All processes that Contributor Success work with
---

## On this page

{:.no_toc .hidden-md .hidden-lg}

- TOC
{:toc .toc-list-icons .hidden-md .hidden-lg}

{::options parse_block_html="true" /}

- - -

# Workflows

## Real-time Communications

A GitLab contributor room is available on [Discord](https://discord.gg/gitlab) for people interested in contributing to GitLab. This is open to everyone to join and is a good place for community members to network and help each other.

## Issues

### Community issues workflow manual process

See the [partial issue triage checklist](/handbook/engineering/quality/issue-triage/#partial-triage-checklist).

## Merge Requests

Wider community merge requests are MRs opened by a person that's not present on https://about.gitlab.com/company/team/ (excluding any bot, service account users or individual contractors).

### Labels

- The `Community contribution` label is automatically applied by the [GitLab Bot](https://gitlab.com/gitlab-bot) to MRs submitted by wider community members. 
  - You can see the list of MRs in [`gitLab-org` list of merge requests](https://gitlab.com/groups/gitlab-org/-/merge_requests?label_name[]=Community+contribution).
  - [Learn more about the cadence and conditions for this automation](/handbook/engineering/quality/triage-operations/#label-community-contributions).
- The `1st contribution` label is added to first-time contributions. Every time a contributor is opening a merge request under the `gitlab-org` namespace for the first time, the label `1st contribution` is automatically applied to the merge request.
  - You can see the list of MRs in [`gitlab-org` list of merge requests](https://gitlab.com/groups/gitlab-org/-/merge_requests?label_name%5B%5D=1st+contribution).
  - [First-time contributors](/handbook/marketing/developer-relations/contributor-success/community-contributors-workflows.html#first-time-contributors) are also awarded a gift as our way to say thanks.

### Triage reports

See [Community-related triage reports](/handbook/engineering/quality/triage-operations/#community-related-triage-reports).

### Scheduled workflow automation

See [Community-related scheduled workflow automation](/handbook/engineering/quality/triage-operations/#community-related-scheduled-workflow-automation).

### Reactive workflow automation

See [Community-related reactive workflow automation](/handbook/engineering/quality/triage-operations/#community-related-reactive-workflow-automation).

## Merge request coaches

[Merge request coaches](https://handbook.gitlab.com/job-families/expert/merge-request-coach/) are available to help contributors with their MRs. This includes: 
- Identifying reviewers for the MR.
- Answering questions from contributors.
- Educating contributors on the [contribution acceptance criteria](https://docs.gitlab.com/ee/development/contributing/merge_request_workflow.html#contribution-acceptance-criteria).
- Or completing the MR if the contributor is unresponsive or unable to complete.
  - In that case, the `coach will finish` label will be added to the MR and the coach will either directly push new commits to the MR, or re-create a new MR with the original changes. 
  - Contributors can mention the coaches in their MRs by typing `@gitlab-org/coaches`.

The list of current merge request coaches can be found in the [team page](/company/team/) by selecting `Merge Request
Coach` in the department filter.

There is also the [`#mr-coaching`](https://gitlab.slack.com/archives/C2T9APP9C) channel in GitLab Slack if GitLab team
members have any questions related to community contributions.

More information on merge request coaches (including how to become a merge request coach) can be found in the 
[MR coach lifecycle page](/handbook/marketing/developer-relations/contributor-success/merge-request-coach-lifecycle.html).

## Contributing to the GitLab Enterprise Edition (EE)

For community contributors to contribute to the [GitLab Enterprise Edition](https://gitlab.com/gitlab-org/gitlab-ee), they will need a license for EE. If they don't already have a license, they can get a [free trial for 30 days](/free-trial/) (choose the Self-Managed option). If they cannot complete their work in 30 days, a new EE license for 90 days for a limited number of users (100) can be issued.

Renewal of this license:

* In the event of active contributions in the previous license cycle, this license can be renewed for a further year.
* If there have been no active contributions in the previous license cycle, a 90 day renewal can be granted.

Contributors will need to create an request in this project to request their license: [Wider Community Contributor License Request](https://gitlab.com/gitlab-org/developer-relations/contributor-success/team-task/-/issues/new?issuable_template=contributor_ee_license_request).

(Internal link for GitLab team members) Upon evaluation of the contributor's request, a license request can be made using [this form](https://gitlab-com.gitlab.io/support/internal-requests-form/) (Make sure to follow the Zendesk Global Light Agent steps if you haven't already). The Support team will respond following [this workflow](/handbook/support/license-and-renewals/workflows/self-managed/creating-wider-community-license.html).

## DCO and CLA Guidance

All external contributions to GitLab are subject to the [GitLab DCO or CLA](/community/contribute/dco-cla/), depending
on where the contribution is made and on whose behalf.

Instructions for corporate contributors to enter into an overarching Corporate CLA covering all contributions made on
their behalf are set out on the [DCO-CLA page](/community/contribute/dco-cla/#need-a-corporate-cla-covering-all-contributors-on-behalf-of-your-organization).

### Corporate CLA Contributor Management

Contributor success has been assisting the Legal and Corporate Affairs team with the creation and maintenance of a namespace under which GitLab can maintain lists of users associated with Corporate CLAs.

This group can be found here: https://gitlab.com/gitlab-corporate-cla

#### Adding a new group

Adding a new corporate group under this namespace is as follows:

1. Create a subgroup with a name/slug that matches the organisation's name.
1. Ensure the visibility of the new subgroup is set to `Private`.
1. Once created, edit the subgroup (Settings > General) and add the text `Approved contributors for XXXXX under the GitLab Corporate CLA` to the group description.
1. Confirm/set the following settings:
  1. General > Permissions and Group Features
    1. Permissions - Group mentions are disabled
    1. Wiki - Group-level wiki is disabled
    1. Roles allowed to create projects - No one
    1. Membership - Users can request access (disabled)
1. Add the user account of the Organization's designated user manager(s) to the group as `Owner`. (under Subgroup information > Members)
1. Remove your user account as a direct member of the subgroup. (Under Group owners, filter for `Membership = Direct`, click the 'kebab menu', select 'Leave Group')

## Educational materials

1. [Gitpod with GDK - Introduction (video)](https://www.youtube.com/watch?v=OzgGP5tT4bo)
1. [Gitpod with GDK - Setup (video)](https://www.youtube.com/watch?v=6VNm36wdXnI)

## Leading Organizations

### How do I add an organization or a user to an organization?

* Navigate to the [Contributing Org Tracker](/handbook/marketing/developer-relations/contributor-success/contributing-org-tracker.html).
* Go to the **MRARR Organization** tab. 
* If a user is not listed here, you can add it to the respective row, or add a new 
row at the bottom with the same structure.

### How do I enable the Leading Organizations program benefits for organizations

* Navigate to the [Contributing Org Tracker](/handbook/marketing/developer-relations/contributor-success/contributing-org-tracker.html).
* Go to the **Leading Organization** tab. 
* Add the organization to the list with the exact same name as found in the **MRARR Organization** tab. 
* Make sure you enter an entry date & current MR count from the last 3 months so we can look back and understand their performance over time.

### How do I stop the Leading Organizations program benefits for organizations

* Navigate to the [Contributing Org Tracker](/handbook/marketing/developer-relations/contributor-success/contributing-org-tracker.html).
* Go to the **Leading Organization** tab. 
* Enter the exit date next to the respective organization that should no longer receive the benefits. 

Caution: If an organization reaches the threshold it will be auto-enrolled in the program for receiving the review-time SLO.

## GitLab MVP Selection Process

See [GitLab MVP Selection Process](/handbook/marketing/developer-relations/contributor-success/mvp-process.html).

## Contributor Thanks messages

The Contributor Success team has been regularly thanking GitLab team members and Wider community members for active participation in Merge Requests. At the moment, this takes the form of:

* A weekly thanks message in the `#thanks` channel in slack - Thanking GitLab team members for participation in `Community Contribution` Merge Requests.
* A weekly thanks message in the `#thanks` channel in discord - Thanking wider community members for having MRs merged, as well as participating in other's MRs that were merged.
* A monthly thread on the forum, with the weekly posts from discord crossposted.

These messages are generated with the help of a [script](https://gitlab.com/gitlab-org/developer-relations/contributor-success/toolbox) that is being maintained and iterated on by the Contributor Success Team. The script runs on a Monday morning, and injects the messages into the `#contributor-success` channel in slack.

### Weekly message posting

To post the messages:

* Copy the appropriate message from the `#contributor-success` Slack channel into the appropriate `#thanks` channel. The `Scope: GitLab Team mode` message goes to Slack `#thanks` and the `Scope: Wider Community mode` message goes to Discord `#thanks`.
* Verify the content is applicable to the audience (i.e. the internal message in slack, etc)
* Validate any automated user handle expansions to verify the correct person and add missing user handles.
* Send the message!
* Post the wider community message on the forum, too, under the [Community](https://forum.gitlab.com/c/community/39) category, with the addition of a crosslink to the Discord post.
    * If this is the first post since a release, open a new topic with the title: `GitLab x.xx Release Community Thanks` and use the tag `thanks`.
    * Otherwise, add a new message on the existing thread.
* Update the assignee of the tracking issues and due dates.

Tracking issues:

* [Internal Weekly message](https://gitlab.com/gitlab-org/developer-relations/contributor-success/team-task/-/issues/85)
* [Wider Community message](https://gitlab.com/gitlab-org/developer-relations/contributor-success/team-task/-/issues/186)

### Manual execution

In the event you need to generate the message(s) manually, you will need to follow these prerequisite steps:

1. Check out the latest `main` branch of the toolbox project: `git clone git@gitlab.com:gitlab-org/developer-relations/contributor-success/toolbox.git`
1. Change directory to the checked out project: `cd toolbox`
1. Install the required gems: `bundle install`

To generate the internal weekly message:

1. Execute the script following the 'weekly' example [here](https://gitlab.com/gitlab-org/developer-relations/contributor-success/toolbox/#community-mr-participants)
1. Paste the resulting message into `#thanks` in slack, taking care to note the keystrokes: `Paste this message into slack using Cmd-v, then apply formatting using Cmd-Shift-F`
1. Double check the message that was pasted - making sure to edit `@` mentions where slack has 'helpfully' incorrectly linked the user.
1. If exceptions were raised in the script for missing managers attempt to track down the acting manager or the next level up report and manually cc them in the message.
1. Send the message and join in the celebrations!
1. Record the PI numbers from the message in the [tracking issue](https://gitlab.com/gitlab-org/developer-relations/contributor-success/team-task/-/issues/85) if necessary.
1. Update the assignee of the tracking issue and due date.

To generate the external community message:

1. Execute the script following the 'wider' example [here](https://gitlab.com/gitlab-org/developer-relations/contributor-success/toolbox/#community-mr-participants)
1. Make sure to check the duration for which you want to run the report.
1. Paste the resulting message into `#thanks` in discord.
1. Double check the message that was pasted - to ensure the users/names all look 'right'.
1. Send the message and join in the celebrations!
1. Record the PI numbers from the message in the [tracking issue](https://gitlab.com/gitlab-org/developer-relations/contributor-success/team-task/-/issues/186) if necessary.
1. Update the assignee of the tracking issue and due date.

## Organizing and promoting events

### Event planning

- Draft an agenda before the meeting, including (make sure the document is open to anyone with the link)
  - Roll call, introductions
  - Various topics
  - Open floor for the community to bring topics
- Include instructions on how to join
  - Link to zoom (or any other video platform)
- Add the event to the [Developer Evangelism calendar](/handbook/marketing/developer-relations/developer-evangelism/calendar). If you are not a GitLab Team Member, ask a member of the [Developer Relations](/handbook/marketing/developer-relations/) team to add the event to the calendar.
- Follow the instructions below for social support or open a request at the [Code Contributor's planning repo](https://gitlab.com/gitlab-com/marketing/community-relations/contributor-program/general/issues/new?issuable_template=event-support-request).

### Social

- Draft a short action-oriented copy like: "Join the upcoming GitLab hackathon (link) on the N."
- Share the message on the following channels at least 2 weeks before, 1 week, and a day before the event:
  - Twitter: use your account but mention `@gitlab` (note: never share a Zoom link on Twitter)
  - [GitLab Community Discord](https://discord.gg/gitlab)

### Event platforms

- Ask [John Coghlan](https://gitlab.com/johncoghlan) for adding the event on [meetup.com](https://www.meetup.com/gitlab-virtual-meetups/). 
- Add the event on [GitLab Events page](https://about.gitlab.com/events/).

### Hackathons

There will be a quarterly [Hackathon](/community/hackathon/) for GitLab community members to come together to work on merge requests, participate in tutorial sessions, and support each other on the [GitLab Discord](https://discord.gg/gitlab).  Agenda, logistics, materials, recordings, and other information for Hackathons will be available on the [GitLab Community Hackathon](/community/hackathon/) page.

The event planning will be done following the [Hackathon issue template](https://gitlab.com/gitlab-org/developer-relations/gitlab-hackathon/-/issues/new?issuable_template=hackathon%20event%20plan) in the [GitLab Hackathon project](https://gitlab.com/gitlab-org/developer-relations/gitlab-hackathon).

GitLab teams are encouraged to use the following [Hackathon issue template](https://gitlab.com/gitlab-org/developer-relations/gitlab-hackathon/-/issues/new?issuable_template=hackathon%20team%20plan) to plan and prepare.

### Virtual hackathons/hackathon-in-a-box

We also encourage wider community members to organize events to encourage and support new contributors to GitLab. This could be done as a part of in-person or virtual [GitLab meetups](/handbook/marketing/developer-relations/evangelist-program/#meetups).

If wider community members are interested in including a hackathon as a part of a meetup, ask them to include this information when they open a [meetup issue](https://gitlab.com/gitlab-com/marketing/community-relations/evangelist-program/general/issues/new?issuable_template=meetup-organizer). Contributor Success team members will get in touch with the organizer and provide the necessary resources to support the event.

Some of the available resources can be found in the [hackathon-in-a-box folder](https://drive.google.com/drive/u/0/folders/1YWb16NAguXq9T5kORhNcXOk3JwdaS4NF), [GDK tutorials playlist](https://www.youtube.com/playlist?list=PL05JrBw4t0KofEeWa9EXUOS8kJHOjIH_W), etc. The program manager should also work with the organizer to create a list of issues that are good for first-time/inexperienced contributors and share the list with participants prior to the event. There should also be coordination with the organizer on GitLab merchandise that can be distributed to anyone who creates a Merge Request during the event.

### Community office hours

To facilitate communication between the wider community and GitLab team members, product teams may host community office hours. The purpose of these office hours is to gather wider community feedback on product/development, discuss wider community contributions, review MR backlog, and other topics. Office hour related issues or MRs will have the label `Office Hours` as you can see in [these examples](https://gitlab.com/groups/gitlab-org/-/issues?scope=all&utf8=%E2%9C%93&state=all&label_name[]=Office%20Hours).

Calls will be open to everyone and recordings will be posted after the call. See examples of past office hours from [this playlist](https://www.youtube.com/playlist?list=PL05JrBw4t0KrXZEInAfyddFlalvwaxL-I). To make it easier for the community to find the videos, each stage should create their own office hours playlist and link to it from their handbook page.

All the community office hour calls should be added to the [Developer Evangelism calendar](https://about.gitlab.com/handbook/marketing/developer-relations/developer-evangelism/#-team-calendar) and [meetup.com group](https://www.meetup.com/gitlab-virtual-meetups/).

#### How to organize a community office hour call

**Preparation**
- Once you have a finalized date and time, add it to:
  - the [meetup.com group](https://www.meetup.com/gitlab-virtual-meetups/) (meetup.com account available at your GitLab's 1Password vault)
  - the [developer evangelism calendar](https://about.gitlab.com/handbook/marketing/developer-relations/developer-evangelism/#-team-calendar)
- Update [the office hour running notes doc](https://docs.google.com/document/d/18ddf5d5xASImrYnAG9P8VJXe0I63SBXy7ufDBBNB5H4/edit#) with the Zoom URL and call details 
- Announce it [on Discord](https://discord.gg/gitlab)
- Tweet about it, [tagging GitLab](https://twitter.com/gitlab)
- The day before the call, post reminders on Discord

**Running the call**
- Ask for everyone's permission to live stream the call. Then press the Live Stream on YouTube button in Zoom to begin streaming.
- Enable close captioning in zoom for accessibility.
- Once the call starts, do a round of introductions asking the question: "what brought you to this call". This will help you adjust the call to the community's needs and, answer any questions/meet their expectations.
- Keep detailed meeting minutes

**After the call**
- Add the youtube video to the "office hour calls" playlist
- Post a recap and the video recording on Discord  

#### Community challenge

To encourage contribution to priority issues on an on-going basis (and not just during Hackathons), we will maintain a list of up to 5 priority issues for each [product stage](/handbook/product/categories/) and prizes will be given to wider community members who have MRs merged for these issues. These issues will have the label [`Community challenge`](https://gitlab.com/groups/gitlab-org/-/issues?label_name%5B%5D=Community+challenge) and more details such as prizes, assignment of these issues, etc.

### Community Newsletter
We run a [Community Newsletter](/handbook/marketing/developer-relations/developer-evangelism/#community-newsletter) to share developer-focused content, alert community members about upcoming events, and keep contributors engaged. The focus of the newsletter is on driving contributions and engagement. It will not be used to generate or nurture leads and allow us to connect with and share our community's contributions. 

#### Issues for new contributors

To highlight issues that would be good for new contributors, you can add a [label `quick win`](https://gitlab.com/groups/gitlab-org/-/issues/?sort=created_date&state=opened&label_name%5B%5D=quick%20win&first_page_size=50). It is strongly recommended that these issues have mentor(s) listed so that the new contributor knows who they can get help from while they work on the issue.

## Supporting the Wider Community Contributors

### Unblocking wider community contributions
Following GitLab's mission that [Everyone can contribute](https://about.gitlab.com/company/mission/#contribute-with-gitlab), the Contributor Success team helps unblock wider community contributors and move contributions forward. Sometimes other teams at GitLab do not have the capacity to support community contributions, but this should not stop the community from contributing.

These 10 GitLab values support efforts to unblock the wider community and push forward:
1. [Do it yourself](https://handbook.gitlab.com/handbook/values/#do-it-yourself)
1. [Short toes](https://handbook.gitlab.com/handbook/values/#short-toes)
1. [Collaboration is not consensus](https://handbook.gitlab.com/handbook/values/#collaboration-is-not-consensus)
1. [Bias for action](https://handbook.gitlab.com/handbook/values/#bias-for-action)
1. [Disagree, commit, and disagree](https://handbook.gitlab.com/handbook/values/#disagree-commit-and-disagree)
1. [Escalate to unblock](https://handbook.gitlab.com/handbook/values/#escalate-to-unblock)
1. [Cleanup over sign-up](https://handbook.gitlab.com/handbook/values/#cleanup-over-sign-off)
1. [Minimal viable change](https://handbook.gitlab.com/handbook/values/#minimal-viable-change-mvc)
1. [Everything is in draft](https://handbook.gitlab.com/handbook/values/#everything-is-in-draft)
1. [Make two-way door decisions](https://handbook.gitlab.com/handbook/values/#make-two-way-door-decisions)

### Seeking wider community contributions

GitLab team members seeking help can reach out to the wider community for contributions. It is suggested to start with smaller issues that have a clear implementation plan before moving on to bigger project requests.

- Add a `quick win` label to the issue.
- Add a clear implementation plan to the issue description.
- Share the issue on the GitLab Community Discord in the [#contribute channel](https://discord.com/channels/778180511088640070/997442331202564176).
- If a community contributor expresses interest, assign them to the issue.
- Follow up with the community contributor to see if they need help.

### First-time contributors
The first-time contributors can be identified after each release in the [First time contributors MRs dashboard](https://gitlab.biterg.io/app/kibana#/dashboard/df97f810-f397-11e8-8fe1-b354a33b38be).

Every time a contributor is opening a merge request to a GitLab namespace for the first time, the label "~1st contribution" is automatically applied to the merge request.

Once the merge request is reviewed and merged, the contributor can apply for the `#myfirstMRmerged` gift via a self-nomination form on the [nominations for GitLab swag page](/handbook/marketing/developer-relations/contributor-success/community-appreciation/#nomination-process).

Contributor Success team members can use the [outreach email/message template](/handbook/marketing/developer-relations/contributor-success/templates/email-templates.html) when sending the link for the first-time contributor gift.

### Working with the Core Team
More information on the [Core Team](/community/core-team/) is available in the [Core Team handbook page](/handbook/marketing/developer-relations/core-team/).

### For contributors who don't own a credit card 

For contributors who don't own a credit card and need to be manually verified, a GitLab team member can open an [internal request](https://gitlab-com.gitlab.io/support/internal-requests-form/) using the `Other -> Other (nothing else fits the request)` template. GitLab Support will follow the [Manual credit card validation process described in the handbook](https://about.gitlab.com/handbook/support/license-and-renewals/workflows/saas/ci_minutes.html#manual-credit-card-validation-for-community-contributors) to complete the request.

### For contributors who run out of compute minutes or other CI/CD resources

Wider community members may run out of monthly compute minutes, or run into other [GitLab CI/CD limits](https://docs.gitlab.com/ee/user/gitlab_com/index.html#gitlab-cicd) if they are working from a personal fork.

The solution is to work from the [GitLab community forks](https://gitlab.com/gitlab-community/meta#about).

### Community outreach

#### Contacting contributors

To be respectful to the contributor's privacy, we will only contact data that is publicly available to reach out to them.

Here are some ways to reach out to contributors to e.g. distribute Hackathon prizes or MVP swag:

- You can mention them in an issue using their GitLab user name.
- In private through our communication platform (Discord, Slack, etc.).
- A user might have e-mail or Twitter info on their GitLab profile. Sometimes users have the same username in other platforms (e.g. GitHub), and might have more information on their profiles there.
- Their e-mail address is stored in their git commits, unless they choose to use a [private commit e-mail](https://docs.gitlab.com/ee/user/profile/index.html#private-commit-email).

If you need assistance finding a contributor's email address please see [Finding Community Member Contact Information](/handbook/marketing/developer-relations/contributor-success/community-appreciation/#finding-community-member-contact-information)

Once you've found out the best way to contact them, you can choose to use a mention, e-mail or Twitter for instance.

#### Contributor blog post series

Goal is to publish a regular blog post featuring contributors from the community.  The format will be a [casual Q&A with a community member](/blog/2018/08/08/contributor-post-vitaliy/) and will be posted on the [GitLab blog page](/blog/).

When developing a blog post, follow the [blog guidelines](/handbook/marketing/blog/).

## Recognition for contributors

### Appreciation for highlighted contributions

From time to time, a wider community member will submit a particularly outstanding contribution. Other than thanking them on the MR, we might want to additionally show our appreciation by sending them some GitLab merchandise. Anyone in the GitLab team or in the wider community can follow the process to [nominate a contributor](/handbook/marketing/developer-relations/contributor-success/community-appreciation/).

### Top Annual Contributors

In order to recognize regular contributors, the list of top contributors for each calendar year will be published in the [Top Annual Contributors page](/community/top-annual-contributors/). There will be three categories of top contributors:

*  SuperStar: more than 75 MRs merged
*  Star: between 11 and 75 MRs merged
*  Enthusiast: between 5 and 10 MRs merged

Customized GitLab merchandise will be created for these contributors and will be available on Printfection. For GitLab team members, you can follow the steps below to get the awards to the wider community members.

1. Login to Printfection using the credentials in 1Password.
1. Under `Campaigns`, go to `Giveaways` and create a new `GIVEAWAY CAMPAIGN` (you may need to [create a new `Kit`](/handbook/marketing/brand-and-product-marketing/brand/merchandise-handling/#sending-gift-cards) under the `Merchandise` tab if you want to include more than one item).
1. Add the item/kit to the campaign.
1. Generate Giveaway links for each contributors.
1. Include the Giveaway link in the individual email to the Top Annual Contributors.

## Contributor lifecycle segments

In an effort to understand, support, and empower the GitLab code contributor community, we have come up with the following lifecycle segments.

These lifecycle segments are assigned on an individual user level. For organizational recognition, see [Leading Organizations](/handbook/marketing/developer-relations/leading-organizations/).

| Contributor Experience level | MRs merged
| ------ | ------ | 
| Level 0 | 0 MRs |
| Level 1 | 1 - 3 MRs |
| Level 2 | 4 - 25 MRs |
| Level 3 | 26 - 75 MRs |
| Level 4 | 75+ MRs |

| Contributor Status | MRs merged | Timeframe
| ------ | ------ | ------ |
| Casual contributor | < 10 MRs | Last 6 months | 
| Regular contributor | 10+ MRs | Last 6 months | 
| Leading contributor | 20+ MRs | last 6 months |
| [Core](/community/core-team/) | Election based | All time |

Segmenting our contributor community will allow us to understand better how contributors "move" across this funnel and how we can better support them through their journey.

The goal is to increase code contributors across all segments (except the inactive ones), by identifying ways to support and reward our contributors.

## Contributor metrics

Note: this is currently a working list of all locations where we can currently gather contributor metrics. It is not *yet* the final set of metrics we will be using to monitor the success of the contributor program with.

### Bitergia dashboards
The [Bitergia dashboard](https://gitlab.biterg.io) is public and anyone can use the dashboard to view/filter/export/analyze the data. A good place to start is the [Merged Community MRs dashboard](https://gitlab.biterg.io/app/kibana#/dashboard/f88a8d00-f36b-11e8-8fe1-b354a33b38be) as it includes information that most people are looking for such as merged community MRs, number of contributors (e.g. yearly), top contributors, merged MRs per milestone, etc. You can filter the dashboard data per milestone and repository (e.g. CE vs. EE).

| Dashboard | Description |
| --- | --- |
| [Contributors](https://contributors.gitlab.com) | Metrics associated to contributors (people) and organizations |
| [Contributions](https://gitlab.biterg.io/app/kibana#/dashboard/f88a8d00-f36b-11e8-8fe1-b354a33b38be) | Metrics associated to contributions (submitted MRs). It contains our main KPI. |
| [Hackathon](https://gitlab.biterg.io/app/kibana#/dashboard/9097a7d0-55bd-11eb-a6f8-03728e7a4c82) | Metrics associated to the quarterly GitLab Hackathon. Change the time scale to zoom into a specific Hackathon |
| [Contributions and contributors over time](https://gitlab.biterg.io/app/kibana#/dashboard/1a47afc0-b950-11eb-a6f8-03728e7a4c82?_g=(refreshInterval%3A(pause%3A!t%2Cvalue%3A0)%2Ctime%3A(from%3Anow-10y%2Cmode%3Arelative%2Cto%3Anow))) | Overview of contribution and contributor growth over release, month and year time periods |

There are a number of other custom dashboards also available and to see the full list, click on `dashboard` on the upper left (next to the Bitergia logo) and then select the dashboard link from the list. To learn more about using the Bitergia dashboard, you can view recordings of Bitergia training at the [Bitergia training livestream channel](https://www.youtube.com/playlist?list=PL-gGdYiFOp7_9ij_wNLKyHgZsyhAY42rv). Specific Bitergia documentation is available on the [Bitergia FAQ](https://gitlab.com/Bitergia/c/FAQ).

Identity management is available on Bitergia's [HatStall](https://gitlab.biterg.io/identities/hatstall/profiles). Amongst other capabilities, HatStall enables merging/unmerging identities from the same person (to avoid their contributions being counted multiple times) and enrollment/offboarding identities to organizations. Use the [same login as the main Bitergia platform](#advanced-features-and-login).

#### Advanced features and login

Some administrative features for Bitergia dashboards (e.g. getting a short URL, creating a new permanent dashboard) require a login, and the login information is available in the Team Vault on 1Password.

#### Bitergia License

GitLab has a subscription with Bitergia for an annual membership renewed on the 1st of October each year. Bitergia is responsible for sending a Statement of Work (SOW) to be signed by GitLab, a month prior the expiration of the license. Contributor Success' Director should include the Bitergia subscription in the program's annual budget planning.

#### Contacting Bitergia support

The Bitergia team can be reached out for support and feature requests via their regular [customer contact process](https://gitlab.com/Bitergia/c/FAQ/-/blob/master/how-to-general/README.md#contact-support)

### SiSense dashboards
Internally, GitLab uses [SiSense](https://about.gitlab.com/handbook/business-technology/data-team/platform/sisensecdt/) for tracking down the performance of various KPIs. Below you can find a list of community-related dashboards, similar to Bitergia's ones. Both tools, SiSense and Bitergia, are in sync, and we use Bitergia as the primary metrics platform for community contributions.

| Dashboard | Description |
| --- | --- |
| [Wider Community Dashboard](https://app.periscopedata.com/app/gitlab/593556/Wider-Community-Dashboard) | Metrics associated to contributors (people) and organizations |
| [Community Contributions KPI](https://app.periscopedata.com/app/gitlab/729542/Community-Contributions-KPI) | Metrics associated to [Developer Relations KPIs](https://about.gitlab.com/handbook/marketing/developer-relations/performance-indicators/#unique-community-contributors-per-month) (like unique contributors per month, etc) |
| [Wider Community Contribution Dashboard](https://app.periscopedata.com/app/gitlab/833190/Wider-Community-Contribution-Dashboard) | Metrics associated to community contributions, including time to triage, [MRARR](https://about.gitlab.com/handbook/engineering/performance-indicators/#mrarr) forecast for merging month, etc |


### GitLab.com
You can also directly query data from `Merge Requests` pages for projects (e.g. CE, EE, Omnibus, Shell, etc.) on gitlab.com and apply appropriate filters for milestone, labels, etc. Some of the examples are listed in the metrics table below.

### Number of Contributors
In the past we often mentioned 2,000+ contributors in the GitLab community (GitLab team members + wider community) as you can see in [this example](/blog/2018/08/13/join-the-gitlab-community/). However, this only included contributors to CE and EE projects based on the old [https://contributors.gitlab.com](https://web.archive.org/web/20190619012814/http://contributors.gitlab.com/) page.

If you include other GitLab projects, the [total number of contributors](https://gitlab.biterg.io/goto/97a5b88e986f2c5d81c017c6413910a1) is much larger.

- Total code contributors: includes GitLab team members and wider community contributors (since 2015)
- Wider community code contributors: includes wider community contributors only (since 2015)
- These figures count contributors who have opened at least one merge request, regardless of whether the merge request has been merged, closed or is still open.

- The number of wider community code contributors with a successful contributions (whose Merge Requests have been merged), can be found by applying the "merged" filter on the [Bitergia dashboard](https://gitlab.biterg.io/goto/2d7a935826f511844c52291300f3d3b2)
  - See [our top misused terms page](/handbook/communication/top-misused-terms/) for a refresher on the definition of wider community members.

When people ask about the number of contributors at GitLab, it's best to clarify if they're asking about total code contributors or wider community code contributors. In most cases, people tend to be more interested in the wider community number.

It's also important to mention that there are other ways the community contributes to GitLab other than code, as listed in our [Contribute to GitLab guide](https://about.gitlab.com/community/contribute/). Contributions like Translations, Evangelism, support on our Forum, and opened issues are not included in the metrics above.

### Monitored projects

We monitor and recognize contributions across a variety of projects on the [`gitlab-org` group](https://gitlab.com/groups/gitlab-org), not only [the GitLab project](https://gitlab.com/gitlab-org/gitlab).

As a general rule, a project will be set up for monitoring wider community contributions if it uses the `gitlab-org` group milestones and the `Community contribution` label.

See the exhaustive list of [monitored `gitlab-org` group projects](https://gitlab.com/Bitergia/c/gitlab/sources/blob/master/projects.json).

Are you interested in contributing to GitLab? Check out the available [contribution opportunities here](/community/contribute/).
