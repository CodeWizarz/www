# Update the projects page (under `/handbook/engineering/projects`)

GitLab Engineering Projects page is generated using information stored in
the `data/projects.yml` file and [the team member database](team_database.md).
Edit these files to add a
project and assign product owners / maintainers / reviewers.

* Typically, product owner is a Product Team member whose responsibilities
include having a vision of a project's development, scheduling a work and
allocating required resources.

* Maintainer is usually a team member who is responsible for the final review
and has ability to merge changes into the `master` branch / default branch.

* A reviewer is a team member who is responsible for reviewing changes and
providing a quick feedback during multiple review iterations.

To assign someone to a project it is necessary to add a `projects` section to
team member's entry in [the team database](team_database.md). See an example below.

```yaml
- name: Full Name
  locality: Some City
  # [...]
  gitlab: gitlab-com-handle
  projects:
    some-project: owner
    gitlab-ce: maintainer backend
    gitlab-ee: maintainer backend
    gitlab-shell: reviewer
  story: Bio that appears on the team page.
```

Note that each project, that user is involved in, is referenced by a key.
The key needs to be defined in `data/projects.yml` as well.

```yaml
gitlab-ce:
  name: GitLab Community Edition (CE)
  path: gitlab-org/gitlab-ce
  # [...]
```

If corresponding key does not exist in `data/projects.yml` then CI pipeline
will fail and an appropriate RSpec failure will inform you which key is
missing.

Supported roles are only `owner`, `maintainer` and `reviewer`. A text provided
after a role name is an arbitrary description, that will appear next to a
team member's gitlab.com handle on a generated page.

See [Engineering Projects Page](https://about.gitlab.com/handbook/engineering/projects) in the Handbook.
