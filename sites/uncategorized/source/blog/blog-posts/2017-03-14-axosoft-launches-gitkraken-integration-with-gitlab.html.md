---
title: Axosoft launches GitKraken integration with GitLab
author: John Sparrow
author_twitter: gitkraken
categories: company
image_title: '/images/blogimages/gitlab-gitkraken-cover-image.png'
description: Manage GitLab repositories directly from GitKraken — get a 20% discount on GitKraken Pro
guest: true
---

With this new integration, GitLab users can now work more efficiently in GitKraken to manage repositories. Save time by leveraging GitKraken’s integration with GitLab to do things like generate and connect SSH keys, find available remote repositories to clone, and more—all without ever leaving GitKraken.

<!-- more -->

## What is GitKraken?

[GitKraken](https://www.gitkraken.com/) is a Git GUI client for Windows, Mac, and Linux. It’s designed to make you a more productive Git user by making Git commands and processes easy, fast, and intuitive. It provides a visually appealing experience that requires fewer interactions and allows for a more fluid workflow; it even has a built-in merge tool so you don’t have to interrupt your workflow by switching applications to resolve merge conflicts. And, if you make a mistake, you can click the undo button.

The GitKraken dev team at Axosoft has been working on a few integrations to keep user workflow running smoothly, particularly when interacting with remote services. We’ve been working on a specific integration that we’re super excited about and think you will be too — our GitLab integration!

![Kraken plus Tanuki](/images/blogimages/gitlab-gitkraken.png){: .shadow}

## GitKraken and GitLab

GitLab has steadily been improving its API, allowing third-party developers to harness the power of its infrastructure in their apps. Of particular interest to the GitKraken team was the remote management of Git repositories. So, naturally, we started working to leverage these capabilities, and now we’re excited to announce [GitKraken v2.2](https://blog.axosoft.com/2017/03/09/gitkraken-v2-2/) with GitLab integration!

Grabbing the URL of a repo and using it as a remote in GitKraken has always been possible, but actually integrating was not, until version 2.2. Here are the various ways GitLab now integrates across GitKraken.

## Integration highlights

### 1. Add and remove SSH keys

You can now generate an SSH key and connect it directly to GitLab from within Gitraken! Simply open **Preferences > Authentication**, click on the GitLab.com Tanuki (logo) tab, click **Connect**, and authenticate with GitLab. You’re done!

![authentication](/images/blogimages/gitkraken-partnership-one.png){: .shadow}

![connection successful](/images/blogimages/gitkraken-partnership-two.png){: .shadow}

### 2. Initialize a repo

Open GitKraken’s Repository Management modal, and select **Init**. From there, you can choose whether to initialize Git in a current directory on your local machine, or GitKraken can create a new bare project for you directly on GitLab.com, and then clone it down locally.

![init](/images/blogimages/gitkraken-partnership-three.png){: .shadow}

### 3. Clone a repo from a GitLab account

If you already have a GitLab.com remote repo set up, cloning it is extremely easy - you don't even have to touch the command line. In the Repository Management modal, select **Clone** and you can browse (and fuzzy find) the repo on your GitLab remote that you wish to clone. As you type, GitKraken will drill down to the appropriate repo names that match your search terms.

You can then browse the local folder to which you want to clone the repo, and you’re done!

![clone](/images/blogimages/gitkraken-partnership-four.png){: .shadow}

### 4. Remote avatars in the graph and left panel

If you have multiple remotes and multiple repos, the owners of those remotes/repos can be difficult to identify, and it can be challenging to find who you’re looking for at a glance. In the graph and left panel views, repository and remote owners’ avatars in their GitLab.com accounts will be shown as thumbnails next to what they own. Just bear in mind that not everyone is as cute as a tanuki.

![remote](/images/blogimages/gitkraken-partnership-five.png){: .shadow}

Those are GitKraken's current integrations with GitLab! But, the story doesn’t end there. **Spoiler alert:** The GitLab and GitKraken teams are committed to making this integration even better!

Who would have thought a kraken and a tanuki could find so much common ground?

## About the Guest Author

John is a web developer, wordsmith and digital artist from London, UK. As Axosoft's token Brit, he works on websites and marketing content.

