# Monorepo

## FAQ

* QUESTION: How do a build the site locally?
  * ANSWER: `bundle exec rake build:all`. See other `build:*` tasks with `bundle exec rake -T`
* QUESTION: Is there a high level overview of the work on the monorepo?
  * ANSWER: Yes, here is a video walk through of the [epics](https://gitlab.com/groups/gitlab-com/-/epics/282) and state of the code as of July 22, 2020, including discussion of monorepo.rb, monorepo.yml, monorepo-migration-helper.rb: https://www.youtube.com/watch?v=4WxyIDiVcjM
* QUESTION: I'm getting a Middleman build error like `Error: Could not locate ...`
  * ANSWER: Add the file which could not be located to `/data/monorepo.yml`, under the `shared_files` list, under the correct `site`. Please be consistent: 1) alphabetize, and 2) add a comment indicating where the file is used from.
* QUESTION: What was the Static Site Editor Group (SSEG) experience moving handbook files? How did y’all deal with merge conflicts? This will be a big hurdle for our content contributors (in the marketing org).
https://gitlab.slack.com/archives/C017LD25V9S/p1595292845017200?thread_ts=1595274702.004300&cid=C017LD25V9S
  * ANSWER: For the devs, while the MR for the move is being worked on, in order to avoid lots of merge conflicts, a strict rebase workflow is followed, where the actual file moves are kept in a separate commit, as the last commit on the branch.  Then this commit can be repeatedly deleted (via `rebase --interactive`) and the move is re-performed and re-committed.
  * ANSWER: For end users when the merge is done, we just notified everyone very clearly that the move was happening, and they would need to deal with it by rebasing (or merging in master) their branch.  We notified them a week in advance, and again when the move was actually performed, and referred them to #mr-buddies for help.  There's copies of this process and the actual slack messages sent on the handbook monorepo issues ["part 1"](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/6689) and ["part 2"](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/7912).
