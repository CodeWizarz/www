<!--
### Notes for the Release post manager

The release post MR and the related MRs, issues, and files required for the release post process should be automatically generated at the beginning of the month.

If there was a problem and you are creating this MR manually, first try to restart the automated process by referring to the [Release post branch creation Rake task](https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-post-branch-creation-rake-task) in the GitLab handbook.

If the task continues to fail, follow these steps to perform a [Manual Release Post Kickoff](https://about.gitlab.com/handbook/marketing/blog/release-posts/manual-release-post-kickoff/).

-->

# Overview

Process Improvements? Have suggestions for improving the release post process as we go?
Capture them in the [Retrospective issue](RETRO_ISSUE_LINK).

- **[Preview page](https://about.gitlab.com/releases/gitlab-com/)** (shows the latest merged content blocks, for reference use until the Friday the milestone ends)
- **[View App](https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/index.html)** (shows the introduction, MVP and latest merged content blocks, for reference use between the Monday of release week and Wednesday, the day before the release date)

_Release post:_

- **[Intro](https://gitlab.com/gitlab-com/www-gitlab-com/blob/release-X-Y/sites/uncategorized/source/releases/posts/YYYY-MM-22-gitlab-X-Y-released.html.md)**
- **[Items](https://gitlab.com/gitlab-com/www-gitlab-com/blob/release-X-Y/data/release_posts/X_Y)**
- **[Images](https://gitlab.com/gitlab-com/www-gitlab-com/tree/release-X-Y/source/images/X_Y)**
- **[MVP Nomination Issue](MVP_ISSUE_LINK)**
- **[Retro](RETRO_ISSUE_LINK)**

_Related files:_

- **[Features YAML](https://gitlab.com/gitlab-com/www-gitlab-com/blob/release-X-Y/data/features.yml)**
- **[Features YAML Images](https://gitlab.com/gitlab-com/www-gitlab-com/blob/release-X-Y/source/images/feature_page/screenshots)**
- **[Homepage YAML](https://gitlab.com/-/ide/project/gitlab-com/marketing/digital-experience/buyer-experience/edit/X-Y-release-post-changes/-/content/index.yml#:~:text=event_type%3A%20Release%0A)**
- **[MVPs](https://gitlab.com/gitlab-com/www-gitlab-com/blob/release-X-Y/data/mvps.yml)**

_Release post task and branch ownership:_

- The **Release Post Manager (RPM)** is solely in charge of changes to the release post branch. To avoid potential merge conflicts later during content assembly, it is imperative that Technical Writers do not merge updates from `master` to the release post branch even if it is falling behind or if there is a conflict. The RPM will take care of conflicts as part of the content assembly process on the Monday of release week and work with the Technical Advisor as needed.

_Handbook references:_

- [Blog handbook](https://about.gitlab.com/handbook/marketing/blog/)
- [Release post handbook](https://about.gitlab.com/handbook/marketing/blog/release-posts/)
- [Markdown guide](https://about.gitlab.com/handbook/markdown-guide/)

_People:_

- [Release Post Managers](https://about.gitlab.com/handbook/marketing/blog/release-posts/managers/)
- [Release Managers](https://about.gitlab.com/community/release-managers/)

| Release post manager | Tech writer | Technical Advisor | Social | PMM lead | Product Operations DRI | Release post manager shadow |
| --- | --- | --- | --- | --- | --- | --- |
| `@release_post_manager` | `@tw_lead` | `@tech_advisor` | DRI: `@social` for Slack Checklist item | `@pmm_lead` | `@justinfarris` | `@rpm_shadow` |

_Response time SLA:_

To accommodate the tight timelines of tasks during the Monday of release week and the release day, members of the release post team are asked to commit to one-hour response times in Slack during their working hours on those dates.

---

### Release post kickoff (`@release_post_manager`) due by the Wednesday, 15 days before the release day

**Note:** There are several tasks in this checklist that can be done any time before the listed due date. If a task says "no earlier than", it is important to follow that guideline.

#### Opening tasks

**Due date: Wednesday, 15 days before the release day**

##### Calendar

1. [ ] Schedule a coffee chat with the previous RPM to get advice and updated information.
1. [ ] Schedule a 25-minute retrospective meeting with the release post team as soon as possible after the release day.
1. [ ] Schedule two weekly 15-minute standups using this [agenda template](https://docs.google.com/document/d/1nVl3aMi6uwXKzoD3IPgh_bMzu9QaxnCRAcSgiV-Vm_E/edit).
   - Avoid scheduling them on Mondays when possible due to time zones and holidays.
   - Invite the TW Lead, Tech Advisor (required), and PMM Lead
   - If time zones pose a challenge, use `#X-Y-release-post-prep` for virtual standups at a consistent time/day.
1. [ ] Review the major due dates in the standup agenda.
   - If any fall on weekends, holidays, or Family and Friends day, inform your release post team in `#X-Y-release-post-prep` to make necessary arrangements.
1. [ ] Confirm that the release post bot initialized the release post with initial commits by the 3rd of the month. Ex. You may expect to see 3 commits for `Init release post for 16.x`,`Updated removals content`, and `Updated deprecations content`. If no initial commits are visible, the automation may have failed. In this case, reach out to your technical advisor for support.

##### `#X-Y-release-post-prep`

1. [ ] Create a `X-Y-release-post-prep` channel in Slack.
   1. [ ] Invite `@tw_lead`, `@tech_advisor`, `@pmm_lead`, `@rpm_shadow`. There is no need to invite the social team to the channel.
1. [ ] Update the `#X-Y-release-post-prep` Slack bookmarks in the `#X-Y-release-post-prep` channel:

   ```md
   MR: RP_MR_LINK
   Preview page: https://about.gitlab.com/releases/gitlab-com/
   Review App: https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/
   Retro issue: RETRO_ISSUE_LINK
   MVP nominations: MVP_ISSUE_LINK
   ```

1. [ ] Paste the following in `#X-Y-release-post-prep`:

   ```md
   Hi team! This channel is to discuss production-specific topics that don't concern the broader product team. By keeping our conversations in this channel, we can help keep #release-post clean.

   :brain: TW Lead and Tech Advisor, please take a minute to look over your roles in the Handbook and consider a coffee chat with the previous team member in your role.

   - [TW Lead](https://about.gitlab.com/handbook/marketing/blog/release-posts/#tw-lead)
   - [Tech Advisor](https://about.gitlab.com/handbook/marketing/blog/release-posts/#technical-advisors)

   Also, @tw_lead, just a gentle reminder not to merge in changes from master to the release post branch. I will take care of all changes to the release post branch; even if there is a merge conflict or things are falling behind.
   ```

##### `#release-post`

1. [ ] Update the `#release-post` Slack bookmarks in the `#release-post` channel:

   ```md
   MR: RP_MR_LINK
   Preview page: https://about.gitlab.com/releases/gitlab-com/
   Review App: https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/
   Retro issue: RETRO_ISSUE_LINK
   MVP nomination: MVP_ISSUE_LINK
   ```

1. [ ] Paste the following in `#release-post`:

   ```md
   Hi team! I'll be your release post manager for X.Y! I'm joined by @tw_lead as our TW Lead and @tech_advisor will be our Tech Advisor for this release.
   ```

#### Confirm Slackbot reminder

**Due date: Monday of the week the milestone ends**

1. [ ] Confirm `ProdOps Slackbot` posted a message titled, `Release post reminders` in `#release-post`

   - If no message is present, post a message in `#X-Y-release-post-prep` directing the Tech Advisor to investigate.

### Content assembly and initial review (`@release_post_manager`) Monday to Friday the week before release week (10 to 6 days before release day)

#### Timing of Final Content Assembly and Structural Check

On the Monday of release week, Final Content Assembly and Structural Check steps will start around 8 AM PST.

Coordination between the RPM and TW Lead is necessary if they are in different time zones to minimize disruption. Starting time may be adjusted, but Final Content Review with CEO and CProdO must start by 12 PM PST on the Tuesday of release week to allow time for feedback and changes.

### Final merge related tasks (`@release_post_manager`) due by the Friday the milestone ends

**Due date: the Friday the milestone ends**

Engineering managers listed in the MRs are responsible for merging content blocks (release post item MRs) as soon as the implementing issue(s) are officially part of the release. All release post items must be merged on or before the Friday the milestone ends. Earlier merges are preferred whenever possible. If a feature is not ready and won't be included in the release, the EM should push the release post item to the next milestone.

To assist managers in determining whether a release contains a feature. The following procedure [documented here](https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/34519) is encouraged to be followed. In the coming releases, Product Management and Development will prioritize automating this process both so it's less error-prone and to make the notes more accurate to release cut.

---

 **Due date: the Friday the milestone ends**


1. [ ] In the `#X-Y-release-post-prep` channel, remind the team that from the Monday of release week and the release day, release post team members are asked to maintain a one-hour response time in Slack during their working hours. This is to ensure the smooth progression of time-sensitive tasks during this window.

   ```md
   :waves: Hi Team - This is a reminder that we have a 1 hour SLA from the Monday of release week and the release day.  Here is a list of each of our timezones and working hours in UTC.  Hopefully this will make coordination during the 1 hour SLA windows for a little easier.
   ```


### Content assembly (`@release_post_manager`) due on the Monday of release week

**Due date: Monday of release week** at **4 pm UTC (11 am ET / 8 am PT)** and NO earlier

On the `release-X-Y` branch:
1. [ ] Verify the presence of .yml files in the `X_Y` data directory: `data/release_posts/X_Y/`.
1. [ ] Verify the absence of .yml files in the `unreleased` data directory: `data/release_posts/unreleased/`.
   - In case there are files left, discuss with the Tech Advisor whether to move them manually or to delete them. 
1. [ ] Verify the presence of image files in the `X_Y` image directory: `source/images/X_Y/`.
1. [ ] Verify the absence of image files in the `unreleased` image directory: `source/images/unreleased/`.
   - In case there are files left, discuss with the Tech Advisor whether to move them manually or to delete them. 
1. [ ] Verify the presence of a cover image in `source/images/X_Y`.
   - Update `image_title` and `twitter_image` lines in `sites/uncategorized/source/releases/posts/YYYY-MM-DD-gitlab-X-Y-released.html.md`.
   - Add a line `rebrand_cover_img: true` at the end of the block ([example MR](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/126593/diffs?commit_id=bb213bfb8db722d799bc6be632b4972421c25341#d09f67b71cce4f46350d3f676272c0abe6231b7b_12_12)).
   - Cover images for 16.x releases have been pre-created and can be found [here](https://drive.google.com/drive/folders/18YNR93JyKbhL16iImVGUErpGfIyZ2UvM) and have been placed in the proper directory in `source/images/X_Y`.
   - For cover images after 16.11 release, create a request similar to [this one](https://gitlab.com/gitlab-com/marketing/corporate_marketing/corporate-marketing/-/issues/8049).
   - If the cover image was generated by the GitLab marketing team, remove the cover image license block (`cover_img`) since it is not needed for GitLab generated images.
1. [ ] Do a  check of the blog post and ordering of content blocks for secondary items to confirm they are grouped by stage in descending alphabetical order.
   - Be sure to wait until after the content bot runs. Otherwise, content may be missing or incomplete.
   - If any of the steps above cannot be verified, content assembly may have failed. Mention `@tech_advisor` in a comment on this MR and in `#X-Y-release-post-prep` and proceed with the steps below. Optionally, you may choose to move the files manually by following the [steps outlined here](https://about.gitlab.com/handbook/marketing/blog/release-posts/manual-release-post-kickoff/#if-the-content-assembly-bot-fails).
   - If the length of one column is much longer than the other, you can force a block of content from the left to the right or vice versa by adding a `force_left: true` or `force_right: true` to an entry's yml file. ([Example](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/100024/diffs?_gl=1*1b0u09k*_ga*MTA4ODEzMDUzMi4xNjM1NzY3NjU1*_ga_ENFH3X7M5Y*MTY3MDAwOTQ3My4yNDEuMC4xNjcwMDA5NDczLjAuMC4w))
1. [ ] Update the release post intro in the `sites/uncategorized/source/releases/posts/YYYY-MM-DD-gitlab-X-Y-released.html.md` with 4 primary features to highlight. To do this:
   1. [ ] Make sure to remove the backticks around the features.
   1. [ ] Make sure to update the feature placeholder text for `title:` and `description:`.
   1. [ ] Link the release post items mentioned in the intro to the item blocks within the release post. For example, for a feature named `"Define test cases in GitLab"`, the link from the introduction should point to `#define-test-cases-in-gitlab`.
   1. [ ] Count the feature blocks to get the total number of improvements and add it to the intro, replace the `XX` in `from the XX improvements` and remove the backticks in `sites/uncategorized/source/releases/posts/YYYY-MM-DD-gitlab-X-Y-released.html.md`. This count includes the top feature, primary features, secondary features, usability improvements, and performance improvements. Do not count bugs, upgrades, etc. **You should use an approximate count (i.e. 40+ instead of 43)** because the number can shift after the release post goes live.
   1. [ ] Replace the `XX` in `We thank our community for the XX contributions` with the count of merged milestones found in [this chart](https://app.periscopedata.com/app/gitlab/729542/Wider-Community-PIs?widget=16283842&udv=1733878). Remove the backticks as well.
   1. [ ] Pick a primary feature entry to be the [top feature](https://about.gitlab.com/handbook/marketing/blog/release-posts/#top-feature) and change the type from `primary` to `top`.
      1. If you are unsure what to pick, you can solicit feedback from `@product-team` in `#release-post`.
1. [ ] In the `#contributor-success`, remind the contributor success team that the MVP MR is due on the Tuesday of release week.

```md
Hi Team - I'm the release post manager for release X.Y. This is a reminder that the MVP for this release is due on the Tuesday of release week.  
```

1. [ ] Ensure that the social sharing text is available and correct on the release post. This text comes from the `title:` element in `sites/uncategorized/source/releases/posts/YYYY-MM-DD-gitlab-X-Y-released.html.md` and should appear below the post introduction inside the social sharing block. View the release post in the Review App and look for `Click to tweet!` to find the social sharing text.

### Hand off for TW review (`@release_post_manager`) due on the Monday of release week

TW review cannot proceed if content assembly is incomplete. Only perform these steps if the content assembly verification you performed above has passed.

**Due date: Monday of release week**

1. [ ] Make sure there are no broken links in the Review App (**View App**) page (use a dead link checker like [Check my Links](https://chrome.google.com/webstore/detail/check-my-links/ojkcdipcgfaekbeaelaapakgnjflfglf)). _Note that the link to the GitLab Runner CHANGELOG.md will be broken at this time. This is expected and will be resolved by the Runner team at the time of publication._
   1. [ ] You can fix broken icon links for the different stages by adding `stage_url: '/stages-devops-lifecycle/'` underneath `stage` as [in this example](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/120791/diffs?commit_id=405f9b04da1550e6c2cefb8605a01360677c72f8).
   1. [ ] Links to confidential issues may be missed. It is helpful to check for broken links as an unauthenticated GitLab user (either logged out, in another browser, or in Incognito mode).
   1. [ ] If there are links to external blogs that are still broken in the Review App, check with PMs and others as needed to make sure the referenced blogs go live before the release day.
   1. [ ] Make sure the video links work and that the video is set to public, so that the content can be seen by an audience external to GitLab.
1. [ ] Check all comments in the MR thread (make sure no contribution was left behind).
1. [ ] Make sure all discussions in the thread are resolved.
1. [ ] Confirm the list of deprecations and removals in the release post reflects the deprecations and removals in docs. Search the deprecations page to make sure there aren't any removals this milestone that got missed.  Not all removals happen on major x.0 releases.
1. [ ] On the docs pages, all H2 titles that apply to the release should be listed as bullets at the bottom of the release post. In case there are deprecations missing from the release post preview:
   1. [ ] Copy the missing headlines from the [deprecations overview](https://docs.gitlab.com/ee/update/deprecations.html) into `/data/release_posts/deprecations-index.yml/` and commit the changes. Make sure the bullet points are listed in alphabetical order.
   1. [ ] Check whether the additional bullet points are present in the Review App once it has been recompiled
1. [ ] Check if any [removals](https://docs.gitlab.com/ee/update/removals.html) in this release post milestone are indicated as "Breaking Changes" in docs.
1. [ ] If the pipeline is failing, confirm all release post content blocks have the right formatting. Common issues include extra spaces, missing quotes, or missing `---` at the beginning and end. If you are unable to locate these items, give the TW lead a heads up and proceed with TW Lead structural check.
1. [ ] Assign the MR to the next reviewer (TW lead) and ping them to complete the [structural check](#structural-check).
1. [ ] Ask the Tech Advisor in Slack `#X-Y-release-post-prep` channel to prep handoff of any release post issues to the next Tech Advisor by referencing [TA handoff](https://about.gitlab.com/handbook/marketing/blog/release-posts/#handoff).

### Final content review (`@release_post_manager`)

**Due date: Tueday of release week**

**Note: The final review should happen after the TW Lead [structural check](#structural-check) is complete.**

#### Verify content and post for review

1. [ ] Check to be sure there are no broken links in the View App (use a dead link checker like [Check my Links](https://chrome.google.com/webstore/detail/check-my-links/ojkcdipcgfaekbeaelaapakgnjflfglf). _Note that the link to the GitLab Runner CHANGELOG.md will be broken at this time. This is expected and will be resolved by the Runner team at the time of publication._
1. [ ] Check the Review App URL on social media with [Meta Tags](https://metatags.io/). Make sure that in both cases, you can see the cover image of the release post displayed along with social sharing copy.
   1. If the cover image is not displaying or you see other error messages, resolve these issues by consulting with the Tech Advisor or Social team as needed. Also try checking the `title:`, `description:` and `twitter_image:` values in the release post markdown file as these are used for generating then social media metadata.
   1. You may get a warning from Facebook that says `Missing Properties - The following required properties are missing: fb:app_id` - this can be ignored.
1. [ ] Check [deprecations in Docs](https://docs.gitlab.com/ee/update/deprecations) to see if there were any deprecations listed with a _planned removal date_ for the current milestone. If so, make sure that you see those deprecations listed in the removals section of your release post page (View App). If there's any missing, alert the PM DRI to get it resolved.
1. [ ] Mention `@Sid`, `@david` in the `#release-post` channel when the post has been generated for their review per these [communication guidelines](https://about.gitlab.com/handbook/marketing/blog/release-posts/#communication).

   ```md
   @Sid, @david - The X-Y Release Post has been generated and can be reviewed at `https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/`.  The X.Y release post MR is `RP_MR_LINK`
   Please share your feedback by 6 pm UTC (1 pm ET / 11 am MT/ 10 am PT) on DAY. Thank you for your review!
   Note: Currently there are no known issues/adjustments to the content.
   cc: @justinfarris, @tw_lead
   ```

1. [ ] Capture any feedback from Slack into a single comment on the Release Post MR with action items assigned to the DRIs to address. Check the [content review guidelines](https://about.gitlab.com/handbook/marketing/blog/release-posts/#content-reviews) for more details.

#### Create the What's New MR

To complete these tasks, you will need to

1. [ ] Identify the 3-7 items for **What's New** and create the MR by following the guidance in [Creating an MR for What's New entries](https://about.gitlab.com/handbook/marketing/blog/release-posts/index.html#creating-an-mr-for-whats-new-entries).
1. [ ] Post the following message in `#backend_maintainers` on Slack:
`I am the release post manager for XX.Y and will need help merging in the "What's new" notification following the publication of the release post. This will be a time-sensitive MR on the release day (15:00-19:00 UTC). Could I please request a volunteer or two to be ready and available to help merge the MR when I have it ready to go? Thanks! cc: @a_akgun`
1. [ ] Create and finalize the MR draft by 11:59 PDT on Wednesday, the day before the release day.
1. [ ] Tag in any maintainers who respond to the above message in `#backend_maintainers` as Reviewers, to review and approve.
1. [ ] If you do not have merge rights on `gitlab-org/gitlab`, mention to the maintainers you've tagged above that you will need them to merge this MR *after the release post is live on the release day*. (There is a task on the release day reminding you to merge or request to merge.). If a release happens over the weekend, changes will not be reflected until a deployment happens on the Monday after the release. 

---

### Prepare and merge to `master` (`@release_post_manager`) from Tueday of release week to the Thursday, release day

**Due date: Tuesday of release week**

#### Incorporating Feedback

1. [ ] Make sure all feedback from CEO and Product team reviews have been addressed by working with the DRIs of those areas as needed.
1. [ ] If you receive feedback about the ordering of the primary items, you might need to adjust the order.
1. [ ] If needed, re-order secondary items by adjusting the `titles` in the content blocks. More information to consider about altering secondary items in the [content review guidelines](https://about.gitlab.com/handbook/marketing/blog/release-posts/#content-reviews) and [feature order technical instructions](https://about.gitlab.com/handbook/marketing/blog/release-posts/#feature-order).
1. [ ] Make sure there are no open feedback items in this MR or in the `#release-post` channel.

#### Branch maintenance

1. [ ] Check if the number of features you added in the introductory paragraph has changed. To get the number, do a hand count of just the features (top, primary, secondary) in `/data/release_posts/X_Y`, and also count the number of items in the performance improvements and the usability improvements files in the current `release-X-Y` branch. Do not include bugs, upgrades, etc. You can use an approximate count (i.e. 40+ instead of 43). Remove the backticks around the number if you have not already.
1. [ ] Check if the number of [merged community contributions](https://app.periscopedata.com/app/gitlab/729542/Wider-Community-PIs?widget=16283842&udv=1733878) you added in the introductory paragraph has changed. Remove the backticks around the number if you have not already.
1. [ ] Verify that the MVP content has been updated and rendering correctly. The `fullname` and `gitlab` fields should not be set to `false` in the `data/release_posts/X_Y/mvp.yml` file, instead they should be populated with the nominated contributor's details.
1. [ ] Avoid rebasing the release post branch against master until after 0000 UTC the Wednesday before the release day to avoid other pipeline failures that then will require manual intervention by the technical advisor. 

#### Announcements

1. [ ] Alert the product team of the top/primary items in Slack.
   1. PMs can use [this query](https://gitlab.com/gitlab-org/gitlab/-/merge_requests?scope=all&utf8=%E2%9C%93&state=merged&milestone_title=X.Y&not%5Blabel_name%5D%5B%5D=released%3A%3Acandidate) (update it with the current milestone) and check with their EMs to verify the features did make it into the release.
   1. Post in the `#release-post` channel:

   ```md
   _Hello PMs! The following features are top/primary!_

   Review App: https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/
   
   (Tag the PMs for the top/primary features listed in the release post).

   _Please let us know if any of your merged primary release post items shifted out of the release after the Monday of release week and will not make it into the final release packages by the release day._
   ```

1. Top/Primary items can move.
   1. It is the RPM's responsibility to make sure any top/primary items mentioned in the introduction are accurate prior to the release day, because release post items can sometimes move in/out of the packaged release after the Monday of release week, and this could affect the themes, headline, etc.
   1. If you learn that any top/primary items have moved in/out of the packaged release after the Monday of release week, communicate this directly to stop or start associated actions, with the DRIs for:
      1. [Technical Marketing](https://about.gitlab.com/handbook/marketing/strategic-marketing/technical-marketing/) (the TMM team), who produce demo videos per release.
      1. [Social Marketing](https://about.gitlab.com/handbook/marketing/integrated-marketing/digital-strategy/social-marketing/), who produce feature campaigns per release.
      1. [Corporate Communications](https://about.gitlab.com/handbook/marketing/corporate-communications/), who lead media outreach and may have produced a press release.
      1. Any other related efforts you're aware of, for example related blog posts.
1. [ ] Post a comment in the `#whats-happening-at-gitlab` channel.

   ```md
   Hey all!
   This month's release post is almost ready!
   Take a look at the preview and either report any problems in `#release-post`, or leave a comment to the release post MR.
   MR: RP_MR_LINK
   Review App (this link is temporary and should only be shared internally):
   https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/index.html
   cc @release_post_manager
   ```

**Due date: Day before release day**

1. [ ] Check if all the anchor links in the intro are working.
1. [ ] Confirm there are no broken links in the Review App (**View App**) with a dead link checker like [Check my Links](https://chrome.google.com/webstore/detail/check-my-links/ojkcdipcgfaekbeaelaapakgnjflfglf)). _Note that the link to the GitLab Runner CHANGELOG.md will be broken at this time. This is expected and will be resolved by the Runner team at the time of publication._
1. [ ] Check the total feature count statement in the introductory paragraph to make sure the number stated is accurate, and if not, update it. To get the number, do a hand count of the top feature, primary features, secondary features, and performance improvements (do not count bugs, upgrades, etc.) in `/data/release_posts/X_Y` on the current `release-X-Y` branch.
1. [ ] If needed, use the [`/rebase` quick action](https://docs.gitlab.com/ee/user/project/quick_actions.html) to rebase `master` on to the `release-X-Y` branch. If you receive an error that the rebase cannot be scheduled, consult with the Tech Advisor.
1. [ ] Check to make sure all unresolved threads on this MR are resolved and there are no merge conflicts. If you need help resolving merge conflicts or other technical problems, ask for help from the [Technical Advisor](https://about.gitlab.com/handbook/marketing/blog/release-posts/#technical-advisors) in the `#dev-escalation`channel in Slack then cross-post to the `#release-post` channel to make others aware.
1. [ ] In the `#releases` channel, post the following: " I'm the release post manager for X.Y. I'll be awaiting your cue that packages have been released to push the release post live. Please let me know if there are any changes to the typical timeline."

**Due date: Release day**

##### At 12:30 UTC

1. [ ] Read the [important notes](#important-notes) below.
1. [ ] Say hello in the `#releases` channel to let the release managers know you're online and awaiting their signal in `#release-post` to start the release post's merge process.
   1. Release Managers will alert you in `#release-post` if there are any issues with the release. You can follow along on the release issue to see the packaging progress on the release day. Check the [issue list](https://gitlab.com/gitlab-org/release/tasks/-/issues/) to find the issue ([example issue](https://gitlab.com/gitlab-org/release/tasks/-/issues/1261)). The `#releases` channel is also a good place to track any updates or announcements.
   1. If everything is okay, the packages should be published around [13:30 UTC](https://gitlab.com/gitlab-org/release-tools/-/blob/fac347e5fc4e1f31cffb018d90061ef4f25747f3/templates/monthly.md.erb#L104-125), and available publicly around 14:10 UTC.
1. [ ] Check to make sure there aren't any alerts on in the `#release-post` and `#whats-happening-at-gitlab` channels.
1. [ ] Check to make sure there aren't any alerts on this MR or merge conflicts.

##### When packages are published (usually around 14:00 UTC)

After the release manager confirms that the packages are publicly available by pinging you in Slack:

1. [ ] Announce to the team in the `#release-post` channel that you are starting the final merge process, you will reach out for help if the MR fails, and that you will lead collaboration with the appropriate team members to resolve any problems.

   ```md
   :waves: Hi Team - I am starting the final merge process for the X-Y Release Post ([MR](RP_MR_LINK))!  I will reach out for help if the MR fails and collaborate with appropriate team members to resolve any problems.
   ```

   1. Depending on the complexity of the failure it is recommended that you first try to resolve the issue yourself and then reach out to the `#dev-escalation` channel per [What to do if your pipeline fails or you have other technical problems](#What-to-do-if-your-pipeline-fails-or-you-have-other-technical-problems).
1. [ ] Merge release post MR:
   1. Remove "Draft:" from the title of the MR
   1. Uncheck `Delete source branch`  
   1. Check `Squash commits` 
   1. Add the MR to - the merge train.
1. [ ] Wait for the pipeline. This can take anywhere from 20-45 minutes to complete.
1. [ ] Check the live [URL](https://release-X-Y.about.gitlab-review.app/releases/YYYY/MM/DD/gitlab-X-Y-released/) on social media (after the MR is merged) with [Meta Tags](https://metatags.io/). Make sure that in both cases, you can see the cover image of the release post displayed along with social sharing copy.
   1. If the cover image is not displaying or you see other error messages, resolve these issues by consulting with the Tech Advisor or Social team as needed.
   1. You may get a warning from Facebook that says `Missing Properties - The following required properties are missing: fb:app_id` - this can be ignored.
1. [ ] Check for broken links again after the post is live.
1. [ ] Hand off social posts to the social team and confirm that it's ready to publish: Mention `@social` in the `#release-post` Slack channel. Be sure to include the live URL link and social media copy (you can copy/paste the final copy from the Review App).
1. [ ] Share the links to the post in `#whats-happening-at-gitlab` in Slack.
1. [ ] Ping an engineer on the [Digital Experience Conversion Group team](https://about.gitlab.com/handbook/marketing/digital-experience/#groups-metrics--team-members) to merge the homepage update MR (link to the MR should be found in [here](https://gitlab.com/gitlab-com/marketing/digital-experience/buyer-experience/-/merge_requests)).
1. [ ] Merge (or request a maintainer to merge) the "What's New" MR after the images referenced in that MR have been checked to load correctly locally.

##### After the MR is merged

1. Keep an eye on Slack and in the blog post comments for a few hours to make sure no one found anything that needs fixing.

#### What to do if your pipeline fails or you have other technical problems

For assistance related to failed pipelines or eleventh-hour issues merging the release post, reach out to release post [technical advisors](https://about.gitlab.com/handbook/marketing/blog/release-posts/#technical-advisors) for assistance in the `#dev-escalation` Slack channel. Cross-post the thread from `#dev-escalation` in `#release-post` so all Product Managers and release post stakeholders are aware of status and delays.

##### Important notes

1. The post is to be live on the **release day** at **15:00 UTC**. It should be merged as soon as GitLab.com is up and running on the new release version (or the latest RC that has the same features as the release), and after all packages are publicly available. Not before. Ideally, merge it around 14:20 UTC as the pipeline takes about 40 min to run.
1. The usual release time is **15:00 UTC** but it varies according to the deployment. If something comes up and delays the release, the release post will be delayed with the release.
1. Coordinate the timing with the [release managers](https://about.gitlab.com/community/release-managers/). Ask them to keep you in the loop. Ideally, the packages should be published around 13:30-13:40, so they will be publicly available around 14:10 and you'll be able to merge the post at 14:20ish.
1. After the release post is live, wait a few minutes to see if anyone spots an error (usually posted in the `#whats-happening-at-gitlab` or `#company-fyi` channels), then follow the `handoff to social team` checklist item above.
1. The tweet to share on Slack will not be live, it will be scheduled during a peak awareness time on the release day. After the tweet is live, the social team will share the tweet link in the `#release-post` and `#whats-happening-at-gitlab` Slack channels.

---

## Other reviews

Ideally, the team should complete all the reviews by the Tuesday of release week, so that the 2 days before the release can be left for fixes and small improvements.

### [Structural check](https://about.gitlab.com/handbook/marketing/blog/release-posts/#structural-check)

**Due date: Monday of release week** (`@tw_lead`)

The structural check is performed by the technical writing lead: `@tw_lead`

#### Before the Monday of release week

- You can see all release post items for a release by running a query in GitLab.
  For example, to see all release post items for 15.10:

  ```html
  https://gitlab.com/dashboard/merge_requests?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=release%20post&label_name[]=release%20post%20item&label_name[]=Ready&milestone_title=15.10
  ```

  Replace `<15.10>` with the required version number.

- The release post `.yml` files are located in
  `https://gitlab.com/gitlab-com/www-gitlab-com/-/tree/master/data/release_posts/unreleased`.
  To save time, you can check their frontmatter in advance of the structural check on the Monday of release week.

- The release post images are located in
  `https://gitlab.com/gitlab-com/www-gitlab-com/-/tree/master/source/images/unreleased`.
  To save time, you can check the size of these images in advance of the structural
  check on the Monday of release week.

#### On the Monday of release week

When starting the structural check:

For suggestions that you are confident don't need to be reviewed, change them locally
and push a commit directly to save the PMs from unneeded reviews. For example:

- Obvious typos, like `this is a typpo`
- Minor front matter issues, like single quotes instead of double quotes, or vice versa
- Extra whitespace

For any changes to the content itself, make suggestions directly on the release post
diff and ping the author in the suggestion comment, so they can find it easily.

In the `www-gitlab-com` repository:

1. [ ] Remove any `.gitkeep` files accidentally included.
1. [ ] Add or check the `cover_img:` license block in `releases/posts/YYYY-MM-DD-gitlab-XX-Y-released.html.md`. If the image was generated by Marketing (which it often is), remove the cover image license block in the Yaml file.
1. [ ] Search for `available_in: [free, premium, ultimate]` and change to `available_in: [core, premium, ultimate]`.

In the Review App:

1. [ ] Check for duplicate entries.
1. [ ] Search for the text `gitlab-ci.yml` and ensure there is a period before the filename, for example, `.gitlab-ci.yml`.
1. [ ] Check that features introduced in this release do not mistakenly reference previous releases.
1. [ ] Check all dates to ensure they refer to the correct year.
1. [ ] Check the anchor links in the intro. All links in the release post markdown file should point to something in the release post YAML file.
1. [ ] Run a spell check against the release post's Review App (**View App**) page. For example, you can use [Webpage Spell-Check](https://chrome.google.com/webstore/detail/webpage-spell-check/mgdhaoimpabdhmacaclbbjddhngchjik?hl=en) for Google Chrome.
1. [ ] Confirm the list of deprecations and removals in the release post matches [the list in the docs](https://docs.gitlab.com/ee/update/deprecations.html). In the docs, all `H2` titles that apply to the release should be listed. Ping the RPM if there is a mismatch.

In general:

1. [ ] Report any problems from the structural check in the `#X-Y-release-post-prep` channel by pinging the reporters directly for each problem. Do NOT ping `@all` or `@channel`, and do NOT leave a general message that no one will pay attention to. If possible, ensure open discussion threads in this merge request track any issues.
1. [ ] Ping the release post manager in Slack `#X-Y-release-post-prep` to let them know your review is over and they can start [final content review](#final-content-review).
1. [ ] `Approve` the release post merge request to communicate you have completed your tasks.

#### After the Monday of release week

1. [ ] Be available for MR reviews for late submissions on the Tuesday and Wednesday before the release day. Remember that members of the release post team have a one-hour response time in Slack during their working hours on these dates.
1. [ ] Within 1 week of the structural check, update the release post templates and release post handbook with anything that comes up during the process.
1. [ ] Set a reminder for yourself on the Friday the milestone ends of the following month to prepare for the [versioned documentation release](https://about.gitlab.com/handbook/marketing/blog/release-posts/#versioned-documentation-release).

---

## Release highlights

`@pmm_lead` shares the release highlights to be distributed to the PR and Field Enablement teams on or before release day of the month. Detailed process [here](https://about.gitlab.com/handbook/marketing/blog/release-posts/#pmm-lead).

1. [ ] Create Product marketing issue with PMM-Release-Post template.
1. [ ] Create release highlights - 3-4 themes with description.
1. [ ] Share with PR and Field enablement team and tag release post manager.

/label ~"blog post" ~release ~"release post" ~"priority::1"
/assign @release_post_manager
/milestone %_MILESTONE_
