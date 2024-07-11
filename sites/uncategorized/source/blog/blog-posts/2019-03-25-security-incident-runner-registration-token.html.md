---
title: "An update on project runner registration token exposed through issues quick actions vulnerability"
description: "How we responded to a vulnerability in quick actions for issues that can expose project runner registration tokens to unauthorized users."
categories: security
author: Kathy Wang
author_gitlab: kathyw
tags: security
postType: product
ee_cta: false
---

On Mar. 20 2019 we released a [critical security release](/releases/2019/03/20/critical-security-release-gitlab-11-dot-8-dot-3-released/) for a vulnerability in quick actions for issues that can expose project runner registration tokens to unauthorized users. This was originally reported to us on Mar. 14, 2019 through our public HackerOne program (identified by [jobert](https://hackerone.com/jobert)).

## Response and mitigation

In order to mitigate this issue, we developed and applied a patch on GitLab.com on Mar. 17, 2019, and expedited the release of a critical security fix to ensure that both ourselves, and our self-managed customers received a timely mitigation.

### Action required

On Mar. 24, 2019 we reset runner registration tokens for all projects hosted on GitLab.com. If you are a GitLab.com user, and have automation in place that relies on runner registration tokens, please [have the tokens reset following instructions from the official documentation](https://docs.gitlab.com/ee/ci/runners/#reset-the-runner-registration-token-for-a-project). If you do not have automation in place that relies on running registration tokens, no further action is required on your part.

### Results of investigation

We have performed an initial investigation and found no evidence to suggest that there has been any security compromise to any project as a result of this issue, but we will continue to investigate and explore ways to help better detect such issues moving forward.

In keeping with our [company value of transparency](/handbook/values/#transparency) we also believe in communicating about such incidents clearly and promptly. We apologize for the impact this issue may have caused to our users. GitLab takes securing your information and your data extremely seriously. We have significantly grown the size of our internal security team in the last six months, with further plans to grow in 2019 and beyond. We will learn from this incident as we continue to improve upon our security posture even further.

If you have any questions, please contact us via [support.gitlab.com](https://support.gitlab.com/).

*Updated on March 28, 2019*
We are modifying our previous recommendation for users who have automation in place that may have been impacted by the runner registration token reset. The paragraph should read as the following:

On Mar. 24, 2019 we reset runner registration tokens for all projects hosted on GitLab.com. If you are a GitLab.com user, and have automation in place that relies on runner registration tokens, please make sure that you update the automation script to use the new registration token. If you do not have automation in place that relies on running registration tokens, no further action is required on your part.