* QUESTION: What happens if SSEG and marketing migrate towards different static site generators?  
  * ANSWER: From a build perspective, you have to deal with the shared files, and the decision comes down to what is shared vs. duplicated (see https://gitlab.com/groups/gitlab-com/-/epics/282)
  * ANSWER: From a publishing perspective, it's much simpler.  The contract is that a given CI job for a specific sub-site or sub-path (like 'handbook') has to fulfill two requirements.  Other than these, it can perform the actual build and HTML generation however is desired, using any tool that is desired:
      1. It `rsync`s the generated files to the GCP bucket to deploy the files (relative to the public dir) it is responsible for building, and doesn't touch anything else on the site
      1. It passes the generated files along as an artifact, so that the "deploy-cleanup-old-deleted-files" job can know not to delete them when it cleans up deleted files.
* QUESTION: As we separate the sites and tech more, how do we deal with relative vs absolute pathing of URLs, ie a handbook page linking to a blog or about page and vice-versa? We might need to update lots of links..  Example: `= link_to "Download the ebook", "/resources/guide-to-the-cloud/"`
  * ANSWER: If you mean actual link in the HTML, the answer is the same as above.  As long as the files get built with the same content, and published to the same location that they always have, there shouldn't be problems with relative links.

## Background

See the following epic and its sub-epics and issues for context on the monorepo:

* https://gitlab.com/groups/gitlab-com/-/epics/282
* Summary: "To ensure stability, accountability and efficiency we need to separate and isolate the various sub-sites in the `www-gitlab-com` repo."

## Why

* There are many reasons large organizations, including Google, Microsoft, and Facebook, use monorepos (TODO: add references).
* A monorepo approach is useful when you want to separate and isolate different areas ownership and functionality, but they still have dependencies or relationships among each other.  For example, shared libraries, assets, documentation, etc.
* One of the main reasons is because of versioning: coordinating related across different areas.
  * In the "separate but related areas" situation, separate repositories introduce significant additional process and technical complexity compared to a single repo.
  * This is because in a single repository, you have the git SHA as a natural "version" to coordinate related changes across different areas, and this coordination can be handled via single Merge Requests.
  * With multiple repositories, in order to coordinate changes, you must have multiple MRs to coordinate related changes, and you must introduce some sort of versioning scheme to indicate which versions of the multiple repos "go together".
  * You must also introduce more complex deployment strategies to ensure that the correct versions and dependencies are deployed together, as well as more complex deprecation schemes to know when you can deprecate old versions which no longer have dependencies from other repos.
* These concepts behind these motivations are also reflected elsewhere in GitLab's technical strategy and documentation:
  * [Advantages of a single application](https://about.gitlab.com/handbook/product/single-application/)
  * [Database Strategy](https://about.gitlab.com/handbook/engineering/development/enablement/data_stores/database/doc/strategy.html) 
    * [The trouble with microservices](https://about.gitlab.com/handbook/engineering/development/enablement/data_stores/database/doc/strategy.html#the-trouble-with-microservices)

## Overview

* There is a single git repo which contains multiple "sites", which live under `sites/<sitename>`
* Files (layouts, media, data, common config, etc) which are shared among the sites, or not specific to any site, live at the top-level of the repo, not under any `site/...` directory. (NOTE: These may eventually be all moved under a top-level `shared` directory.)
* However, there is still a single website/domain built and published from all the individual sites. (NOTE: this may eventually change, if different sites decide to implement independent deployments and/or domains)
* The `data/monorepo.yml` file is used as a **"single source of truth"** for all the monorepo sites and most of their configuration:
  * It contains a top-level list of the sites, which must match the directories under `sites/`
  * Under each site, there are two entries: `paths` and `shared_files`. There may also be an optional `development_paths` entry.
  * `paths` describes what URL paths are served by the site.
  * `shared_files` describes what top-level files are referenced by the site.
  * `development_paths` is a list of URL root paths which are served only in development mode.

* There is a top-level Middleman build `config.rb` file, as well as dedicated `sites/<sitename>/config.rb` builds for each site.  More details on this below.

## "No Circular Dependencies" Rule

The primary rule is that there must be no "circular dependencies" in the monorepo at build time.  This means:

* Files in individual sites **MAY** depend on (directly reference) shared files in the top-level at build time.
* Files in individual sites **MUST NOT** depend on (directly reference) files in any other site at build time.  The only exception to this is "runtime" references, such as a URL, image link, or iframe pointing to a file or page in the built/published website, which was built and published by a different site.
* Top-level files **MUST NOT** depend on files in any other site at build time (with the same "runtime" reference exception as above).

## Middleman Support for Monorepo

Middleman does not provide official support for building a single site which is composed out of sub-sites in a monorepo structure.  However, it does provide some low-level support for configuring a monorepo structure to work.

We have encapsulated and abstracted most of this configuration, so that knowledge of the low-level middleman details is not necessary for day-to-day development.  This is driven via the `data/monorepo.yml` referenced above.

There is a custom Middleman extension, `extensions/monorepo.rb`, which encapsulates the necessary config, driven by `data/monorepo.yml`.  It does the following:

* Uses each site's `paths` (and in development mode, `development_paths`) entr(ies) to implement a `manipulate_resource_list` hook, and only publish the specified paths for that site.
  * `development_paths` is used to allow paths under the top-level `source` directory to be served only in development mode, and not filtered out by the main `paths` entry.
* Uses each site's `shared_files` entry to add a `files.watch` configuration, which includes only those shared files as dependencies.
* Add some other common middleman configuration which is required for the monorepo structure to work.

Each site has a dedicated Middleman build config at `sites/<sitename>/config.rb`, which calls the `monorepo` extension, as well as other necessary configuration such as proxy resources for the site.  However, in Middleman `development` mode, these are not used - everything is built by the top-level `config.rb`.  More details below.

### More details on monorepo extension

See the notes at the top of `data/monorepo.yml` for some additional related notes/references/gotchas related to the monorepo extension (they are not all duplicated here).

## Middleman Build Mode vs. Development Mode

When the site is being built for deployment via CI/CD, different parts of the site are built and deployed by different CI jobs. Currently, this includes the assets and non-team/pet images in the top-level `source` directory, plus all the individual sites' Middleman builds. There is also a scheduled job which cleans up old files on the deployed site which have been deleted from git. Note that eventually, once all pages are moved to monorepo sites and they deploy and clean up all their own templates/assets/images, there will hopefully be no need for a monolithic top-level build.

To build the site locally, use `bundle exec rake build:all`. See other `build:*` tasks with `bundle exec rake -T`

For `development` mode, support is being removed for running the entire site from the top-level via `bundle exec middleman`.

Instead, you will run middleman for the individual sites, by changing to the site's directory (`cd sites/handbook`) and running the middleman build `bundle exec middleman`.  This will only serve the pages/assets/etc contained and required by that site. 

## Deploys

There is no longer a "monolithic" deploy in the CI/CD pipeline.  Instead, each part of the site builds and deploys itself via an independent dedicated job.

There is also a scheduled job which cleans up old files on the deployed site which have been deleted from git.  This is accomplished by each job passing along as artifacts the files which it deploys, so the cleanup job knows the entire set of files on the site in order to determine what needs to be cleaned up.

Each site is free to build and deploy its files however they want, with any tools, build or deployment approach, as long as they fulfill the contract:

1. Has CI job(s) which publish all new/modified files to the GCP bucket without deleting anything owned by other sites.
1. Pass along all files built by the job(s) to the cleanup job so old deleted files can be cleaned up off the site.  Note that we can potentially eliminate this in the future too if we can give each site the responsibility of cleaning up its own old files without impacting other sites. One way would be to  

Note: With this independent per-job build+deploy, there's a chance of production being slightly out of sync, for example if an image or asset deploys at a different time than the template which references it. However, we aren't too concerned about it, mainly because the image and asset jobs are faster, and will likely always finish before the middleman template build jobs. And even if they did, they would only be out of sync for a minute or so at most. So, it's worth the benefits we are getting from fewer/faster jobs and decoupling of the shared deploy, unless we have (m)any complaints about it.

## Middleman Configs

The top level middleman config file will be going away.  Each site will have its own config under `sites/<sitename>/config.rb`, if/while they are served by middleman (but they may be served and deployed any way the site wants, as long as the contract is fulfilled.  See the "Deploys" section above.

There may still be small middleman configs at the top level to support the partial deploy jobs. `config_assets.rb` is an example of this. This approach is supported by `/extensions/middleman_evaluate_configuration_monkeypatch.rb`.  However, this will hopefully go away soon as we migrate away from Middleman for asset processing.

## Migrating a new site to the monorepo

* Look at the issues for the previous monorepo migrations. There are detailed task lists there:
  * [The initial spike and research into the viability of a monorepo approach under Middleman](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/49086)
  * [Handbook Part 1](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/6689) - Note this also has many associated MRs that were done as part of the initial cleanup and research.
  * [Handbook Part 2](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/7912)
  * [Monorepo Refactor Preliminary Separation and Decoupling Tasks](https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/8302)
  * The remaining tasks are still in flux. See the [`www-gitlab-com` Monorepo Refactor epic](https://gitlab.com/groups/gitlab-com/-/epics/282) for the latest status.
* Use `scripts/monorepo-migration-helper.rb`.  But note that it is not perfect! It currently will miss transitive dependencies, and may add some unnecessary dependencies which are referenced in markdown code blocks.
* Handy command to do a fast build of only a subset of pages for debugging:
	* `MIDDLEMAN_DEBUG_RESOURCE_REGEX='(sitemap|20-years)' SKIP_BLOG=true SKIP_EXTERNAL_PIPELINE=true NO_CONTRACTS=true bundle exec middleman build --bail`

