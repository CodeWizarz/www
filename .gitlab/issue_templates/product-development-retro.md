## Overview

The purpose of our retrospective is to help our R&D team at GitLab learn and improve as much as possible from every monthly release. The moderator for this Retrospective is `@TBD`.

Each retrospective consist of three parts:

- [Group Retrospectives](https://about.gitlab.com/handbook/engineering/management/group-retrospectives/): retrospectives held by individual groups
- [Retrospective Summary](https://about.gitlab.com/handbook/engineering/workflow/#retrospective-summary): a short pre-recorded video which summarizes the learnings across all group retrospectives
- [Retrospective Discussion](https://about.gitlab.com/handbook/engineering/workflow/#retrospective-discussion): a 25 minute live discussion diving into retrospective discussion topics]

### Output
- [X.X Retrospective Discussion Google Doc Bookmark](TBD)
- [X.X Discussion Suggestion Thread - TBD](TBD)
- [X.X Retrospective Summary Video - TBD](TBD)
- [X.X Retrospective Summary Presentation - TBD](TBD)
- [X.X Retrospective Discussion Video - TBD](TBD)

### References

- [Retro Doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit)
- [Handbook](https://about.gitlab.com/handbook/engineering/workflow/#retrospective)
- [Previous Retrospective Planning Issues](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues?scope=all&state=closed&label_name[]=Retrospective%20Planning)
- [Retrospective Planning Issue Template](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/.gitlab/issue_templates/product-development-retro.md)
- [Retrospective GoogleDoc Template](https://docs.google.com/document/d/1JCMzo4TI7bJ-9L8V9OrR7dJmBnrX2MA2PrGYmczsAaw/edit#heading=h.2ygf1533fg7p)
- [Retro Presentation Template](https://docs.google.com/presentation/d/1pkXwB7qOvVDMrWPgEfM6lsRntKvlo1QyxkEkvBzwBl0/edit#slide=id.gb4bfa1ceca_0_21)

### Timeline

- `M-1 26th`: GitLab Bot opens [Group Retrospective](https://about.gitlab.com/handbook/engineering/management/group-retrospectives/) issue for the current milestone.
- `M, 19th`: Group Retrospectives should be held.
- `M, 24th`: Moderator opens the Retrospective planning and execution issue.
- `M, 24th` to `M+1, 3rd`: Participants complete the Retrospective planning and execution issue, add their notes to the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit#), and suggest and vote on discussion topics.
- `M+1, 4th`: Moderator records the Retrospective Summary video and announces the video and discussion topics.
- `M+1, 6th`: Retrospective Discussion is held.

## Group Retrospectives

At the end of every release, each group should conduct their own retrospective. For details on how this is done, see [Group Retrospectives](/handbook/engineering/management/group-retrospectives/).

### Group Retrospective Tasks

While performing your Group Retrospectives:
1. Please conduct your Group Retrospective following the guidelines outlined in the [handbook](https://about.gitlab.com/handbook/engineering/management/group-retrospectives/).
1. After the Group Retrospective is complete, please choose a subset some of your most interesting learnings to share company-wide in the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit).  Please try to group by these by our [CREDIT values](https://about.gitlab.com/handbook/values/).
1. In the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit), if there is a learning that you would like to explicitely highlight, please add the text **highlight** at the beginning of the text. The moderator will highlight this along with other learnings listed in the retro doc when they create the pre-recorded video.
1. If there are improvement tasks for your group from the previous retrospective, please provide an update on them in the retro doc. They will be verbalized during the Retrospective Discussion.
1. If there are improvement tasks for your group in the current retrospective, please add them in the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit). They will be verbalized during the Retrospective Discussion.
1. Add a checkbox in the table of the Retrospective planning and execution issue when your Group Retrospective is complete and when the retro doc is updated.

While preparing for the Retrospective Discussion:
1. Suggest discussion topics by commenting on to the Retrospective planning and execution issue.
1. Vote on discussion topics by adding a :thumbsup: reaction. Voting closes on `M+1, 3rd`.
1. Once discussion topics are announced on `M+1, 4th`, begin adding your comments to the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit).
1. During the Retrospective Discussion, be prepared to verbalize any improvement tasks or commentary on the discussion topics. If you can't make the meeting and there is an item for you to verbalize, please ask someone else in your group to attend to do so.


| Group                       | Development Managers (DRIs)             | UX              | Product Manager | Retro done? | Doc updated? |
| --------------------------- | --------------------------------------- | :-------------: | :-------------: | :---------: | :----------: |
| Manage:Authentication and Authorization | @m_gill                      | @badnewsblair   | @hsutor         |  |  |
| Manage:Import               | @wortschi                               | @badnewsblair   | @ogolowinski    |  |  |
| Manage:Organization         | @mksionek                               | @badnewsblair   | @clohr          |  |  |
| Plan                        | @donaldcook + @johnhope                 | @badnewsblair   | @gweaver + @mushakov |  |  |
| Plan:Optimize             | @johnhope                                 | @badnewsblair   | @hsnir1         |  |  |
| Create:Code Review          | @mnohr + @andr3                         | @mvanremmerden  | @phikai         |  |  |
| Create:IDE               | @oregand                                | @mvanremmerden  | @ericschurter   |  |  |
| Create:Source Code          | @sean_carroll + @andr3                  | @mvanremmerden  | @tlinz   |  |  |
| Gitaly                      | @zj-gitlab                              | -               | @mjwood         |  |  |
| Manage:Foundations          | @samdbeckham                            | @tauriedavis    | @cdybenko      |  |  |
| Manage:Integrations         | @arturoherrero                          | @mvanremmerden  | @g.hickman       |  |  |
| Verify:Pipeline Authoring   | @marknuzzo                              | @rayana         | @dhershkovitch  |  |  |
| Verify:Pipeline Execution   | @carolinesimpson                        | @rayana         | @jheimbuck_gl   |  |  |
| Verify:Runner               | @erushton                               | @rayana         | @DarrenEastman  |  |  |
| Verify:Pipeline Security    | @shampton                               | @rayana         | @jreporter   |  |  |
| Package                     | @michelletorres                         | @rayana         | @trizzi         |  |  |
| Release                     | @nicolewilliams                         | @rayana         | @cbalane        |  |  |
| Configure                   | @nicholasklick                          | @jmandell       | @nagyv-gitlab   |  |  |
| Monitor                     | @crystalpoole                           | @jmandell       | @abellucci      |  |  |
| Secure:Composition Analysis | @gonzoyumo                              | @jmandell       | @smeadzinger    |  |  |
| Secure:Dynamic Analysis     | @twoodham                               | @jmandell       | @derekferguson  |  |  |
| Secure:Static Analysis      | @amarpatel                              | @jmandell       | @@connorgilbert |  |  |
| Govern:Threat Insights      | @nmccorrison + @thiagocsf               | @jmandell       | @abellucci      |  |  |
| Govern:Security Policies    | @alan                                   | @jmandell       | @g.hickman      |  |  |
| Govern:Compliance           | @nrosandich                             | @jmandell       | @derekferguson  |  |  |
| Database                    | @craig-gomes                            | -               | @fzimmer        |  |  |
| Distribution                | @mendeni                                | @mvanremmerden  | @dorrino        |  |  |
| Global Search               | @changzhengliu                          | @mvanremmerden  | @JohnMcGuire    |  |  |
| Geo                         | @nhxnguyen                              | @jackib         | @fzimmer        |  |  |
| Memory                      | @changzhengliu                          | -               | @fzimmer        |  |  |
| Sharding                    | @craig-gomes                            | -               | @fzimmer        |  |  |
| Fulfillment:Purchase        | @rhardarson                             | @jackib         | @tgolubeva      |  |  |
| Fulfillment:License         | @jameslopez                             | @jackib         | @teresatison    |  |  |
| Fulfillment:Utilization     | @csouthard                              | @jackib         | @amandarueda    |  |  |
| Analytics:Analytics Instrumentation | @bastirehm                      | @jackib         | @tjayaramaraju  |  |  |
| Growth:Activation           | @kniechajewicz                          | @jackib         | @s_awezec       |  |  |
| Growth:Acquisition          | @kniechajewicz                          | @jackib         | @s_awezec       |  |  |
| DataScience:Anti-abuse      | @jay_swain                              | @jmandell       | @jstava         |  |  |
| Quality                     | @vincywilson                            |                 |                 |  |  |
| UX                          | @vkarnes                                |                 |                 |  |  |


## Retrospective Summary

The Retrospective Summary is a short pre-recorded video which summarizes the learnings across all [Group Retrospectives](/handbook/engineering/management/group-retrospectives/) ([example video](https://www.youtube.com/watch?v=XdENBhVOSiw&feature=youtu.be), [example presentation](https://docs.google.com/presentation/d/1kH9TwUAXbslM1cac938hS4Y-3mEBojQlwHw_Mm44kDE/edit?usp=sharing)).

Once all Group Retrospectives are completed, each group inputs their learnings into a single publicly-accessible [retro doc](https://docs.google.com/document/d/1ElPkZ90A8ey_iOkTvUs_ByMlwKK6NAB2VOK5835wYK0/edit?usp=sharing). The  moderator then pre-records a video of the highlights. This video is then announced in the Retrospective planning and execution issue along with the #whats-happening-at-gitlab slack channel. In line with our value of [transparency](/handbook/values/#transparency), we also post this video to our public [GitLab Unfiltered channel](https://www.youtube.com/c/GitLabUnfiltered/videos).

## Retrospective Discussion

The Retrospective Discussion is a 25 minute live discussion among participants where we deep dive into discussion topics from our Group Retrospectives ([example](https://www.youtube.com/watch?v=WP9E7RbNSPw)). In line with our value of [transparency](/handbook/values/#transparency), we livestream this meeting to YouTube and monitor chat for questions from viewers. Please check the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit?usp=sharing) for details on joining the livestream.

#### Meeting Agenda

* Improvement tasks from the previous release (5 minutes)
* Discussion topics (14 minutes, 2 topics at 7 minutes each)
* Improvement tasks from the current release (5 minutes)
* Wrap up (1 minute)

#### Discussion Topics
For each retrospective discussion, we aim to host an interactive discussion covering two discussion topics. We limit this to two topics due to the length of the meeting.

The discussion topics stem from our Group Retrospective learnings and should be applicable to the majority of participants.

Discussion topics are suggested by participants by commenting on the Retrospective planning and execution issue. Participants can vote on these topics by adding a :thumbsup: reaction. The two topics with the most :thumbsup: votes will be used as the discussion topics. If there are not enough votes or if the discussion topics are not relevant to the majority of participants, the moderator can choose other discussion topics.

## Moderator

The moderator of each retrospective is responsible for coordinating the Retrospective planning and execution issue, presenting and recording the Retrospective Summary, and hosting the Retrospective Discussion. The job of a moderator is to remain objective and is focused on guiding conversations forward.

### Moderator Tasks

#### Opening Tasks
These tasks are to be completed when this issue is opened
- [ ] Ensure this issue is titled `X.X R&D Retrospective`
- [ ] Add your handle as the moderator in the [Overview](#overview) section of this issue
- [ ] Update the [GoogleDoc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit) for the new retrospective (Copy in and adjust the content from the [Template Doc](https://docs.google.com/document/d/1JCMzo4TI7bJ-9L8V9OrR7dJmBnrX2MA2PrGYmczsAaw/edit#heading=h.2ygf1533fg7p)). Reference the Retro Doc in the Output section.
- [ ] Add a comment introducing yourself as the Moderator
- [ ] Add a comment with `Template Improvements Thread` to track changes that need to make to [this issue template](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/.gitlab/issue_templates/product-development-retro.md)
- [ ] Create a thread for Discussion Topics to consider and vote on. Reference that comment/thread in the Output
- [ ] Ensure the Retrospective Discussion is scheduled on the team calendar for an appropriate date. Coordinate any changes with the EBA to the VP of Development.
- [ ] Add a reference to this issue reminding everyone to contribute in [`#development`](https://gitlab.slack.com/archives/C02PF508L), [`#product`](https://gitlab.slack.com/archives/C0NFPSFA8), [`#quality`](https://gitlab.slack.com/archives/C3JJET4Q6), [`#ux`](https://gitlab.slack.com/archives/C03MSG8B7) and [#eng-managers](https://gitlab.slack.com/archives/CU4RJDQTY) slack channels.
- [ ] Ping owners of followup items from the previous retro in the [GoogleDoc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit) and this issue template.

#### Follow Up Tasks
- [ ] Follow up with Group members to ensure they complete Group Retros and add to the Discussion Doc
- [ ] Voting ends at the close of business on `M+1, 3rd`. Take note of which discussion topics have the most votes at this time. If there are not enough votes or if you deem the discussion topics as not relevant to the majority of participants, please choose other discussion topics.

#### Summary Video Tasks
- [ ] Create a retrospective summary presentation ([template](https://docs.google.com/presentation/d/1pkXwB7qOvVDMrWPgEfM6lsRntKvlo1QyxkEkvBzwBl0/edit#slide=id.g8e3e21f43b_0_10)). Reference it in the Output section of this issue description.
- [ ] Please read through the Group Retrospective learnings in the [retro doc](https://docs.google.com/document/d/1nEkM_7Dj4bT21GJy0Ut3By76FZqCfLBmFQNVThmW2TY/edit).
- [ ] Add the learnings into a slide deck and identify the highlights you would like to cover.

- [ ] Record a video presentation summarizing the highlights.
- [ ] Upload this video to our public [GitLab Unfiltered channel](https://www.youtube.com/c/GitLabUnfiltered/videos). Put the Google Doc, Presentation and this Issue reference in the video description.
- [ ] Announce the video and discussion topics in Retrospective planning and execution issue, the #whats-happening-at-gitlab slack channel, and the retro doc.

#### Retrospective Discussion Tasks
- [ ] Host the Retrospective Discussion and press livestream to Youtube.

#### Closing Tasks
- [ ] Resolve any open `Template Improvement Thread` items by updating the [issue template](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/.gitlab/issue_templates/product-development-retro.md)
- [ ] Close this issue after the Retrospective Livestream has occurred

FYI: @fseifoddini @kencjohnston @david @joshlambert @hilaqu @meks

/label ~"Retrospective Planning"
