---
title: "GitLab Pages Security Issue Notification"
description: "Learn more about GitLab Pages Security Issue Notification for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2018/02/05/gitlab-pages-custom-domain-validation/"
date: 2018-02-05
author: James Ritchey
author_gitlab: jritchey
categories: releases
tags: security
---

## Issue Summary

When a user adds a [custom domain] to their Pages site, no validation was being performed to ensure the domain was owned by that user. This issue allows an attacker to discover DNS records already pointing to the GitLab Page IP address which haven't been claimed and potentially hijack them. This issue impacts all users who have created and then deleted custom domains using GitLab Pages, but still have the DNS records active.

## Customer Remediation Steps

Our customers should check if they are using the GitLab Pages service with a custom domain and review their DNS records which point to the GitLab Pages IP `52.167.214.135`.

If you notice any of your DNS records pointing to that IP address and you're no longer using or intending to use the Gitlab Pages service, please remove those specific DNS records.

If you are intending to use the GitLab Pages service and notice that your custom domain has already been claimed or "hijacked", please contact us at security@gitlab.com.

## GitLab Remediation Strategy

We've currently disabled the feature to add custom domains until we've deployed the patch. In the meantime, the GitLab team is working to provide a more complete [validation] of custom domains in the GitLab Pages service as soon as possible.

Our mitigation strategy will consist of implementing domain verification mechanisms on all new and existing GitLab Pages domains, utilizing checks on customer DNS TXT records. This mechanism will be detailed in GitLab Pages documentation when implemented.

There will be a transition plan for current customers once the domain verification mechanisms are active. Stay tuned for further details.

#### Update (2018-02-07 10:00PM UTC)

The [issue] referenced above is currently confidential and will be made public after the fix is implemented in 10.5.

#### Update (2018-02-14 7:00PM UTC)

The domain verification mechanism will be deployed by the 20th of February in the 10.4 security release. The feature to add custom domains will be re-enabled, and once again users will be able to configure domains and update TLS certificates.

#### Update (2018-02-21 12:00AM UTC)

The domain verification mechanism rollout will be phased, starting with GitLab.com, beginning on 2/21. We expect that rollout will be completed end of week 2/26, based on current projections.

[custom domain]: https://docs.gitlab.com/ee/user/project/pages/custom_domains_ssl_tls_certification/index.html#adding-your-custom-domain-to-gitlab-pages
[validation]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29497
[issue]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29497
