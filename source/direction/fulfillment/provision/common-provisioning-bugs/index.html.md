---
layout: markdown_page
title: "Common Provisioning Bugs"
description: "The Provision team at GitLab focuses on providing a seamless activation experience for customers."
---

## On this page
{:.no_toc .hidden-md .hidden-lg}

- TOC
{:toc}

<link rel="stylesheet" type="text/css" href="/stylesheets/biztech.css" />

## Overview

This page will outline top provisioning bugs and when they were resolved or are expected to be fixed. You can also refer to our `group::provision` [bug board](https://gitlab.com/groups/gitlab-org/-/boards/5164901?label_name[]=group%3A%3Aprovision&label_name[]=type%3A%3Abug) for a quick view of planned bug work by milestone.

For more information about `group::provision` and our long-term team direction, please refer to our [team direction page](https://about.gitlab.com/direction/fulfillment/provision/).

### Why do we need this page?
The provisioning process touches every customer who purchases or trials a GitLab subscription. This process has become complex over time as GitLab has scaled. Unfortunately, this has resulted in a significant number of process bugs. Our team has published this page as a resource for both customers and internal stakeholders interested in the status of these bugs.


### Resolved Bugs

| SM or SaaS? |  Category    | Description of Bug         | Related Issue Link(s) |  Version Resolved |
|---------|--------------|----------|--------------------------------|--------------------|
| SaaS | Subscription Cancellations | Scheduled subscription cancellation downgrades namespace directly. | [6153](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/6153) | 16.2 |
| SaaS | Deprovisioning | SaaS subscriptions can be deprovisioned if within grace period with add-on refunded. | [4777](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4777) | 16.0 |
| Self Managed | Cloud Licensing | Multi year cloud license was generated with conflicting trueup_from/to and previous_user_count values. | [5520](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5520) |  16.0 |
| Self Managed | Cloud Licensing | Self Managed instance generating new cloud license each sync. | [5041](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5041)  | 15.10 |
| Self Managed | Cloud Licensing | Self Managed instance activations created even when the activation fails. | [5232](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5232) | 15.10 |
| Self Managed | Legacy Licenses | Licenses generated during years 2 or 3 of a MY legacy subscription have expired dates. | [3421](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3421) |  15.10 |
| Self Managed | Cloud Licensing | Cloud License activation failure when future dated renewal and past subscription trueups. | [4874](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4874) | 15.10 |
| Both | True-Ups | True-up validation fails when no previous_users_count is present. | [361345](https://gitlab.com/gitlab-org/gitlab/-/issues/361345) |  15.9 |
| Self Managed | Cloud Licensing | CustomersDot Admin Cloud Activations tab lists multiple activation codes when zuora_id is blank. | [4580](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4580) |  15.9 |
| SaaS | Add-Ons Provisioning | Gitlab group storage quota is overwritten by the last syncd Zuora subscription's storage. | [4687](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4687) | 15.8 |
| SaaS | SaaS Provisioning | SaaS subscriptions with multiple product line items do not provision seats correctly. | [3956](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3956) | 15.8 |
| Self Managed | Cloud Licensing | License sync does now work with IPv4. | [354839](https://gitlab.com/gitlab-org/gitlab/-/issues/354839) | 15.7 |
| Self Managed | Cloud Licensing  |  Multi-year subscription licenses have incorrect term dates (already expired license, 1-year only term). | [4815](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4815), [3421](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3421), [4816](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4816) | 15.7 |
| Self Managed | Offline Cloud Licensing | Some mime types are not supported when a customer emails their offline usage file. | [4812](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4812) | 15.6 |
| Self Managed | Cloud Licensing | Cloud license valid from dates show prior year's term after applying new subscription. | [3651](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3651) | 15.5 |
| Both | Banners | Subscription expiration alert is still shown after customer activates renewal subscription. | [372119](https://gitlab.com/gitlab-org/gitlab/-/issues/372119), [4507](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4507) | 15.5 |
| Self Managed | License Creation | Using Optional "Customer" field causes licenses to generate using customer portal data instead of details entered. | [3566](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3566) | 15.5 |
| Both | License Display | License overview shows 'Expired: Never' for expired licenses. | [372230](https://gitlab.com/gitlab-org/gitlab/-/issues/372230) | 15.5 |
| Self Managed | Cloud Licensing | Activation error messages do not indicate the problem accurately. | [355794](https://gitlab.com/gitlab-org/gitlab/-/issues/355794) | 15.4 |
| Self Managed | Cloud Licensing | Some customers are not receiving activation codes in welcome mailer. | [4741](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4741), [4599](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/4599) | 15.4 |
|  Both       | User Count | Previous user count is incorrect when changing products and seat count during renewal. | [3346](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/3346) | 15.3 |
|  Both       | Provisioning | After applying a license, a restart is required | [377489](https://gitlab.com/gitlab-org/gitlab/-/issues/377489),[388063](https://gitlab.com/gitlab-org/gitlab/-/issues/388063) | 15.4.3 |



### Open Bugs

| SM or SaaS? | Category    | Description of Bug         | Related Issue Link(s) |  Priority | Expected Release |
|---------------|------------|--------------------------------|--------------------|--------------|-------------|
| SaaS | Add-on Provisioning | Purchased CI Minutes are not synced to instance. | [6340](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/6340) | `severity::2` | 16.2 |
| SaaS | Contract Resets | Add buffer to SaaS subscription cancellations in CustomersDot. | [5733](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5733)) | `severity::3` | 16.3 |
| SaaS | Deprovisioning | Paid features are not deprovisioned upon transfer to subgroup. | [351780](https://gitlab.com/gitlab-org/gitlab/-/issues/351780) | `severity::4` | 16.3 |
| Self Managed | Cloud Licensing | Cloud License issued as premium one day, Starter the next. | [5105](https://gitlab.com/gitlab-org/customers-gitlab-com/-/issues/5105) | `severity::4` | 16.5 |


