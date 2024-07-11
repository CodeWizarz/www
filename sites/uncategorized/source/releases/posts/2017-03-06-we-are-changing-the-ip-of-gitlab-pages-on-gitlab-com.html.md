---
title: "We are changing the IP of GitLab Pages on GitLab.com"
author: Marcia Ramos
author_gitlab: marcia
author_twitter: XMDRamos
categories: releases
image_title: '/images/blogimages/we-are-changing-the-ip-of-gitlab-pages-on-gitlab-com-cover.png'
twitter_image: '/images/tweets/pages-alert.png'
description: "Websites hosted on GitLab.com with GitLab Pages with custom root domains need to update their DNS A record"
---

**GitLab Pages' IP** on **GitLab.com** is changing from `104.208.235.32` to ~~`52.167.214.135`~~!
{:.alert .alert-webcast}

**Update**: As of August 2018, as a result of the GitLab.com migration to Google Cloud Platform,
the IP address for your Pages `A` record has changed to `35.185.44.232`. See our latest [GitLab Pages Update](/blog/2018/08/28/gitlab-pages-update/) post.

Learn which websites are affected by this change, which settings you'll have to update, and how much time you have to do it.

<!-- more -->

----

## What is changing?

We are changing the [IP address of **GitLab Pages** server on **GitLab.com**](https://gitlab.com/gitlab-com/marketing/issues/883) to `52.167.214.135`.

## Which websites will be affected?

Only websites hosted with GitLab Pages **on GitLab.com** set up with a **custom root domain**, such as `example.com`, which has a DNS `A` record pointing to `104.208.235.32`, will be affected.

## Which GitLab Pages websites will NOT be affected?

No other websites hosted with GitLab Pages will be affected, more specifically:

- On-premise GitLab will not be affected.
- GitLab.com websites with default Pages domains (`*.gitlab.io`) will not be affected.
- GitLab.com websites with custom subdomains, like `subdomain.example.com`, set up with DNS `CNAME` records will not be affected.

## What do I have to do?

If you have a [DNS `A` record](https://docs.gitlab.com/ee/user/project/pages/custom_domains_ssl_tls_certification/index.html#dns-a-record) pointing your domain to `104.208.235.32`, edit it to point to `52.167.214.135`. If you cannot edit it, delete it and create a new one.

## When will the old IP be deactivated?

**31 March 2017 at 23:59h UTC**.

### Can I change the DNS `A` record right now?

Yes, and we ask you to do so as soon as possible. Currently we have both IPs working but from 1 April 2017 only the new IP address will work.

### What happens if I don't do anything?

If you have a website hosted with GitLab Pages **on GitLab.com** set up with a **custom root domain** and don't update your DNS `A` record by the deadline, your website will be inaccessible from 1 April 2017.

## Why is this happening?

Due to recent GitLab.com infrastructure improvements a number of IP addresses, including the one used for GitLab Pages, had to change.

## Questions?

Please leave a comment below or in [this issue](https://gitlab.com/gitlab-com/marketing/issues/883) thread.
