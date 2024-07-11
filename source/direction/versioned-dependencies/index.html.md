---
layout: handbook-page-toc
title: "Product Vision - Versioned Dependencies"
---

- TOC
{:toc}

Some projects generate packages as output, that are then included as dependencies in other projects - perhaps within the same company/org, or external. Usually these packages are versioned. e.g. Node.js modules published to https://www.npmjs.com/ (public or private).

There are several challenges specific to this use case, including deployment, review apps, testing, and version number handling.

Today, if you have a manual gate to production, the act of clicking the manual approval button simply starts the deployment to production, but if the output is a package and it needs to be versioned, then the act of approving has to have the side effect of bumping the version number. This year, we're investigating how best to automate that, or how to continuously version.

## What's next & why
TBD

## North Stars
TBD

## Stages with a version-dependency focus

There are several stages involved in delivering a comprehensive, quality version dependencies experience at GitLab. These include, but are not necessarily limited to the following:
- [Package](/direction/package/)
- [Release](/direction/release/)

## Highlighted epics and issues

There are a few epics and important issues you can check out to see where we're headed.

TBD
