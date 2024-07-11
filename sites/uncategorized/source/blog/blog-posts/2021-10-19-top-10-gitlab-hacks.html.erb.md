---
title: "Top ten GitLab hacks for all stages of the DevOps Platform" 
author: Michael Friedrich
author_gitlab: dnsmichi
author_twitter: dnsmichi
categories: devops platform
image_title: '/images/blogimages/top-10-gitlab-hacks/cover-image-unsplash.jpg' 
description: "Get the most out of the GitLab DevOps Platform with our ten best tips for enhanced productivity."
tags: tutorial, DevOps, workflow 
twitter_text: "Top 10 @gitlab hacks for all stages of the #DevOps platform" 
featured: yes 
postType: ​​dev-evangelism
related_posts:
  - "/blog/2021/02/18/improve-your-gitlab-productivity-with-these-10-tips/"
  - "/blog/2021/07/19/teams-gitpod-integration-gitlab-speed-up-development/"
  - "/blog/2021/04/21/devops-workflows-json-format-jq-ci-cd-lint/"
---

It's been ten years since the first commit to GitLab, so we are sharing our ten favorite GitLab hacks to help you get the most out of our DevOps Platform. These are tips for all stages of the development lifecycle, so roll up your sleeves and let's get started.

## Manage faster with quick actions

