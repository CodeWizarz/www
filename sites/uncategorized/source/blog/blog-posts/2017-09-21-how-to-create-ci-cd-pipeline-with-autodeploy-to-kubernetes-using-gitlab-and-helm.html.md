---
title: "How to create a CI/CD pipeline with Auto Deploy to Kubernetes using GitLab and Helm"
author: Sergey Nuzhdin
author_gitlab:
author_twitter: SergeyNuzhdin
categories: engineering
guest: true
image_title: '/images/blogimages/how-to-create-ci-cd-pipeline-with-autodeploy-to-kubernetes-using-gitlab-and-helm.jpg'
twitter_image: '/images/tweets/auto-deploy-gitlab-helm-tweet.png'
description: "One user walks through how he tried GitLab caching and split the job into multiple steps to get better feedback."
tags: CI/CD, user stories, tutorial
cta_button_text: 'Discover the benefits of GitLab CI/CD'
cta_button_link: '/why/use-continuous-integration-to-build-and-test-faster/'
related_posts:
  - "/blog/2020/07/06/beginner-guide-ci-cd/"
  - "/blog/2020/12/17/gitlab-for-cicd-agile-gitops-cloudnative/"
  - "/blog/2020/12/10/basics-of-gitlab-ci-updated/"
---


Recently, I started working on a few Golang [microservices](/topics/microservices/). I decided to try GitLab’s caching and split the job into multiple steps for better feedback in the UI.

<!-- more -->

