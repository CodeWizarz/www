# Adding a press release page

The [press releases] page follows the same principle like the [blog archives].
It is automatically populated by the data fed into [`data/press_releases.yml`](/data/press_releases.yml).

As you can see, there are three values, `title`, `link` and `date`. Here's a
short explanation what each does.

| Value | Description |
| ----- | ----------- |
| `title` | The headline of the article, make sure to include it inside double quotes and remove the trailing period if any. |
| `link` | The URL that links back to the article. If a press release is hosted on our website, you must first create a blog post with the press release. Create it like any other blog post and make sure to include the `categories: press` in the [frontmatter]. The category is essential if you want the post to appear in the [press category]. That way we can have a list of press posts hosted on our website. |
| `date` | The date should be in ISO format as stated in the handbooks's [Writing Style Guidelines][] (see bullet 4). Make sure to make this right as this value is used to make the links listed in descending order (newest to oldest). |

## Create a new press release page under `/press/releases`

There are two ways to create a new press release page that will be hosted under
`/press/releases`. You can use the automatic way using the command line or
edit the files manually with your text editor.

### Using the raketask to create a new press release page

Assuming you have cloned the repository, you have Ruby installed and have ran
`bundle install`, here are the steps needed to create a new press release page
automatically:

1. Go to the root directory of `www-gitlab-com`
1. Create a new branch: `git checkout -b press-release-branch`
1. Run the following:

    ```
    rake new_press
    ```

    You will be asked two questions, 1) the `date` of the press release in ISO
    format, 2) the `title` of the press release.

    These data will be used to automatically create a new file
    `source/press/releases/{date}-{title}.html.md` and will also populate
    `data/press_releases.yml` with the right information.

1. Add content to the new press release file according to our [Markdown guide][md].
1. Add the changed files and commit the changes:

    ```
    git add data press
    git commit -m "New press release"
    git push origin press-release-branch
    ```

1. Create a new merge request.

### Manually create a new press release page

You need to do 2 things:

1. Create a new file under `source/press/releases/` with its filename ending
   in `.html.md`. An example of such a page would be
   `source/press/releases/2016-01-01-new-press-release.html.md`. Its contents
   should always start with the following block:

    ```
    ---
    layout: markdown_page
    title: "New press release!"
    ---
    ```

    The only thing you may change to your liking is the title. Leave everything
    else as-is. Once you have created that block you may add the content
    according to our [Markdown guide][md].

1. Follow the steps outlined in the section [Add an internal URL to the press
   releases archive manually](#add-an-internal-url-to-the-press-releases-archive-manually)

## Add an existing URL to the press releases archive using the raketask

1. Go to the root directory of `www-gitlab-com`
1. Create a new branch: `git checkout -b press-release-branch`
1. Run the following:

    ```
    rake add_press
    ```

    You will be asked three questions, 1) the `date` of the press release in ISO
    format, 2) the `title` of the press release, and 3) the URL of the press
    release.

    These data will be used to automatically populate `data/press_releases.yml` with the
    right information.

1. Add the changed file and commit the changes:

    ```
    git add data
    git commit -m "New press release"
    git push origin press-release-branch
    ```

1. Create a new merge request.

## Add an existing URL to the press releases archive manually

To add an existing URL under `about.gitlab.com` in the press releases page,
follow the steps below:

1. Open `data/press_releases.yml` with an editor (do **not** use Microsoft Word).
1. Copy paste the previous block leaving a newline between.
1. Add your own `title`, `date` and `link`.
1. Visit <http://localhost:4567/press/releases/> and make sure it appears in
   the list.
1. When ready, commit the changes, push to the repository and open an MR for
   review.

[frontmatter]: https://about.gitlab.com/handbook/marketing/blog/#frontmatter
[Writing Style Guidelines]: https://about.gitlab.com/handbook/communication/#writing-style-guidelines
[press releases]: https://about.gitlab.com/press/releases/
[press category]: https://about.gitlab.com/blog/categories/press
[blog archives]: https://about.gitlab.com/blog/archives.html
[md]: https://about.gitlab.com/handbook/product/ux/technical-writing/markdown-guide
