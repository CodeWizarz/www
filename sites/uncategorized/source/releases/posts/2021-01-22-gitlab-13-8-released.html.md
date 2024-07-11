---
release_number: "13.8"
title: "GitLab 13.8 released with a Pipeline Editor and DORA metrics"
author: Farnoosh Seifoddini
author_gitlab: fseifoddini
image_title: '/images/13_8/13_8-cover-image-2.jpg'
description: "GitLab 13.8 released with a Pipeline Editor, DORA metrics, quality of life improvements, and much more!"
twitter_image: '/images/13_8/13_8-cover-image-2.jpg' # required - copy URL from image title section above
categories: releases
layout: release
featured: yes
release_number_dark: true
cover_img:
  image_url: "https://unsplash.com/photos/IuLgi9PWETU"
  licence: CC0
  licence_url: "https://unsplash.com/license"
---

Today, we are excited to introduce a dedicated Pipeline Editor, a deployment frequency dashboard, and several quality of life improvements that will make using GitLab every day even more enjoyable. These are just a few highlights from the 50+ improvements in this release.

## The new Pipeline Editor makes CI/CD easy to use
{: .intro-header}

Since its inception, the defining feature of GitLab CI/CD has been the `.gitlab-ci.yml` configuration file. Configuring pipelines as code means you can version control and collaborate on pipelines using the same interfaces you use for your application code. Additionally, GitLab's advanced syntax provides a high degree of customization for sophisticated and demanding CI/CD use cases. However, all of this power and flexibility comes with a fair bit of complexity. This is why our [vision for CI/CD](https://gitlab.com/groups/gitlab-org/-/epics/4534) is to create a visual pipeline authoring experience, built-in to GitLab, that simplifies the complexity letting you quickly create and edit pipelines while still exposing advanced options when you need them.

Today, we’re pleased to introduce the first iteration of the [Pipeline Editor](#pipeline-editor). Starting in 13.8, you'll have a dedicated editor designed for CI/CD with some enhanced functionality such as built-in [linting](#ci-lint-tool-in-the-pipeline-editor-page) and [configuration validation](#cicd-configuration-validation-in-pipeline-editor). A [pipeline visualizer](#visualization-of-pipeline-configuration) in the editor will show you what your pipelines will look like before you commit your changes. These capabilities allow new users to get started with GitLab CI/CD quickly and make experienced power users more efficient. This is just the beginning of what's in store for the Pipeline Editor. We can't wait for you to try it out so you can share your feedback, suggestions, and code contributions.

## Improve your DevOps maturity with deployment frequency metrics
{: .intro-header}

IT leaders and practitioners alike love DevOps. Developers and software engineers love that DevOps makes their job easier while IT leaders love that DevOps makes the business perform better. For several years, [DORA, the DevOps Research and Assessment firm](https://www.devops-research.com/research.html), has conducted primary research on the impact of DevOps in the enterprise. Their [published results](https://www.devops-research.com/research.html#reports) have shown that DevOps maturity leads to positive business outcomes like happier customers, greater market share, and increased revenue. Four metrics in particular, commonly known as the “DORA 4”, are highly correlated with business performance. These are deployment frequency, lead time for changes, time to restore service, and change failure rate.

We’ve heard from many of you that you want to measure these metrics so that you can improve them. However, instrumenting your systems to capture and report on these metrics can be difficult and time-consuming. We decided to build them into GitLab for you so you can focus on improving your DevOps maturity instead of instrumentation. Starting with GitLab 13.8 you can find [deployment frequency charts](#deployment-frequency-charts) in your CI/CD analytics. This is just the first of the DORA 4 metrics to come to GitLab. Our [vision for the coming year](https://gitlab.com/groups/gitlab-org/-/epics/4358) will be to add the additional three metrics so you’ll be able to measure and optimize your DevOps practices.

## A few small features to improve your quality of life
{: .intro-header}

As GitLab gets better with every iteration sometimes the most exciting improvements aren’t the big new features, but the small UX improvements that take a tedious task and make it simple and easy. In this release, we’ve shipped several long-asked-for enhancements that we think you’ll enjoy such as the ability to:

- [Send an email to an issue](#send-an-email-to-an-issue).
- [Click and drag to make multi-line comments](#click-and-drag-multiline-merge-request-comments).
- [Download artifacts from an MR widget](#download-artifacts-directly-from-the-merge-request-widget).
- [Identify flaky tests with a repeat failed test counter](#repeat-failed-test-counter).
- [Rebase an MR branch with a quick action](#rebase-quick-action-for-merge-requests).

## And much more!
{: .intro-header}

These are just a few of many ways GitLab has been made better in this release. Read on to see more. And, if you'd like to preview what's coming in next month’s release, check out our [Upcoming Releases](/direction/kickoff/) page as well as our [13.9 release kick-off video](https://www.youtube.com/watch?v=NYX-thYThCo).
