# Local development

## Gitpod.io

Gitpod.io is a "Dev Environments Built for the Cloud" third-party service, which can be used as an alternative to setting up a dev environment on your local machine.

See [`doc/gitpod.md`](./gitpod.md) in this repo for more details. 

## Install prerequisites

1. Follow the instructions on the [Edit this website locally handbook page](https://about.gitlab.com/handbook/git-page-update). This is the single source of truth for getting set up with the `www-gitlab-com` repository's Ruby version. It points to this document for our additional dependencies.
1. If you are on macOS, install [Homebrew](https://brew.sh/), which is a
   package manager for macOS that allows you to easily install programs
   and tools through the Terminal. Visit their website for installation
   instructions.
1. Follow the [official instructions to install nvm](https://github.com/nvm-sh/nvm#installing-and-updating), a Node version manager. Then, run the following in the directory for `www-gitlab-com` to install and use the repository's Node version:

   ```sh
   nvm install
   nvm use
   ```

   The required Node version should be automatically detected from the [`.nvmrc`](https://github.com/nvm-sh/nvm#nvmrc) file. This can be confirmed by running `nvm which`.
1. Install [Yarn](https://classic.yarnpkg.com/en/docs/install), a package manager for the Node ecosystem.
1. It's recommended that you enable git hooks by running `lefthook install`.

## Run middleman

Use the following commands to run Middleman in development mode (see [monorepo docs](https://gitlab.com/gitlab-com/www-gitlab-com/-/blob/master/doc/monorepo.md) for more details):

```sh
bundle install
yarn

cd sites/XXX # NOTE: where XXX is one of the sites in the monorepo. For example: `cd sites/handbook` or `cd sites/uncategorized`

NO_CONTRACTS=true bundle exec middleman

Refer to this issue for more context around the NO_CONTRACTS env variable: https://github.com/middleman/middleman/issues/2094
```

If you run into any issues with local development, running the command with an additional verbose flag may be helpful.
```sh
NO_CONTRACTS=true bundle exec middleman --verbose
```

Once the Middleman server is running, you can visit
[http://localhost:4567](http://localhost:4567) in your browser to see a live,
local preview of the site. Any changes to files in the `source` directory will
be detected automatically, and your browser will even reload the page if necessary.

PDF files are not available in development mode. See below for more information.

See the [Middleman docs](https://middlemanapp.com/basics/development_cycle/) for
more information.

### Faster local template development 

The Middleman Preview server can be slow to work with when you want to make changes to CSS, JavaScript, or Markup. We've resolved the CSS and JavaScript challenges by [using Webpack to serve assets without Middleman rebuilds](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/71845), but working on templating still triggers Middleman sitemap rebuilds. 

If you're a developer, designer, or other team member making changes to templates, we have an experimental option to speed up your development cycle: [a monkeypatch on the Middleman::Sitemap::Extensions::OnDisk::update_files method](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/73487). 

To enable it, run the Middleman preview server with the environment variable `DISABLE_ON_DISK_REBUILD=true`. 

This will allow you to make changes to templates and get much faster refreshes. It disables the `ensure_resource_list_updated!` method from running when template files are changed. The preview server still renders the template by calling its `render` method, so your markup changes should go through, but it may not work in every case (i.e. if you make a change that would require a new sitemap object to be created). 

Note that this change won't necessarily speed up data-driven pages. Making changes to YAML files in the `data` directory will still trigger the sitemap rebuild. The current implementation is rough and untested. Use at your own risk and please file issues and MRs if you would like to improve the overall experience. 

We have currently only added this to the `sites/uncategorized/config.rb` file since the [Digital Experience](https://about.gitlab.com/handbook/marketing/digital-experience/#principles-wip) team put it together - but we have notified the handbook team of the option if they want to add it to `sites/handbook`. 

Using this in conjunction with [NO_CONTRACTS](https://github.com/middleman/middleman/issues/2094) may make your local development experience much faster. You can also make these commands slightly more ergonomic by [setting up aliases](https://linuxize.com/post/how-to-create-bash-aliases/) in your shell config file. An example for zsh might look like this: 

```sh
# ~/.zshrc

# Run the standard Middleman preview server from your repository
alias serve_handbook="cd /path/to/www-gitlab-com/sites/handbook; bundle exec middleman serve"

# Run the preview server without contract - faster serving, full Middleman functionality intact.
alias serve_handbook_faster="cd /path/to/www-gitlab-com/sites/handbook; NO_CONTRACTS=true bundle exec middleman serve" 

# Run the preview server without contracts and without rebuilding the sitemap - faster serving, faster template development, some Middleman features may not work. 
alias serve_handbook_fastest="cd /path/to/www-gitlab-com/sites/handbook; DISABLE_ON_DISK_REBUILD=true NO_CONTRACTS=true bundle exec middleman serve"

# Run the preview server without contracts, without rebuilding the sitemap, and with livereload enabled - livereload may slow things down substantially, but could be more convenient. 
alias serve_handbook_fastest_livereload="cd /path/to/www-gitlab-com/sites/handbook; DISABLE_ON_DISK_REBUILD=true ENABLE_LIVERELOAD=1 NO_CONTRACTS=true bundle exec middleman serve"
```

### Check Blog Categories

You can execute rake tasks locally too, just as CI/CD would run them. The following example checks if all
blog categories match. 

```
NO_CONTRACTS=true bundle exec rake lint:blog:categories

=> Checking if any posts have incorrect categories...
All posts have correct categories!
```

## Enable livereloading

When running middleman with the livereload option enabled, it watches your
repo for changes and reloads the site automatically.

Livereload can result to [slow server response times][gh-livereload], so it is
disabled by default. That means you need to manually refresh the webpage if you
make any changes to the source files. To enable it, just set the environment
variable `ENABLE_LIVERELOAD=1` before running middleman:

```
ENABLE_LIVERELOAD=1 bundle exec middleman
```

You can verify that it's enabled from the following line:

```
== LiveReload accepting connections from ws://192.168.0.12:35729
```

To permanently have livereload enabled without typing the environment variable,
just export its value in your shell's configuration file:

```
# Open your rc file (replace editor with vim, emacs, nano, atom, etc.)
editor ~/.bashrc

# Export the livereload variable
export ENABLE_LIVERELOAD=1
```

>**Note:**
You need to logout and login in order for the changes to take effect. To
temporarily use the changes, run `source ~/.bashrc`.

[gh-livereload]: https://github.com/middleman/middleman-livereload/issues/60

## Production Build

For the production CI build, files are built statically.

You can perform a production build locally instead of running the middleman dev server.

This is necessary for some pages which use custom generators, such as `/direction`.
See the sections below for details on how to use the local production build.

The other case the local build might be necessary is when debugging, or working
on the production build process. 

Otherwise, the middleman dev server described above should suffice for most cases.

See the following sub-sections for details on how to use the local production build.

### Custom Generators

There are a few custom, static generators specified in the sites' `config.rb`. For
example, some generators produce the direction issue list,
releases list, and organization chart dynamically.

These pages cannot be viewed directly via the Middleman server
(e.g. http://localhost:4567) because there are explicit rules that
tell Middleman to defer the generation to other scripts. These
special URLs (e.g. /releases/index.html) usually have two
Middleman keywords:

1. [`proxy`](https://middlemanapp.com/advanced/dynamic_pages/)

   This tells Middleman to output a static file based on the provided template.

2. [`ignore`](https://www.relishapp.com/middleman/middleman-core/docs/ignoring-paths)

   This tells the Middleman server not to handle this URL. The external generator will
   build static files.

To preview these custom-generated pages locally, you must first build the files
with the production build.

The following "Preview `/direction`" section" contains instructions on how to do
this, using the direction proxy resource as an example.

### Preview `/direction/`

This section contains instructions on how to do a local production build, using
the `/direction` pages as an example.

The [direction](https://about.gitlab.com/direction/) page is generated
by a mix of [markdown text](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/source/direction/template.html.md.erb)
and content generated automatically by fetching data from different projects. In order to fetch that data, the build process will need
a GitLab access token.

For the sake of build speed while developing the website, the direction page is
only built when the `INCLUDE_GENERATORS` (and `PRIVATE_TOKEN` is set). This means that locally,
it returns a 404.

A workaround for previewing it locally is setting `INCLUDE_GENERATORS` and `PRIVATE_TOKEN`
and doing a local build (not development mode).

The `PRIVATE_TOKEN` variable should be set to a GitLab
[personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html)
with read-only permissions.  It can be generated in your GitLab.com's profile **Settings > Access Tokens**.

1. Open a terminal window and cd to your `www-gitlab-com` project directory.
1. Run the `build:all` rake command to build the website:

    ```shell
    INCLUDE_GENERATORS=true PRIVATE_TOKEN=your_access_token bundle exec rake build:all
    ```

1. Wait until it builds (it takes about 10 min or more)
1. The website will be built in a folder called `/public/` in the root dir
1. `cd` to the `/public/` folder in another terminal
1. Run a local web server: `ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'`
1. Preview at port 8000: `http://localhost:8000/direction/`

Notes:

- You'll have to build the site again to preview a new change

### Direction Page Caching

Due to the number of API requests necessary for generating the Direction page,
the issue info results of those requests are cached. 

On production CI, the pages are cached for a number of hours. If you need the page to
be updated immediately, you can set the `CLEAR_DIRECTION_CACHE` environment variable
to `true`.

On production CI, you can [set the variable in the pipeline](https://docs.gitlab.com/ee/ci/pipelines/index.html#run-a-pipeline-manually).

If you're doing a local production build, you can set the variable directly or
delete the `./tmp/cache/direction/` directory.

## Troubleshooting

1. Do check that the Ruby version matches the [expected Ruby
   version](https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/.ruby-version).
   Run the following in the directory for `www-gitlab-com`:

   ```sh
   ruby --version
   ```

1. If a page is not loading with a `File not found` error, check if it is marked as ignored in the middleman sitemap. This is typically located at `http://localhost:7654/__middleman/sitemap/`. If it is marked as ignored, it may be prevented from rendering because you have not set your `PRIVATE_TOKEN` environment variable. This environment variable should be set to a GitLab [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) with read-only permissions. Certain pages require this token to be built properly.

## Modern JavaScript

Currently a lot of the JavaScript developed locally, can be found in
[`source/javascripts/`](../source/javascripts/). The files there however are
handcrafted. For a more modern approach of developing interactive javascript
features, please have a look at [source/frontend/](../source/frontend/).

## Style

### Anchor/links and image tags

When adding anchor and image tags prefer the `link_to` and `image_tag` Middleman
helpers respectively instead of using `%a` and `%img` tags directly. This allows
Middleman to generate the URLs for those tags, which gives us greater control
and flexibility on URL configuration.

For example:

Instead of:

```haml
%img.event-tile-image{ src: "/images/20-years-open-source/1983-gnu-project.svg", alt: "20 years open source gnu project gitlab svg" }
```

Use:

```haml
= image_tag "/images/20-years-open-source/1983-gnu-project.svg", class: "event-tile-image", alt: "20 years open source gnu project gitlab svg"
```

Instead of:

```haml
%a.feature-more{ href: "/blog/2018/03/05/gitlab-for-agile-software-development/" } Read
```

Use:

```haml
= link_to "Read", "/blog/2018/03/05/gitlab-for-agile-software-development/", class: "feature-more"
```

For more information on middleman helpers go to https://middlemanapp.com/basics/helper-methods/

## Testing

### Rspec Unit and Integration Tests

To run all rspec tests:

```sh
bundle exec rspec
```

#### Integration Tests

Integration tests were deprecated in [`gitlab-com/www-gitlab-com!75872`](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/75872).
See that MR for more information.

### Jest Javascript Tests

Run all js/jest tests:

```sh
yarn run test
```

## Cache-busting

We have experienced issues with our cache-busting across the marketing site (in that it didn't exist to begin with). To quickly remediate that, we have implemented the "alternate" approach outlined in [this epic](https://gitlab.com/groups/gitlab-com/marketing/inbound-marketing/-/epics/384), with some changes, such as [using the commit SHA as the cache bust key](https://gitlab.com/gitlab-com/marketing/inbound-marketing/growth/-/issues/1504).

1. We added a helper module that will give templates the ability to inject cache-busting to asset links.
1. We wrapped relevant `script` and `link` tags with the cache bust helper in `source/includes/layout/head.html.haml` and `source/includes/layout/scripts.html.haml`. That should catch most of the sitewide resources, along with items added via `extra_css` and `extra_js`. 

This is still a bandaid measure. Eventually, we should complete the steps in [this epic](https://gitlab.com/groups/gitlab-com/marketing/inbound-marketing/-/epics/384), or as outlined by Chad Woolley [in this comment](https://gitlab.com/groups/gitlab-com/marketing/inbound-marketing/-/epics/384#note_647941354). In particular, this is a non-standard workaround for cache busting, and it brute-forces its way to cache bust all assets, regardless of changes. It also requires manual effort to update. 

For now, it should resolve immediate issues, and we can work towards the holistic fix in the future.

### Cache busting via the commit SHA

When the Middleman static site generator encounters the `cache_bust` helper, it will append a cache busting query parameter to any script or link tag passed to it. In most places, we have used the built in `cache_bust_value` method to provide that, which is a memoized call to the system that invokes `git rev-parse --short HEAD`. That means you don't need to take any manual action to bust the cache when you make changes to this website, but it comes at the cost that every change to this website triggers a cache bust, so our caches will be short-lived, since this repository has so much activity. If we find that caching behavior is leading to negative impacts, such as decreased page speed or traffic, we should consider working on the holistic fix in the future. 

### Cache-busting helper

We have a [custom defined helper](https://middlemanapp.com/basics/helper-methods/#custom-defined-helpers) that implements this behavior.

For future-proofing against changes to the static site generator, it's written as a Ruby module. 

You can find its tests in `spec/helpers/cache_bust_helpers_spec`, and its code in `helpers/cache_bust_helpers`. The spec file demonstrates expected behavior, and the source file includes some more in-depth documentation.

You can also see its use in `source/includes/layout/head.html.haml` and `source/includes/layout/scripts.html.haml`. It works well to wrap `stylesheet_link_tag` helpers with `cache_bust`, but sometimes if you need to use it in HAML or ERB, you may want to wrap the `src` attribute of your stylesheet or script with it.
