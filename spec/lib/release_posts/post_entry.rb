require 'spec_helper'
require_relative '../../lib/release_posts/issue'

describe ReleasePosts::PostEntry do
  let(:issue) do
    api_body = {
      "id" => 71215381,
      "iid" => 249767,
      "project_id" => 278964,
      "title" => "Feature: Warn about failed jobs in the Project Security Dashboard",
      "description" => "### Release notes \n\nProject Security Dashboards provide security and engineering teams with a centralized place to manage vulnerabilities. Because the reports are based on the latest successful pipeline scan of the `default` branch, it is important to know if the results are up to date. Previously, there was no way to determine the time or status of the latest `default` pipeline scan from these pages. This required navigating away to the Pipelines list and digging for the relevant information.\n\nNow, you can easily see when the last `default` pipeline completed at the top of all Project Security Dashboards. A link to the corresponding pipeline page is conveniently provided. And in the case of any pipeline failures, you will see the number of failures clearly indicated. The failure notification takes you directly to the `Failed jobs` tab of pipeline page. After addressing the failure conditions, running a new pipeline will update the vulnerability data for the project along with the new pipeline status area on the Security Dashboard.\n\nDocumentation: https://docs.gitlab.com/ee/user/application_security/security_dashboard/\n\nImage: ![pipeline-status](/uploads/f7abb7fe70f778b366fb336940a0a090/pipeline-status.png)\n\n### Problem to solve\n\nUsers can't see easily if some data are missing or out of date from on the Project Security Dashboards because of stale or failed pipeline jobs on the `default` branch. The only way to tell is going to the Pipelines list and looking for the most recent one for `default`.\n\n### Intended users\n\n* [Sasha (Software Developer)](https://about.gitlab.com/handbook/product/personas/#sasha-software-developer)\n* [Amy (Application Security Engineer)](https://about.gitlab.com/handbook/product/personas/#amy-application-security-engineer)\n* [Isaac Infrastructure Security Engineer)](https://about.gitlab.com/handbook/product/personas/#isaac-infrastructure-security-engineer)\n\n### User experience goal\n\nSee https://gitlab.com/gitlab-org/gitlab/-/issues/208298\n\n### Further details\n\nSee https://gitlab.com/groups/gitlab-org/-/epics/4263",
      "state" => "opened",
      "created_at" => "2020-09-15T19:12:00.852Z",
      "updated_at" => "2020-11-17T00:07:35.154Z",
      "labels" => [
        "Category:Vulnerability Management",
        "GitLab Ultimate",
        "devops::secure",
        "direction",
        "feature",
        "group::threat insights",
        "release post item::secondary",
        "section::sec"
      ],
      "milestone" => {
        "id" => 1233755,
        "iid" => 53,
        "group_id" => 9970,
        "title" => "13.6",
        "description" => "https://about.gitlab.com/releases/",
        "state" => "active",
        "created_at" => "2020-04-09T17:39:22.328Z",
        "updated_at" => "2020-07-17T11:46:54.771Z",
        "due_date" => "2020-11-17",
        "start_date" => "2020-10-18",
        "expired" => false,
        "web_url" => "https://gitlab.com/groups/gitlab-org/-/milestones/53"
      },
      "web_url" => "https://gitlab.com/gitlab-org/gitlab/-/issues/249767"
    }
    i = ReleasePosts::Issue.new(api_body, 'secondary')
    ReleasePosts::PostEntry.new(i, nil)
  end

  let(:epic) do
    api_body = {
      "id" => 5989,
      "iid" => 1189,
      "group_id" => 9970,
      "parent_id" => 8447,
      "title" => "Gitaly Cluster: strong consistency",
      "description" => "### Release notes\n\nGitaly Cluster allows Git repositories to be replicated on multiple warm Gitaly nodes. This improves fault tolerance by removing single points of failure. [Reference transactions](#gitaly-cluster-reference-transactions), introduced in GitLab 13.3, causes changes to be broadcast to all the Gitaly nodes in the cluster, but only the Gitaly nodes that vote in agreement with the primary node persist the changes to disk. If all the replica nodes dissented, only one copy of the change would be persisted to disk, creating a single point of failure until asynchronous replication completed.\n\nQuorum-based voting improves fault tolerance by requiring a majority of nodes to agree before persisting changes to disk. When the feature flag is enabled, writes must succeed on multiple nodes. Dissenting nodes are automatically brought in sync by asynchronous replication from the nodes that formed the quorum.\n\nDocumentation: https://docs.gitlab.com/ee/administration/gitaly/praefect.html#strong-consistency\n\n### Problem to solve\n\nWhen a user pushes changes to GitLab, if we accept the changes we should have a sufficient number of replicas before we communicate success to the client to prevent unexpected data loss where the write isn't replicated to sufficiently before the primary fails.\n\n### Further details\n\nCustomers using NFS for HA expect a similarly consistent consistent solution, not an eventually consistent backup.\n\n<details><summary>Possible approaches:</summary>\n\n- :x: Fully Praefect managed https://gitlab.com/gitlab-org/gitaly/-/merge_requests/1863  \n  - Pro: Single code base changes, Migration can be done piece by piece\n  - Con: Migration is done piece by piece, Complexity for Gitaly, as well as Praefect\n- :x: Git update-ref DSL changes\n  - Mailinglist changes: https://lore.kernel.org/git/cover.1585129842.git.ps@pks.im/, https://lore.kernel.org/git/cover.1585811013.git.ps@pks.im/\n  - Pro: Can be upstreamed, Migration can be done piece by piece\n  - Con: Requires all RPCs to use git-update-refs to make use of it, Migration is done piece by piece\n- :white_check_mark: Git hooks based, introduce new hooks https://gitlab.com/gitlab-org/gitlab-git/-/tree/pks-ref-transaction-hooks https://gitlab.com/gitlab-org/gitaly/-/issues/2529#note_312712916\n  - Pro: Can be upstreamed, Catches all known Git commands that do ref updates, Can be implemented mostly transparently to the caller of a given command\n  - Con: Commands doing multiple reference updates will have to do multiple votes\n- :x: Update ref.c with GitLab specific logic\n  - Pro: No dependency on hooks\n  - Con: Maintaining a patch, reapplying each Git version, Harder to ship throughout GitLab (CNG, GDK, omnibus, etc)\n\nIntention: **hooks** are the preferred approach. Upstream new hooks once we've built and MVC and improved.\n\n</details>\n\n### Proposal\n\n\n\n- [x] **Iteration 1:** 2PC pre-receive hook proof of concept https://gitlab.com/gitlab-org/gitaly/-/issues/2635 %\"13.0\" \n- [x] **Iteration 2:** 2PC hooks MVC %13.1\n\n    Iterate on the proof of concept pre-receive hook approach to include **all write operations** by creating new hooks for ref updates, implement **proxying** of writes, and monitoring.\n\n- [x] **Iteration 3:** Improvements and Performance %13.2\n\n    Maybe Stream-wise proxying and faster checksums\n\n- [x] **Iteration 4:** Generally available %13.3\n\n### Links / references",
      "confidential" => false,
      "start_date" => "2020-02-18",
      "start_date_is_fixed" => false,
      "start_date_fixed" => nil,
      "start_date_from_inherited_source" => "2020-02-18",
      "start_date_from_milestones" => "2020-02-18",
      "end_date" => "2020-12-17",
      "due_date" => "2020-12-17",
      "due_date_is_fixed" => false,
      "due_date_fixed" => nil,
      "due_date_from_inherited_source" => "2020-12-17",
      "due_date_from_milestones" => "2020-12-17",
      "state" => "opened",
      "web_edit_url" => "/groups/gitlab-org/-/epics/1189",
      "web_url" => "https://gitlab.com/groups/gitlab-org/-/epics/1189",
      "created_at" => "2019-04-09T18:11:06.636Z",
      "updated_at" => "2020-11-02T20:07:48.954Z",
      "closed_at" => nil,
      "labels" => [
        "Category:Gitaly",
        "GitLab Premium",
        "Gitaly Cluster",
        "availability",
        "devops::create",
        "direction",
        "feature",
        "group::gitaly",
        "maturity::complete"
      ]
    }
    i = ReleasePosts::Issue.new(api_body, 'primary')
    ReleasePosts::PostEntry.new(i, nil)
  end

  describe '#image_url' do
    it 'returns an image_url when included in the description' do
      expect(issue.image_url).to eq('/images/unreleased/feature_warn_about_failed_jobs_in_the_project_security_dashboard.png')
    end
    it 'returns nil when no image is included in the descrption' do
      expect(epic.image_url).to be_nil
    end
  end

  describe '#contents' do
    it 'returns a well formatted YAML content block when a complete issue is provided' do
      expect(issue.contents).to eq(%(---
features:
  secondary:
  - name: "Feature: Warn about failed jobs in the Project Security Dashboard"
    available_in: [ultimate]
    gitlab_com: true
    documentation_link: 'https://docs.gitlab.com/ee/user/application_security/security_dashboard/'
    image_url: '/images/unreleased/feature_warn_about_failed_jobs_in_the_project_security_dashboard.png'
    reporter: matt_wilson
    stage: secure
    categories:
    - Vulnerability Management
    issue_url: 'https://gitlab.com/gitlab-org/gitlab/-/issues/249767'
    description: |
      Project Security Dashboards provide security and engineering teams with a centralized place to manage vulnerabilities. Because the reports are based on the latest successful pipeline scan of the `default` branch, it is important to know if the results are up to date. Previously, there was no way to determine the time or status of the latest `default` pipeline scan from these pages. This required navigating away to the Pipelines list and digging for the relevant information.

      Now, you can easily see when the last `default` pipeline completed at the top of all Project Security Dashboards. A link to the corresponding pipeline page is conveniently provided. And in the case of any pipeline failures, you will see the number of failures clearly indicated. The failure notification takes you directly to the `Failed jobs` tab of pipeline page. After addressing the failure conditions, running a new pipeline will update the vulnerability data for the project along with the new pipeline status area on the Security Dashboard.
))
    end
  end
end
