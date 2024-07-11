---
layout: markdown_page
title: Efficient GitLab SaaS Free tier FAQ
description: "On this page you can view frequently asked questions for changes related to Free tier efficiency"
canonical_path: "/pricing/faq-efficient-free-tier/"
---

# Frequently Asked Questions - GitLab SaaS Free Tier

{:.no_toc}

### On this page

{:.no_toc}

{:toc}

- TOC

## Effective Date of the changes

#### Q: What is the effective date of the changes?
{:.no_toc}

We intend to roll out the application of user and storage limits independently and gradually. Storage limits will not be applied before [storage management improvements](https://gitlab.com/gitlab-org/gitlab/-/issues/375296) are available.

Top-level private groups on the Free tier of GitLab SaaS created on/after 2022-12-28 are subject to the application of user limits. For top-level private groups on the Free tier of GitLab SaaS created before 2022-12-28 we will show in-app notifications for user limits to affected top-level private groups, including any subgroups and projects, prior to the limits being applied. Top-level private groups that are already above the limit will see the in-app notifications at least 60 days ahead of the limits being applied. Top-level private groups that go above the limit during the period when the in-app notifications are showing will see them as soon as they go above the threshold. Note personal namespaces are public and therefore excluded from user limit notification and applying the 5-user limit.

For storage limits we will show in-app notifications to affected top-level groups and personal namespaces, including any subgroups and projects, prior to the limits being applied. Namespaces that are already above the storage limit will see the in-app notifications at least 60 days ahead of applying the storage limits. Namespaces that go above the limit during the period when the in-app notifications are showing will see them as soon as they go above the threshold.

## What does namespace in the context of user limits and storage limits refer to?

In GitLab, a [namespace](https://docs.gitlab.com/ee/user/namespace/) is a unique name for a personal namespace, a group, or subgroup, under which a project can be created. User limits and storage limits are implemented at the **top-level group or personal namespace** where applicable.

## Storage limits on GitLab SaaS Free Tier

#### Q: What is changing with storage?
{:.no_toc}

We are introducing a storage limit of 5GB for top-level groups and personal namespaces to the [GitLab SaaS Free tier](/pricing/).

| GitLab SaaS Tier                    | Free |
|-------------------------------------|:----:|
| Storage (in GB per top-level group / personal namespace) | 5 GB |

**Note:** A 10GB project storage limit for git repository and git LFS is currently active for all projects. Once the [namespace storage limit](https://docs.gitlab.com/ee/user/usage_quotas.html#namespace-storage-limit) is applicable, the project storage limits will be removed.
{: .note}

#### Q: Which users are these changes applicable to?
{:.no_toc}

Free Storage limits are applicable to users of the Free GitLab SaaS offering. Community programs - including GitLab for Open Source, Education and Startups users - will have the limits applicable for GitLab Ultimate. This change does not apply to self-managed users.
Customers who are still on the Bronze subscription are not impacted by this change immediately, and the new limits on Premium / Ultimate will be applicable when they upgrade.

If you have questions regarding the future storage and transfer limits for the Paid GitLab SaaS tiers please see the [Storage and Transfer limits for the Paid GitLab SaaS tiers FAQ](/pricing/faq-paid-storage-transfer/).

#### Q: Does this change apply to Trials?
{:.no_toc}

Yes, GitLab Ultimate Trial and Premium Trial will receive entitlements from GitLab Ultimate and Premium respectively.

#### Q: Is this change applicable to public projects as well?
{:.no_toc}

Yes, the change is applicable to both public and private projects. Free tier users using GitLab for public open source projects should consider applying for the [GitLab for Open Source program](/solutions/open-source/), which provides access to the GitLab Ultimate features and entitlements for free.


### Managing your Storage Usage

#### Q: What constitutes Storage usage?
{:.no_toc}

Currently storage includes [pipeline job artifacts](https://docs.gitlab.com/ee/ci/pipelines/pipeline_artifacts.html#storage), [repositories](https://docs.gitlab.com/ee/user/project/repository/#repository), [package](https://docs.gitlab.com/ee/user/packages/package_registry/) and [container](https://docs.gitlab.com/ee/user/packages/container_registry/) registries, [snippets](https://docs.gitlab.com/ee/user/snippets.html#snippets), [Git LFS](https://docs.gitlab.com/ee/topics/git/lfs/#git-large-file-storage-lfs), [wiki](https://docs.gitlab.com/ee/user/project/wiki/#wiki) storage, [dependency proxy](https://docs.gitlab.com/ee/user/packages/dependency_proxy/). Future product features that allow you to store data will also be incorporated into the storage usage count, when available.

#### Q: How can I view and manage my storage usage?
{:.no_toc}

You can view the storage usage on the Group Settings page for [Usage Quota](https://docs.gitlab.com/ee/user/usage_quotas.html#view-storage-usage) in the `Storage` tab. The summaries are divided into all storage types listed in the answer to the "What constitutes Storage usage?" question. Each type provides details on how to proceed with detailed analysis and cleanup procedures.

#### Q: What happens if I exceed my storage limits?
{:.no_toc}

Top-level groups and personal namespaces exceeding the storage limit will continue to have read access but will be unable to write any new data. This applies to all types of storage including Repository, LFS, Packages, and Registry.

#### Q: How can I reduce the amount of Storage consumed?
{:.no_toc}

Below you will find steps for managing the different storage types:

- Pipeline job artifacts: You can set an [expiration policy](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html#when-job-artifacts-are-deleted) for when artifacts can be deleted. If not specified, the [default expiration time on GitLab.com SaaS]( https://docs.gitlab.com/ee/user/gitlab_com/#gitlab-cicd) is 30 days. You can also [delete job artifacts](https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html#delete-job-artifacts) manually - remember this can lead to data loss.
- Repositories: Repositories can become large over time. You can reduce your repository size using the steps highlighted in the [documentation](https://docs.gitlab.com/ee/user/project/repository/reducing_the_repo_size_using_git.html).
- Container Registry: You can set an [cleanup policy](https://docs.gitlab.com/ee/user/packages/container_registry/reduce_container_registry_storage.html#cleanup-policy) to programmatically remove old, unused images and tags. You can also use the [user interface or API](https://docs.gitlab.com/ee/user/packages/container_registry/reduce_container_registry_storage.html)to delete items as well.
- Packages: You can delete an [entire package](https://docs.gitlab.com/ee/user/packages/package_registry/reduce_package_registry_storage.html#delete-a-package) or [files within a package](https://docs.gitlab.com/ee/user/packages/package_registry/reduce_package_registry_storage.html#delete-files-associated-with-a-package)
- Dependency Proxy: You can set an [expiration policy](https://docs.gitlab.com/ee/user/packages/dependency_proxy/reduce_dependency_proxy_storage.html#cleanup-policies) to programmatically clear the cache. Or, you can manually [purge the cache](https://docs.gitlab.com/ee/user/packages/dependency_proxy/reduce_dependency_proxy_storage.html#use-the-api-to-clear-the-cache) using the API.
- Snippets: Snippets follow the same process as [reducing repository size](https://docs.gitlab.com/ee/user/snippets.html#reduce-snippets-repository-size).
- Wikis: Wikis follow the same process as [reducing repository size](https://docs.gitlab.com/ee/administration/wikis/index.html#reduce-wiki-repository-size).

#### Q: How can I automate storage usage analysis and cleanup?
{:.no_toc}

You can automate storage management with the [GitLab API](https://docs.gitlab.com/ee/api/) to programmatically view and delete storage data types. For more information, see the [storage management automation documentation](https://docs.gitlab.com/ee/user/storage_management_automation.html).

#### Q: How will the storage limits affect me when I’m contributing to another project?
{:.no_toc}

We plan to [apply a cost factor](https://gitlab.com/gitlab-org/gitlab/-/issues/373914) to forks, similar to what is done today for [compute minutes](https://docs.gitlab.com/ee/ci/pipelines/cicd_minutes.html#cost-factor), as long as the fork relationship is maintained.

### Purchasing additional Storage

#### Q: How much does it cost to buy additional Storage units?
{:.no_toc}

Additional units can be purchased from the [GitLab Customer Portal](https://customers.gitlab.com/) at $60/year for 10GB of storage. More details [here](https://docs.gitlab.com/ee/subscriptions/gitlab_com/#purchase-more-storage-and-transfer). For example:

- If you require 15GB storage, you will pay $120 for the year.
- If you have purchased 5 add-ons, you will be entitled to 50GB storage

#### Q: Does my previously purchased additional storage apply to my top-level group once namespace storage limits are in effect?
{:.no_toc}

Yes, once [namespace storage limits](https://docs.gitlab.com/ee/user/usage_quotas.html#namespace-storage-limit) are in effect any previously purchased additional storage, including additional storage purchased due to [project storage limits](https://docs.gitlab.com/ee/user/usage_quotas.html#project-storage-limit), will be applicable to the top-level group.

### Next steps

#### Over both the Free storage limit and the [5-user limit](#user-limits-on-gitlab-saas-free-tier):

If your top-level group is above **both the 5-user limit and Free storage limit**, it's important you manage your user count first, as the 5-user limit has already been fully rolled out. **If you reduce your storage usage and/or buy more storage while your user count is more than 5, and the namespace is still on the Free tier, your top-level group would be immediately placed in the [read only state](https://docs.gitlab.com/ee/user/read_only_namespaces.html).** Please see the recommended ordering of considerations below:

1. Apply for [GitLab for Education](/solutions/education/join/), [GitLab for Open Source](/solutions/open-source/join/), or [GitLab for Startups](/solutions/startups/) if you meet the eligibility requirements.
1. Consider using a [self-managed instance](https://docs.gitlab.com/ee/subscriptions/self_managed/) of GitLab which does not have these limits on the Free tier.
1. [Start a trial](/free-trial/) or [upgrade to GitLab Premium or Ultimate](/pricing/) which include higher limits and features that enable growing teams to ship faster without sacrificing on quality.
1. Reduce storage consumption by following the suggestions in the [Managing Your Storage](#managing-your-storage-usage) section of this page.
1. [Purchase additional storage](https://docs.gitlab.com/ee/subscriptions/gitlab_com/#purchase-more-storage-and-transfer) units at $60/year for 10GB of storage.
1. [Talk to an expert](https://page.gitlab.com/usage_limits_help.html) to learn more about your options and ask questions.

### Over only the Free storage limit

If your top-level group is only over the Free storage limit, it's recommended you manage your storage usage first. Please see the recommended ordering of considerations below:

1. Reduce storage consumption by following the suggestions in the [Managing Your Storage](#managing-your-storage-usage) section of this page.
1. Apply for [GitLab for Education](/solutions/education/join/), [GitLab for Open Source](/solutions/open-source/join/), or [GitLab for Startups](/solutions/startups/) if you meet the eligibility requirements.
1. Consider using a [self-managed instance](https://docs.gitlab.com/ee/subscriptions/self_managed/) of GitLab which does not have these limits on the Free tier.
1. [Purchase additional storage](https://docs.gitlab.com/ee/subscriptions/gitlab_com/#purchase-more-storage-and-transfer) units at $60/year for 10GB of storage.
1. [Start a trial](/free-trial/) or [upgrade to GitLab Premium or Ultimate](/pricing/) which include higher limits and features that enable growing teams to ship faster without sacrificing on quality.
1. [Talk to an expert](https://page.gitlab.com/usage_limits_help.html) to learn more about your options and ask questions.

## User Limits on GitLab SaaS Free Tier

#### Q: What is changing with user limits?
{:.no_toc}

There will be a 5-user limit for top-level groups with private visibility. At this time, top-level groups with public visibility will not have a user limit.

**Note:** Personal namespaces are public by default and therefore excluded from the user limit.
{: .note}

#### Q: Who do these changes apply to?
{:.no_toc}

These user limits are applicable only to users of the Free tier of the GitLab SaaS offering in a top-level group with private visibility. These changes do not apply to users of the Free tier of the GitLab SaaS offering in a public top-level group, paid tiers, the Free tier of the self-managed offering and [community programs](/community/), including GitLab for Open Source, GitLab for Education, and GitLab for Startups users.

#### Q: Do these changes apply to Trials?
{:.no_toc}

No. These user limits do not apply to Trials during the trial period.

#### Q: Do these changes apply to public projects as well?
{:.no_toc}

No, these changes are applicable to top-level groups with private visibility. At this time, public projects in a top-level group with public visibility do not have a user limit. If you're a public open source project, you should consider applying for the [GitLab for Open Source Program](/solutions/open-source/), which provides access to the GitLab Ultimate features and entitlements for free.

#### Q: What happens if I change the top-level visibility from private to public?
{:.no_toc}

The top-level group is [publicly visible](https://docs.gitlab.com/ee/user/public_access.html), this includes information such as members, issues, and merge requests. The top-level group will be indexed by search engines.

#### Q: Do these changes apply to private projects within a top-level group with public visibility?
{:.no_toc}

User limits are currently applied based on the visibility of the top-level group. We will monitor how top-level groups with public visibility are using private projects to identify whether any limits on such projects are needed.

#### Q: When are these changes effective?
{:.no_toc}

We intend to roll out application of the user limits gradually, impacted users will be notified in-app at least 60 days prior to the user limits being applied.

#### Q: Will I be personally notified of the changes?
{:.no_toc}

Yes, impacted users will be notified in-app at least 60 days prior to the user limits being applied.

#### Q: I have more than 5 users in my top-level private group on the GitLab SaaS Free tier, but am not seeing the user limits notification?
{:.no_toc}

We're applying a 5-user limit to top-level private groups on the GitLab SaaS Free tier. If you are above the 5-user limit on your top-level private group and are not seeing this notification, limits are not currently being applied to that group, so you can continue to use the Free tier until a later date. We'll notify you with at least 60 days notice before applying these limits to your top-level private group. Should any other transition offer be made available it will be presented as part of the notification as applicable.

#### Q: I'm seeing the 5-user limit being applied but I've previously purchased a subscription. What should I do?
{:.no_toc}

Please ensure that your subscription [has been associated](https://docs.gitlab.com/ee/subscriptions/gitlab_com/#change-the-linked-namespace) to the correct top-level group and/or has been linked to your Customer Portal SaaS account.

### Managing User Limits (Free tier only)

#### Q: How are the total number of users in my top-level group calculated?
{:.no_toc}

We count the sum of unique users within a top-level group which includes the users in the top-level group, subgroups, and projects. For example:
If a user has a group named `top` and two subgroups under `top` named `child1` and `child2` with 4 different unique users in each group, then the `top` group will have a total of 8 users, which is above the user limit of 5. If the two subgroups contain the same 4 users, then `top` would only have 4 total users.

#### Q: Where can I view and manage the number of users in my top-level group?
{:.no_toc}

Users can view and manage the users in their top-level group by going to Group > Group Settings > Usage Quotas > Seats. Only Group Owners can add or remove users from the Usage Quotas page. Owners and Maintainers of individual subgroups and projects can still manage the specific users in their subgroups/projects.

#### Q: How can I view and manage my users if my project is not located within a group?
{:.no_toc}

If your project is not located within a group, you can manage the users in each of your personal projects but the sum of the unique users within all your personal projects cannot exceed 5.
GitLab strongly encourages personal projects to be moved into Groups which will allow these projects to access all GitLab features as well as give you the ability to manage all users from the Usage Quotas page, start a trial, and purchase a subscription. See [Move your project to a group](https://docs.gitlab.com/ee/tutorials/move_personal_project_to_a_group.html#move-your-project-to-a-group) for instructions.

#### Q: What happens if I don’t reduce my user count before the date they're applied?
{:.no_toc}

When the 5-user limit is applied to top-level groups with private visibility, top-level groups exceeding the user limit will be placed in a [read only state](https://docs.gitlab.com/ee/user/read_only_namespaces.html). These top level groups exceeding the user limit will continue to have read access but will be unable to write any new data. This applies to all types of storage including Repository, LFS, Packages, and Registry.

#### Q: How can I add users beyond the limit of 5 users?
{:.no_toc}

The Free tier has a limit of 5 users on top-level groups with private visibility which cannot be increased. GitLab recommends the paid tiers - Premium or Ultimate - for larger teams as there are no user limits and they contain features designed to increase your team’s productivity. We recommend starting a [free trial](https://gitlab.com/-/trial_registrations/new?glm_source=about.gitlab.com&glm_content=storage-usage-blog-post) of GitLab Ultimate to experience the value of the paid features while also getting access to unlimited users for the trial period.

#### Q: Why am I seeing user limit notifications in my top-level group if I'm a current paying GitLab customer or a member of [GitLab for Education](/solutions/education/join/), [GitLab for Open Source](/solutions/open-source/join/), or [GitLab for Startups](/solutions/startups/)?
{:.no_toc}

You may have inadvertently created new top-level groups not associated to the one being paid for. To confirm if this is the case, navigate to your **Group > Group Settings > Billings**. If your group is listed as being on the Free tier, then it is not associated with your paid GitLab subscription. To move this group into your paid subscription, follow the steps documented here: [Transfer a group](https://docs.gitlab.com/ee/user/group/manage.html#transfer-a-group) ."

#### Q: How can I ensure all my groups are associated with my current GitLab subscription to avoid user limit*
{:.no_toc}

See [Transfer a group](https://docs.gitlab.com/ee/user/group/manage.html#transfer-a-group) for instructions on how to move existing groups that are not associated with your top-level namespace. Users that are not part of the top-level namespace will require additional seats to remain active. See [Add users to your subscription](https://docs.gitlab.com/ee/subscriptions/gitlab_com/#add-users-to-your-subscription) for instructions on how to add seats.

Free tier users can also consider using the self-managed deployment option that does not have user limits. GitLab also has special programs for Open Source projects and students/educators granting access to GitLab Ultimate. If you believe you could qualify for one of these programs you can learn more [here](/community/).

### Next Steps

- Apply for [GitLab for Education](/solutions/education/join/), [GitLab for Open Source](/solutions/open-source/join/), or [GitLab for Startups](/solutions/startups/) if you meet the eligibility requirements.
- Consider using a [self-managed instance](https://docs.gitlab.com/ee/subscriptions/self_managed/) of GitLab which does not have these limits on the Free tier.
- [Start a trial](/free-trial/) or [upgrade to GitLab Premium or Ultimate](/pricing/) which include higher limits and features that enable growing teams to ship faster without sacrificing on quality.
- [Talk to an expert](https://page.gitlab.com/usage_limits_help.html) to learn more about your options and ask questions.

## Public projects on GitLab SaaS Free Tier

### Overview

#### Q: What is changing with public projects?
{:.no_toc}

The GitLab for Open Source Program was created to give back to the open source community by encouraging individuals and teams to contribute to open source. Public open source projects will need to be part of the GitLab for Open Source program to continue to receive GitLab Ultimate features.

As previously announced, [all Free tier public projects will not receive Ultimate by default](/blog/2022/02/04/ultimate-perks-for-open-source-projects/), and [all public projects will be subject to quota of compute minutes applicable to their plan](/blog/2021/11/11/public-project-minute-limits/). Free tier users using GitLab for public open source projects should consider applying to the [GitLab for Open Source program](/solutions/open-source/) to continue to take advantage of GitLab Ultimate features such as portfolio management, advanced security testing, security risk mitigation, and compliance.

#### Q: Which users are these changes applicable to?
{:.no_toc}

These changes are applicable to users with public projects on the Free tier of GitLab SaaS. These changes do not apply to self-managed free and paid tier users, SaaS paid tier users, and community programs - including GitLab for Open Source, Education and Startups users.

#### Q: What is the effective date of the changes?
{:.no_toc}

The CI/CD limits on public projects will be applicable for all users including paid and Free tier with public projects starting 2022-06-01. Public projects on the Free tier will stop receiving Ultimate entitlements by default starting 2022-07-01.

#### Q: How can I retain the Ultimate entitlements for my public projects?
{:.no_toc}

There are two ways:
- Enroll in the GitLab Open Source Program. [Learn more](/solutions/open-source/join/) on how to apply to the GitLab for Open Source Program.
- Upgrade to GitLab Ultimate. Learn more [here](/pricing/).

### Managing Compute Usage

#### Q. What happens when my top-level group or personal namespace has used all of the month’s allocated compute minutes limit of 400 minutes?
{:.no_toc}

You will not be able to run new jobs until you purchase additional compute minutes, or until the next month when you receive your monthly allotted compute minutes. Running jobs will be cancelled when a top-level group or personal namespace reaches its limit while a pipeline is running.

#### Q: How can I manage my compute minutes usage to stay under the limit?
{:.no_toc}

This detailed FAQ covers how to manage your compute minutes usage.
Watch this deep dive video on how you can manage your compute minutes usage.

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/GrO-8KtIpRA" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

#### Q. What exactly is a compute minute and how is it calculated?
{:.no_toc}

Compute minutes are calculated using a formula that includes the job duration and an applied cost factor. Please refer to the [documentation](https://docs.gitlab.com/ee/ci/pipelines/cicd_minutes.html#how-cicd-minute-usage-is-calculated) to learn more.

#### Q: I am an active contributor to GitLab. Will the same limits be applicable to me as well?
{:.no_toc}

All Free tier users receive 50,000 compute minutes for running pipelines on public forks of public open source projects, like GitLab. Contributions to all other projects by Free tier users are subject to the new limits.

### GitLab for Open Source Program

#### Q: How can I apply for the GitLab for Open Source program?
{:.no_toc}

The GitLab for Open Source Program gives access to unlimited seats per license of GitLab Ultimate (SaaS or Self-Managed), including 50,000 compute minutes, excluding support.  View the program requirements and apply for the GitLab for Open Source program online here. In most cases, GitLab will respond with a decision or request for additional information within 15  business days.

#### Q: What happens to my account if I do not enroll in the GitLab for Open Source program or I am not accepted into the program?
{:.no_toc}

If you are not part of the GitLab for Open Source program, after July 1, 2022, your account will stop receiving GitLab Ultimate capabilities and will receive the entitlements available to the Free tier.
You will not lose any data, but you will not be able to create any new jobs or artifacts nor access Ultimate features if you have exceeded the usage limits of the Free tier.

#### Q: Can I apply for GitLab’s Open Source program with some public projects and some private projects in my group?
{:.no_toc}

No. In order to meet the [requirements of the Open Source Program](/solutions/open-source/join/), **all** of the code you host in this GitLab group must be published under [OSI-approved open source licences](https://opensource.org/licenses/category). All projects under this group must have public visibility. Individual projects are not eligible for the Open Source Program. Additionally, your organization must not seek to make a profit. Please check all the eligibility requirements for the Open Source program [here](/solutions/open-source/join/).

#### Q: Do I need to apply for GitLab for Open Source Program for each individual project?
{:.no_toc}

No. You will need to apply for GitLab for Open Source Program at the top-level [group](https://docs.gitlab.com/ee/user/group/#namespaces).

- All projects under this group must have public visiblity
- All projects must be published under [OSI-approved open source licences](https://opensource.org/licenses/category).
- All projects must be within a group or a subgroup, you cannot apply for the program for projects within a personal namespace. (for example, consider a user `username`. Projects within the username group `username` will not be considered. If `username` creates a group `user-group` and has open source projects within that group, then `user-group` can be considered for the Open Source program)
- If you have projects unrelated to an `open source project` (for example, personal projects), you will need to move out the unrelated projects to a different group to be eligible for the GitLab for Open Source Program.

### Next Steps

- [Click here](/solutions/open-source/join/) to join the GitLab for Open Source program
- [Purchase online](https://customers.gitlab.com) or contact [GitLab Sales](/sales/) to upgrade to a paid GitLab.com tier - which have advanced capabilities and higher usage limits.
