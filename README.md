> **Important Note**: Many core pages of the GitLab website are now built from the Buyer Experience project: https://gitlab.com/gitlab-com/marketing/digital-experience/buyer-experience

# www-gitlab-com

This is the source for some of the https://about.gitlab.com/ site such as the public handbook, blog, and jobs. For a guide on how to start editing the website using git, see the [handbook page on that topic](https://about.gitlab.com/handbook/git-page-update).

The bulk of the marketing site, such as the homepage, pricing, and solutions are built by the [Buyer Experience repository](https://gitlab.com/gitlab-com/marketing/digital-experience/buyer-experience). 

## Local development

_If you've already setup the project locally in the past, follow [these simple steps](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/doc/development.md#run-middleman) to get back into contributing._

[The git-page-update handbook page](https://about.gitlab.com/handbook/git-page-update/#editing-the-handbook) is the single source of truth for how to get this repository set up for local development. 

We do, however, have additional details listed in the [doc/development.md](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/doc/development.md) file. Regardless, you should start from the single source of truth for Ruby installation instructions and other dependencies.

## Contributing

Please see the [contribution guidelines](CONTRIBUTING.md)

### Adding yourself to the team page

Please follow the instructions [in the handbook](https://about.gitlab.com/handbook/git-page-update/#12-add-yourself-to-the-team-page).

### Adding a pet to the team pets page

Edit [`data/pets.yml`](./data/pets.yml) and add a new entry.

Images should be uploaded to [`sites/uncategorized/source/images/team/pets`](./sites/uncategorized/source/images/team/pets).

### Blog posts

[Read how to add a blog post.](doc/blog-posts.md)

## Netlify CMS

[Developer documentation for our instance of Netlify CMS](doc/netlifycms.md). 

### Update the releases page (under `/releases`)

[How to update the releases page.](doc/releases.md)

### Update the projects page (under `/handbook/engineering/projects`)

[How to update the projects page.](doc/projects.md)

### Press releases page

[How to add a press release page.](doc/press.md)

## Production build

This section has moved to the [`doc/development.md` "Production Build" section](./doc/development.md#production-build)

## Custom Generators

This section has moved to the [`doc/development.md` "Custom Generators" section](./doc/development.md#custom-generators)

## Review Apps

Thanks to the [Review Apps], the `www-gitlab-com` project supports live reviewing
of any website changes with every merge request. When a branch is pushed and
the pipeline is successfully run, you can see a link pointing to the live
environment in your merge request. The URL will be of the following scheme:
`<branch-name>.about.gitlab.com`.  Note that if you have underscores in your
branch name, they will be replaced with dashes in the URL.

Beware that:

- To successfully deploy a Review App, the branch must exist in the
  `www-gitlab-com` repository. That means that branches from forks will not
  deploy a Review App (hence MRs from contributors). For that case, you should
  have at least Developer access to the `www-gitlab-com` project or
  `gitlab-com` group.
- The generation of the direction, wishlist, and releases pages are omitted
  in branches and is run only on master. This helps to shave off some time from
  the build process. That means you won't be able to preview these pages with
  Review Apps.

[review apps]: https://docs.gitlab.com/ee/ci/review_apps/

## Use Docker to render the website

This section has moved to the [`doc/docker.md`](./doc/docker.md)

## Building a single file

If you only want Middleman to build a single file, you can do that via the `--glob` parameter.
Here are a few things to keep in mind:

* The glob parameter must match the **destination** file.

* The `--no-clean` option should be included or Middleman will wipe out
  files that do not match the glob parameter.

For example, here's how to rebuild the Contribute page. Note how
`source/company/culture/index.html.md.erb` is mapped to
`company/culture/contribute/index.html`:

```sh
bundle exec middleman build --glob={company/culture/contribute/index.html} --no-clean
```

For blog posts,
`source/blog/posts/2017-05-23-attributes-of-successful-development-teams.html.md`
maps to `blog/2017/05/23/attributes-of-successful-development-teams/index.html`:

```sh
bundle exec middleman build --glob={2017/05/23/attributes-of-successful-development-teams/index.html} --no-clean
```

## Conclusion (please leave this at the bottom of the doc)

In case someone forgot the most important commands and is catting this file from the command line we end by listing them:

```sh
kill -kill `lsof -t -i tcp:4567`
bundle exec rake new_post
open -a "Google Chrome" http://localhost:4567
cd sites/mysite && bundle exec middleman
```

or to execute the last two commands, just run:

```sh
bin/run
```
