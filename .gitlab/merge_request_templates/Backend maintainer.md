/label ~backend ~"maintainer application"
/assign `@manager`

<!-- Congratulations! Fill out the following MR when you feel you are ready to become -->
<!-- a backend maintainer! This MR should contain updates to a file in `data/team_members/person/` -->
<!-- declaring yourself as a maintainer of the relevant application -->

## Manager Justification

It's hard to specify hard requirements for becoming a maintainer, which is why [the documentation](https://about.gitlab.com/handbook/engineering/workflow/code-review/#how-to-become-a-project-maintainer) consists of flexible guidelines. Reviewers are encouraged to think of their eligibility for maintainership in the terms of "I could be ready at any time to be a maintainer as long as my work as an author and reviewer is consistent with other maintainers".

- [ ] The MRs reviewed by the candidate consistently make it through maintainer review without significant additionally required changes.
- [ ] The MRs authored by the candidate consistently make it through reviewer and maintainer review without significant required changes.

...justification...

## Before Merging (Manager Tasks)

- [ ] Close any relevant _trainee maintainer issues_ with a comment indicating that this merge request is being created, as ([they are no longer required to become a maintainer](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/109500)). 
- [ ] Mention the maintainers from the given specialty with the template below.
- [ ] Leave this merge request open for 1 week, to give the maintainers time to provide feedback.
- [ ] Ensure we have at least 2 approvals from existing maintainers.

<details><summary>Template call to action</summary>

```
SPECIALITY Maintainers, please review this proposal to make TRAINEE maintainer of PROJECT. 

* If you have blocking feedback adhering [to the documentation](https://about.gitlab.com/handbook/engineering/workflow/code-review/#how-to-become-a-project-maintainer) please share it with me via Slack.
* If you are in agreement please approve or give a 👍 on the MR

After 1 week, if there is no blocking feedback and at least 2 approvals, I will merge this MR.
```

</details>

## Once This MR is Merged

1. [ ] Join the `#backend_maintainers` Slack channel
1. [ ] Ask the maintainers in your group to invite you to any maintainer-specific meeting if one exists.
1. [ ] Let a maintainer add you to `@gitlab-org/maintainers/rails-backend` with `Owner` access level.
1. [ ] Announce it _everywhere_
1. [ ] Familiarize yourself with documentation for [Merging a merge request](https://docs.gitlab.com/ee/development/code_review.html#merging-a-merge-request)
1. [ ] Keep reviewing, start merging :sign_of_the_horns: :sunglasses: :sign_of_the_horns:

[access-request]: https://about.gitlab.com/handbook/business-technology/team-member-enablement/onboarding-access-requests/access-requests/#individual-or-bulk-access-request
