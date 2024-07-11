---
title: "Update about GitLab Pages"
author: David Smith
author_gitlab: dawsmith
author_twitter: dsmith8641
categories: engineering
featured: yes
image_title: '/images/blogimages/gitlab-gke-integration-cover.png'
description: "If you are using GitLab Pages with a custom domain, you may need to update your DNS."
tags: google, cloud native, GKE, kubernetes
ee_cta: false
twitter_text: "GitLab Pages Update"
---

After completing our move to Google Cloud Platform (GCP) on August 11, 2018, GitLab.com traffic has been served from our new infrastructure in GCP. For GitLab Pages users, we left a proxy in place in Azure to be backwards compatible for those Pages users who had an A record pointing to the IP Address at our Azure location.

We had planned a graceful window to let people have time to migrate their DNS records.  In our [July GCP move update](/blog/2018/07/19/gcp-move-update/), we referenced the new IP address at GCP that people should use.

In that transition, users should have moved their DNS records from 52.167.214.135 to 35.185.44.232.

This week, we started cleanup of parts of our now legacy Azure infrastructure. Unfortunately, that cleanup also caught up the Azure load balancer that had the old 52.167.214.135 IP address for the GitLab pages proxy. We quickly filed a ticket to see if we could reclaim the IP address, but could not be guaranteed that we could get it back when we rebuilt the load balancer. This post is to get the information out for those Pages users who have been affected by this change.

### What you need to know:

If you are using GitLab Pages with a custom domain AND you have an A record in DNS that points to the old Azure IP, you will need to update your DNS:

|from IP (old)|to IP (new)|
|----|----|
|52.167.214.135|35.185.44.232|

Additional information, including [setting up your custom domain with a CNAME record](https://docs.gitlab.com/ee/user/project/pages/custom_domains_ssl_tls_certification/index.html#dns-cname-record) is available in the [GitLab Pages Documentation](https://docs.gitlab.com/ee/user/project/pages/custom_domains_ssl_tls_certification/index.html#adding-your-custom-domain-to-gitlab-pages)

We apologize for the abrupt change, it was our intent to leave the proxy in place and give users another 30 or more days to do the transition.

