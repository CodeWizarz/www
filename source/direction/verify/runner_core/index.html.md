---
layout: markdown_page
title: "Category Direction - Runner Core"
description: "This is the Product Direction Page for the Runner Core product category."
canonical_path: "/direction/verify/runner_core/"
---

## Navigation & Settings

|                       |                               |
| -                     | -                             |
| Stage                 | [Verify](/direction/verify/)  |
| Maturity              | Lovable |
| Content Last Reviewed | `2023-09-11`                  |

### Introduction and how you can help

Thanks for visiting this direction page on the Runner Core category at GitLab. This page belongs to the [Runner Group](https://about.gitlab.com/handbook/product/categories/#runner-group) within the Verify Stage and is maintained by [Darren Eastman](mailto:deastman@gitlab.com).

### Strategy and Themes

GitLab Runner -  the near-ubiquitous build agent that executes CI jobs on a target compute platform is a critical foundational pillar of GitLab's [one DevSecOps platform vision](https://about.gitlab.com/direction/#vision). The fundamental problems customers must solve in this product category include installing, configuring, and scaling CI/CD build agents (runners) on public or private cloud infrastructure and securely executing CI/CD jobs on heterogeneous computing environments.

Organizations that adopt the GitLab one DevSecOps platform approach [realize](https://about.gitlab.com/resources/report-forrester-tei/) significant gains in development and delivery efficiency. With GitLab's new [AI/ML](https://about.gitlab.com/blog/2023/04/24/ai-ml-in-devsecops-series/) feature sets, we expect an order of magnitude increase in developer efficiency and reduced time to market for software-enabled technology changes.GitLab CI/CD can power millions of CI/CD jobs monthly, ensuring that developers in any size organization can deliver features quickly and reliably as developer efficiency increases.

Some self-managed GitLab customers must consider, plan for, and operate computing for CI/CD builds at an enormous scale. And this is where the GitLab Runner Core strategy comes in. As DevOps practices mature and AI integrates more into development processes, organizations can efficiently and cost-effectively scale a runner fleet to meet the ever-increasing demand for computing to run CI/CD jobs.

For customers at the monthly scale of millions of CI/CD jobs, the primary autoscaling options for CI builds in ephemeral, isolated environments are Kubernetes and autoscaling on public cloud or on-premise hosted virtual machine environments. Therefore, critical needs for this customer segment include consistently fast start times for builds, fast build times as measured by total wall clock time, and minimal operational complexity for ongoing operations.

For other customers, critical needs include seamless support for multi-platform and architecture builds within the same pipeline. Therefore, another essential pillar for the runner core strategy is the ongoing support of market-leading compute platforms and architectures.

### 1 year plan

The FY24 product themes for Runner Core mapped to GitLab's FY24 product investment themes are as follows.

**World-class DevSecOps experience**:

- [Next Runner Token Architecture](https://docs.gitlab.com/ee/architecture/blueprints/runner_tokens/#next-gitlab-runner-token-architecture)
- [Next Runner Autoscaling](https://docs.gitlab.com/ee/architecture/blueprints/runner_scaling/#next-runner-auto-scaling-architecture)
  - [Autoscaling on AWS EC2 instances](https://gitlab.com/groups/gitlab-org/-/epics/8856)
  - [Autoscaling on Google Compute Engine](https://gitlab.com/groups/gitlab-org/-/epics/9358)
  - [Autoscaling on Azure Virtual Machines](https://gitlab.com/groups/gitlab-org/-/epics/9359)
- [Kubernetes Executor - FY24](https://gitlab.com/groups/gitlab-org/-/epics/8394)

**Advanced security and compliance**

- Software Supply Chain Security - [Native Signing of Build Artifacts](https://gitlab.com/groups/gitlab-org/-/epics/9212)

### What is next for us
<!-- This is a 3 month look ahead for the next iteration that you have planned for the category. This section must provide links to issues or
or to [epics](https://about.gitlab.com/handbook/product/product-processes/#epics-for-a-single-iteration) that are scoped to a single iteration. Please do not link to epics encompass a vision that is a longer horizon and don't lay out an iteration plan. -->

In the next three months (August to October) we plan to deliver these critical features:

**Next Runner Autoscaling:**

- [GitLab Runner Fleeting plugin for AWS EC2 instances - BETA](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/29404)
- [GitLab Runner Fleeting Plugin for GCP Compute Engine -  BETA](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/29409)
- [GitLab Runner Fleeting plugin for Azure Virtual Machines - BETA](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/29410)

### What we are currently working on
<!-- Scoped to the current month. This section can contain the items that you choose to highlight on the kickoff call. Only link to issues, not Epics.  -->

1. Work on the [GitLab Runner-Taskscaler integration tests](https://gitlab.com/gitlab-org/fleeting/taskscaler/-/issues/3) that are required to deliver the [new GitLab Runner autoscaling solution](https://docs.gitlab.com/runner/runner_autoscale/#gitlab-runner-autoscaling) on instances provided by the major public cloud provider.
2. Supporting community contributions for the [GitLab Runner Admissions Controller MVC](https://gitlab.com/gitlab-org/gitlab/-/issues/378322)

### What we recently completed
<!-- Lookback limited to 3 months. Link to the relevant issues or release post items. -->
**Next Runner Autoscaling:**

- [Fleeting plugin for Azure Virtual Machines - Experimental](https://gitlab.com/gitlab-org/gitlab-runner/-/issues/29410)

### What is Not Planned Right Now

We are not actively working on the following features:

- [Runner Priority](https://gitlab.com/gitlab-org/gitlab/-/issues/14976) - This is a viral feature proposal in the Runner core product backlog. The problem is routing CI jobs to an available or less busy Runner. One use case that has come up recently in multiple customer conversations is being able to only burst into public cloud-hosted runners (cloud bursting), when the capacity of on-premise hosted runner infrastructure is at capacity. Using the public cloud for burst-only workloads is critical as it enables customers to keep their cloud spend for runner infrastructure to a minimum. We had decided not to work on a solution to this problem due to the complexity of architectural changes that may be required to the GitLab CI job queueing mechanism. However, recent customer interviews have highlighted how critical this problem is and the urgency of a solution for their expanded use of GitLab CI. Therefore the next step is a [small iteration](https://gitlab.com/gitlab-org/gitlab/-/issues/419985), the goal of which is to develop a proof-of-concept solution.

- [Sticky Runners](https://gitlab.com/gitlab-org/gitlab/-/issues/17497) - For this feature, the problem to solve is that users need to improve CI job performance in scenarios where each job can generate intermediate build elements with hundreds of GBs in size. In the current GitLab CI model, a significant amount of pipeline execution time is due to the uploading and downloading of intermediate build elements between jobs in a pipeline. Given the current Runner executor implementation, i.e., we support several executor types out of the box (shell, docker, Kubernetes), changing the CI job execution paradigm in GitLab is a significant architectural change. The Sticky Runners MVC feature is not in the FY24 roadmap due to higher priority features in the Runner core and the Verify stage.

### Best in Class Landscape
<!-- Blanket description consistent across all pages that clarifies what GitLab means when we say "best in class" -->

BIC (Best In Class) is an indicator of forecasted near-term market performance based on a combination of factors, including analyst views, market news, and feedback from the sales and product teams. It is critical that we understand where GitLab appears in the BIC landscape.

#### Key Capabilities

When you run a continuous integration pipeline job or workflow, the code in that pipeline must execute on some computing platform to complete your software's building, testing, and deployment. Terms used to describe the software that handles the pipeline code execution include worker, agent, or runner.

So while the basic functionality of pipeline code execution is table stakes in the industry, the ability to efficiently build software on multiple compute platforms with low operational maintenance overhead are critical features for a best-in-class solution.

#### GitLab Runner Value Proposition

- Fully mature Kubernetes autoscaling solution where CI builds run in ephemeral, one-time use, runner worker pods.
- Runner autoscaling solution for public cloud virtual machine instances where CI builds by default run in ephemeral, one-time use virtual machine instances.

#### Roadmap

**Q3 FY24** :

- Next Runner Autoscaling - Instance Executor (BETA)
- Next Runner Autoscaling - Docker-Autoscaler (BETA)
- Next Runner Autoscaling - Fleeting plugin for AWS EC2 instances (BETA)

**Q4 FY24** :

- Next Runner Autoscaling - Fleeting plugin for AWS EC2 instances (GA)
- Next Runner Autoscaling - Fleeting plugin for Azure Virtual Machines (GA)
- Next Runner Autoscaling - Fleeting plugin for GCP Compute Engine (GA)

#### Top [1/2/3] Competitive Solutions

| Solution | CI/CD Agent naming convention/brand |Self-Managed Option Availablity|Notes|
| ------ | ------ |------ |------ |
|GitHub Actions| Runners |Available|At its core, GitHub Action Runners are similar to GitLab Runners in that they communicate to a central server via a REST API, execute jobs, and send the logs and artifacts back to the server when finished. However, multi-platform support, native autoscaling on cloud instances, support for Kubernetes as a build environment, concurrency, and parallel CI/CD job execution are more mature in GitLab Runner. As expected, GitHub has continued to invest in features and capabilities to improve the maturity of GitHub Action Runners. For instance, the recently released [Actions Runner Controller (ARC)](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/quickstart-for-actions-runner-controller) enables GitHub Actions Runners to autoscale on Kubernetes clusters. However, as noted by others, there is operational overhead involved in the setup and configuration of ARC. On the GitHub public roadmap, we also notice similar investment themes regarding multi-platform support as GitHub continues to target market segments requiring a self-managed platform.|
|Jenkins|Agents|Available|In Jenkins, an agent is a software executable that runs a task under the direction of the Jenkins controller.  Like GitLab Runner, a Jenkins agent can run on different computing environments (bare metal, virtual machines, containers, Kubernetes clusters).  Java must be supported and installed on the host OS to run a Jenkins agent. |
| Harness.io   | Harness Delegate                          |Available| Harness currently provides the following types of Delegate: Kubernetes, Shell Script, AWS ECS, Helm, Docker. Though the Delegates perform a similar essential function as GitLab Runner, i.e., executes tasks provided by the Harness Manager, the Delegates' primary purpose is to deploy software to the target platform. In this regard, the value proposition of the [GitLab Agent for Kubernetes](https://docs.gitlab.com/ee/user/clusters/agent/) is a critical consideration when evaluating capabilities in GitLab for developer frictionless cloud-native deployment.

### Maturity Plan

- Runner core is at the "Lovable" maturity level (see our [definitions of maturity levels](/direction/maturity/)).
- As detailed in this [epic](https://gitlab.com/groups/gitlab-org/-/epics/6090), we plan to review the maturity scorecard for runner core and complete new category maturity scorecards for the other product development categories, runner cloud, and fleet management.
