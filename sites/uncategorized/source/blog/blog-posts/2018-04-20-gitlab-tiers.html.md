---
title: "New names for GitLab self-managed pricing tiers"
author: William Chia
author_gitlab: williamchia
author_twitter: thewilliamchia
categories: company
image_title: '/images/blogimages/gitlab-tiers-cover.png'
twitter_image: '/images/tweets/gitlab-tiers.png'
description: "Understand GitLab's pricing tiers and know which features your subscription gives you access to."
ee_cta: false
tags: inside GitLab, features
---

_Note: We've continued to iterate on our platform and pricing model since this blog post was published in 2018. To see what's new (including everything from security and container-focused capabilities to guest users), check out our [platform](https://about.gitlab.com/platform/), [pricing](https://about.gitlab.com/pricing/), and [why GitLab](https://about.gitlab.com/why-gitlab/) pages._

At GitLab, [iteration is one of our ore values](/handbook/values/#iteration). We’ve recently iterated on the names of our self-managed pricing tiers, so [Marcia](/company/team/#XMDRamos) and I got together and wrote this post
to catch you up on the current options. We’ll explain each tier, and share how to figure out
which features your subscription gives you access to.

- [GitLab deployment options](#gitlab-deployment-options)
- [GitLab self-hosted](#gitlab-self-managed)
- [GitLab.com](#gitlabcom)
- [Repository architecture](#repository-architecture)
- [Subscription model](#subscription-model)
- [Examples of use cases](#examples)

## GitLab deployment options

To use GitLab, you have two options:

- **GitLab self-managed**: Install, administer, and maintain your own GitLab self-managed instance.
- **GitLab.com**: GitLab's SaaS offering. You don't need to install anything to use GitLab.com,
you only need to [sign up](https://gitlab.com/users/sign_in) and start using GitLab
straight away.

### GitLab self-managed

With GitLab self-managed, you deploy your own GitLab instance on-premises or in the cloud. From
bare metal to Kubernetes, you can [install GitLab almost
anywhere](/install/). GitLab self-managed has both [free
and paid options](/pricing/):
**Core**, **Starter**, **Premium**, and **Ultimate**.

You can see a full list of features in each self-managed tier on the [self-managed feature
comparison](/pricing/feature-comparison/) page. For more details on storage amounts and CI/CD minutes per month, see our [pricing page](https://about.gitlab.com/pricing/).

### GitLab.com

GitLab.com is hosted, managed, and administered by GitLab, Inc., with
[free and paid options](/pricing/) for individuals
and teams: **Free**, **Bronze**, **Silver**, and **Gold**.

To support the open source community and encourage the development of
open source projects, GitLab grants access to **Gold** features
for all GitLab.com **public** projects, regardless of the subscription.

You can see a full list of features in each GitLab.com tier on the [GitLab.com feature
comparison](/pricing/feature-comparison/) page.

### Repository architecture

We develop GitLab from two repositories, one for GitLab Community Edition (CE)
and another for GitLab Enterprise Edition (EE):

- [GitLab CE](https://gitlab.com/gitlab-org/gitlab-ce/): open source code, [MIT-based
license](https://gitlab.com/gitlab-org/gitlab-ce/blob/master/LICENSE), from which we deliver
GitLab CE packages.
- [GitLab EE](https://gitlab.com/gitlab-org/gitlab-ee/): open core code, [proprietary
license](https://gitlab.com/gitlab-org/gitlab-ee/blob/master/LICENSE), from which we deliver
GitLab EE packages.

GitLab EE grants you access to features by installing a license key. You
can also install GitLab EE and run it for free without a license key which will give you
access to the same features as CE. This makes it easier to upgrade later on.

Visit the CE vs EE page to see [which GitLab installation method to
choose](/install/ce-or-ee/).

### Subscription model

GitLab Core contains all of the open source features of GitLab. Whether you are running GitLab
CE or GitLab EE without a license key, you'll get access to the same Core features. The
proprietary features of EE are unlocked by purchasing a license key.

Tiers are additive:
- Starter contains all the features of Core
- Premium contains all the features of Starter and Core
- Ultimate contains all of the features of Premium, Starter, and Core

![GitLab Core, Starter, Premium, Ultimate](/images/blogimages/gitlab-tiers-repos-and-tiers.jpg)

### Examples

- Consider a user of [GitLab Premium](/pricing/premium/) who wants to contribute to a given feature present in GitLab Core, e.g. Issue Boards. The code is submitted to the CE repo, therefore, it's open source code. The master branch of GitLab CE is then merged into GitLab EE. The CE code will be available to this Premium user in the next release.
- Consider a user of GitLab Premium who wants to contribute to a given feature present only in Premium, e.g., Geo. The code is submitted directly to the EE repo, therefore, it's proprietary. The same is valid for Starter and Ultimate features.

### Use cases

#### GitLab self-managed use cases

- I installed GitLab CE: I’m a Core user. I have access to Core features. The software I’m using is 100 percent open source.
- I installed GitLab EE: the software I’m using is open core- it includes both open source and proprietary code.
  - I don't have a subscription: I have access to Core features.
  - I have a Starter subscription: I have access to Starter features.
  - I have a GitLab Premium subscription: I have access to Premium features.
  - I have a GitLab Ultimate subscription: I have access to Ultimate features.
- I have a trial installation: I installed GitLab EE, and I’m an Ultimate user during the valid period of the trial. If the trial period expires and I don’t get a paid subscription (Starter, Premium, or Ultimate), I’ll become a Core user, with access to Core features.

#### GitLab.com use cases

- I use GitLab.com, a huge installation of GitLab EE. I’m using proprietary software.
- I don’t have access to administration features as GitLab.com is administered by GitLab, Inc.
- _Subscriptions_:
  - I have a Bronze subscription: my private projects get access to Bronze features. My public projects get access to Gold features.
  - I have a Silver subscription: my private projects get access to Silver features. My public projects get access to Gold features.
  - I have a Gold subscription: my private projects get access to Gold features, as well as my public projects.
  - I don’t have any paid subscriptions: I’m a Free GitLab.com user:
      - I have access to Free features for private projects.
      - I have access to Gold features for public projects.

_Questions, comments? Let us know what you think below._
