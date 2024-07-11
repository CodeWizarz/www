---
title: "How to deploy Shopify themes with GitLab"
author: Austin Regnery
author_gitlab: aregnery
author_twitter: reglyson
categories: engineering
image_title: '/images/blogimages/storefront.jpg'
description: "Streamline your development workflow by configuring auto deployments for Shopify themes with GitLab pipelines."
tags: eCommerce, tutorial
twitter_text: "Streamline your development workflow by configuring auto deployments for Shopify themes with GitLab pipelines. Our tutorial shows you how."
postType: content marketing
featured: no # reviewer should set
related_posts:
- "blog/2015/07/29/feature-highlight-merge-request-approvals/"
- "blog/2020/12/14/merge-trains-explained/"
- "blog/2019/07/12/guide-to-ci-cd-pipelines/"
---

[1.75 million sellers are using Shopify's eCommerce platform](https://backlinko.com/shopify-stores), and every one of these online stores has a codebase that lives somewhere. You may have encountered some challenges while scaling your development efforts at your organization while working within Shopify. Setting up a process for repeatable deployments with GitLab can keep everything streamlined and safe. No one wants something going live in production before it's ready.

Here's a simple development flow you are going to be able to replicate using GitLab CI/CD pipelines for Shopify theme deployments.

1. Develop locally on a feature branch until you are happy with your local changes
2. Merge your `feature` branch into your `main` branch → This will update the staging theme in Shopify
3. When everything is ready to go live, create a new tag and push it to GitLab → The live theme will be updated automatically 🎉

This tutorial assumes you have set up a repository in a GitLab project.

## 1. Add your variables

For security purposes, you don't want to store your credentials for your Shopify site in your configuration file. You can use variables in GitLab to handle that.

Use the [ThemeKit CLI](https://shopify.github.io/themekit/configuration/) to retrieve all the available theme IDs from your Shopify store by entering this into your command line:

```curl
theme get --list -p=[shopify-api-access-token] -s=[your-store.myshopify.com]
```

> **Help:** [Generate API credentials in Shopify](https://shopify.dev/apps/auth/basic-http#step-2-generate-api-credentials)

Open your project in GitLab, navigate to `/settings/ci_cd`, and open the variables section.

Add four unique variables with their corresponding keys and values

| Key | Value |
| --- | ----- |
| `STAGING_THEME_ID`     | [staging-theme-id-number]    |
| `PRODUCTION_THEME_ID`  | [production-theme-id-number] |
| `SHOP_WEB_ADDRESS`     | [your-store.myshopify.com]   |
| `SHOPIFY_API_ACCESS_TOKEN` | [shopify-api-access-token]  |

> **Note:** A protected variable will not show in the CI logs, which adds an extra layer of security. If you choose to protect your variables, you need to make sure that your `main` branch and the tag `v*` wildcard are protected as well.

## 2. Add a `config.yml` to your project repository

This file may already exist, but `config.yml` needs to have the following to properly map the variables from step 1 with your Shopify theme for deployments.

```yml
staging:
  password: ${SHOPIFY_API_ACCESS_TOKEN}
  theme_id: ${STAGING_THEME_ID}
  store: ${SHOP_WEB_ADDRESS}

production:
  password: ${SHOPIFY_API_ACCESS_TOKEN}
  theme_id: ${PRODUCTION_THEME_ID}
  store: ${SHOP_WEB_ADDRESS}
```

## 3. Add a `.gitlab-ci.yml` file to your project

Now set up your pipeline to run on specific triggers. Go to your local theme folder, create a `.gitlab-ci.yml` file at the project root, and add the snippet below. This snippet is the configuration for the CI pipeline.

```yml
image: python:2

stages:
  - staging
  - production

staging:
  image: python:2
  stage: staging
  script:
    - curl -s https://shopify.github.io/themekit/scripts/install.py | python
    - theme deploy -e=staging
  only:
    variables:
      - $CI_DEFAULT_BRANCH == $CI_COMMIT_BRANCH

production:
  image: python:2
  stage: production
  script:
    - curl -s https://shopify.github.io/themekit/scripts/install.py | python
    - theme deploy -e=production --allow-live
  only:
    - tags

```

It has two stages: **staging** and **production**. Each will install the ThemeKit CLI first and then deploy the repository to the corresponding theme.

## 4. Now push some changes to deploy

Any code pushed to the `main` branch will set up a deployment to the staging theme in Shopify

```
git commit -am "commit message"
git push
```

When you are ready to push changes to production, add a tag and push it.

```
git tag -a "v1.0.0" -m "First release to production from GitLab"
git push --tags
```

> **Alternative option:** [Create a tag from GitLab](https://docs.gitlab.com/ee/user/project/releases/#create-a-release-in-the-tags-page)

That's it! You're now using CI to automate deployments from GitLab to your Shopify themes.

Further refine this workflow by [incorporating merge requests approvals](/blog/2015/07/29/feature-highlight-merge-request-approvals/), [setting up merge trains](/blog/2020/12/14/merge-trains-explained/), or learning more about [GitLab CI/CD pipelines](/blog/2019/07/12/guide-to-ci-cd-pipelines/).

Big thanks to Alex Gogl for their [blog](https://medium.com/@gogl.alex/how-to-deploy-shopify-themes-automatically-1ac17ee1229c). This `.gitlab-ci.yml` will appear as an available template when [merge request !52279](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/52279) is merged.

Cover image by [Artem Gavrysh](https://unsplash.com/@tmwd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/)
{: .note}