You might have adopted keyboard shortcuts for faster navigation and workflows already - if not, check out the GitLab documentation for [platform specific shortcuts](https://docs.gitlab.com/ee/user/shortcuts.html). The knowledge of pressing `r` to land in the reply to comment in text form can be combined with other quick actions, including:

```
/assign_reviewer @ <search username>

/label ~ <search label>
/label ~enhancement ~workflow::indev

/due Oct 8

/rebase

/approve

/merge 
```

Quick actions are also helpful if you have to manage many issues, merge requests and epics at the same time. There are specific actions which allow you to duplicate existing issues, as one example. 

Take a deeper dive into [Quick Actions](/blog/2021/02/18/improve-your-gitlab-productivity-with-these-10-tips/). 

## Plan instructions with templates

Don’t fall into the trap of back-and-forth with empty issue descriptions that leave out details your development teams need to reproduce the error in the best way possible. 

GitLab provides the possibility to use so-called [description templates](https://docs.gitlab.com/ee/user/project/description_templates.html) in issues and merge requests. Next to providing a structured template with headings, you can also add [task lists](https://docs.gitlab.com/ee/user/markdown.html#task-lists) which can later be ticked off by the assignee. Basically everything is possible and is supported in GitLab-flavored markdown and HTML.

In addition to that, you can combine the static description templates with quick actions. This allows you to automatically set labels, assignees, define due dates, and more to level up your productivity with GitLab. 

```
<!-- 
This is a comment, it will not be rendered by the Markdown engine. You can use it to provide instructions how to fill in the template.
--> 

### Summary 

<!-- Summarize the bug encountered concisely. -->

### Steps to reproduce

<!-- Describe how one can reproduce the issue - this is very important. -->

### Output of checks

<!-- If you are reporting a bug on GitLab.com, write: This bug happens on GitLab.com -->

#### Results of GitLab environment info

<!--  Input any relevant GitLab environment information if needed. -->

<details>
<summary>Expand for output related to app info</summary>

<pre>

(Paste the version details of your app here)

</pre>
</details>

### Possible fixes

<!-- If you can, link to the line of code and suggest actions. →

## Maintainer tasks

- [ ] Problem reproduced
- [ ] Weight added
- [ ] Fix in test
- [ ] Docs update needed

/label ~"type::bug"
```

When you manage different types of templates, you can pass along the name of the template in the `issuable_template` parameter, for example `https://gitlab.com/gitlab-org/gitlab/-/issues/new?issuable_template=Feature%20proposal%20%23%20lean`. 

At GitLab, we use description and merge request templates in many ways: [GitLab the project](https://gitlab.com/gitlab-org/gitlab/-/tree/master/.gitlab/issue_templates), [GitLab Corporate Marketing team](https://gitlab.com/gitlab-com/marketing/corporate_marketing/corporate-marketing/-/tree/master/.gitlab/issue_templates), [GitLab team member onboarding](https://gitlab.com/gitlab-com/people-group/people-operations/employment-templates/-/tree/master/.gitlab/issue_templates) and [GitLab product team](https://gitlab.com/gitlab-com/Product/-/tree/main/.gitlab/issue_templates) are just a few examples.


## Create with confidence 

When reading GitLab issues and merge requests, you may see the abbreviation `MWPS` which means `Merge When Pipeline Succeeds`. This is an efficient way to merge the MRs when the pipeline passes all jobs and stages - you can even combine this workflow with [automatically closing issues](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically) with keywords from the MR.

`Merge When Pipeline Succeeds` also works on the CLI with the `git` command and [push options](https://docs.gitlab.com/ee/user/project/push_options.html). That way you can create a merge request from a local Git branch, and set it to merge when the pipeline succeeds.

```shell
# mwps BRANCHNAME
alias mwps='git push -u origin -o merge_request.create -o merge_request.target=main -o merge_request.merge_when_pipeline_succeeds'
```

Checkout [this ZSH alias example](https://gitlab.com/sytses/dotfiles/-/blob/745ef9725a859dd759059f6ce283e2a8132c9b00/git/aliases.zsh#L24) in our CEO [Sid Sijbrandij](/company/team/#sytses)’s dotfiles repository. There are more push options available, and even more Git CLI tips in [our tools & tips handbook](/handbook/tools-and-tips/#terminal). One last tip: Delete all local branches where the remote branch was deleted, for example after merging a MR.

```shell
# Delete all remote tracking Git branches where the upstream branch has been deleted
alias git_prune="git fetch --prune && git branch -vv | grep 'origin/.*: gone]' | awk '{print \$1}' | xargs git branch -d"
```

You are not bound to your local CLI environment; take it to the cloud with [Gitpod](/blog/2021/07/19/teams-gitpod-integration-gitlab-speed-up-development/) and either work in VS Code or the pod terminal. 


## Verify your CI/CD pipeline

Remember the old workflow of committing a change to `.gitlab-ci.yml` just to see if it was valid, or if the job template really inherits all the attributes? This has gotten a whole lot easier with our new [pipeline editor](https://docs.gitlab.com/ee/ci/pipeline_editor/). Navigate into the `CI/CD` menu and start building CI/CD pipelines right away.

But the editor is more than just another YAML editor. You’ll get live linting, allowing you to know if there is a missing dash for array lists or a wrong keyword in use before you commit. You can also preview jobs and stages or asynchronous dependencies with `needs` to make your pipelines more efficient.

The pipeline editor also uses uses the `/ci/lint` API endpoint, and fetches the merged YAML configuration I described earlier in [this blog post about jq and CI/CD linting](/blog/2021/04/21/devops-workflows-json-format-jq-ci-cd-lint/). That way you can quickly verify that job templates with [extends](https://docs.gitlab.com/ee/ci/yaml/#extends) and [!reference tags](https://docs.gitlab.com/ee/ci/yaml/yaml_optimization.html#reference-tags) work in the way you designed them. It also allows you to unfold included files, and possible job overrides (for example changing the stage of an [included SAST security template](https://docs.gitlab.com/ee/user/application_security/sast/#overriding-sast-jobs)).

Let’s try a quick example – create a new project and new file called `server.c` with the following content: 

```
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

int main(void) {
    size_t pagesize = getpagesize();
    char * region = mmap(
        (void*) (pagesize * (1 << 20)),
        pagesize,
        PROT_READ|PROT_WRITE|PROT_EXEC,
        MAP_ANON|MAP_PRIVATE, 0, 0);

    strcpy(region, "Hello GitLab SAST!");
    printf("Contents of region: %s\n", region);

    FILE *fp;
    fp = fopen("devops.platform", "r");
    fprintf(fp, "10 years of GitLab 🦊 🥳");
    fclose(fp);
    chmod("devops.platform", S_IRWXU|S_IRWXG|S_IRWXO);

    return 0;
}
```

Open the CI/CD pipeline editor and add the following configuration, with an extra `secure` stage assigned to the `semgrep-sast` job for SAST and the C code. 

```yaml
stages:
    - build
    - secure
    - test
    - deploy

include:
    - template: Security/SAST.gitlab-ci.yml

semgrep-sast:
    stage: secure
```

Inspect the `Merged YAML tab` to see the fully compiled CI/CD configuration. You can commit the changes and check the found vulnerabilities too as an async practice :). The examples are available in [this project](https://gitlab.com/gitlab-de/playground/sast-10y-example).

![CI/CD Pipeline editor - Merged YAML](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_pipeline_editor_view_merged_yaml.png)
Verify the stage attribute for the job by opening the `view merged YAML` tab in the CI/CD pipeline editor.
{: .note.text-center}


## Package your applications

The [package registry](https://docs.gitlab.com/ee/user/packages/) possibilities are huge and there are more languages and package managers to come. Describing why Terraform, Helm, and containers (for infrastructure) and Maven, npm, NuGet, PyPI, Composer, Conan, Debian, Go and Ruby Gems (for applications) are so awesome would take too long, but it's clear there are plenty of choices. 

One of my favourite workflows is to use existing CI/CD templates to publish container images in the GitLab container registry. This makes continuous delivery much more efficient, such as when deploying the application into your Kubernetes cluster or AWS instances. 

```yaml
include:
  - template: 'Docker.gitlab-ci.yml'
```

In addition to including the CI/CD template, you can also override the job attributes and define a specific stage and manual non-blocking rules.

```yaml
stages:
  - build
  - docker-build
  - test

include:
  - template: 'Docker.gitlab-ci.yml'

# Change Docker build to manual non-blocking
docker-build:
  stage: docker-build
  rules:
    - if: '$CI_COMMIT_REF_NAME == $CI_DEFAULT_BRANCH'
      when: manual 
      allow_failure: true
```

For celebrating [#10YearsOfGitLab](/ten/), we have created a [C++ example](https://gitlab.com/gitlab-de/cicd-tanuki-cpp) with an Easter egg on time calculations. This project also uses a Docker builder image to showcase a more efficient pipeline. Our recommendation is to learn using the templates in a test repository, and then create a dedicated group/project for managing all required container images. You can think of builder images which include the compiler tool chain, or specific scripts to run end-to-end tests, etc. 


## Secure your secrets

It is easy to leak a secret by making choices that uncomplicate a unit test by running it directly with the production database. The secret persists in git history, and someone with bad intentions gains access to private data, or finds ways to exploit your supply chain even further. 

To help prevent that, include the CI/CD template for secret detection. 

```yaml
​​stages:
    - test

include:
  - template: Security/Secret-Detection.gitlab-ci.yml  
```

A known way to leak secrets is committing the `.env` file which stores settings and secrets in the repository. Try the following snippet by adding a new file `.env` and create a merge request.

```
export AWS_KEY="AKIA1318109798ABCDEF"
```

Inspect the reports JSON to see the raw reports structure. GitLab Ultimate provides an MR integration, a security dashboard overview, and more features to take immediate action. The example can be found in [this project](https://gitlab.com/gitlab-de/playground/secret-scanning-10y-example).

![Secrets Scanning in MR](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_secrets_scanning.png)
MR detail view with detected AWS secret from security scanning
{: .note.text-center}


## Release and continuously deliver (CD)

GitLab’s release stage provides many [features](https://about.gitlab.com/handbook/product/categories/features/#release), including [canary deployments](https://docs.gitlab.com/ee/user/project/canary_deployments.html) and [GitLab pages](https://docs.gitlab.com/ee/user/project/pages/). There are also infrastructure deployments with Terraform and cloud native (protected) [environments](https://docs.gitlab.com/ee/ci/environments/). 

While working on a CI/CD pipeline efficiency workshop, I got enthusiastic about [parent-child pipelines](https://docs.gitlab.com/ee/ci/pipelines/parent_child_pipelines.html) allowing non-blocking child pipelines into production, with micro services in Kubernetes as one example. 

Let’s try it! Create a new project, and add 2 child pipeline configuration files: `child-deploy-staging.yml` and `child-deploy-prod.yml`. The naming is important as the files will be referenced in the main `.gitlab-ci.yml` configuration file later. The jobs in the child pipelines will sleep for 60 seconds to simulate a deployment. 

child-deploy-staging.yml:

```yaml
deploy-staging:
    stage: deploy
    script:
        - echo "Deploying microservices to staging" && sleep 60
```

child-deploy-prod.yml

```yaml
deploy-prod:
    stage: deploy
    script:
        - echo "Deploying microservices to prod" && sleep 60

monitor-prod:
    stage: deploy
    script:
        - echo "Monitoring production SLOs" && sleep 60
```

Now edit the `.gitlab-ci.yml` configuration file and create a build-test-deploy stage workflow.

```yaml
stages:
  - build
  - test
  - deploy

build:
  stage: build
  script: echo "Build"

test:
  stage: test 
  script: echo "Test"

deploy-staging-trigger:
  stage: deploy
  trigger:
    include: child-deploy-staging.yml
  #rules:
  #  - if: $CI_MERGE_REQUEST_ID

deploy-prod-trigger:
  stage: deploy
  trigger:
    include: child-deploy-prod.yml
    #strategy: depend
  #rules:
  #  - if: $CI_COMMIT_REF_NAME == $CI_DEFAULT_BRANCH   
```

Commit the changes and inspect the CI/CD pipelines. 

![Parent-child Pipelines](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_parent_child_pipelines.png)
View parent-child pipelines in GitLab
{: .note.text-center}

`strategy: depends` allows you to make the child pipelines blocking again, and the parent child pipeline waits again. Try uncommenting this for the prod job, and verify that by inspecting the pipeline view. [Rules](https://docs.gitlab.com/ee/ci/yaml/#rules) allow refining the scope when jobs are being run, such as when staging child pipelines that should only be run in merge requests and the prod child pipeline only gets triggered when on the default main branch. The full example can be found in [this project](https://gitlab.com/gitlab-de/playground/parent-child-pipeline-10y-example).

Tip: You can use [resource_groups](/blog/2020/01/21/introducing-resource-groups/) to limit production deployments from running concurrent child pipelines. 

## Configure your infrastructure

Terraform allows you to describe, plan and apply the provisioning of infrastructure resources. The workflow requires a state file to be stored over steps, where the [managed state in GitLab](https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html) as an HTTP backend is a great help, together with predefined container images and CI/CD templates to make [Infrastructure as code](https://docs.gitlab.com/ee/user/infrastructure/iac/) as smooth as possible.

You can customize the template, or copy the CI/CD configuration into .gitlab-ci.yml and modify the steps by yourself. Let’s try a quick example with only an AWS account and an IAM user key pair. Configure them as CI/CD variables in `Settings > CI/CD > Variables`: `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

Next, create the `backend.tf` file and specify the http backend and AWS module dependency.

```terraform
terraform {
  backend "http" {
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
```

Create `provider.tf` to specify the AWS region.

```terraform
provider "aws" {
  region = "us-east-1"
}
```

The `main.tf` describes the S3 bucket resources.

```terraform
resource "aws_s3_bucket_public_access_block" "publicaccess" {
  bucket = aws_s3_bucket.demobucket.id
  block_public_acls = false
  block_public_policy = false
}

resource "aws_s3_bucket" "demobucket" {
  bucket = "terraformdemobucket"
  acl = "private"
}
```

Tip: You can verify the configuration locally on your CLI by commenting out the HTTP backend above.

For GitLab CI/CD, open the pipeline editor and use the following configuration: (Note that it is important to specify the `TF_ROOT` and `TF_ADDRESS` variables since you can [manage multiple Terraform state files](https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html#configure-the-backend)). 

```yaml
variables:
  TF_ROOT: ${CI_PROJECT_DIR}
  TF_ADDRESS: ${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/terraform/state/${CI_PROJECT_NAME}

include:
    - template: Terraform.latest.gitlab-ci.yml

stages:
  - init
  - validate
  - build
  - deploy
  - cleanup

destroy:
    stage: cleanup
    extends: .terraform:destroy 
    when: manual
    allow_failure: true
```

Commit the configuration and inspect the pipeline jobs. 

![Terraform pipeline AWS S3 bucket](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_terraform_state_cicd_pipeline_aws_s3_bucket.png)
AWS S3 bucket provisioned with Terraform in GitLab CI/CD 
{: .note.text-center}

The `destroy` job is not created in the template and therefore explicitly added as a manual job. It is recommended to review the opinionated Terraform CI/CD template and copy the jobs into your own configuration to allow for further modifications or style adjustments.  The full example is located in [this project](https://gitlab.com/gitlab-de/playground/terraform-aws-state-10y-example).

![GitLab managed Terraform states](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_terraform_state_cicd_overview.png)
View the Terraform states in GitLab
{: .note.text-center}

Hat tipping to our Package stage - you can manage and publish [Terraform modules in the registry](https://docs.gitlab.com/ee/user/packages/terraform_module_registry/) too, using all of the DevOps Platform advantages. And hot off the press, the [GitLab Kubernetes Operator is generally available](/blog/2021/10/12/open-shift-ga/). 


## Monitor GitLab and dive into Prometheus

Prometheus is a monitoring solution which collects metrics from `/metrics` HTTP endpoints made available by applications, as well as so-called exporters to serve services and host information in the specified metrics format. One example is CI/CD pipeline insights to analyse bottlenecks and [make your pipelines more efficient](https://docs.gitlab.com/ee/ci/pipelines/pipeline_efficiency.html). The [GitLab CI Pipeline Exporter project](https://github.com/mvisonneau/gitlab-ci-pipelines-exporter/tree/main/examples/quickstart) has a great quick start in under 5 minutes, bringing up demo setup with Docker-compose, Prometheus and Grafana. From there, it is not far into your production monitoring environment, and monitoring more of GitLab. 

![GitLab CI Exporter](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_ci_pipeline_exporter_prometheus.png)
Example dashboard for the GitLab CI Pipeline Exporter
{: .note.text-center}

The Prometheus Exporter uses the [Go client libraries](https://prometheus.io/docs/instrumenting/writing_exporters/). They can be used to write your own exporter, or instrument your application code to expose `/metrics`. When deployed, you can use Prometheus again to monitor the performance of your applications in Kubernetes, as one example. Find more monitoring ideas in my talk “[From Monitoring to Observability: Left Shift your SLOs](https://docs.google.com/presentation/d/1LPb-HPMgbc8_l98VjMEo5d0uYlnNnAtJSURngZPWDdE/edit)”. 


## Protect

You can enable security features in GitLab by including the CI/CD templates one by one. A more easy way is to enable [Auto DevOps](https://docs.gitlab.com/ee/topics/autodevops/) and use the default best practices for [security scans](https://docs.gitlab.com/ee/user/application_security/index.html#security-scanning-with-auto-devops). This includes [container scanning](https://docs.gitlab.com/ee/topics/autodevops/stages.html#auto-container-scanning) ensuring that application deployments are not vulnerable on the container OS level. 

Let’s try a quick example with a potentially vulnerable image, and the Docker template tip from the Package stage above. Create a new `Dockerfile` in a new project:

```yaml
FROM debian:10.0 
```

Open the pipeline editor and add the following CI/CD configuration:

```yaml
# 1. Automatically build the Docker image
# 2. Run container scanning. https://docs.gitlab.com/ee/user/application_security/container_scanning/index.html
# 3. Inspect `Security & Compliance > Security Dashboard`

# For demo purposes, scan the latest tagged image from 'main'
variables:
    DOCKER_IMAGE: $CI_REGISTRY_IMAGE:latest    

include:
    - template: Docker.gitlab-ci.yml
    - template: Security/Container-Scanning.gitlab-ci.yml
```

The full example is located in [this project](https://gitlab.com/gitlab-de/playground/container-scanning-10y-example).

Tip: Learn more about [scanning container images in a deployed Kubernetes cluster](https://docs.gitlab.com/ee/user/application_security/cluster_image_scanning/) to stay even more safe. 


![Container Scanning Vulnerability Report](/images/blogimages/top-10-gitlab-hacks/gitlab_10y_container_scanning_vulnerability_report.png)
View the container scanning vulnerability report
{: .note.text-center}


## What’s next?

We have tried to find a great “hack” for each stage of the DevOps lifecycle. There are more hacks and hidden gems inside GitLab - share yours and be ready to explore more stages of the DevOps Platform.


Cover image by [Alin Andersen](https://unsplash.com/photos/diUGN5N5Rrs) on [Unsplash](https://unsplash.com)
