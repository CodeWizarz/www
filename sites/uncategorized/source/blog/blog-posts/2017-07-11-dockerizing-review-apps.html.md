---
title: "Dockerizing GitLab Review Apps"
author: Stephan Hochdörfer
author_twitter: shochdoerfer
guest: True
categories: engineering
image_title: '/images/blogimages/dockerizing-review-apps.jpg'
twitter_image: '/images/tweets/dockerizing-gitlab-review-apps.png'
description: "A GitLab user shows us how to deploy Docker containers as a Review App."
tags: user stories, CI/CD
---

Last year GitLab introduced the [Review Apps](/stages-devops-lifecycle/review-apps/) feature. Review Apps are app environments that are created dynamically every time you push a new branch up to GitLab. As a bonus point the app environments are automatically deleted when the branch is deleted. Since we moved to using Docker for quite a few of our projects I was keen on figuring out how to combine Docker and the GitLab Review Apps functionality as the documentation only mentions NGINX as a way to run Review Apps. As it turns out, it is rather simple to deploy Docker containers as a Review App.

<!-- more -->

In our scenario the GitLab Runner for building the Docker image and the GitLab Runner for "running" the Review Apps make use of the shell executor, that way we do not have to deal with Docker-in-Docker issues. Besides installing the gitlab-ci-multi-runner package we also installed Docker and docker-compose.

First of all, we define two build stages in the .gitlab-ci.yml file – the build and deploy stage:

```html
stages:
  - build
  - deploy
  ```

The build stage is defined like this:
```html
build:
  tags:
    - php7
  stage: build
  script:
    - echo "Building the app"
    - composer.phar install
    - docker build -t myproject/myapp .
    - docker tag myproject/myapp:latest \
      registry.loc/myproject/myapp:$CI_COMMIT_REF_NAME
    - docker push registry.loc/myproject/myapp:$CI_COMMIT_REF_NAME
  only:
  - master
  ```

This will create the Docker image and push it to our Sonatype Nexus instance which serves as a private Docker registry for us. As you can see I make use of the $CI_COMMIT_REF_NAME variable when tagging the Docker image. That way, we end up with a Docker image per branch. Downside: you cannot use characters in the branch name which are no valid Docker version identifiers. I still need to figure out a fix for this.

The deploy stage consists of two jobs: one for deploying the container, the other for undeploying the container:

```html
deploy_dev:
  tags:
    - dev
  stage: deploy
  variables:
    GIT_STRATEGY: none
  script:
    - echo "Deploy to dev.loc"
    - docker pull registry.loc/myproject/myapp:$CI_COMMIT_REF_NAME
    - docker stop reviewapp-demo-$CI_COMMIT_REF_NAME || true
    - docker rm reviewapp-demo-$CI_COMMIT_REF_NAME || true
    - docker run -d -P -l traefik.enable=true \
      -l traefik.frontend.rule=Host:reviewapp.dev.loc \
      -l traefik.protocol=http --name reviewapp-demo-$CI_COMMIT_REF_NAME \
      registry.loc/myproject/myapp:$CI_COMMIT_REF_NAME
  environment:
    name: dev
    url: http://reviewapp.dev.loc
  only:
  - master
  ```

When this code is run it will simply pull the latest image from the private Docker registry and run it. Since the gitlab-runner user will push the image to the registry the user needs an account there and needs to be authenticated against the registry. I could not find a way how to configure the registry credentials via the .gitlab.yml file, so I ssh'ed into the boxes and manually run a "docker login registry.loc" for the gitlab-runner user. Currently we do not have many servers - virtual machines in our case - so that approach is fine, but does not scale in the future.

When running the container we set a fixed name for the container. That way, we can easily stop it when it comes to the undeploy job. We also define some Traefik labels as we use Traefik in front of the docker daemon to route the requests. Traefik itself runs in a container as well. The Traefik container is launched like this:

```html
docker run -d --restart=always -p 8080:8080 -p 80:80 -p 443:443 \
-l traefik.enable=false --name=traefik \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /etc/traefik/traefik.toml:/etc/traefik/traefik.toml \
-v /etc/traefik/ssl/cert.key:/etc/traefik/ssl/cert.key \
-v /etc/traefik/ssl/cert.pem:/etc/traefik/ssl/cert.pem \
traefik
```

We do not use any fancy Traefik configuration, just the defaults for the docker backend. Since the Review Apps server runs in our intranet and uses our intranet domain name we were not able to use the Let's Encrypt support built in Traefik. Instead, we were required to generate a self-signed SSL certificate and mount that in the Traefik container.

The undeploy job is the final piece of the puzzle. GitLab allows you to manually stop Review Apps by clicking a Pause button the GitLab UI. To undeploy a Review App we simply stop and remove the container by the defined name.

```html
undeploy_dev:
  tags:
    - dev
  stage: deploy
  variables:
    GIT_STRATEGY: none
  script:
    - echo "Remove review app from dev.loc"
    - docker stop reviewapp-demo-$CI_COMMIT_REF_NAME || true
    - docker rm reviewapp-demo-$CI_COMMIT_REF_NAME || true
  when: manual
  environment:
    name: dev
    action: stop
```

Both the deploy_dev and the undeploy_dev job are bound by the tag "dev" to the dev server which hosts our docker instances. That way the docker instances will always start on the right server.

## About the Author

[Stephan Hochdörfer](https://twitter.com/shochdoerfer) currently holds the position of Head of Technology at [bitExpert AG](https://www.bitexpert.de), a company specializing in software and mobile development. His primary focus is everything related to web development as well as automation techniques ranging from code generation to deployment automation.

_This post was originally published on [blog.bitexpert.de](https://blog.bitexpert.de/blog/dockerizing-gitlab-review-apps/)._

[Cover image](https://unsplash.com/@guibolduc?photo=uBe2mknURG4) by [Guillaume Bolduc](https://unsplash.com/@guibolduc) on Unsplash
{: .note}
