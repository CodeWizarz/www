---
layout: markdown_page
title: Updates to paid tiers for improved billing and subscription management
description: "On this page you can view frequently asked questions for the billing and subscription management updates"
canonical_path: "/pricing/faq-improved-billing-and-subscription-management/"
---

# Frequently Asked Questions
{:.no_toc}

### On this page
{:.no_toc}

{:toc}
- TOC

## Overview

Q. **What is GitLab announcing?**

A. GitLab [announced](https://about.gitlab.com/blog/2021/07/20/improved-billing-and-subscription-management/) changes  to improve the billing and subscription management experience for customers. These changes and your [new subscription agreement](https://about.gitlab.com/terms/) will be applicable at your next renewal on or after August 1, 2021.

We announced 4 key changes:

*Changes applicable to both SaaS and self-managed customers*

- **Quarterly subscription reconciliation** - Users added during a quarter will only be charged for the remaining quarters of their subscription term as opposed to the full annual subscription fee(s) with annual true-ups - resulting in significant savings for add-on Users.

*Changes applicable to self-managed customers only*

- **Auto-renewals** - To make the renewal process more seamless for customers and more efficient for GitLab, similar to our SaaS subscriptions, all self managed subscriptions will now be set to auto-renew, with an option to manually cancel in the [GitLab Customers Portal](http://customers.gitlab.com) anytime up to thirty (30) days before renewal.

- **Cloud licensing** - Self-managed customers will be able to activate their GitLab instances via an activation code and manage their GitLab licenses using the [GitLab Customers Portal](http://customers.gitlab.com). License data such as subscription tier, active users, guest users and inactive users will be synced with GitLab daily to facilitate quarterly subscription reconciliation and auto-renewals.

- **Operational Data** - To enable consistent [customer success services](https://about.gitlab.com/services/customer-success-services/) for paying customers, self-managed instances will be required to share aggregated operational data that indicates the adoption of product use cases or features. Like [SaaS service usage data](https://about.gitlab.com/handbook/legal/privacy/customer-product-usage-information/#saas-gitlabcom-software), operational data for self-managed instances such as number of projects, issues, pipelines, and merge requests will be aggregated for each self-managed instance and will not contain any personal information or project-specific information. This operational data will be used by customer success services to help customers understand their usage, identify adoption issues, provide use case enablement, and recommend best practices for a successful customer journey. Please see our [service usage data page](https://about.gitlab.com/handbook/legal/privacy/customer-product-usage-information/) for the full list of usage data and its use.


Q. **What is the effective date of these changes?**

A. These changes are applicable to customers purchasing or renewing a GitLab subscription on or after August 1, 2021. For existing customers, these changes are applicable at their next renewal. At purchase or renewal -

SaaS customers can benefit from the changes at their next renewal on or after **August 1, 2021**
Self-managed customers can benefit from the changes by installing/upgrading to version 14.1. Existing customers can upgrade at their own pace - GitLab will support the current license management process on 13.x versions and 14.x versions, until further notice.

Q. **Which customers are these changes applicable to?**

A. These changes are only applicable to customers using any of GitLab’s [paid tiers](https://about.gitlab.com/pricing/). For existing customers, these changes will be applicable at your next renewal after the effective date.

Quarterly subscription reconciliation will be applicable for both SaaS and self-managed customers.
Auto-renewals, cloud licensing and operational data collection will be applicable for self-managed customers. To benefit from these changes, self-managed customers will need to be on version 14.1 (releasing on July 22, 2021)

The changes are not applicable to
- Free tier users and users of our community programs (GitLab for [Education](https://about.gitlab.com/solutions/education/), [Open Source](https://about.gitlab.com/solutions/open-source/) and [Startups](https://about.gitlab.com/solutions/startups/)).
- For customers purchasing GitLab via channel partners / resellers, quarterly subscription reconciliation and auto-renewals will not be available at launch - but will be made available subsequently.

Q. **I don’t want to update to 14.1. Can I still benefit from these changes?**

A. No, self-managed customers will need to be on version 14.1 (releasing on July 22, 2021) which enables cloud licensing and will need to activate the self-managed instance using the activation code. This is required to take advantage of quarterly subscription reconciliation, auto-renewals and cloud licensing.

## Cloud licensing

Q. **What is changing related to cloud licensing?**

A. Cloud Licensing is a new and easier way to manage licenses for self-managed subscription plans.  It introduces two major capabilities.

- **Activation** - is the ability to unlock plan features and activate a self-managed instance via an activation code. Previously, customers needed to manage license files and manually upload them to their instance.
- **License sync** - is the ability for a self-managed instance to sync subscription data between itself and GitLab. Previously, an instance would not update automatically to any subscription changes including add ons or renewals, requiring manual generation of new license files

These capabilities make activation, provisioning, subscription reconciliation and renewal seamless for customers.

Q. **Which customers are these changes applicable to?**

A. Self-managed customers running version 14.1 on or after the effective date.

Q. **How does Cloud licensing work?**

A. Customers will receive a confirmation email with the activation code upon purchase.  By logging into the Admin Area of the customer's GitLab instance, the customer can then use the code to activate the instance.  Once the instance is activated, a nightly job will generate a payload that sends the number of active users, tier, etc., back to GitLab. This data will be used to enable quarterly subscription reconciliation and auto-renewals, and to improve license management (described in subsequent sections).

Existing customers can upgrade at their own pace - GitLab will support the current license management process on 13.x versions and 14.x versions until further notice.

Q. **My GitLab instance is behind a closed network. How do I make cloud licensing work?**

A. We understand that you may be unable to automatically share required license data to GitLab due to network limitations (e.g. air-gapped instances, restrictive firewalling, etc.).

If your organization policies allow you to add an IP or domain to your allow list as per [these instructions](https://docs.gitlab.com/ee/subscriptions/self_managed/#troubleshooting-cloud-licensing-sync), you can still share license data to GitLab.

If that is not an option, for now, you will need to continue to use the annual true-up model. We are investigating ways we can allow for manual submission of required license data without needing an active internet connection. When available, we’ll update any affected customers.


## Quarterly Subscription Reconciliation

Q. **What is changing with true-ups?**

A. Annual true-ups were confusing and frustrating for customers. With quarterly subscription reconciliation, users added during a quarter will only be charged for the remaining quarters of their subscription term as opposed to the full annual subscription fee(s) with annual true-ups. Customers stand to gain substantial savings for add-on users as there is no retroactive charge. For example:

| Quarter in which users are added | Payment period with quarterly subscription reconciliation | Savings per add-on user |
|----------------------------------|-----------------------------------------------------------|-------------------------|
| First                            | Remaining three quarters only                             | 25%                     |
| Second                           | Remaining two quarters only                               | 50%                     |
| Third                            | Remaining one quarter only                                | 75%                     |
| Fourth                           | Next subscription period only                             | 100%                    |


Under no scenario will the license cost for add-on users in the quarterly subscription reconciliation model be higher than in the annual true-up model.

In the current annual true-up model, you pay for the full subscription period in which these users were added. For example, if your subscription term starts Sep 1, 2021 and ends Aug 31, 2022 and you add 100 users on May 15, 2022 - you pay for those 100 additional users for the full subscription period even though the users were only added in the third quarter of your subscription period.

In the quarterly co-terms model, new users are accounted for after the quarter in which they are added. In the same example as before, if your subscription term starts Sep 1, 2021 and ends Aug 31, 2022 and you add 100 users on May 15, 2022 (third quarter), you will now pay for those 100 additional users only starting from Jun 1, 2022, the fourth quarter of your term.

Q. **Will quarterly subscription reconciliation apply if I reduce the number of users in a subsequent quarter?**

If you increase the number of users in a specific quarter, with that overage reconciled and paid for, and then reduce the number of users in the next quarter, you will not be subject to quarterly subscription reconciliation. The number of billed users will be same as the previous quarter.

For example, your subscription term starts Sep 1, 2021 and ends Aug 31, 2022. If you add 100 seats on October 15, 2021, you will pay for the additional 100 seats from the quarter starting Dec 1, 2021. If you remove 25 seats on Jan 15, 2022, you will not have any overage, and therefore no quarterly reconciliation. The number of billed users for the quarter starting Mar 1, 2022 will be the same as the previous quarter (i.e., 100)

Q. **Will quarterly subscription reconciliation also apply if I reduce the number of users below the number of users in my subscription?**

A. Quarterly subscription reconciliation is only applicable for users added above the number of users in your subscription. It does not apply to the base subscription user count.

For example, if you signed up for a subscription for 100 users and during the quarter you only used 75 seats, there is no reduction in your annual subscription amount.

Q. **How does GitLab calculate the number of additional users in the quarter?**

A. With Cloud Licensing on, GitLab will receive a daily update of how many seats are currently in use. At the end of the quarter, we will use the highest daily user count and bill you for any additional seats beyond your original subscription.

Q. **What is the per user pricing that will be used for the additional users?**

A. Any additional users will be charged at the effective per user price on your current subscription.

Q. **Will I be notified of my overages for the quarter?**

A. Yes, an email notification will be sent to your subscription billing contact within 3 days of your quarterly reconciliation.

Q. **Which customers are these changes applicable to?**

A. These changes are applicable to all new and existing SaaS and self-managed customers.

For existing customers, these changes will be applicable at your next renewal on or after the effective date. For new customers, these changes will be applicable when you subscribe to GitLab after the effective date.
.

These changes are not yet available to customers who purchase GitLab through a reseller or channel partner, but will be made available subsequently. Please contact your reseller or channel partner and GitLab channel manager to benefit from these updates.

Q. **This is beneficial for me. Can I take advantage of this immediately?**

A. Existing SaaS and self-managed customers can take advantage of these changes at their next renewal after the effective date. Self-managed customers will need to have cloud licensing enabled and be on version 14.1+. If you would like to avail these changes before your renewal, please reach out to your sales representative for more information.

In a future release, we will make the ability to avail cloud licensing before your renewal self-service - details of which will be announced when available.

Q. **My organization is not set up for quarterly subscription reconciliation. Can I opt out?**

A. Please contact your Gitlab sales representative or GitLab Support to assist you with this.

Q. **How does quarterly subscription reconciliation work when I pay via credit card?**

A. You will receive an email within 3 days of your quarterly reconciliation date with details of the reconciled seats. Your credit card will be charged within 10 days of the quarterly boundary of your renewal date with the reconciled amount for additional seats added during the previous quarter.

For example, if your subscription has 25 users, your term is Sep 1, 2021 to Aug 31, 2022 and you add 15 users on October 15, 2021, then:
- Around Dec 3, 2021, you will receive an email informing you that you will be billed for 15 additional seats
- Around Dec 10, 2021, your credit card will be charged for the 15 additional seats and your contract will be amended to 40 users.
- If credit card payment fails, you will be reverted to annual true-ups for your subscription term, as stated in our [terms](https://about.gitlab.com/terms/).

Q. **How does quarterly subscription reconciliation work when I do not pay via credit card?**

A. You will receive an email within 3 days after your quarterly reconciliation date with details of the reconciled seats. An invoice will be generated and emailed to your billing contact within 10 days of the quarterly boundary of your renewal date with the reconciled amount for additional seats added during the previous quarter.

For example, if your subscription has 25 users, your term is Sep 1, 2021 to Aug 31, 2022 and you add 15 users on October 15, 2021, then:
- Around Dec 3, 2021, you will receive an email informing you that you will be billed for 15 additional seats
- Around Dec 10, 2021, you will receive an invoice for the 15 additional seats and your contract will be amended to 40 users.
- The payment of the invoice will follow the GitLab payment [terms and conditions](https://about.gitlab.com/terms/)

## Auto-renewals

Q. **What is changing with auto-renewals?**

A. Subscriptions on GitLab SaaS are already on auto-renewal. This has made the renewal process more seamless for customers and more efficient for GitLab.   After their next renewal, all subscriptions for self-managed customers will be set to auto-renew, with an option to manually cancel in the [GitLab Customers Portal](http://customers.gitlab.com) anytime up to thirty (30) days before renewal.

Q. **How do I cancel auto-renewal?**

A. You can cancel auto-renewal a minimum of 30 days prior to your renewal date. To do so, either select the “Cancel subscription” button in the [GitLab Customers Portal](http://customers.gitlab.com), or reach out to your GitLab sales representative to provide notice.

Q. **Which customers are these changes applicable to?**

A. These changes are applicable to all new and existing SaaS and self-managed customers. For existing customers, these changes will be applicable at your next renewal after the effective date.

These changes are not yet available to customers who purchase GitLab through a reseller or channel partner, but will be made available subsequently. Please contact your reseller or channel partner and GitLab channel manager to benefit from these updates.

Q. **What will be my per user price while auto-renewing?**

A. Auto-renewal will be at the per user list price as documented on our [pricing page](https://about.gitlab.com/pricing/).

Q. **How many users will I be billed for during auto-renewal?**

A. You will be billed for the total number of active users on the date of renewal.

For example, if your maximum number of users during the 4th quarter of your subscription is 120 but on the last date of the quarter you have 103 active users, you will auto-renew for 103 users.

Q. **I don’t pay using my credit card. How does auto-renewal work for me?**

A. Auto-renewal is a terms-of-use change and not a change to your payment methods. If you're a customer without a credit card on file, GitLab will generate an invoice for your auto renewal. You can still process your renewal payment via GitLab sales or channel partner or distributor of GitLab. Customers that require purchase orders will continue to process their renewal via GitLab sales or a channel partner or distributor of GitLab.

Q. **What happens if I forget to cancel auto-renew and I don’t want to renew?**

A. You can cancel auto-renewal a minimum of 30 days prior to your renewal date. Non-payment of your subscription fees will follow the termination terms as per our [subscription agreement](https://about.gitlab.com/handbook/legal/subscription-agreement/#4-term-and-termination).

## Operational Data

Q. **What is changing with Operational Data?**

A. To enable consistent [customer success services](https://about.gitlab.com/services/customer-success-services/) for paying customers, self-managed instances will be required to share aggregated operational data that indicates the adoption of product use cases or features. Operational data for self-managed instances such as number of projects, issues, pipelines, and merge requests will be aggregated for each self-managed instance and will not contain any individual user’s personal information or project-specific information. This operational data will be used by customer success services to help customers understand their usage, identify adoption issues, provide use case enablement, and recommend best practices for a successful customer journey. Please see our [service usage data page](https://about.gitlab.com/handbook/legal/privacy/customer-product-usage-information/) for the full list of usage data and its use.

Q. **What can I expect from customer success services?**

A. Please refer to the [customer success services](https://about.gitlab.com/services/customer-success-services/) page for details on the service offering.

Q. **What data is collected as operational data?**

A. There are two categories of data collected:

| Category                    | Why it’s important                                                                                                                                           | Status                                           |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| Operational Data            | Data essential to operate the product, to aid primary product improvement use cases and provide proactive support to customers with self-managed instances.  | Always on by default                             |
| Optional product usage data | Data to aid secondary product improvement use cases                                                                                                          | Turned on by default. Can be [disabled](https://docs.gitlab.com/ee/development/service_ping/#disable-service-ping-using-the-ui) by customer |

Previously, data was not classified in these categories.

With this change, the license data and operational data cannot be turned off by the customer without a contract change. Please contact your GitLab Sales Representative for assistance.

Q. **Which customers are these changes applicable to?**

A. These changes are applicable to all new and existing paid tier self-managed customers. Operational data for SaaS customers is already available on GitLab SaaS.

For existing customers, these changes will be applicable at your next renewal on or after the effective date. For new customers, these changes will be applicable when you subscribe to GitLab after the effective date.

Q. **What is classified as operational data?**

A. Any data necessary to operate the product is classified as operational data. A sample list of the data classification is [here](https://about.gitlab.com/handbook/legal/privacy/customer-product-usage-information/).

Q. **Is GitLab going to share this data with 3rd party vendors?**

A. No, this operational data will be used by customer success services to help you understand your usage, identify adoption issues, provide use case enablement, and recommend best practices for a successful customer journey.

Q. **Will this replace usage ping?**

A. No, operational and optional data defines the “what” we will collect and usage ping defines the “how” we will collect these metrics. The metrics collected in usage ping will be classified in the categories defined above.

Q. **My GitLab instance is behind a closed network. How can I share this data?**

A. We understand that you may be unable to automatically share required license data to GitLab due to network limitations (e.g. air-gapped instances, restrictive firewalling, etc).

If your organization policies allow you to add an IP or domain to your allow list as per [these instructions](https://docs.gitlab.com/ee/subscriptions/self_managed/#troubleshooting-cloud-licensing-sync), you can still share license data to GitLab.

If that is not an option, for now, you will need to continue to use the annual true-up model. We are investigating ways we can allow for manual submission of required license data without needing an active internet connection. When we have those plans we’ll update any affected customers.

Q. **I don’t want to share my data for privacy reasons. Can I opt out?**

A. GitLab does not share this data externally and this data will be used to enhance your product and support experience. However, we understand your concerns. Please contact your GitLab Sales representative or GitLab support who will guide you through the next steps.

Q. **How does Operational Data comply with GitLab’s Privacy Policy?**

A. There is no personal information or project specific information collected from self-managed and/or SaaS customers in the Operational Data data set, therefore the data collection is in compliance with the [GitLab Privacy Policy](https://about.gitlab.com/privacy/#information-about-your-use-of-the-services-we-collect-automatically).


## More information

To address your questions and feedback, we have created a [space in the GitLab Community Forum](https://forum.gitlab.com/t/updates-to-paid-tiers-for-improved-billing-and-subscription-management/) that is actively monitored by GitLab Team members involved with this change.

If you have more questions or need clarifications, please contact your GitLab Sales Representative or [GitLab Support](https://support.gitlab.com/hc/en-us/requests/new).
