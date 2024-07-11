---
title: "Announcing Git LFS Support in GitLab"
description: "Support for Git Large File Storage is now included in GitLab.com, GitLab Community Edition and Enterprise Edition."
canonical_path: "/blog/2015/11/23/announcing-git-lfs-support-in-gitlab/"
date: 2015-11-23
author: GitLab
author_twitter: GitLab
categories: company
---

As the use of Git and GitLab becomes increasingly popular in the development world, we’re seeing people in other industries use GitLab as well. Versioning video files, images, and even microchip designs, teams need to be able to work collaboratively to version any type of large file efficiently and reliably.

In order to better serve our community with a need to version large files, support for Git Large File Storage (LFS) is now included in GitLab.com, GitLab Community Edition, and GitLab Enterprise Edition. Now game developers, graphic designers, mobile app developers, and anyone else building software requiring large files can use GitLab to version all of their assets.

<!-- more -->

Companies using [GitLab EE](/features/#enterprise) still have the option to use [git-annex](/blog/2015/02/17/gitlab-annex-solves-the-problem-of-versioning-large-binaries-with-git/), released in February 2015, to version large files or to switch to Git LFS.

## What is Git LFS?

Git LFS uses reference pointers within small text files to point to large files stored on the GitLab servers for GitLab.com, or on your own servers for our on-premises offerings, GitLab CE and EE. Large files such as high resolution images and videos, audio files, and assets can be called from a remote server.

This allows for Git users to bypass the size restrictions previously given for repositories. The general recommendation has been to not allow Git repositories larger than 1GB to preserve performance and decrease the chances of performance issues.

## How do I get started using Git LFS?

Git LFS is already running on GitLab.com. To update your on-premises version of GitLab EE or CE, simply update your [installation to 8.2](/install/). To learn more about Git LFS, take a look at our [documentation](http://doc.gitlab.com/ce/workflow/lfs/manage_large_binaries_with_git_lfs.html).

Don’t miss the other great features from [yesterday’s release](/releases/2015/11/22/gitlab-8-2-released/) like repository mirroring, award emoji, and more. As always, thanks everyone in the community, both inside the company and out, for helping with this release. If you have any comments or questions, please feel free to comment directly on this post.

## Update

Read the blog post "[Getting Started with Git LFS](/blog/2017/01/30/getting-started-with-git-lfs-tutorial/)".
