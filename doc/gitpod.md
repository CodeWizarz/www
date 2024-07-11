# Gitpod.io Development

## Overview

Gitpod.io is a "Dev Environments Built for the Cloud" third-party service, which can be used as an alternative to setting up a dev environment on your local machine.

You can create a free account, which can currently be used for public repos for up to 50 hours per month.

We have created a `/gitpod.yml` in the repo which contains the necessary configuration to automatically install all dependencies, and start the uncategorized and handbook sites in dev/build mode. 

## Getting Started

### Creating a Gitpod.io workspace

Gitpod has pretty good documentation. After creating an account, see the following docs:

* Getting Started: https://www.gitpod.io/docs/getting-started/
* Browser Extension: If you install the [Gitpod browser extension](https://www.gitpod.io/docs/browser-extension/), you will automatically get a button in the GitLab UI to start a workspace.
* Context URLs: Alternately, besides the browser extension, the easiest way to start a workspace is via a [Context URL](https://www.gitpod.io/docs/context-urls/#context-urls).

## Workspace Usage

### Startup times

The first time a new workspace is started (for a new branch/MR), it will take several minutes to pull the docker image, download and install all the dependencies, and then start the Middleman dev/build servers for the handbook and uncategorized sites. 

On subsequent starts of the same workspace, it will be faster, because the dependencies don't need to be downloaded, but you still need to wait for the dev/build servers to start.

### Accessing the dev server sites

There will be three tabs in the Gitpod workspace terminal area:

1. Handbook site server (port 4567)
1. Uncategorized site server (port 4568)
1. Instructions to view sites

The first two "site server" tabs will automatically install dependencies and start the site servers as background daemon processes.

The third "Instructions to view sites" tab will automatically update to show the progress of the servers starting. When they are all done, you will see the message: "The handbook and uncategorized sites are now available!".

You will also see the message: "Please change to the 'Open Ports' tab to preview or open the handbook or uncategorized sites."  On this tab, you can choose to open one or both of the sites in separate browser tabs, or open one of them in the Gitpod preview pane (you can't have multiple preview panes for different sites).

Note that the handbook site will automatically redirect to the `/handbook` path, and the uncategorized site will open to the root `/`.

## Editing the site

Refer to the [Gitpod docs](https://www.gitpod.io/docs/) to learn how to use the editor. 

For most changes, the dev server should automatically detect and show your changes. However, for some changes to code, scripts, config files, data files, and possibly styling, you may need to restart the dev server. You should be able to go to the relevant "site server" tab in the terminal, Ctrl-C to stop the server, then up-arrow to restart it.

## Gotchas

* Don't forget that you need to explicitly pull/push changes to the Gitpod workspace. You can do this via the menu, or you can do it directly from the `git` command line in the terminal.
* If you have your local git config set to automatically rebase instead of merge when pulling, don't forget to add the config or explicitly do a `git pull --rebase` in the Gitpod terminal.

## Technical Notes

* We use the same docker image as we do for the CI/CD pipelines.
* We could possibly further optimize Gitpod startup times by having a custom child docker image which has the dependencies pre-loaded and pre-installed.
