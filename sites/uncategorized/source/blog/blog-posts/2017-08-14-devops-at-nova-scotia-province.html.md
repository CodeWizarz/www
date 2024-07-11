---
title: "How we introduced DevOps at the province of Nova Scotia"
author: "Steven Zinck & Paul Badcock"
author_twitter:
guest: True
categories: insights
campaign: just commit
image_title: '/images/blogimages/devops-nova-scotia-cover.jpg'
twitter_image: '/images/tweets/devops-nova-scotia-tweet.png'
description: "The Linux Ops team and one of the Development teams at the Government of Nova Scotia introduced DevOps practices to their workflow – find out how they did it and what benefits they're now enjoying."
tags: DevOps, workflow
---

DevOps is the practice of breaking down silos between Development and Operations teams. DevOps promotes a culture and practices where Dev and Ops teams have open communication and collaboration. This article explains how the Linux Ops team and one of the Development teams at the Government of Nova Scotia were able to implement DevOps practices and realize its benefits.

<!-- more -->

## The beginning

The Linux Ops team was asked to host a Ruby application built circa 2006. We’re a Red Hat Enterprise Linux shop, provisioning the newest release of RHEL 7 and the Ruby app required gems that are only compatible with RHEL 6 and older. So, we had two options — provision a new RHEL 6 VM — something we haven’t done in over a year, or take this opportunity to containerize the application and use it as a proof of concept. Although we’ve been using containers for over two years in our [Puppet CI](https://medium.com/@szinck/how-we-use-gitlab-at-the-province-of-nova-scotia-708b514cc47f) environment, and have containerized some of our own management apps, this was our first client application to containerize.

You can also learn more about our DevOps transformation by watching our recent interview:

<figure class="video_container">
  <iframe src="https://www.youtube.com/embed/SHdeqznJXbc" frameborder="0" allowfullscreen="true"></iframe>
</figure>

## Ops digs into the application

Since the Ruby code for the application was already in our GitLab, we had easy access to it so we could begin to understand its functionality. How does authentication work? How does SSL work? Where are assets stored? Exactly which gems are required? Does the system send email, and if so, how?
As we started to peek into the application, we found the answers to all of these things and a lot more. We were able to make a couple improvements to the application, for example, we were able to remove hard-coded values and switch to variables. In particular, we were able to expose database connection strings which can be leveraged by Docker Swarm.

## The Docker image

Now that we had a better understanding of how the application works, we started working on the container to host the application. We started with a base image of RHEL 6.9 and began layering on the dependencies and the application itself. Since the Development team is naturally very knowledgeable about their application, we collaborated closely with them on this process.

## Automatically building and deploying

Once we had an image we were happy with, it was time to configure [Docker Swarm](https://docs.docker.com/engine/swarm/) and configure GitLab CI to push the image to our Docker registry.

I’ve included the relevant piece of our CI configuration below. As you can see, we’re tagging the Docker image with the last commit # and pushing it to our internal registry.

```build_image:
  image: docker:1.12
  stage: build
  script:
    - docker build -t
    ${DOCKER_REGISTRY}/${NAMESPACE}/${CI_PROJECT_NAME}:${CI_COMMIT_SHA}
    - docker push  
    ${DOCKER_REGISTRY}/${NAMESPACE}/${CI_PROJECT_NAME}:${CI_COMMIT_SHA}
```

Now that the image is up on our registry, we can tell Docker Swarm that a new image is available. Swarm will automatically pull down the new image and reload the application with less than five seconds of downtime.

```
DOCKER_HOST="${DOCKER_DEV_HOST}" docker service update --image  
${DOCKER_REGISTRY}/${NAMESPACE}/${CI_PROJECT_NAME}:${CI_COMMIT_SHA}  
${CI_PROJECT_NAME}_app_1
```

## Automating security scanning (DevSecOps!)

In addition to building the image, we also run a battery of security tests against the application code, the operating system, and application in its running state.

![pipeline](/images/blogimages/devops-nova-scotia-screengrab.png){: .shadow}<br>

As you can see from the pipeline, after the image is built, we run a static code analysis using [Brakeman](http://brakemanscanner.org/). Brakeman tests the code for security issues, and since it’s a code analysis tool, the application doesn’t need to be running. After the code scan, we run [Red Hat’s atomic scanner](https://developers.redhat.com/blog/2016/05/02/introducing-atomic-scan-container-vulnerability-detection/) against the image. This tool will notify us of any known security issues in the operating system. Finally, we can deploy the application and then run [Arachni](http://www.arachni-scanner.com/) to test the application in its running state.

## Benefits of DevOps

We’ve discovered several benefits from this approach:

- The Ops and Dev teams worked closely together, each learning about the other's domain expertise. As Ops discovered issues with the application, we were able to make code changes that were peer-reviewed by the Dev team using the [Git Flow](https://datasift.github.io/gitflow/IntroducingGitFlow.html) development model.
- The time to delivery for the application has improved drastically, and a framework has been established that existing, new and third-party staff can all leverage.
- Lower failure ratec —  if a new vulnerability is introduced into the stack, we’ll know.
- Fixes can be applied on demand by Dev without Ops involvement.
- Recovery of the application is now as simple as two clicks.
- Dev and Ops both understand how the application functions and have a blueprint of its architecture in the Docker configuration.

## Next steps

We’re actively collaborating with other Development teams across government to implement DevOps-style practices. From a technology perspective, we’re aggressively working towards improving our technology stack so that we can improve business value for our customers.

This post originally appeared on [*Medium*](https://medium.com/@szinck/devops-at-the-province-of-nova-scotia-42688759a25d).

### About the Guest Authors

[Steve Zinck](https://www.linkedin.com/in/stevezinck/) spent most of his career working in the Public Service as a Unix and Infrastructure administrator. Over the past few years, he's started to transition away from traditional systems administration and begun to focus on software delivery and automation. As part of that transition, his team has implemented GitLab at the core of our automation and software delivery stack. His current focus is working with software and application teams to assist in streamlining their deployment and delivery process.

[Paul Badcock](https://www.linkedin.com/in/pbadcock/?ppe=1) started working in the IT sector in 1998 with positions in small startups, to large Fortune 500 companies, to currently on a public-sector team. His career was focused as a traditional IT Linux administrator until in the mid-2000s he started focusing on adopting development tooling, practices and methodologies for operational teams. This work culminated in implementing an early 2010s DevOps workplace framework with the help of @stewbawka and subsequently working with like-minded teams since. As a part of adopting developer tools he has previously worked with and managed CVS, SVN installations and various vendor products before reading a “Show HN” posting on Hacker News about GitLab.
