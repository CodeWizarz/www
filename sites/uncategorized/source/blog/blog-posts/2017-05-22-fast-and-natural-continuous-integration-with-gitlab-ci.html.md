---
title: "Fast and natural continuous integration with GitLab CI"
author: Samuel Alfageme
author_twitter: samu_alfageme
categories: engineering
image_title: '/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci.jpg'
twitter_image: '/images/tweets/fast-and-natural-continuous-integration-with-gitlab-ci.png'
description: "An overview of GitLab Continuous Integration and Delivery, and the main features of the tool."
---
Do you use GitLab to store your repos? Have you ever stopped to check what some of those tabs on top of your repositories do? Well, you can either disable those in your project settings, or you can keep reading to discover some ways in which they can help you power up your development speed.

<!-- more -->

![what do these tabs do?](/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci/your-awesome-project.png){: .shadow}<br>

This post aims to offer a high-level overview of how GitLab has interpreted the main concepts of Continuous Integration/Delivery and introduce the main features of the tool as well as their naming conventions, as it can sound more overwhelming than it actually is.

The product’s growth has made it present on many companies’ tech stacks. Part of this popularity comes from being indeed a great open-source project to follow, its release cycle is blazing fast and it’s delivering new features every month on the 22nd. One of the most important factors of this equation is the fact that it’s not only a self-managed solution that enables you to have all your projects under control, but also a pretty solid one. Just ask your reference ops for his opinion on how even the community (non-commercial) edition brings many stuff to the table, that were incredibly expensive or even lacking on many other SaaS products before.

![integrated development tools](/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci/idea-to-production-graphics.png){: .shadow}<br>

