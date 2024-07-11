---
release_number: "13.4"  # version number - required
title: "GitLab 13.4 released with Vault for CI variables and Kubernetes Agent"  # short title (no longer than 62 characters) - required
author: Eric Schurter  # author name and surname - required
author_gitlab: ericschurter  # author's gitlab.com username - required
image_title: '/images/13_4/13-4-cover-image.jpg'  # cover image - required
description: "GitLab 13.4 released with Vault for CI variables, Kubernetes Agent, and Security Center... and we’re open sourcing feature flags!"  # short description - required
twitter_image: '/images/opengraph/release-posts/gitlab-13-4-released.png'  # social sharing image - not required but recommended
categories: releases  # required
layout: release  # required
featured: yes

# APPEARANCE
header_layout_dark: true  # uncomment if the cover image is dark
# release_number_dark: true  # uncomment if you want a dark release number

# COVER IMAGE LICENCE
cover_img:
  image_url: 'https://unsplash.com/photos/70qNNVjzTaY'  # required
  licence: CC0  # which licence the image is available with - required
  licence_url: 'https://unsplash.com/license'  # required

---

<!--
This is the release blog post file. Add here the introduction only.
All remaining content goes into data/release-posts/.

**Use the merge request template "Release-Post", and please set the calendar due
date for each stage (general contributions, review).**

Read through the Release Posts Handbook for more information:
https://about.gitlab.com/handbook/marketing/blog/release-posts/#introduction
-->

## GitLab 13.4 released with Vault for CI variables, Kubernetes Agent, and Security Center... and we’re bringing feature flags to Starter!

At GitLab, we are always focusing on how to help your team reduce risk, increase their efficiency, and accelerate their delivery speed with a platform you love. This month, we’re bringing all sorts of goodness that expands visibility into security, lowers vulnerabilities, improves efficiency, makes the user experience better, and helps your team deploy even faster. We hope that you find these top features, and the **53 other new features** packed in this release, useful.

## Expanded security capabilities

True to form, this month’s release adds several capabilities to your GitLab DevSecOps kit. First, [secrets stored in HashiCorp Vault can now be injected into CI/CD jobs](#use-hashicorp-vault-secrets-in-ci-jobs) as part of the build and deploy process. Next, organizations who want to maintain a separation of code deployment duties can [promote specific users with Reporter access to the role of Deployer](#grant-users-deployment-permissions-without-code-access). The Deployer role follows the principle of least privilege access, allowing them to approve merge requests and deploy code to protected environments without requiring access to modify the code itself. Another way you can reduce risk is by using the new [GitLab Agent for Kubernetes](#introducing-the-gitlab-agent-for-kubernetes). Operators can deploy to their Kubernetes clusters from GitLab without the need to open their cluster to the entire Internet. We are also introducing automatic versioning support for new Terraform state files with [GitLab Managed Terraform state](#gitlab-managed-terraform-state) to support compliance and debugging needs. Last but not least, the Instance Security Dashboard has evolved into the [GitLab Security Center](#security-center) featuring Vulnerability Reporting and Settings.

## Better UX & efficiency

We’ve improved our global search capabilities with [quick navigation from the search bar](#quick-navigation-using-the-search-bar) to quickly jump to recent issues, groups, projects, settings, and Help topics. We're excited about [GitLab Pages Redirects](#simple-redirect-configuration-file-for-gitlab-pages) for redirecting individual pages and directories within a site, which makes users more efficient at deploying pages sites. And for those who have been wishing for enhanced deployment information, this release enables you to [manage hundreds of supported project deployments from the Environments dashboard](#track-environments-at-scale-with-the-environments-dashboard). Tada! 🎉

## Open source contribution highlights

We’re introducing [inline code coverage remarks inside MR diffs](#inline-code-coverage-remarks-inside-mr-diffs), (contributed by [this month's MVP, Fabio Huser](#mvp)!), providing developers a visual representation of code coverage in the Merge Request diff when doing a review. Knowing whether modified code is covered by a unit test helps speed up code reviews and time to merge and deploy a feature. We have [moved feature flags to Starter](#feature-flags-made-available-in-gitlab-starter) and plan to move [feature flags to Core in 13.5](https://gitlab.com/gitlab-org/gitlab/-/issues/212318).

<!--
Suggestion: describe each feature briefly in just a few words, using
anchors to link to their headings (use the relative path). The intro is supposed
to be eyes-catching, so "be happy" about it, describe them enthusiastically.
Focus on what are the advantages on having each of them. For some guidance,
look at the intros of past release posts.
-->

### But wait, wait... there’s more!

As usual, we have way too little space, but still lots and lots of new things we packed into 13.4 to tell you about. Here are a few more of them:

- [List and revoke Personal Access Tokens via API](#list-and-revoke-personal-access-tokens-via-api)
- [Revoke PATs for self-managed credential inventory](#revoke-pats-for-self-managed-credential-inventory)
- [Child pipelines can now trigger their own child pipelines](#child-pipelines-can-now-trigger-their-own-child-pipelines)
- [Mark a to-do as Done in the Design View](#mark-a-to-do-as-done-in-the-design-view)
- [GitLab Runner 13.4 released](#gitlab-runner-134)
- [GitLab chart improvements](#gitlab-chart-improvements)
- [Smartcard authentication support for GitLab Helm chart](#smartcard-authentication-support-for-gitlab-helm-chart)


If you'd like to preview what's coming in next month’s release, be sure to check out our 13.5 [kickoff video](https://www.youtube.com/watch?v=Zp7_PNRxMxU)!

<!--
Reminder: the final paragraph should include the total number of new features
being released, including bugs, performance improvements, and contributions from
non-DevOps stages like Enablement. All of these should be listed in the release
post, either as headers or bullet points.
-->
