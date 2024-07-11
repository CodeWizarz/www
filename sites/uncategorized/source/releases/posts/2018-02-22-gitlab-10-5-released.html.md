---
release_number: "10.5"
title: "GitLab 10.5 released with Let's Encrypt integration, Gemnasium dependency checks, and CI/CD external files"
author: Fabio Busatto
author_gitlab: bikebilly
author_twitter:
image_title: '/images/10_5/10_5-cover-image.jpg'
description: "GitLab 10.5 released with Let's Encrypt integration, CI/CD external files, Gemnasium dependency checks, External Policy Classification Control, and much more!"
twitter_image: '/images/tweets/gitlab-10-5-released.png'
categories: releases
layout: release
tags: features, releases
---

In this month’s release of GitLab 10.5 we’ve added capabilities to encrypt GitLab traffic easily, improve application security, scaling CI/CD management, and so much more.

<!-- more -->

## Secure GitLab deployments in less time
{:.intro-header}

HTTPS is a pillar of internet security and a must-have if your GitLab instance is exposed to the public internet. It provides two key benefits. First, traffic is encrypted to and from the server, protecting credentials and other sensitive data from potential eavesdropping. Second, it allows users to verify the site identity. Without a verified identity it's possible for users to log into the wrong site. These capabilities are particularly important for mobile and remote users, who often use public unsecured Wi-Fi increasing the risk of snooping or interacting with a malicious site.

Although HTTPS provides great security, setting up HTTPS and requesting certificates can be a hassle involving credit cards and key management.

[Let’s Encrypt](https://letsencrypt.org/) is a free, automated, and open certificate authority. With GitLab 10.5 we’ve added [Let’s Encrypt integration](#instant-ssl-with-lets-encrypt-for-gitlab), allowing you to enable instant SSL certificates with a single option. Enabling Let’s Encrypt on your GitLab instance ensures traffic to your GitLab instance is encrypted and the identity of your site is verified. The Let’s Encrypt integration is available on both paid and open source GitLab.

## Scale your pipeline management
{:.intro-header}

Today, we’re releasing a simple feature with powerful implications.

Running DevOps in an enterprise environment comes with some unique challenges. For many of our largest customers, the DevOps team is responsible for providing CI/CD pipelines to a large number of development teams throughout the organization. Previously, this was a painful process to manage. There wasn’t a scalable way to distribute reusable pipeline configuration which meant code needed to be manually copied between multiple `.gitlab-ci.yml` files in multiple projects. This was a labor-intensive and error-prone process. Additionally, it didn't provide adequate controls to ensure testing and deployment is consistently enforced for each repo.

Starting with 10.5, you can now [include external files in CI/CD pipeline definition](#include-external-files-in-cicd-pipeline-definition). Included files can be either local (contained in the same repo) or remote (accessible via HTTP/HTTPS).  Including local files allows a large and complex `.gitlab-ci.yml` to be broken up in to modular chunks that are easier to maintain. Remote files allow these modular chunks to be distributed across thousands (or potentially millions) of repositories. Now there’s a simple, consistent, and maintainable way to distribute pipeline configuration.

## Better security testing with Gemnasium
{:.intro-header}

Less than a month ago, [GitLab acquired Gemnasium](/press/releases/2018-01-30-gemnasium-acquisition.html). As promised, we haven’t wasted any time in bringing Gemnasium’s advanced dependency-checking functionality to GitLab users. Often, when companies make acquisitions, they tend to create bolt-on additions or package functionality as separate offerings. GitLab’s vision is to provide a [single application architecture](/direction/#single-application) so that dev, QA, security, and ops can work concurrently off the same data in the same interface. In this spirit we’ve [integrated Gemnasium’s technology](#gemnasium-dependency-checks) seamlessly into GitLab CI/CD, supercharging security testing.

Thanks to advanced algorithms and a larger vulnerability database, GitLab now provides more complete results in JavaScript, Ruby, and Python. We’ve also added PHP and Java support so you have five languages total.

## See all the features
{:.intro-header}

This post highlights 26 enhancements (18 of which are available in open source GitLab!) For the full list of improvements see the [changelog](#changelog). Or read on to learn more about all of the key features shipped in 10.5!
