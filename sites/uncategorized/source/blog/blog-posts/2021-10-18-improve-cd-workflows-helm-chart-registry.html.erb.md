---
title: "Get started with GitLab's Helm Package Registry"
author: Philip Welz
author_gitlab: phil.xx
author_twitter: philip_welz
categories: devops platform
image_title: '/images/blogimages/cover-image-helm-registry.jpeg'
description: "Improve CD workflows and speed up application deployment using our new Helm Package Registry."
tags:  DevOps, CD, kubernetes
twitter_text: "Improve your CD workflows with the new Helm Chart registry in @gitLab"
featured: no
postType: content marketing
related_posts:
  - "/blog/2021/07/26/gitlab-helm-package-registry/"
---

In our 14.1 release, we offered the ability to add Helm charts to the GitLab Package Registry. Here's everything you need to know to leverage application deployment with these new features.

## The role of container images

The de-facto standard is to package applications into [OCI Images](https://github.com/opencontainers/image-spec) which are often just referred to as `container images` and more often as `Docker containers`. The [Open Container Initiative](https://opencontainers.org/) was launched in 2015 by Docker and other companies to define industry standards around container image formats and runtimes. GitLab introduced an OCI conform [Container Registry](/blog/2016/05/23/gitlab-container-registry/) with the release of [GitLab 8.8](/releases/2016/05/22/gitlab-8-8-released/) in May 2016.

Today, a common and widely adopted approach is to deploy applications with [Helm charts](https://helm.sh/) to [Kubernetes](https://kubernetes.io/). This will be covered in this blog together with the feature release in [GitLab 14.1](/releases/2021/07/22/gitlab-14-1-released/) of adding Helm Charts to the [GitLab Package Registry](https://docs.gitlab.com/ee/user/packages/package_registry/).

### Install software to Kubernetes

In the [DevOps](https://about.gitlab.com/topics/devops/) era, [APIs](https://en.wikipedia.org/wiki/API) became incredibly popular, helping to drive demand for Kubernetes.

The core of Kubernetes' control plane is the API server. The API server exposes an HTTP REST API that lets end users, different parts of your cluster, and external components communicate with one another.

To interact with the API server we can use the command-line tool [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) - although it would be also possible to use software development kits (SDKs) or any client that understands REST like curl that was released 1997.

But which data format is best to use?

Modern APIs most likely use JSON. JSON is a human-readable format that provides provide access to machine-readable data. Here is an example for Kubernetes:

```json
{
    "kind": "Pod",
    "apiVersion": "v1",
    "metadata": {
        "name": "nginx",
        "creationTimestamp": null,
        "labels": {
            "run": "nginx"
        }
    },
    "spec": {
        "containers": [
            {
                "name": "nginx",
                "image": "nginx",
                "resources": {}
            }
        ],
        "restartPolicy": "Always",
        "dnsPolicy": "ClusterFirst"
    },
    "status": {}
}
```

One downside of JSON is that comments are not supported. That is one several reasons why YAML stepped in and took the spot as the de-facto language to use for declarative configurations. The Kubernetes API transforms YAML to JSON behind the scenes. As you can easily convert back and forth between both, YAML tends to be more user-friendly. Nginx example Pod in YAML:

```yaml
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: nginx
  name: nginx
spec:
  Containers:
  # NOTE: If no tag is specified latest will be used
  - image: nginx
    name: nginx
    # TODO
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```

Now you are ready to save our YAML code in a file called `nginx.yaml` and deploy it into Kubernetes:

```shell
$ kubectl apply --filename=nginx.yaml 
```

### Create a Helm chart

Applying YAML configuration files can get overwhelming, especially when needing to deploy into several environments or wanting to version the manifests. It is also cumbersome to maintain plain YAML files for more complex deployments which can easily extend to more than 1000 lines per file.

Instead, how about using a format that packages our applications and makes them easily reproducible with templates? How about adding our own versioning scheme to this packaged application? How about deploying the same version with a few lines of code to multiple environments? This all comes with Helm.

To create a Helm package you have to ensure that the Helm CLI is [installed](https://helm.sh/docs/intro/install/) on your system (example with Homebrew on macOS: `brew install helm`).

```shell
$ helm create nginx 
```

Inspect the created Helm boilerplate files with `ls -lR` or `tree` on the CLI. This Helm chart can also be tested in a sandbox environment to verify it is operational.

```shell
.
├── Chart.yaml
├── charts
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── hpa.yaml
│   ├── ingress.yaml
│   ├── service.yaml
│   ├── serviceaccount.yaml
│   └── tests
│       └── test-connection.yaml
└── values.yaml
```

NOTE: You can read more about the starter Chart [here](https://helm.sh/docs/chart_template_guide/getting_started/).

Kindly Helm creates a starter chart directory along with the common files and directories used in a chart with NGINX as an example. We again can install this into our Kubernetes cluster:

```shell
$ helm install nginx .
```

### Package Distribution

Thus far, we have learned that applications are packaged in containers and are installed using a Helm chart. Both methods require central distribution storage that is publicly accessible, or accessible in your local network environment where the Kubernetes clusters are running.

The Helm documentation provides insights on [running your own Helm registry](https://helm.sh/docs/topics/registries/), similar to hosting your own Docker container registry.

What if we could avoid Do It Yourself DevOps and have both containers and Helm charts in one central DevOps platform? After maturing the [container registry in GitLab](https://docs.gitlab.com/ee/user/packages/container_registry/), community contributors helped add the [Helm chart registry](https://docs.gitlab.com/ee/user/packages/helm_repository/index.html) in 14.1.

Building the container image and Helm chart is part of the CI/CD pipeline stages and jobs. The missing bit is the automated production deployment using Helm charts in your Kubernetes cluster.

An additional benefit in CI/CD is reusing the authentication mechanism, and working in the same trust environment with security jobs before actually uploading and publishing any containers and charts.

### Build the Helm Chart

```shell
$ helm package nginx 
```

The command creates a new tar.gz archive ready to upload. Before doing so, you can inspect the archive with the `tar` command to verify its content.

```shell
$ tar ztf nginx-0.1.0.tgz

nginx/Chart.yaml
nginx/values.yaml
nginx/templates/NOTES.txt
nginx/templates/_helpers.tpl
nginx/templates/deployment.yaml
nginx/templates/hpa.yaml
nginx/templates/ingress.yaml
nginx/templates/service.yaml 
nginx/templates/serviceaccount.yaml
nginx/templates/tests/test-connection.yaml
nginx/.helmignore
```

### Push the Helm chart to the registry

With the [helm-push](https://github.com/chartmuseum/helm-push/#readme) plugin for Helm we can now upload the chart to the GitLab Helm Package Registry:

```shell
$ helm repo add --username <username> --password <personal_access_token> <REGISTRY_NAME> https://gitlab.com/api/v4/projects/<project_id>/packages/helm/stable
$ helm push nginx-0.1.0.tgz nginx
```

This step should be automated for a production-ready deployment with a GitLab CI/CD job.

```yaml
default:
  image: dtzar/helm-kubectl
  before_script:
    - 'helm repo add --username gitlab-ci-token --password ${CI_JOB_TOKEN} ${CI_PROJECT_NAME} ${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/helm/stable'
stages:
  - upload
upload:
  stage: upload
  script:
    - 'helm plugin install https://github.com/chartmuseum/helm-push.git'
    - 'helm push ./charts/podtatoserver-0.1.0.tgz ${CI_PROJECT_NAME}'
```

### Install the Helm chart

First, add the Helm chart registry to your local CLI configuration and test the manual installation.

```shell
$ helm repo add --username <username> --password <personal_access_token> <REGISTRY_NAME> https://gitlab.com/api/v4/projects/<project_id>/packages/helm/stable
$ helm install --name nginx <REGISTRY_NAME>/nginx
```

Once it works, you can continue with adding an automated installation job into the CI/CD pipeline.

```yaml
default:
  image: alpine/helm
  before_script:
    - 'helm repo add --username gitlab-ci-token --password ${CI_JOB_TOKEN} ${CI_PROJECT_NAME} ${CI_API_V4_URL}/projects/${CI_PROJECT_ID}/packages/helm/stable'
stages:
  - install
upload:
  stage: install
  script:
    - 'helm repo update'
    - 'helm install --name nginx ${CI_PROJECT_NAME}/nginx'
```

### Complete your DevOps lifecycle

You can learn more about the newest GitLab registries for Helm and Terraform in this [#EveryoneCanContribute cafe session](https://everyonecancontribute.com/post/2021-07-28-cafe-40-terraform-helm-gitlab-registry/) and inspect the [deployment repository](https://gitlab.com/everyonecancontribute/kubernetes/civo-k3s).

Try the Helm chart registry and share your workflows. Are there any features missing to complete your DevOps lifecycle? Let us know [on Discord](https://discord.gg/qgQWhD6wWV).

Cover image by [Joseph Barrientos](https://unsplash.com/@jbcreate_) on [Unsplash](https://unsplash.com/photos/eUMEWE-7Ewg)
{: .note}
