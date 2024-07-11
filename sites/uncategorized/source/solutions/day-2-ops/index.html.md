---
layout: markdown_page
title: "Day-2 Operations"
description: "Find out what is Day-2 Operations and how GitLab supports Day-2 Operations."
canonical_path: "/solutions/day-2-ops/"
---

<!-- blank line -->
<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/_61TtldPYFo" frameborder="0" allowfullscreen="true"> </iframe>
</figure>
<!-- blank line -->

## What is "Day-2"
More teams across industries are evaluating and running proof of concept projects with new technologies. Many of these technologies directly impact the production environments of critical customer facing applications. [Cloud native](/topics/cloud-native/){:data-ga-name="Cloud native"}{:data-ga-location="body"} infrastructure like containers, Kubernetes, and serverless platforms enable rapid development and deployment of new applications. As these technologies have matured, large enterprises have begun shifting focus to [Day-2 operations](https://dzone.com/articles/defining-day-2-operations).

Day-2 operations is the pain that comes with continually improving not just your application, but the way in which you operate it in production environments. Day-2 operations include considerations that go far beyond the original speed of development problems a cloud-native tools help solve.  To operationalize a given technology, enterprises need to understand how it will fit into their broader architecture.  Leaders must consider both their technical and operational architecture.  After all, all systems are made up of not only software but also people and processes.

Technology must solve all the requirements of a business, not just the technical ones.  The installation, setup, and ongoing configuration adjustment of cloud-native infrastructure can no longer be a manual process. It must be repeatable and reliable.  Teams need to establish plans for maintenance, upgrades, and most importantly future optimization.  In large organizations, there's a need to provide education and process change to ensure teams are well equipped to provide the levels of availability and performance their business requires.

Many times new technology, open-source innovations, or the latest tools don't consider these Day-2 operations concerns.  This is one of many reasons technology adoption lags in large enterprises, governments, or other risk-averse teams.

## How does GitLab support Day-2
GitLab's product and company strategy lend themselves naturally to Day-2 support.  GitLab's strength is in the enterprise, and our teams focus on [enterprise-class](/solutions/enterprise-class/){:data-ga-name="Enterprise class"}{:data-ga-location="body"} as a key consideration while building GitLab.

In addition, several ways GitLab product principles directly benefit Day-2 operations tasks:

* [Prefering small primatives](/handbook/product/product-principles/#prefer-small-primitives){:data-ga-name="Prefer small primitives"}{:data-ga-location="body"}: all the building blocks of GitLab to allow for small changes. Our bias for iteration lets users and customers leverage the same tools our team use to extend GitLab.
* GitLab doesn't [enforce a workflow](/handbook/product/product-principles/#no-enforced-workflows){:data-ga-name="no enforced workflows"}{:data-ga-location="body"}, which means GitLab is not restricted only to a small number of use cases.
* The [emergent benefits of a single application](/handbook/product/single-application/#emergent-benefits-of-a-single-application){:data-ga-name="Benefits of a single app"}{:data-ga-location="body"} include a focus on improving cycle time, reduced context switching and other critical productivity considerations for Day-2.
* As [open-source](https://about.gitlab.com/company/#open-source){:data-ga-name="Open source"}{:data-ga-location="body"} software, GitLab's source is available, and open for contribution. This enables developers to understand what GitLab is doing under the covers easily and contribute ways to better customize it if needed.

Here are some specific examples of how those principles translate into GitLab features.

### Gradual Customization
GitLab's [small primitives](/handbook/product/product-principles/#prefer-small-primitives){:data-ga-name="Prefer smal primitives"}{:data-ga-location="body"} paired with [convention over configuration](/handbook/product/product-principles/#convention-over-configuration){:data-ga-name="convention over configuration"}{:data-ga-location="body"} are a powerful combination.  They bring a best-of-both-worlds solution to DevOps:

* Start with a "batteries included" platform AND
* Allow for full customization by staying true to our open-source roots

A vital example of this would be our [Auto DevOps offering](/stages-devops-lifecycle/auto-devops/){:data-ga-name="Auto devops"}{:data-ga-location="body"}.  Auto DevOps allows a team to commit their code and have GitLab do the rest right out of the gate.  GitLab automatically [builds](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-build){:data-ga-name="Auto build"}{:data-ga-location="body"}, [tests](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-test-deprecated){:data-ga-name="Auto tests"}{:data-ga-location="body"}, and checks for [code quality](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-code-quality){:data-ga-name="Auto code quality"}{:data-ga-location="body"}.  Then GitLab runs security checks including [SAST](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-sast){:data-ga-name="Auto SAST"}{:data-ga-location="body"}, [DAST](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-dependency-scanning){:data-ga-name="Auto DAST"}{:data-ga-location="body"}, [dependancy scanning](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-dependency-scanning){:data-ga-name="Dependancy scanning"}{:data-ga-location="body"}, [license compliance](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-license-compliance){:data-ga-name="License compliance"}{:data-ga-location="body"}, and [container scanning](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-container-scanning){:data-ga-name="Container scanning"}{:data-ga-location="body"}.  Deployment is then automated through Helm and Tiller into the connected Kubernetes cluster.  In this way, Auto DevOps allows developers to deploy code to a Kubernetes cluster without writing a single line of CI/CD configuration.

However, when team needs to "graduate" from the sensible defaults, Auto DevOps provides, you don't need to shift your CI/CD approach completely.  For example, if your team wants to customize the Docker image created in the build process, simply adding a `Dockerfile` to the project. Auto DevOps recognizes that custom configuration and [uses the Dockerfile](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-build-using-a-dockerfile){:data-ga-name="Auto dockerfile build"}{:data-ga-location="body"} for the build rather than buildpacks.  Similarly, if the deploy to Kubernetes needs to be customized for production use there are a number of options.  First, a simple change to the [environment variables](https://docs.gitlab.com/ee/topics/autodevops/customize.html#environment-variables){:data-ga-name="Environment variables"}{:data-ga-location="body"} that Auto DevOps uses change impact how the deploy functions.  Options like canary deploys, incremental rollouts, and staging environments are all customized in this way.  Secondly, complete control over the Helm chart that GitLab uses is achievable through a [custom Helm chart](https://docs.gitlab.com/ee/topics/autodevops/customize.html#custom-helm-chart){:data-ga-name="Custom helm chart"}{:data-ga-location="body"} in the project.

As teams Day-2 operations needs require them to graduate even further, the final simple primitive of Auto DevOps allows for the ultimate in customization.  The actual [`.gitlab-ci.yml`](https://gitlab.com/gitlab-org/gitlab/blob/master/lib/gitlab/ci/templates/Auto-DevOps.gitlab-ci.yml){:data-ga-name="GitLab ci yml"}{:data-ga-location="body"} file that GitLab uses to orchestrate all of Auto DevOps is exposed to the user, and teams can use that file as the basis for their entirely customized deployment.  These building blocks allow organizations to gradually customize their CI, environments, and implementations over time.

### Universal, compute agnostic control plane
GitLab's support for Day-2 doesn't just stop at Kubernetes.  While Kubernetes may be a great solution for many teams, there are many workloads and organization that will continue to leverage different cloud and on-premise platforms for deployments for years to come.  Many infrastructure providers focus on only one type of deployment or focus solely on Kubernetes as a hammer for every nail.

GitLab, however, takes a different agnostic approach to create a universal control plane for the entire DevOps lifecycle.  By comparison to other control planes, GitLab:

* Works with any Kubernetes cluster, you are not limited to running on GitLab's infrastructure
* Many features work "out of the box" with any compute platform.
* Even features (such as Review Apps) that are *designed* to work with Kubernetes are built on small primitives that work in any environment.
* There is no additional cost (e.g. no markup on infrastructure costs) for using GitLab.  You can use a Kubernetes cluster or other compute you host locally, or can use Containers/Compute as a Service on any public cloud.

All of these features allow users to adopt GitLab without worrying about GitLab driving them to one particular cloud vendor or compute platform.

### Built on best of pure open source
GitLab understands and values the power of [open source](https://gitlab.com/gitlab-org/gitlab-foss/){:data-ga-name="Open source"}{:data-ga-location="body"}.  Being based on open source, we are firm in our [stewardship](/company/stewardship/){:data-ga-name="Stewardship"}{:data-ga-location="body"} of our product as well as recognizing the best open source projects in their respective spaces.

GitLab Auto DevOps is another excellent example of this:

* Auto Build leverages [Cloud Native Buildpacks](https://buildpacks.io/).
* Auto SAST uses the [best open source scanning tools for each programming language](https://docs.gitlab.com/ee/user/application_security/sast/index.html#supported-languages-and-frameworks){:data-ga-name="Supported languages"}{:data-ga-location="body"}.

Many other features of Auto DevOps represent simple configuration-less wrappers of the best of breed open-source tools for those use cases.  Where there aren't open-source tools, GitLab either creates open-source version or incorporated proprietary features.

Other examples include:

* [Hasihcorp Vault](https://www.vaultproject.io/): GitLab has a concept of [CI/CD varaiables](https://docs.gitlab.com/ee/ci/variables/){:data-ga-name="Variables"}{:data-ga-location="body"}. Instead of reinventing a way of storing, rotating, and protecting secrets, our teams will [integrate Vault](https://gitlab.com/gitlab-org/gitlab/-/issues/28321){:data-ga-name="Integrate vault"}{:data-ga-location="body"}, the clear winner in this space.
* [Prometheus](https://prometheus.io/): GitLab leverages Prometheus both for monitoring GitLab itself, as well as making it [easy for users to install Prometheus](https://docs.gitlab.com/ee/user/project/integrations/prometheus.html#embedding-gitlab-managed-kubernetes-metrics){:data-ga-name="Prometheus"}{:data-ga-location="body"} to monitor their own compute clusters and applications.
* [Jaeger](https://www.jaegertracing.io/): GitLab uses the best-of-breed tracing tool Jaeger to implement [tracing](https://docs.gitlab.com/ee/operations/tracing.html){:data-ga-name="tracing"}{:data-ga-location="body"}, rather than trying to redevelop a proprietary tracing system.
