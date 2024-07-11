# Team Member Database

This repository contains a database of GitLab team members, stored
in flat files. You will need to edit your file to keep it up-to-date,
in fact editing this database is one of your first tasks as a new
GitLab team member!

The canonical content of this database is stored in the 
[`data/team_members`](https://gitlab.com/gitlab-com/www-gitlab-com/-/tree/master/data/team_members)
directory. This is automatically compiled into a single file (`data/team.yml`)
by one of our helpful bots. In the regular course of affairs, we will not
have need to edit `data/team.yml` directly.

Each team member instead has their own file, located at
`data/team_members/person/{char}/{slug}.yml`. The first letter of the slug (the
`{char}`) is used to index the directory and help keep the file-system tractable
for humans and our tools. So for example, a person whose slug is `tanuki` would find
their file at: `data/team_members/person/t/tanuki.yml`

The `data/team.yml` file began, as many things do, as a simple solution
to the problem of keeping track of who we all are. Over time it became
enormous - a 26k line YAML file that everyone had to edit, breaking
tools and editors and sanity under its foot.

It is not strictly necessary (middleman can also access all these
separate files directly, under `data.team_members.person.s.sid` for 
example), and it may be removed in the future.

# Accessing the team member file externally (in progress)

See: https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/10507

If you need to pull in the team member database for processing, the best thing
to do is to fetch it from:

```
https://about.gitlab.com/company/team/team.yml
```

# Managing the database

There are some rake tasks that can be used to manage this database:

- `build:team_yml`

  Takes the individual files in the `data/team_members` directory
  and builds a new `data/team.yml` file, that can be consumed by
  existing tools. Generating this artifact allows us to keep
  external tools working that rely on this single file.

- `build:verify_team`

  This loads the individual files on disk, and the combined file on disk
  and compares them. If they differ, the task aborts with an informative
  message.

- `build:verify_team_members`

  This loads the individual files from `data/team_members` and validates
  that they meet certain requirements (all slugs are unique, the org-chart
  is an acyclic directed graph, required properties are set).

  It is safe to call this task before generating the `team.yml` file, since
  it only considers the content of the individual files.

