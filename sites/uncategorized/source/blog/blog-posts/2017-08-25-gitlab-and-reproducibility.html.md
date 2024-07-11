---
title: "How GitLab can help in research reproducibility"
author: Vicky Steeves
author_gitlab: vickysteeves
author_twitter: vickysteeves
categories: open source
guest: true
image_title: '/images/blogimages/gitlab-and-reproducibility.jpg'
twitter_image: '/images/tweets/gitlab-and-reproducibility.png'
description: "NYU reproducibility librarian Vicky Steeves shares why GitLab is her choice for ongoing collaborative research, and how it can help overcome challenges with sharing code in academia."
tags: open source, collaboration, user stories
---

GitLab is a great platform for active, ongoing, collaborative research. It enables folks to work together easily and share that work in the open. This is especially poignant given the problems in sharing code in academia, across time and people.

<!-- more -->

![phd-code-comic](https://phdcomics.com/comics/archive/phd031214s.gif)

It's no surprise that GitLab, a platform for collaborative coding and Git repository hosting, has features for reproducibility that researchers can leverage for their own and their communities’ benefit.

### What exactly is reproducibility?

Reproducibility is a core component in a variety of work, from software engineering to research. For software engineers, the ability to reproduce errors or functionality is key to development. For researchers, reproducibility is about independent verification of results/methods, to build on top of previous work, and to increase the impact, visibility, and quality of research. Y’know. That Sir Isaac Newton quote in every reproducibility presentation ever: "If I have seen further, it is by standing on the shoulders of giants."

Like all things, reproducibility exists on a spectrum. I like Stodden et al’s definitions from the [2013 ICERM report](http://stodden.net/icerm_report.pdf), so I’ll use those:

| ICERM Report Definitions                                                                       | Potential Real-World Examples                                                                                                  |
|:-----------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------|
| Reviewable Research: Sufficient detail for peer review and assessment                            | The code and data are openly available                                                                                         |
| Replicable Research: Tools are available to duplicate the author’s results using their data    | The tools (software) used in the analysis are freely available for others to confirm results                                   |
| Confirmable Research: Main conclusions can be attained independently without author’s software | Others can reach the conclusion using similar tools, not necessarily the same as the author, or on a different operating system |
| Auditable Research: Process and tools archived such that it can be defended later if necessary   | The tools, environment, data, and code are put into a preservation-ready format                                                |
| Open/Reproducible Research: Auditable research made openly available                           | Everything above is made available in a repository for others to examine and use                                               |

The last bullet there is the goal – open and reproducible research. Releasing code and data are key to open research, but not necessarily enough for reproducibility. This is where the concept of computational reproducibility becomes important, where whole environments are captured. You could also look at it this way:

![reproducibility-pyramid](https://osf.io/8rx9y/download)

### How can GitLab help?

There are a few solutions out there, including containers (such as Docker or Singularity) for active research, and [o2r](http://o2r.info/) and [ReproZip](https://reprozip.org) for capturing and reproducing completed research. For this post, I’m going to focus on active research and containers.

I like GitLab for research reproducibility because it makes working together simple, and seamless. There’s no hacking together 100 different third-party services. GitLab has hosting, LFS, and integrated Continuous Integration for free, for both public and private repositories! Everything is integrated in a single GitLab repository which, if made publicly available, can enable secondary users to reproduce results in a more streamlined fashion. You can also keep these private to a group – you control the visibility of everything in one repository in one place, as opposed to updating permissions across multiple services.

There are a few key features that set GitLab apart when it comes to containers and reproducibility. The first is that GitLab doesn’t use a third-party service for continuous integration. It’s shipped with CI runners which can use Docker images from GitLab’s registry. Basically, you can use the Docker Container Registry, a secure, private Docker registry, to choose a container that GitLab CI uses to run each job in a separate and isolated container.

![gitlab-ci-repro](/images/ci/arch-1.jpg)

If you don’t feel like using the GitLab registry, you can also use images from DockerHub or a custom Docker container you’re already using locally. These can be integrated with GitLab CI, and if made public, any secondary users can use it as well!

### Let's look at an example

This process is set up in a single file, a `.gitlab-ci.yml`. Another feature that makes my life easier – GitLab can syntax-check the CI config files! The `.gitlab-ci.yml` file describes the pipelines and stages, each of which has a different function and can have its own tags, produce its own artifacts, and reuse artifacts from other stages. These stages can also run in parallel if needed. Here’s an example of what a basic config file looks like with R:

```
image: jangorecki/r-base-dev
test:
  script:
    - R CMD build . --no-build-vignettes --no-manual
    - PKG_FILE_NAME=$(ls -1t *.tar.gz | head -n 1)
    - R CMD check "${PKG_FILE_NAME}" --no-build-vignettes --no-manual --as-cran
```

And here’s an example of building a website using the GitLab and the static site generator, Nikola:

```
image: registry.gitlab.com/paddy-hack/nikola:7.8.7
test:
  script:
  - nikola build
  except:
  - master

pages:
  script:
    - nikola build
  artifacts:
    paths:
    - public
  only:
  - master
```

It’s also worth noting that you can use different containers per step in your workflow, if you outline it in your .gitlab-ci.yml. If your data collection script runs in one environment but your analysis script needs another, that’s perfectly fine using GitLab, and others have the information to reproduce it easily! Another feature that puts GitLab apart is that a build of one project can trigger a build of another – AKA, multi-project pipelines. For those of you working with big data, you can automatically spin up and down VMs to make sure your builds get processed immediately with GitLab’s CI as well.

Here are some other great resources and examples of using GitLab to make research more reproducible:

+ [Gitlab-CI for R packages](https://gitlab.com/jangorecki/r.gitlab.ci)
+ [Blog Post explaining GitLab + reproducibility - Jon Zelner](http://www.jonzelner.net/statistics/make/docker/reproducibility/2016/05/31/reproducibility-pt-1/)
+ [GitLab repo accompanying blog post - Jon Zelner](https://gitlab.com/jzelner/reproducible-stan)
+ [Continuous Integration with Gitlab - Tony Wildish](https://www.nersc.gov/assets/Uploads/2017-02-06-Gitlab-CI.pdf)

Beyond reproducibility, there are a lot of features that make GitLab an ideal place for me to work and organize my research. I’d urge folks to look at the [feature list](/features/) and see how they can get started!

## About the Guest Author

Vicky Steeves is the Librarian for Research Data Management and Reproducibility at New York University, a dual appointment between the Division of Libraries and Center for Data Science. In this role, she works supporting researchers in creating well-managed, high quality, and reproducible research through facilitating use of tools such as ReproZip. Her research centers on integrating reproducible practices into the research workflow, advocating openness in all facets of scholarship, and building/contributing to open infrastructure.

“[research](https://www.flickr.com/photos/alovesdc/3464555556/)” by [a loves dc](https://www.flickr.com/photos/alovesdc/) is licensed under [CC BY 2.0](https://creativecommons.org/licenses/by/2.0/legalcode)
{: .note}
