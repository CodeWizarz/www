/label ~Frontend ~"maintainer application"
/assign `@manager`

<!-- Congratulations! Fill out the following MR when you feel you are ready to become -->
<!-- a frontend maintainer! This MR should contain updates to a file in `data/team_members/person/` -->
<!-- declaring yourself as a maintainer of the relevant application -->

## Manager Justification

It's hard to specify hard requirements for becoming a maintainer, which is why [the documentation](https://about.gitlab.com/handbook/engineering/workflow/code-review/#how-to-become-a-project-maintainer) consists of flexible guidelines. Reviewers are encouraged to think of their eligibility for maintainership in the terms of "I could be ready at any time to be a maintainer as long as it is justified".

- [ ] The MRs reviewed by the candidate consistently make it through maintainer review without significant additionally required changes.
- [ ] The MRs authored by the candidate consistently make it through reviewer and maintainer review without significant required changes.

...justification...

## Before Merging (Manager Tasks)

- [ ] Close any relevant _trainee maintainer issues_ with a comment indicating that this merge request is being created, as ([they are no longer required to become a maintainer](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/109500)). 
- [ ] Mention the maintainers from the given specialty and ask them to provide feedback to the manager directly.
- [ ] Leave this merge request open for 1 week, to give the maintainers time to provide feedback.
- [ ] Ensure we have at least 2 approvals from existing maintainers.

## Once This MR is Merged

1. [ ] Create an [access request][access-request]
       for maintainer access to `gitlab-org/<project>`. <!-- make sure to update the <project> as needed, for example `gitlab-org/gitlab` -->
1. [ ] Join the [`[at]frontend-maintainers` slack group][frontend-maintainers-slack-group]
1. [ ] Ask the maintainers in your group to invite you to any maintainer-specific meeting if one exists.
1. [ ] Let a maintainer add you to `gitlab-org/maintainers/frontend` with `Owner` access level.
1. [ ] Announce it _everywhere_
1. [ ] Keep reviewing, start merging :sign_of_the_horns: :sunglasses: :sign_of_the_horns:

[access-request]: https://about.gitlab.com/handbook/business-technology/team-member-enablement/onboarding-access-requests/access-requests/#individual-or-bulk-access-request
[frontend-maintainers-slack-group]: https://gitlab.slack.com/archives/C9Q5V0597
