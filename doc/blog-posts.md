# Adding a blog post

Please read through the [Blog Handbook] before you begin.

A new blog post likely needs to be reviewed by others before being published, so
it's best to use our standard [feature branch workflow](https://docs.gitlab.com/ee/gitlab-basics/feature_branch_workflow.html)
and to open a Merge Request. If you're not yet comfortable using the Git command
line, you can [create a branch in the GitLab UI](https://docs.gitlab.com/ee/gitlab-basics/create-branch.html).

Blog posts go in [`sites/uncategorized/source/blog-posts/`](./sites/uncategorized/source/blog-posts/). The file name **must match the following format:** `yyyy-mm-dd-the-post-title.html.md.erb`.

Blog posts will be published to `about.gitlab.com/blog/yyyy/mm/dd/the-post-title`.

Release posts go in [`sites/uncategorized/source/releases/posts/`](./sites/uncategorized/source/releases/posts/). Please see [Release Post Documentation](https://about.gitlab.com/handbook/marketing/blog/release-posts/#release-posts) on publishing release posts.

The formatting of the filename is important and specific, so it's best to
generate the file for a new blog post interactively in your terminal. You can do this by using
the `new_post` Rake task:

```shell
bundle exec rake new_post
```

When prompted, enter the blog post title, _without a date_, and press
<kbd>Enter</kbd>. A message will be printed to tell you the path to the new
file.

Open the file in your text editor of choice. The file will be empty except for a
few lines at the top, surrounded by a pair of three hyphens (`---`). These lines
are called [**Frontmatter**](https://middlemanapp.com/basics/frontmatter/).

The `title` attribute has already been filled out by the `new_post` Rake task.
Fill in the others as needed, or remove any that aren't applicable to your post
(not every post needs an `image`, for example).

If you need more control over blog post ordering, or publication
time, add a `date` attribute to the frontmatter with a UTC-based time. For
example:

```yaml
---
title: "Example Blog Post"
date: 2017-04-01 15:45
---
```

If no `date` attribute is supplied, it will be inferred from the filename.

When adding timestamps to blog posts, **be warned:** setting it too far into the
future will cause the post to not be published until that time has passed.
Because builds are only triggered on new commits to `master`, you might set a
blog post to publish in a few hours, but it might not be published for days if
no one makes a new commit after that time has passed.

When in doubt, either don't give it a timestamp, or set it to a time that has
already passed.

Fill in the post's content using [Markdown][mkd-guide]. To preview your post locally
before publishing, see [**Local development**](development.md) for
instructions.

[Blog Handbook]: https://about.gitlab.com/handbook/marketing/blog/
[mkd-guide]: https://about.gitlab.com/handbook/markdown-guide/
