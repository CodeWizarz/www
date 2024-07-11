---
layout: markdown_page
title: GitLab Cloud Licensing Overview
description: "On this page you can find more information about Cloud Licensing - the method GitLab uses to activate self-managed customer subscriptions."
---

### On this page
{:.no_toc}

{:toc}
- TOC

## What is Cloud Licensing? 

Cloud Licensing allows GitLab customers to activate paid subscription features on self-managed instances using an activation code, rather than managing license files and manually uploading them to instances. This licensing method was [first introduced in August 2021](/blog/2021/07/20/improved-billing-and-subscription-management/) and became the default activation method for Self Managed customers in July 2022. By activating through Cloud Licensing, a customer’s GitLab instance will [synchronize subscription data](https://docs.gitlab.com/ee/subscriptions/self_managed/#subscription-data-synchronization) daily with GitLab. 

These regular synchronizations of usage data enable GitLab to better support you as you grow, and provides you with a simpler and more efficient billing and subscription management experience for subscription overages reconciliation, mid-term add ons, and renewals.


### Why Cloud Licensing?

GitLab is moving away from license files so that we can more efficiently support you and your company's growth. Cloud Licensing provides:
1. **The flexibility to manage licenses on your time:** With the previous licensing method, GitLab customers had to work directly with a GitLab Sales team member to obtain additional license files for each year of a multi-year subscription, additional seats purchased or a subscription renewal. This manual process could cause slow downs and inefficiencies. With Cloud Licensing, all of these purchase types are automatically synced to your instance, without any action needed from you.
1. **The efficiency you’ve been waiting for:** Cloud Licensing is an important iteration to improve license efficiency for purchases, renewals, and add-ons. Cloud Licensing allows you to enable [Quarterly Subscription Reconciliation](https://docs.gitlab.com/ee/subscriptions/quarterly_reconciliation.html), which allows you to pay on a go-forward quarterly basis for overages, rather than paying in arrears for the full subscription term with our [legacy true-up process](https://docs.gitlab.com/ee/subscriptions/quarterly_reconciliation.html#quarterly-reconciliation-vs-annual-true-ups). Cloud Licensing also allows you to enable auto-renewal, removing the need for the manual renewal process.

### What Data Does GitLab Collect and Why? 

Cloud Licensing is made up of two parts:
1. **Activation Method:** A new activation method using a single activation code to synchronize license entitlements rather than multiple license keys.
1. **Subscription data synchronization:** Daily transmission of subscription data to GitLab.
 
The data transmitted is limited to what is necessary to administer a GitLab license and support future renewals, add ons, and seat reconciliation. The data does not include any intellectual property, source code, or user personal information except the name, company name, and email address of the administrator account associated with the subscription, which are all encrypted within the License Key. No fields can be excluded from what is transmitted. 

**For the exact list of data fields included in License Sync, please refer to our [Subscription Data documentation](https://docs.gitlab.com/ee/subscriptions/self_managed/#subscription-data).**

### How Can I Enable Cloud Licensing?

#### Customer Prerequisites and Availability

Cloud Licensing is available to all GitLab Self Managed customers – both those who work with GitLab directly, and those who work indirectly through a Channel or Alliances partner, regardless of payment or contract method. Cloud Licensing is not currently available for Education, Open Source, Startup, or Free Tier customers.

**To use Cloud Licensing, you must be on GitLab version 14.1 or higher and have an internet connection.** If you are not yet on version 14.1, you can [upgrade your instance](https://docs.gitlab.com/ee/update/) to take advantage of the benefits of Cloud Licensing. You may also be unable to use Cloud Licensing if your instance is blocked by a firewall. If you are unable to apply an activation code you received to your instance, please [contact our Support team](https://about.gitlab.com/support/) for troubleshooting or to receive a legacy license file.
 
#### Activating Cloud Licensing

If you purchase(d) a new or renewal GitLab Self Managed subscription after July 2022, you can access your Cloud License activation code in your initial purchase email or from the [Customers Portal](https://customers.gitlab.com/). You can review our documentation for further details on [how to activate your instance with an activation code](https://docs.gitlab.com/ee/administration/license.html). 

If you are an existing customer using a legacy license file, you can activate Cloud Licensing mid-term - no need to wait for a renewal! 
* If you purchased your subscription from GitLab directly, you can copy your activation code from the [Customers Portal](https://customers.gitlab.com/) and [apply it to your instance](https://docs.gitlab.com/ee/administration/license.html).
If you purchased your subscription through an authorized reseller, please submit a [new Support request](https://support.gitlab.com/hc/en-us/requests/new) and select the reason type 'Licensing and renewal problem' to receive your cloud activation code.

### Offline Cloud Licensing

#### What is an Offline Cloud License?

For customers with an offline or air-gapped instance **on GitLab version 15.0 or higher** who want to take advantage of the benefits of Cloud Licensing, an Offline Cloud License may be an option on an approval-only basis. Offline Cloud Licenses offer an alternative to online License Sync by requesting you to manually provide usage data to GitLab on a monthly basis. Offline Cloud Licenses can help with smoother renewals and add-ons by providing GitLab with insight into the current state of a subscription, but does not support automated syncs of additional purchases given the lack of internet connectivity. Additional license files will be required.

#### How do Offline Cloud Licenses Work?

If you have been approved for an Offline Cloud License, you will receive your license file via email. If you purchased from GitLab directly, you can also access your Offline license from the [Customers Portal](https://customers.gitlab.com/). 

Once you [upload your license file to your instance](https://docs.gitlab.com/ee/administration/license_file.html), you will receive monthly email reminders (sent to the account's `Sold To` contact) and in-app banners (visible to all instance admins) to [export your usage data](https://docs.gitlab.com/ee/subscriptions/self_managed/index.html#export-your-license-usage) and email it to `renewals-service@customers.gitlab.com`. Exported usage data files include the [same data fields](https://docs.gitlab.com/ee/subscriptions/self_managed/#subscription-data) as a Cloud License online sync and help GitLab to understand the current state of your subscription. When we receive this data, we automatically match against the file’s contents (not on the `From` email address) to ensure this data is stored correctly. Mime-types of `'application/octet-stream'`, `'text/csv'` and `'application/vnd.ms-excel'` are supported for shared usage files. 

The in-app reminder banners will appear until an admin completes the export of data, at which point they become dismissable and will not be displayed again until the following month. If usage data is not shared monthly while on an Offline Cloud License, GitLab will not have any insight into your current usage, which can complicate additional purchases and the renewal process. However, you will _not_ be at risk of any downgrades or other impacts to your instance.

If you are interested in Offline Cloud Licensing, please reach out to your account manager to understand if you may be a candidate.
 
### Additional Resources 

#### Questions?
* For more information on your eligiblity for Cloud Licensing or Offline Cloud licensing, please contact your sales representative or fill out [this form](https://about.gitlab.com/sales/). 
* For assistance on applying an activation code or license file, please [contact our Support team](https://about.gitlab.com/support/).

#### Related Documenation
* [How to activate your instance with a Cloud License activation code](https://docs.gitlab.com/ee/administration/license.html)
* [What data is included in Cloud or Offline shared usage data?](https://docs.gitlab.com/ee/subscriptions/self_managed/#subscription-data)