Since my previous posts[[1](http://blog.lwolf.org/post/how-to-build-tiny-golang-docker-images-with-gitlab-ci/)][[2](http://blog.lwolf.org/post/continuous-deployment-to-kubernetes-from-gitlab-ci/)] about [CI/CD](/topics/ci-cd/), a lot has changed. I started using Helm charts for packaging applications, and stopped using docker-in-docker in gitlab-runner.

Here are a few of the main changes to my `.gitlab-ci.yml` file since my previous post:

* no docker-in-docker
* using cache for packages instead of a prebuilt image with dependencies
* splitting everything into multiple steps
* autodeploy to staging environment using Helm, a package manager for Kubernetes

### Building Golang image

Since Golang is very strict about the location of the project, we need to make some adjustments to the CI job. This is done in the `before_script` block. Simply create needed directories and link source code in there. Assuming that the official repository of the project is `gitlab.example.com/librerio/libr_files` it should look like this.


```
variables:
  APP_PATH: /go/src/gitlab.example.com/librerio/libr_files

before_script:
  - mkdir -p /go/src/gitlab.example.com/librerio/
  - ln -s $PWD ${APP_PATH}
  - mkdir -p ${APP_PATH}/vendor
  - cd ${APP_PATH}
```

With this in place, we can install dependencies and build our binaries. To avoid the download of all packages on each build we need to configure caching. Due to the strange caching rules of GitLab, we need to add vendor directory to both cache and artifacts. Cache will give us an ability to use it between build jobs and artifacts will allow us to use it inside the same job.


```

cache:
  untracked: true
  key: "$CI_BUILD_REF_NAME"
  paths:
    - vendor/

setup:
  stage: setup
  image: lwolf/golang-glide:0.12.3
  script:
    - glide install -v
  artifacts:
    paths:
     - vendor/

```

Build step didn’t change, it’s still about building the binary. I add binary to artifacts.

```
build:
  stage: build
  image: lwolf/golang-glide:0.12.3
  script:
    - cd ${APP_PATH}
    - GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o release/app -ldflags '-w -s'
    - cd release
  artifacts:
    paths:
     - release/
```

###  Test stage

To run golang tests with coverage reports I’m using the variation of [this shell script](https://github.com/mlafeldt/chef-runner/blob/v0.7.0/script/coverage). It runs all tests in project subdirectories and creates a [coverage report](/blog/2016/11/03/publish-code-coverage-report-with-gitlab-pages/). I changed it a bit before putting into a gist. I exclude vendor directory from tests.

* coverage regexp for gitlab-ci: `^total:\s*\(statements\)\s*(\d+.\d+\%)`

### Deploy stage

I don’t use native GitLab’s integration with Kubernetes.

First I thought about creating Kubernetes secrets and mounting it to the gitlab-runner pod. But it’s very complicated. You need to upgrade deployment every time you want to add new Kubernetes cluster configurations. So I’m using GitLab’s CI/CD variables with base64 encoded Kubernetes config. Each project can have any number of configurations. The process is easy – create base64 string from the configuration file and copy it to the clipboard. After this, put it into `kube_config` variable (name it whatever you like).

`cat ~/.kube/config | base64 | pbcopy`

If you do not own a full GitLab installation, consider creating a Kubernetes user with restricted permissions.

Then on the deploy stage, we can decode this variable back into the file and use it with kubectl.

```
variables:
  KUBECONFIG: /etc/deploy/config

deploy:
  ...
  before_script:
    - mkdir -p /etc/deploy
    - echo ${kube_config} | base64 -d > ${KUBECONFIG}
    - kubectl config use-context homekube
    - helm init --client-only
    - helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    - helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
    - helm repo update
```

Deploy stage also covers the case when you have several versions of the same application.

For example, you have two versions of API: v1.0 and v1.1. All you need to do is set `appVersion` in Chart.yaml file. Build system will check API version and either deploy or upgrade needed release.

```
- export API_VERSION="$(grep "appVersion" Chart.yaml | cut -d" " -f2)"
- export RELEASE_NAME="libr-files-v${API_VERSION/./-}"
- export DEPLOYS=$(helm ls | grep $RELEASE_NAME | wc -l)
- if [ ${DEPLOYS}  -eq 0 ]; then helm install --name=${RELEASE_NAME} . --namespace=${STAGING_NAMESPACE}; else helm upgrade ${RELEASE_NAME} . --namespace=${STAGING_NAMESPACE}; fi
```

### tl;dr

```
Here is complete `.gitlab-ci.yaml` file for reference.

cache:
  untracked: true
  key: "$CI_BUILD_REF_NAME"
  paths:
    - vendor/

before_script:
  - mkdir -p /go/src/gitlab.example.com/librerio/
  - ln -s $PWD ${APP_PATH}
  - mkdir -p ${APP_PATH}/vendor
  - cd ${APP_PATH}

stages:
  - setup
  - test
  - build
  - release
  - deploy

variables:
  CONTAINER_IMAGE: ${CI_REGISTRY}/${CI_PROJECT_PATH}:${CI_BUILD_REF_NAME}_${CI_BUILD_REF}
  CONTAINER_IMAGE_LATEST: ${CI_REGISTRY}/${CI_PROJECT_PATH}:latest
  DOCKER_DRIVER: overlay2

  KUBECONFIG: /etc/deploy/config
  STAGING_NAMESPACE: app-stage
  PRODUCTION_NAMESPACE: app-prod

  APP_PATH: /go/src/gitlab.example.com/librerio/libr_files
  POSTGRES_USER: gorma
  POSTGRES_DB: test-${CI_BUILD_REF}
  POSTGRES_PASSWORD: gorma

setup:
  stage: setup
  image: lwolf/golang-glide:0.12.3
  script:
    - glide install -v
  artifacts:
    paths:
     - vendor/

build:
  stage: build
  image: lwolf/golang-glide:0.12.3
  script:
    - cd ${APP_PATH}
    - GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o release/app -ldflags '-w -s'
    - cd release
  artifacts:
    paths:
     - release/

release:
  stage: release
  image: docker:latest
  script:
    - cd ${APP_PATH}/release
    - docker login -u gitlab-ci-token -p ${CI_BUILD_TOKEN} ${CI_REGISTRY}
    - docker build -t ${CONTAINER_IMAGE} .
    - docker tag ${CONTAINER_IMAGE} ${CONTAINER_IMAGE_LATEST}
    - docker push ${CONTAINER_IMAGE}
    - docker push ${CONTAINER_IMAGE_LATEST}

test:
  stage: test
  image: lwolf/golang-glide:0.12.3
  services:
    - postgres:9.6
  script:
    - cd ${APP_PATH}
    - curl -o coverage.sh https://gist.githubusercontent.com/lwolf/3764a3b6cd08387e80aa6ca3b9534b8a/raw
    - sh coverage.sh

deploy_staging:
  stage: deploy
  image: lwolf/helm-kubectl-docker:v152_213
  before_script:
    - mkdir -p /etc/deploy
    - echo ${kube_config} | base64 -d > ${KUBECONFIG}
    - kubectl config use-context homekube
    - helm init --client-only
    - helm repo add stable https://kubernetes-charts.storage.googleapis.com/
    - helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/
    - helm repo update
  script:
    - cd deploy/libr-files
    - helm dep build
    - export API_VERSION="$(grep "appVersion" Chart.yaml | cut -d" " -f2)"
    - export RELEASE_NAME="libr-files-v${API_VERSION/./-}"
    - export DEPLOYS=$(helm ls | grep $RELEASE_NAME | wc -l)
    - if [ ${DEPLOYS}  -eq 0 ]; then helm install --name=${RELEASE_NAME} . --namespace=${STAGING_NAMESPACE}; else helm upgrade ${RELEASE_NAME} . --namespace=${STAGING_NAMESPACE}; fi
  environment:
    name: staging
    url: https://librerio.example.com
  only:
  - master

```


_[How to create a CI/CD pipeline with Auto Deploy to Kubernetes using GitLab and Helm](http://blog.lwolf.org/post/how-to-create-ci-cd-pipeline-with-autodeploy-k8s-gitlab-helm/) was originally published on Lwolfs Blog._

Photo by C Chapman on [Unsplash](https://unsplash.com/)
{: .note}
