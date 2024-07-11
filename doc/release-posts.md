# Release Post Automation

## Release Post Branch Creation Task

- User documentation: https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-post-branch-creation-rake-task
- Source: https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/lib/tasks/release_post.rake#L4-371
- Spec: none

Release Post Branch Creation Task is:

- a rake task that creates the release post branch (release-X-Y) along with the related directories, files, issues, and MRs to facilitate the release post process.
- a scheduled pipeline triggered on the 3rd of the month that invokes the `release:start` task.  If the script fails to run or there are pipeline issues, you can run `bundle exec rake release:start` locally.
- it will perform all of the necessary git actions as a bot user. Locally, you will need to export the `PRIVATE_TOKEN` to your shell environment using a personal access token with sufficient privileges (likely the `api` [scope](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#personal-access-token-scopes)) to perform all of these actions. You may also need to have [maintainer privileges](https://docs.gitlab.com/ee/user/permissions.html#project-members-permissions) on your account.

## Release Post Item Generator

- User documentation: https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-post-item-generator
- Source:
  - `lib/release_posts/post_entry.rb`
  - `lib/release_posts/issue.rb`
- Spec:
  - `spec/lib/release_posts/post_entry.rb`
  - `spec/lib/release_posts/issue.rb`

The release post item generator is:

- a scheduled CI pipeline that runs hourly
- it creates release post entry items from issues and epics, and uses the API to create merge requests
- it uses labels to determine which issues and epics require a release post item
- the branch name is based on the reporter, group and issue/epic id so that duplicate runs will not create duplicate branches or merge request (e.g. if something goes wrong, it won't keep opening many merge requests)

Some implementation decisions were made based on this being a personal script I would run locally, and then push. I slowly worked to upgrade the script to support API flows. Remnants of local command line usage could be removed over time.

To run the generator:

```shell
# PRIVATE_TOKEN can also be used
#
# --dry-run    can be used to prevent any write API operations - this is helpful for testing
# --no-local   forces the script to use the API for all read and write operations
#
# url          a web or api url to an issue or epic can be provided to a specific issue or epic - this is helpful for testing
GITLAB_BOT_TOKEN=XXXX bundle exec bin/release-post-item --no-local
```

The implementation is lightly tested and primarily located in `lib/release_posts/post_entry.rb`.

- If no issue/epic URL is provided, the script searches for issues and epics using the different release post labels
- Web responses are detected, and API request made so that we are operating off a stable interface
- Each issue/epic is then processed, including cross referencing labels with team, stages, and category data files

A particularly difficult challenge was generating YAML that looked good to the people who review the release post item. This has been extracted into the `styled_yaml` gem which now provides overrides to force predictable YAML formatting, and prevent stylistic nit-picking.

## Release Post Entry Linter

- User documentation: https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-post-item-linting
- Source: `bin/validate-release-post-item`
- Spec: none

The [Release Post Entry Generator](#release-post-entry-generator) is not compulsory, and the output is reviewed and edited as part of the release process. This can result in invalid YAML which can be hard to debug after the release post assembly process.

To run the linter:

```shell
# path will default to 'data/release_posts/unreleased' if not set
# path may be a file or directory
bundle exec bin/validate-release-post-item [path]
```

The implementation checks each file one by one:

- validating YAML can be parsed by Ruby
- validating YAML conforms to `data/schemas/releasepost.schema.json`
- validating the stage, category, and image fields

The same JSON schema is also configured for the Web IDE in `.gitlab/.gitlab-webide.yml`. Where possible reasonable, the schema is the best place to perform validation because it can be configured in local editors powered by [yaml-language-server](https://github.com/redhat-developer/yaml-language-server) using:

- [VSCode: vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [Vim: vim-lsp](https://github.com/prabirshrestha/vim-lsp)

## Release Post Assembly

- User documentation: https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-post-assembly
- Source: `lib/release_posts/post.rb`
- Spec: none

A very simple script that:

- moves the unreleased YAML release post items to the correct location
- moved the unreleased images to the correct location
- updates the image_url field for release post items that have been moved
- is wrapped by `./bin/release-post-assemble` which is called from [release_post.rake](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/lib/tasks/release_post.rake#L372)
- is invoked via a scheduled pipeline on the 18th on the month at 16:00 UTC
- can be invoked separately locally
