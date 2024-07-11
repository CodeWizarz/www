<!--
The Release Post Manager uses this issue to collect feedback on the release post. This issue is created by [release post branch creation task](https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-post-branch-creation-rake-task)

Guidelines for the release post manager before submitting the issue:

- Give the issue a title: Release Post X.Y Retrospective
- Replace the release post MR link
- Use the correct month to the feedback date
- Assign milestone

You can remove this comment once you completed the items above.
-->

Release post MR: RP_MR_LINK

Please add your feedback by **YYYY-MM-DD**. Thank you!

**Note for release post team** (release post manager, technical advisor, TW lead and release post manager show, and Product Operations): For items you want to cover during the live retro, please add the :star: emoji.

Retro meeting link: <a target="_blank" href="https://calendar.google.com/event?action=TEMPLATE&amp;tmeid=MXZpZXBoNDgxNTVsMnZvN2kycDY5MGtramsgb2dvbG93aW5za2lAZ2l0bGFiLmNvbQ&amp;tmsrc=ogolowinski%40gitlab.com"><img border="0" src="https://www.google.com/calendar/images/ext/gc_button1_en.gif"></a>

***

Create individual comments for every entry so that each item can have its own thread. Then, each thread will get an `**Action: @mention**` for resolution tracking.

Start your comment with an H2 heading which will be used as its title, and add
the appropriate icon ahead of it to indicate which category it falls under:

```md
## :thumbsup: Something that went well
```
```md
## :thumbsdown: Something that didn't go well
```
```md
## :bulb: Something we can improve
```
```md
## :question: Something for discussion but not a clear good or bad event to improve upon
```
```md
## :thought_balloon: Something related but not required for closing the retro
```

## How to close this retro

It is the responsibility of the release post manager to track and close this issue in partnership with Product Operations

- During and after release, collect and add threads here from Slack, MRs and other channels as appropriate
- Once the release is over, strive to close each thread with a :white_check_mark: emoji
- Prioritize first closing any items that affect the next release post managers workflow, no later than the 1st of the month
- Each thread will be actioned with MRs where available or a resolution

## After retro

- After this retro issue is closed, close the `#X-Y-release-post-prep` Slack channel

/assign @release_post_manager
/assign @rpm_shadow
/assign @tw_lead
/assign @tech_advisor

/label ~"release post" ~"Product Retrospectives" ~"Product Operations"

/milestone %_MILESTONE_
