---
layout: markdown_page
title: Storage and Transfer limits for the Paid GitLab SaaS tiers FAQ
description: "On this page you can view frequently asked questions for storage and transfer limits for the Paid GitLab SaaS tiers"
canonical_path: "/pricing/faq-paid-storage-transfer/"
---

# Frequently Asked Questions

{:.no_toc}

### On this page

{:.no_toc}

{:toc}

- TOC

## GitLab SaaS Premium and Ultimate

#### Q: What is the current SaaS project storage limit?
{:.no_toc}
Projects on GitLab SaaS have a [10 GiB storage limit](https://docs.gitlab.com/ee/user/usage_quotas.html#project-storage-limit) on their Git repository and LFS storage. These will be removed in advance of the future SaaS namespace storage limits.

#### Q: What are the future SaaS namespace storage and transfer limits?
{:.no_toc}

We are introducing storage and transfer limits to the [GitLab SaaS Paid offerings](/pricing/).

| GitLab SaaS Tier                               | Premium | Ultimate |
|------------------------------------------------|:-------:|:--------:|
| Storage (in GB per top-level group)            | 50 GB   | 250 GB   |
| Transfer (in GB per top-level group per month) | 100 GB  | 500 GB   |

#### Q: Which users are these future namespace limits applicable to?
{:.no_toc}

These limits are applicable to users of the GitLab SaaS offerings. These changes do not apply to self-managed users (both free and paid tier) and community programs - including GitLab for Open Source, Education and Startups users.

Customers who are still on the Bronze subscription are not impacted by this change immediately, and the new limits on Premium / Ultimate will be applicable when they upgrade.

If you have questions regarding the storage limit for the Free GitLab SaaS tier please see the [Efficient GitLab SaaS Free tier FAQ](/pricing/faq-efficient-free-tier/).

#### Q: Do these these future namespace limits apply to Trials?
{:.no_toc}

Yes, GitLab Trial will receive entitlements from GitLab Ultimate.

#### Q: What is the effective date of the changes?
{:.no_toc}

For existing paid tier users:

- Storage limits are not yet applicable for paid customers. GitLab will release additional features in the coming months for users to [view and manage storage usage](https://gitlab.com/gitlab-org/gitlab/-/issues/375296) well ahead of the storage limits being applicable.
- Storage limits are included in GitLab subscription terms, but are not currently applicable. Existing customers will be notified at least 60 days in advance of the storage limits becoming applicable, with the storage limits taking effect upon renewal.
- We intend to roll out application of these limits gradually. We will show in-app notifications to affected top-level groups, including any subgroups and projects, prior to the storage limits being applied. Users that are already above the limit will see the in-app notifications at least 60 days ahead of enforcement. Users that go above the limit during the period where the in-app notifications are showing will see them as soon as they go above the threshold.
- Transfer limits will not be applicable until further communication from GitLab.

For existing paid tier users on a multi-year contract:

- Storage limits will not apply to customers until their first renewal after the storage limits have been added to the subscription terms. After a customer is on the new subscription terms, limit effective date would apply based on the timeline outlined above.

#### Q: Will namespace storage limits apply only once both storage and transfer are available?
{:.no_toc}

No, application of storage and transfer limits will be independent of each other. Storage usage visibility, and storage limits will be first, transfer usage visibility and transfer limits will follow.

### Managing your Storage Usage

#### Q: What constitutes Storage usage?
{:.no_toc}

Currently storage includes [pipeline job artifacts](https://docs.gitlab.com/ee/ci/pipelines/pipeline_artifacts.html#storage), [repositories](https://docs.gitlab.com/ee/user/project/repository/#repository), [package](https://docs.gitlab.com/ee/user/packages/package_registry/) and [container](https://docs.gitlab.com/ee/user/packages/container_registry/) registries, [snippets](https://docs.gitlab.com/ee/user/snippets.html#snippets), [Git LFS](https://docs.gitlab.com/ee/topics/git/lfs/#git-large-file-storage-lfs), [wiki](https://docs.gitlab.com/ee/user/project/wiki/#wiki) storage, [dependency proxy](https://docs.gitlab.com/ee/user/packages/dependency_proxy/). Future product features that allow you to store data will also be incorporated into the storage usage count, when available.

#### Q: How can I view and manage my storage usage?
{:.no_toc}

You can view the storage usage on the Group Settings page for [Usage Quota](https://docs.gitlab.com/ee/user/usage_quotas.html#view-storage-usage) in the `Storage` tab. The summaries are divided into all storage types listed in the answer to the "What constitutes Storage usage?" question. Each type provides details on how to proceed with detailed analysis and cleanup procedures.

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

#### Q: How will the namespace storage limits affect me when I’m contributing to another project?
{:.no_toc}

We plan to [apply a cost factor](https://gitlab.com/gitlab-org/gitlab/-/issues/373914) to forks, similar to what is done today for [compute minutes](https://docs.gitlab.com/ee/ci/pipelines/cicd_minutes.html#cost-factor), as long as the fork relationship is maintained.

### Managing your Transfer Usage

#### Q: What constitutes transfer usage?
{:.no_toc}

Transfer is measured as the amount of data egress leaving GitLab.com, except for:

- Transfer generated by GitLab.com [Shared Runners](https://docs.gitlab.com/ee/ci/runners/)
- Transfer generated by GitLab Runners authenticating with a `CI_JOB_TOKEN`
- Transfer generated by deployments authenticating with a `DEPLOY_TOKEN`
- The web interface

The primary use cases affected by transfer limits are end users working with code repositories, and public distribution of containers and packages.
Future product features that allow transfer of data will also be incorporated into the transfer usage count, when available.

#### Q: Can I proactively monitor and reduce my transfer usage?
{:.no_toc}

Viewing transfer usage is not yet available. Until the usage report is available on the Group Settings Usage `Quota Page`, transfer limits will not be programmatically applied. If your usage is significantly high, the GitLab team will reach out to you to help manage your usage.

### Purchasing additional Storage and Transfer

#### Q: How much does it cost to buy additional Storage and Transfer units?
{:.no_toc}

Additional storage or transfer units can be purchased from the [GitLab Customers Portal](https://customers.gitlab.com/) at $60/year that includes both 10GB of storage and 20GB/month transfer.
For example:

- If you require 15GB storage, you will pay $120 for the year.
- If you require 25GB transfer per month, you will pay $120 for the year.
- If you require both 15GB storage and 25GB Transfer per month, you will still pay $120 for the year.
- If you have purchased 5 add-ons, you will be entitled to 50GB storage and 100GB transfer/month.

#### Q: Does my previously purchased additional storage apply to my top-level group once namespace storage limits are in effect?
{:.no_toc}

Yes, once [namespace storage limits](https://docs.gitlab.com/ee/user/usage_quotas.html#namespace-storage-limit) are in effect any previously purchased additional storage, including additional storage purchased due to [project storage limits](https://docs.gitlab.com/ee/user/usage_quotas.html#project-storage-limit), will be applicable to the top-level group.

### More information

For more information on managing and reducing your storage usage, please contact GitLab support or your GitLab sales representative.