It sometimes happens that we simply stick to well-known tools for us and won’t notice or research alternatives that may improve our everyday work. I believe this to be the case with some of the GitLab’s lesser-known features. The software is much more than a traditional VCS server. In fact, last year they came up with the idea of their so-called “masterplan” to extend the product to be more like a “suite” and cover every step of the development cycle, or in their words: go from [idea to production](/blog/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/#from-idea-to-production-with-gitlab). And in both previous and [future](/direction/) releases, they are bundling some really cool additional integrations worth checking (e.g. Mattermost ChatOps or Prometheus monitoring).

### Differences with other continuous integration tools

Let’s start getting the full picture of the features that make it so powerful. First of all, its model is based on a lightweight YAML configuration file stored in each repository’s root. This has some pros worth to mention along with the rest:

1. Tightly coupled systems (both Continuous Integration and VCS are a single product).
2. The Continuous Integration configuration becomes versioned:
   * Enforcing different branches with different configurations.
   * Allowing contributors to also collaborate in the integration setup.
3. Docker integration out of the box, including private docker registry per project.
4. Artifacts browser that allows to access the stages output the same way you’d do locally.
5. No nightmare maintenance time of the CI server.

Of course, from the user’s point of view, it also comes with some drawbacks compared to other Continuous Integration systems, since it embraces a “convention over configuration” model, which means you get a pretty powerful tool without having to spend your time configuring it while you stick to its way of doing things. The lack of plug-ins and integrations we are used to seeing in other tools to fine-grain configure some aspects of the project is one of them (e.g. creating jobs that require multiple repositories becomes non-trivial). On the other hand, most use-cases are covered enough and features like configurable email alerts, history browser or programmable builds, you have them all.

But let’s be clear, they neither have invented the wheel nor are the only ones using it. Many other Continuous Integration software solutions also lay in similar paradigms (.travis.yml, Jenkinsfiles…). This is all a matter of taste. The strongest feeling you get after using different solutions is that GitLab’s is easier to configure plus it allows having most details under control in the same browser tab. They took some of the best features of every tool and bundled them into this solution. It makes complete sense.

### Main features

Let’s try to briefly illustrate the main features of this tool and demonstrate how easy it is just to get started with it even without any sysadmin experience or without bothering your DevOps. As said, everything spins around the .gitlab_ci.yml file containing the definition of the different stages (steps) that have to be completed in whole, in order to get the project successfully delivered. The [file structure](/direction/) is natural to be read and once you have seen a couple of examples, you’ll start writing your own without much effort.

Head first for GitLab’s [CI docs](https://docs.gitlab.com/ee/ci/yaml/) for lots of info about how to translate the specific needs of your project into their conventions. But to summarize a review of the Continuous Integration capabilities every project has enabled by default:

#### CI/CD settings

The settings page gives an overview on just how easy it is to configure everything related to what’s needed for the creation of the continuous integration magic, i.e.:

#### Runners

What if I tell you can finally forget about configuring and managing slave machines, the way they speak with the CI server through SSH, how to balance the workload between all the build machines, and many other stuff that is both tedious and often difficult? Meet the runners! [Setup](https://docs.gitlab.com/runner/install/) becomes just as easy as it is to follow the three steps described in the CI/CD settings (settings/ci_cd) on your project: install the right binary for your OS, set the URL endpoint and the registration token provided in the settings page and you are done. Also, you can tag the runners based on their capabilities (e.g. docker, databases, etc.) to select them for specific jobs when they are required.

Runners can implement many executors, i.e. ways of running your build scripts/code in them; from the most basic ssh executor, through a container host and right to the biggest kubernetes cluster you can think of, supporting even Powershell/Batch in Windows systems.

In their self-managed solution, [gitlab.com](https://gitlab.com/), they also provide "shared runners": VMs free of charge, dynamically allocated to build your project, extremely useful for those open source projects with limited resources.

#### Secrets management

In the microservices era, where your project might be integrated and talk with dozens of APIs that require tokens, secrets, passwords, and many other ways to authorize that dialog, a way to handle this complexity in an elegant manner becomes a priority. A really bad smell [seen in many projects](https://gitleaks.com/) is to store all these in config files on a remote machine or even hang around in some piece of code. To stress the importance of this, just consider how many [services](https://www.vaultproject.io/) and [projects](https://docs.docker.com/engine/swarm/secrets/) are popping up to handle this issue. GitLab projects provide a simple keystore in their Continuous Integration settings that can be accessed from the integration scripts, to help project members handle and configure all these secrets.

#### Pipelines

This is the core feature of any Continuous Integration system and yet a really simple concept, that translates to all the steps you’ll follow from the moment you are facing your source code to the point in which you are about to deploy your application. In between, you can include everything you would consider to make sure your code looks right (linting), can be built, works right (testing), integrates with other systems and anything you can come up with to take the last steps and ship your code.


![this is the core feature of any Continuous Integration system](/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci/pipelines-are-a-core-feature.png){: .shadow}<br>

#### Container registry

Imagine having your own private Docker hub, where you can store your project’s images and update them whenever it’s needed without having to expose them to the public, and being able to pull them login from anywhere into the registry. You can have an image ready for every stage of the road and pulling them from your runners is blazing fast. This becomes super handy to avoid initializing the environment and therefore speeding up the total time the pipeline takes to run: faster builds = happier devs.

#### Environments and Review Apps

Everyone loves [gitflow](http://nvie.com/posts/a-successful-git-branching-model/), right? There are some good reasons for that. It’s built on the premise that if every branch is developed isolated, new features don’t interfere with each other or the stable version until they are merged back in the master branch. This helps with both developing new functionalities and testing them.

When containers came into our lives it was obvious how the process of deploying different, independent environments with individual settings per feature could be eased and improved. It’s fair to say we now use containers as standard de facto for environment templates. Most mainstream Continuous Integration solutions were released way before the first container was even created, so they were not built with Docker in mind, but for GitLab CI it’s the other way around: they embrace containers as the way to go, based on the many benefits it brings to the workflow.

![GitLab embraces containers as the way to go, based on the many benefits it brings to the workflow.](/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci/environments-and-review-apps.png){: .shadow}<br>

Imagine a very common scenario in the workflow: you are about to merge a feature branch that has to be tested out by the QA team, which introduces some new libraries and a new service (e.g. Redis, mongoDB…) to be deployed. Just update your Dockerfile to include the new layer(s) that manage those new dependencies and push the image to your local registry. Also, append the line to include the new service via docker hub to .gitlab_ci.yml. The feature branch, when pushed on the remote, will have everything in place to be deployed to the testing environment.

![The feature branch, when pushed on the remote, will have everything in place to be deployed to the testing environment](/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci/production-and-staging.png){: .shadow}<br>

This is where [Review Apps](https://docs.gitlab.com/ee/ci/review_apps/) come into action, it’s just a posh way to call dynamic, per-branch environments created to verify changes and see them live. Every branch gets instant deploy support when pushed to the repo. This process can speed up with tools such as [dpl](https://github.com/travis-ci/dpl), that abstract many of the details for major deploy services, or go freestyle and call your custom deployment script from there. It also integrates an interactive terminal in-browser to introspect on builds to debug and troubleshoot if needed. You no longer have to go over the Jenkins’ mantra to clone a configured job, rename it, adjust the branch in the configuration… and 10 or 15 tedious steps before deploying an ephemeral test environment.

Another major feature you are going to love is the [history browser](https://docs.gitlab.com/ee/ci/environments/index.html#viewing-the-deployment-history-of-an-environment). Imagine you deployed some changes to a demo environment and 10 minutes before going live, you detect it contains a major bug that would be nasty if displayed on camera. No worries; it’s super easy to access the history of what was deployed on every environment and perform rollbacks or redeploy on-demand to any previous reproducible state. Just awesome.

![it’s super easy to access the history of what was deployed on every environment](/images/blogimages/fast-and-natural-continuous-integration-with-gitlab-ci/history-browser.png){: .shadow}<br>

I hope after this post, the central concepts of GitLab’s Continuous Integration make good sense to you and your projects.

_This post was originally published on [solidgeargroup.com](https://solidgeargroup.com/gitlab_countinuous_integration_intro)._

<p class="alert alert-orange" style="background-color: rgba(252,163,38,.3); border-color: rgba(252,163,38,.3); color: rgb(226,67,41) !important; text-align: center;">Sign up for a &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<strong>GitLab EE Trial</strong> &nbsp;&nbsp;<i class="fab fa-gitlab" style="color:rgb(107,79,187); font-size:.85em" aria-hidden="true"></i> &nbsp;&nbsp;<a style="color: rgb(107,79,187);" href="/free-trial/">now!</a>!</p>
