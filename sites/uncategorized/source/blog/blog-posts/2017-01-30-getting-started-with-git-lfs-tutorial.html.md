---
title: "Getting started with Git LFS"
author: Tobias Günther
author_twitter: gntr
author_gitlab: tobidobi
categories: engineering
description: "Managing large files efficiently with Git LFS"
image_title: '/images/blogimages/getting-started-with-git-lfs-tutorial/lfs-website.png'
guest: true
---

It happens with the best of intentions: your design team adds their large graphic files to your project repository - and you see it grow and grow until it's a multi-gigabyte clump...

<!--more-->

Working with large binary files in Git can indeed be tricky.
Every time a tiny change in a 100 MB Photoshop file is committed, your repository grows by another 100 MB.
This quickly adds up and makes your repository almost unusable due to its enormous size.

But of course, _not_ using [version control](/topics/version-control/) for your design / concept / movie / audio / executables / &lt;other-large-file-use-case&gt; work _cannot_ be the solution.
The general benefits of version control still apply and should be reaped in all kinds of projects.

Luckily, there's a Git extension that makes working with large files a lot more efficient: say hello to "[Large File Storage](https://git-lfs.github.com/)" (or simply "LFS" if you prefer nicknames).

## Without LFS: Bloated repositories

Before we look at how exactly LFS works its wonders, we'll take a closer look at the actual problem.
Let's consider a simple website project as an example:

![A simple project setup](/images/blogimages/getting-started-with-git-lfs-tutorial/project-setup-without-big-files.png){:.shadow}

Nothing special: some HTML, CSS, and JS files and a couple of small image assets.
However, until now, we haven't included our design assets (Photoshop, Sketch, etc.).
It makes a lot of sense to put your design assets under version control, too.

![Big binary files in a project](/images/blogimages/getting-started-with-git-lfs-tutorial/project-setup-with-big-files.png){:.shadow}

However, here's the catch: each time our designer makes a change (no matter how small) to this new Photoshop file, she will commit another 100 MB to the repository.
Very quickly, the repository will weigh tons of megabytes and soon gigabytes - which makes cloning and managing it very tedious.
{: .alert .alert-info}

Although I only talked about "design" files, this is really a problem with all "large" files:
movies, audio recordings, datasets, etc.

## With LFS: Efficient large file handling

Of course, LFS cannot simply "magic away" all that large data: it accrues with every change and has to be saved.
However, it shifts that burden to the remote server - allowing the _local_ repository to stay relatively lean!

To make this possible, LFS uses a simple trick: **it does not keep all of a file's versions in the local repository**.
Instead, it provides only the files that are necessary in the checked out revision, on demand.

