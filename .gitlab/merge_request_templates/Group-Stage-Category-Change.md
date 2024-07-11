<!--

Describe the change and rationale here.

-->

### Approvals

Merge requests with changes to stages and groups and significant
changes to categories need to be created, approved, and/or merged
by each of the below:

- [ ] Chief Product Officer `@david`
- [ ] The Product Director relevant to the affected Section(s)
- [ ] The Engineering Director relevant to the affected Section(s)
- [ ] Director of Product Design `@vkarnes`

The following people need to be on the merge request so they stay informed:

- [ ] Vice President of Development `@clefelhocz1`
- [ ] Vice President of Infrastructure & Quality `@meks`
- [ ] Vice President of User Experience `@clenneville`
- [ ] The Product Marketing Manager relevant to the stage group(s)
- [ ] Director of Technical Writing `@susantacker`

### After Approvals and Merge

- [ ] Create an issue in the triage-ops project to update GitLab Bot automation:
  - [for Category change](https://gitlab.com/gitlab-org/quality/triage-ops/-/issues/new?issuable_template=category-label-change)
  - [for Stage or Group change](https://gitlab.com/gitlab-org/quality/triage-ops/-/issues/new?issuable_template=stage-or-group-label-change)
  - If label migration is required, please follow the [self-serve instructions](https://about.gitlab.com/handbook/engineering/quality/engineering-productivity/workflow-automation#one-off-label-migrations) to get started on a one-off label migration MR.
- [ ] Mention the [product group Technical Writer](https://about.gitlab.com/handbook/product/ux/technical-writing/#designated-technical-writers) to update the [documentation metadata](https://docs.gitlab.com/ee/development/documentation/#stage-and-group-metadata)
- [ ] Share MR in #product, #development, and relevant #s_, #g_, and #f_ slack channels

<!--
Changes that require executive approval include:
- Changes to a stage, group, or category name
- Removal or addition of a stage, group, or category

Changes that require approval only from the relevant Product Director include:
- Changing a category maturity date
- Changes to section or group member lists
- Changes to a category vision page

More information can be found in the Category Change section:
https://about.gitlab.com/handbook/product/categories/#changes

-->
