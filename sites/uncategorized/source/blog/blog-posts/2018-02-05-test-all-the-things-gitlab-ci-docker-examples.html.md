---
title: "Test all the things in GitLab CI with Docker by example"
author: Gabriel Le Breton
author_twitter: gableroux
categories: engineering
image_title: '/images/blogimages/test-all-the-things-in-gitlab-ci-with-docker-by-example.jpg'
description: "Running tests is easier than you think – guest author Gabriel Le Breton shares his presentation about testing everything automatically with GitLab CI/CD."
guest: true
tags: user stories, CI/CD
---

Do you write tests? Or do you skip them because it’s too complicated to run? Or maybe developers on your team just don’t care? You should take a few minutes and set up CI so you can enforce good practices. Good news, you can test [all the things](http://knowyourmeme.com/memes/all-the-things) automagically in [GitLab CI/CD](/features/continuous-integration/) with Docker and very little effort 🤘

<!-- more -->

I recently gave a presentation at the [SagLacIO](http://saglac.io/) about [GitLab CI/CD](/features/continuous-integration/).

## Getting started

First, you’ll need an account at [GitLab.com](https://gitlab.com/). If you don’t already have one, you can open an account with no problem. [GitLab’s free tier](/stages-devops-lifecycle/) gives you a ton of features, unlimited free hosted repositories, 2,000 CI build minutes per month, etc. You can even use your own task runners in case you bust that limit.

### Useful links

- [GitLab.com](https://gitlab.com/)
- [GitLab CI/CD documentation](https://docs.gitlab.com/ee/ci/) 📗
- [.gitlab-ci.yml documentation](https://docs.gitlab.com/ee/ci/yaml/) 📕
- [.gitlab-ci.yml linter: gitlab.com/ci/lint](https://gitlab.com/ci/lint/) ✅
- [gitlab-ci nodejs example project](https://gitlab.com/gableroux/gitlab-ci-example-nodejs)
- [gitlab-ci Docker example project](https://gitlab.com/gableroux/gitlab-ci-example-docker)
- [gitlab-ci django example project](https://gitlab.com/gableroux/gitlab-ci-example-django)
- [Unity3D Docker project](https://gitlab.com/gableroux/unity3d) running in gitlab-ci and published to [Docker Hub](https://hub.docker.com/r/gableroux/unity3d/)
- [How to publish Docker images to Docker Hub from gitlab-ci on Stack Overflow](https://stackoverflow.com/questions/45517733/how-to-publish-docker-images-to-docker-hub-from-gitlab-ci)

## Here go the slides

Scroll through the slides from my presentation on GitLab CI/CD at SagLacIO, you’ll have fun 🤘

<figure class="video_container">
<iframe src="https://docs.google.com/presentation/d/10835yig54EbR_OQcxSXURkPk_0zkhLxaWHdRdXb-yWw/embed?start=false&amp;loop=false&amp;delayms=3000" frameborder="0" width="1280" height="749" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
</figure>

If you have suggestions, feel free to poke me or [open an issue](https://github.com/GabLeRoux/gableroux.github.io/issues).

 *[Test all the things in GitLab CI with Docker by example](https://gableroux.com/saglacio/2018/01/16/test-all-the-things-in-gitlab-ci-with-docker-by-example/) was originally published on gableroux.com.*

 *Cover photo by [Federico Beccari](https://unsplash.com/photos/ahi73ZN5P0Y?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/)*
 {: .note}