But this poses an interesting question: if those huge files themselves are _not_ present in your local repository... what _is_ present instead?
[LFS saves lightweight pointers](https://www.git-tower.com/learn/git/ebook/en/desktop-gui/advanced-topics/git-lfs?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post) in place of real file data. When you check out a revision with such a pointer, LFS simply looks up the original file (possibly on the server if it's not in its own, special cache) and downloads it for you.

Thereby, you end up with only the files you really want - not a whole bunch of superfluous data that you might never need.

## Installing LFS

LFS is not (yet) part of the core Git binary, but it's available as an extension.
This means that, before we can work with LFS, we need to make sure it's installed.

#### Server

Not all code hosting services support LFS already. As a GitLab user, however, there's not much to worry about:
if you're using GitLab.com or a halfway recent version of GitLab CE or EE, [support for LFS is already baked in](https://docs.gitlab.com/ee/topics/git/lfs/index.html)!
Your administrator only need to [enable the LFS option](https://docs.gitlab.com/ee/administration/lfs/index.html).

#### Local machine

Your local Git installation also needs to support LFS.
If you're using [Tower](https://www.git-tower.com/?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post), a Git desktop client, you don't have to install anything: Tower supports the Git Large File System out of the box.

If you're using Git on the command line, there are different installation options available to you:

- Binary Packages: Up-to-date [binary packages](https://github.com/git-lfs/git-lfs/releases) are available for Windows, Mac, Linux, and FreeBSD.
- Linux: Packages for Debian and RPM are available from [PackageCloud](https://packagecloud.io/github/git-lfs/install).
- macOS: You can use [Homebrew](https://github.com/Homebrew/brew) via "brew install git-lfs" or [MacPorts](https://www.macports.org) via "port install git-lfs".
- Windows: You can use the [Chocolatey](https://chocolatey.org/) package manager via "choco install git-lfs".

After your package manager has finished its work, you need to complete the installation with the "lfs install" command:

```
git lfs install
```

## Tracking files with LFS

Without further instructions, LFS won't take care of your large file problems.
We'll have to tell LFS explicitly which files it should handle!

So let's return to our "big Photoshop file" example. We can instruct LFS to take care of the "design.psd" file using the "lfs track" command:

```
git lfs track "design-resources/design.psd"
```

At first glance, the command didn't seem to have much effect. However, you'll notice that a new file in the project's root folder has been created (or changed, if it already existed): `.gitattributes` collects all file patterns that we choose to track via LFS. Let's take a look at its contents:

```
cat .gitattributes
design-resources/design.psd filter=lfs diff=lfs merge=lfs -text
```

Perfect! From now on, LFS will handle this file. We can now go ahead and add it to the repository in the way we're used to.
Notice that any changes to `.gitattributes` also have to be committed to the repository, just like other modifications:

```
git add .gitattributes
git add design-resources/design.psd
git commit -m "Add design file"
```

## Tracking file patterns

Adding a specific, single file like this is all well and good... but what if you want to track, for example, _every_ `.indd` file in our project?
Please relax: you don't have to add each file manually! LFS allows you to define file patterns, much like when ignoring files.
The following command, for example, will instruct LFS to track all _InDesign_ files - existing ones and future ones:

```
git lfs track "*.indd"
```

You could also tell LFS to track the contents of a whole directory:

```
git lfs track "design-assets/*"
```

## Getting an overview of tracked files

At some point, you might want to know which files exactly are tracked by LFS at the moment.
You could simply take a look at the `.gitattributes` file. However, these are not _actual_ files, but only rules and therefore highly "theoretical": individual files might have slipped through, e.g. due to typos or overly restrictive rules.

To see a list of the _actual_ files that you're currently tracking, simply use the `git lfs ls-files` command:

```
git lfs ls-files
194dcdb603 * design-resources/design.psd
```		

## Track as early as possible

Remember that LFS does _not_ change the laws of nature: things that were committed to the repository are there to stay.
It's very hard (and dangerous) to change a project's commit history.

This means that you should tell LFS to track a file _before_ it's committed to the repository.
{: .alert .alert-info}

Otherwise, it has become part of your project's history - including all of its megabytes and gigabytes...

The ideal moment to configure which file patterns you want to track is right when initializing a repository (just like with [ignoring files](https://www.git-tower.com/learn/git/ebook/en/desktop-gui/basics/starting-with-an-unversioned-project?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post#chapter_ignoring+files)).

## Using LFS in a GUI

Although LFS is not difficult to use, there are still commands to remember and things to mess up.
If you want to be more productive with Git (and LFS), have a look at [Tower](https://www.git-tower.com/?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post), a Git desktop client for Mac and Windows.
Since Tower comes with built-in support for Git LFS, there is nothing to install. The app has been around for several years and is trusted by over 80,000 users all over the world.

![Using Tower to be more productive with Git and Git LFS](/images/blogimages/getting-started-with-git-lfs-tutorial/tower-lfs.gif)

Additionally, Tower provides a direct [integration with GitLab](/blog/2017/01/20/gitlab-tower-integration-coupon-code/)! After connecting your GitLab account in Tower, you can clone and create repositories with just a single click.

## Working with Git

A great aspect of LFS is that you can maintain your normal Git workflow: staging, committing, pushing, pulling and everything else works just like before.
Apart from the commands we've discussed, there's nothing to watch out for.

LFS will provide the files you need, _when_ you need them.

In case you're looking for more information about LFS, have a look at this free [online book](https://www.git-tower.com/learn/git/ebook/en/desktop-gui/advanced-topics/git-lfs?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post).
For general insights about Git, take a look at the [Git Tips & Tricks](/blog/2016/12/08/git-tips-and-tricks/) blog post and Tower's [video series](https://www.git-tower.com/learn/git/videos?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post).

## About Guest Author

This is a [guest post](/handbook/marketing/blog/#guest-posts)
written by [Tobias Günther](https://twitter.com/gntr), who is part of the team behind the [Tower Git client](https://www.git-tower.com/?utm_source=gitlab-blog&utm_campaign=GitLab%20LFS&utm_medium=guest-post).

Cover image: screenshot of [Git LFS](https://git-lfs.github.com/)
{:.note}
