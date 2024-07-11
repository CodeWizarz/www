<!--

Before nominating yourself as a trainee, talk with your manager and team about it, as the traineeship is likely to impact your capacity. More information in https://about.gitlab.com/handbook/product/ux/pajamas-design-system/design-review/#duration.

-->

## Basic setup

1. [ ] Decide which [project and type](https://about.gitlab.com/handbook/product/ux/pajamas-design-system/design-review/#maintainer-types)
    you would like to become a maintainer of.
1. [ ] Change this issue title to include your name, project, and maintainer type:
    `Trainee Design Maintainer ([Project], [Type]): [Your Name]`.
1. [ ] Read the [design review page in the handbook](https://about.gitlab.com/handbook/product/ux/pajamas-design-system/design-review).
1. [ ] Understand [how to become a maintainer](https://about.gitlab.com/handbook/product/ux/pajamas-design-system/design-review/#maintainer)
    and add yourself as a [trainee maintainer](https://about.gitlab.com/handbook/product/ux/pajamas-design-system/design-review/#trainee-maintainer)
    in the [team database](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/doc/team_database.md).
    Indicate your selected project and maintainer type:
    1. [ ] `design.gitlab.com: trainee_maintainer Figma`
    1. [ ] `design.gitlab.com: trainee_maintainer UX`
    1. [ ] `gitlab-svgs: trainee_maintainer Figma`
1. [ ] Add yourself to the [Current trainee maintainers table](https://about.gitlab.com/handbook/product/ux/pajamas-design-system/design-review/#current-trainee-maintainers).
1. [ ] Mention a [design maintainer of the project you chose](https://about.gitlab.com/handbook/engineering/projects/)
    and work with them to find an available Support Maintainer during the traineeship, if possible.
1. [ ] Mention your manager in this issue for awareness.

## Working towards becoming a maintainer

This is not a checklist, but guidelines that will help you become a maintainer.
Remember that there is no specific timeline on this, and that you should work
together with your manager and current maintainers.

All designers are maintainers of [`gitlab-design`](https://gitlab.com/gitlab-org/gitlab-design)
project. If you are interested in becoming a Maintainer of UI (`.scss`) for
`gitlab-ce`, `gitlab-ee`, and `gitlab-ui` projects, please follow the [Engineering Review Workflow](https://about.gitlab.com/handbook/engineering/workflow/code-review/).

It is up to you to ensure that you are getting enough MRs to review, and of varied
types. You could also seek out more reviews from your team, for example by asking
for reviews on the `#ux` and `#pajamas-design-system` Slack channels. If you are
not receiving enough MRs to advance in your training, be proactive and work on
your own improvements to Pajamas. This will demonstrate overall understanding of
the product, as well as quality contributions, and help propel your progress.
Maintainers are available to help guide you.

Your reviews should aim to cover maintainer responsibilities as well as reviewer
responsibilities. Design Maintainers should be focused on MRs that have an impact
on usability, iterate on existing user experience, and/or include usage of design
guidelines, standards, and patterns. Your approval means you think it is ready
to merge.

After each MR is merged or closed, add a discussion to this issue using this
template:

```markdown
### (Merge request title): (Merge request URL)

During review:

- (List anything of note, or a quick summary. "I suggested/identified/noted...")

Post-review:

- (List anything of note, or a quick summary. "I missed..." or "Merged as-is")

(`@support-maintainer-username`) please add feedback, and compare this review to
the average maintainer review.
```

**Tip:** There are [tools](https://about.gitlab.com/handbook/tools-and-tips/#trainee-maintainer-issue-upkeep)
available to assist with this task.

It is your responsibility to set up any necessary meetings to discuss your
progress with your support maintainer, as well as your manager. These can be at any
increment that is right for you.

## When you're ready to make it official

When reviews have accumulated, and recent reviews consistently fulfill maintainer
responsibilities, any maintainer can take the next step. The trainee should also
feel free to discuss their progress with their manager or any maintainer at any
time.

1. [ ] Create a merge request updating [your team member entry](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/doc/team_database.md)
    proposing yourself as a maintainer for the chosen project. Indicate your selected project and maintainer type:
    1. [ ] `design.gitlab.com: maintainer Figma`
    1. [ ] `design.gitlab.com: maintainer UX`
    1. [ ] `gitlab-svgs: maintainer Figma`
    1. [ ] `gitlab-svgs: maintainer UX`
1. [ ] Create a merge request for CODEOWNERS of [`design.gitlab.com`](https://gitlab.com/gitlab-org/gitlab-services/design.gitlab.com/-/blob/main/.gitlab/CODEOWNERS)
    or [`gitlab-svgs`](https://gitlab.com/gitlab-org/gitlab-svgs/-/blob/main/.gitlab/CODEOWNERS), adding yourself
    accordingly, and ask a maintainer to review it.
    1. As maintainer, you must keep [relying on others](https://about.gitlab.com/handbook/values/#its-impossible-to-know-everything) for the expertise they have that you don't. In the MR description, highlight the efforts that showcase your results at a maintainer-level, what skills you want to continue working on, and add a link to this issue. ([Example](https://gitlab.com/gitlab-org/gitlab-services/design.gitlab.com/-/merge_requests/2395)). 
    1. [ ] [design.gitlab.com CODEOWNERS file](https://gitlab.com/gitlab-org/gitlab-services/design.gitlab.com/blob/main/.gitlab/CODEOWNERS)
    1. [ ] [gitlab-svgs CODEOWNERS file](https://gitlab.com/gitlab-org/gitlab-svgs/-/blob/main/.gitlab/CODEOWNERS)
1. [ ] Ask a current project owner or maintainer to change your role on the project to **Maintainer**.
1. [ ] After your team member entry merge request has merged, ask your manager or maintainer buddy to share the news in the following:
   1. [ ] [UX Weekly](https://docs.google.com/document/d/1fSRyTboySDpWPrQiiFIcIOhg09-9G54haIippIVtcCY/)
   1. [ ] [Engineering week in review](https://docs.google.com/document/d/1JBdCl3MAOSdlgq3kzzRmtzTsFWsTIQ9iQg0RHhMht6E/edit)
   1. [ ] [#ux](https://gitlab.slack.com/archives/C03MSG8B7) Slack channels
1. [ ] Keep reviewing, start merging 😃

/label ~"trainee maintainer" ~Pajamas
