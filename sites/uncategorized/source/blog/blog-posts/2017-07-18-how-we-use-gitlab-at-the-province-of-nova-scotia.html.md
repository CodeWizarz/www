---
title: "How we use GitLab at the Province of Nova Scotia"
author: "Steven Zinck & Paul Badcock"
author_twitter:
categories: engineering
image_title: '/images/blogimages/how-we-use-gitlab-at-nova-scotia.jpg'
twitter_image: '/images/twitter/how-we-use-gitlab-at-nova-scotia-twitter.png'
description: "The Unix operations team at the Province of Nova Scotia decided to implement GitLab for source control and CI/CD. Here's how we started exploring DevOps."
tags: DevOps, CI/CD, workflow
---

In 2015 the Unix operations team at the Province of Nova Scotia decided to implement GitLab for source control and [Continuous Integration and Continuous Deployment](/features/continuous-integration/). This was the beginning of our foray into DevOps practices. This article describes our automated testing, integration and release of Puppet code.

<!-- more -->

![Image via Steve Zinck and Paul Badcock](/images/blogimages/nova-scotia-devops/devops-infinity-graphic.png){: .shadow}<br>

You can also learn more about our DevOps transformation by watching our recent interview:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/SHdeqznJXbc" frameborder="0" allowfullscreen="true"></iframe>
</figure>

### Source control

A source control management (SCM) system allows the user to “commit” code, documentation and other system artifacts such as configuration files to a central location. Each change results in a new version of the file, and previous versions of the file remain available on the SCM. Restoring a previous version is quick and easy.

We needed a way for multiple sysadmins to be able to work on code without colliding with one another. We also needed a way to vet changes through a peer review process. GitLab makes this easy thanks to its support of branching and merge requests. Branching allows a sysadmin to create an individual copy of the production code (“master”) and work with it in isolation — this allows multiple team members to be working on the same production code base without being concerned about conflicts between their work.

### Continuous integration

![Image via Steve Zinck and Paul Badcock](/images/blogimages/nova-scotia-devops/ci-cd-workflow.png){: .shadow}<br>

As we built out more of our infrastructure with Puppet, we needed an automated way of testing our code. Over time, our test strategy has evolved to include automated [syntax checking](https://puppet.com/blog/verifying-puppet-checking-syntax-and-writing-automated-tests), [linting](http://puppet-lint.com/), [unit](https://puppet.com/blog/unit-testing-rspec-puppet-for-beginners) and [integration](http://serverspec.org/) tests. Manual testing was not sufficient, as it was often forgotten about and was very time consuming. Automated testing solved that — for every code commit, the test pipeline is executed. A complete test cycle currently takes under five minutes.

On each code commit to a branch other than master, the following test pipeline is kicked off by GitLab CI:

![Image via Steve Zinck and Paul Badcock](/images/blogimages/nova-scotia-devops/ci-screenshot.png){: .shadow}<br>

If at any point a job fails, the pipeline stops and the sysadmin is notified. One of the great features of GitLab CI is its tight integration with Docker — each of the jobs above is run inside its own isolated container. The syntax-lint-spec job verifies that the Puppet syntax is good; linting confirms the code conforms to best practices; and spec confirms that logically the code functions as designed.

The test-kitchen jobs are a full suite of [ServerSpec](http://serverspec.org/) tests. We automatically provision four containers that represent our four most common configurations. Our Puppet code is applied to each container to verify that it will work in our production environment. This acts as a full regression test each time a code commit is made, and ensures that there were no unintended problems introduced. It gives us confidence that the code is actually doing what it’s intended to do.

### Continuous deployment

Once all of the tests pass, the sysadmin can submit a merge request for their branch, and it will be reviewed by a senior staff member before reaching production. This is an important part of our workflow, because it gives junior staff the confidence that a more senior member of the team will review and approve a change before it reaches any of our servers. If the merge request is accepted, the branch will be merged into master and at that point GitLab CI will push the code to our Red Hat Satellite and Puppet Enterprise servers where it will be deployed to our environment.

![Image via Steve Zinck and Paul Badcock](/images/blogimages/nova-scotia-devops/cd-screenshot.jpeg){: .shadow}<br>

You can find the configuration files (Dockerfiles, .kitchen.yml, .gitlab-ci.yml and Satellite push script) at our [GitHub](https://github.com/nsgov).

The implementation of our system automation strategy and the toolset we selected has proven itself many times. We are spending less time fighting fires due to the streamlined and tested nature of our deployments and have earned the confidence of our clients.

### The road ahead

In upcoming articles, we’ll write about the CI/CD process we built with [Communications Nova Scotia](https://novascotia.ca/cns/) that allows their development team to deploy and roll back their Dockerized application environment on demand. We also plan to write about our automated test strategy for Red Hat Ansible.

This post originally appeared on [*Medium*](https://medium.com/@szinck/how-we-use-gitlab-at-the-province-of-nova-scotia-708b514cc47f).

## About the Guest Authors

[Steve Zinck](https://www.linkedin.com/in/stevezinck/) spent most of his career working in the Public Service as a Unix and Infrastructure administrator. Over the past few years, he's started to transition away from traditional systems administration and begun to focus on software delivery and automation. As part of that transition, his team has implemented GitLab at the core of our automation and software delivery stack. His current focus is working with software and application teams to assist in streamlining their deployment and delivery process.

[Paul Badcock](https://www.linkedin.com/in/pbadcock/?ppe=1) started working in the IT sector in 1998 with positions in small startups, to large fortune 500 companies, to currently on a public-sector team. His career was focused as a traditional IT Linux administrator until in the mid-2000s he started focusing on adopting development tooling, practices and methodologies for operational teams. This work culminated in implementing an early 2010s DevOps workplace framework with the help of @stewbawka and subsequently working with like-minded teams since. As a part of adopting developer tools he has previously worked with and managed CVS, SVN installations and various vendor products before reading a “Show HN” posting on Hacker News about GitLab.
