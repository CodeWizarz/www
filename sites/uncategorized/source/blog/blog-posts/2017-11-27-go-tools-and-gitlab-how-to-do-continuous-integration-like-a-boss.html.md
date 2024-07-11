---
title: "Go tools and GitLab: How to do continuous integration like a boss"
author: Julien Andrieux
author_twitter: chilladx
categories: engineering
image_title: '/images/blogimages/go-tools-and-gitlab.jpg'
description: "How the team at Pantomath makes their lives easier with GitLab CI."
guest: true
twitter_text: "How to do CI like a boss"
tags: CI/CD, user stories, tutorial
---

At [Pantomath](https://pantomath.io/), we use [GitLab](/) for all our development work. The purpose of this paper is not to present GitLab and all [its features](/features/), but to introduce how we use these tools to ease our lives. So what is it all about? To automate everything that is related to your development project, and let you focus on your code.

<!-- more -->

We’ll cover the [lint](https://en.wikipedia.org/wiki/Lint_(software)), [unit tests](https://en.wikipedia.org/wiki/Unit_testing), [data race](https://en.wikipedia.org/wiki/Race_condition), [memory sanitizer](https://clang.llvm.org/docs/MemorySanitizer.html), [code coverage](https://en.wikipedia.org/wiki/Code_coverage), and build.

All the source code shown in this post is available at [gitlab.com/pantomath-io/demo-tools](https://gitlab.com/pantomath-io/demo-tools). So feel free to get the repository, and use the tags to navigate in it. The repository should be placed in the `src` folder of your `$GOPATH`:

```bash
$ go get -v -d gitlab.com/pantomath-io/demo-tools
$ cd $GOPATH/src/gitlab.com/pantomath-io/demo-tools
```

### Go tools

Luckily, `Go` — the open source programming language also known as golang — comes with a [lot of useful tools](https://golang.org/cmd/go/), to build, test, and check your code. In fact, it’s all there. We’ll just add extra tools to glue them together. But before we go there, we need to take them one by one, and see what they do.

#### Package list

Your Go project is a collection of packages, as described in the [official doc](https://golang.org/doc/code.html). Most of the following tools will be fed with these packages, and thus the first command we need is a way to list the packages. Hopefully, the `Go` language covers our back with the `list` subcommand ([read the fine manual](https://golang.org/cmd/go/#hdr-List_packages) and this [excellent post from Dave Cheney](https://dave.cheney.net/2014/09/14/go-list-your-swiss-army-knife)):

```bash
$ go list ./...
```

Note that we want to avoid applying our tools on external packages or resources, and restrict it to **our** code. So we need to get rid of the [vendor directories](https://golang.org/cmd/go/#hdr-Vendor_Directories):

```bash
$ go list ./... | grep -v /vendor/
```

#### Lint

This is the very first tool we use on the code: the linter. Its role is to make sure that the code respects the code style. This may sounds like an optional tool, or at least a “nice-to-have” but it really helps to keep consistent style over your project.

This linter is not part of Go *per se*, so you need to grab it and install it by hand (see [official doc](https://github.com/golang/lint)).

The usage is fairly simple: you just run it on the packages of your code (you can also point the `.go` files):

```bash
$ golint -set_exit_status $(go list ./... | grep -v /vendor/)
```

Note the `-set_exit_status` option. By default, `golint` only prints the style issues, and returns (with a 0 return code), so the CI never considers something went wrong. If you specify the `-set_exit_status`, the return code from `golint` will be different from 0 if any style issue is encountered.

#### Unit test

These are the most common tests you can run on your code. For each `.go` file, we need to have an associated `_test.go` file holding the unit tests. You can run the tests for all the packages with the following command:

```bash
$ go test -short $(go list ./... | grep -v /vendor/)
```

#### Data race

This is usually a hard subject to cover, but the `Go` tool has it by default (but only available on `linux/amd64`, `freebsd/amd64`, `darwin/amd64` and `windows/amd64`). For more information about data race, see [this article](https://golang.org/doc/articles/race_detector.html). Meanwhile, here is how to run it:

```bash
$ go test -race -short $(go list ./... | grep -v /vendor/)
```

#### Memory sanitizer

Clang has a nice detector for uninitialized reads called [MemorySanitizer](https://clang.llvm.org/docs/MemorySanitizer.html). The `go test` tool is kind enough to interact with this Clang module (as soon as you are on `linux/amd64` host and using a recent version of Clang/LLVM (`>=3.8.0`). This command is how to run it:

```bash
$ go test -msan -short $(go list ./... | grep -v /vendor/)
```

#### Code coverage

This is also a must have to evaluate the health of your code, and see what the part of code is under unit tests and what part is not. [Rob Pike](https://twitter.com/rob_pike) wrote a [full post on that very subject](https://blog.golang.org/cover).

To calculate the code coverage ratio, we need to run the following script:

```bash
$ PKG_LIST=$(go list ./... | grep -v /vendor/)
$ for package in ${PKG_LIST}; do
    go test -covermode=count -coverprofile "cover/${package##*/}.cov" "$package" ;
done
$ tail -q -n +2 cover/*.cov >> cover/coverage.cov
$ go tool cover -func=cover/coverage.cov
```

If we want to get the coverage report in HTML format, we need to add the following command:

```bash
$ go tool cover -html=cover/coverage.cov -o coverage.html
```

#### Build

Last but not least, once the code has been fully tested, we might want to compile it to make sure we can build a working binary.

```bash
$ go build -i -v gitlab.com/pantomath-io/demo-tools
```

### Makefile

*git tag:* [init-makefile](https://gitlab.com/pantomath-io/demo-tools/tags/init-makefile)

![](https://cdn-images-1.medium.com/max/1600/1*Ip_q_6I-kNpUjuPMOutuTA.jpeg)
*<small>Photo by [Matt Artz](https://unsplash.com/photos/qJE5Svhs2ek?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)</small>*

Now we have all the tools that we may use in the context of continuous integration, we can wrap them all in a [Makefile](https://gitlab.com/pantomath-io/demo-tools/blob/init-makefile/Makefile), and have a consistent way to call them.

The purpose of this doc is not to present `make`, but you can refer to [official documentation](https://www.gnu.org/software/make/manual/make.html) to learn more about it.

    PROJECT_NAME := "demo-tools"
    PKG := "gitlab.com/pantomath-io/$(PROJECT_NAME)"
    PKG_LIST := $(shell go list ${PKG}/... | grep -v /vendor/)
    GO_FILES := $(shell find . -name '*.go' | grep -v /vendor/ | grep -v _test.go)

    .PHONY: all dep build clean test coverage coverhtml lint

    all: build

    lint: ## Lint the files
      @golint -set_exit_status ${PKG_LIST}

    test: ## Run unittests
      @go test -short ${PKG_LIST}

    race: dep ## Run data race detector
      @go test -race -short ${PKG_LIST}

    msan: dep ## Run memory sanitizer
      @go test -msan -short ${PKG_LIST}

    coverage: ## Generate global code coverage report
      ./tools/coverage.sh;

    coverhtml: ## Generate global code coverage report in HTML
      ./tools/coverage.sh html;

    dep: ## Get the dependencies
      @go get -v -d ./...

    build: dep ## Build the binary file
      @go build -i -v $(PKG)

    clean: ## Remove previous build
      @rm -f $(PROJECT_NAME)

    help: ## Display this help screen
      @grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

What do we have now? One target for any tool previously presented, and three more targets for:

* installation of dependencies (`dep`);
* housekeeping of the project (`clean`);
* some nice and shiny help (`help`).

Note that we also had to create a script for the code coverage work. This is because implementing loops over files in a Makefile is a pain. So the work is done in a `bash` script, and the Makefile only triggers this script.

You can try the Makefile with the following commands:

    $ make help
    $ make lint
    $ make coverage

### Continuous integration

*git tag:* [init-ci](https://gitlab.com/pantomath-io/demo-tools/tags/init-ci)

Now the tools are in place, and we can run various tests on our code, we’d like to automate these, on your repository. Luckily, GitLab offers [CI pipelines](/features/continuous-integration/) just for this. And the setup for this is pretty straightforward: all you create is a `.gitlab-ci.yml` file at the root of the repository.

The [full documentation](https://docs.gitlab.com/ee/ci/yaml/) on this Yaml file presents all the options, but you can start with this `.gitlab-ci.yml`:

```yaml
image: golang:1.9

cache:
  paths:
    - /apt-cache
    - /go/src/github.com
    - /go/src/golang.org
    - /go/src/google.golang.org
    - /go/src/gopkg.in

stages:
  - test
  - build

before_script:
  - mkdir -p /go/src/gitlab.com/pantomath-io /go/src/_/builds
  - cp -r $CI_PROJECT_DIR /go/src/gitlab.com/pantomath-io/pantomath
  - ln -s /go/src/gitlab.com/pantomath-io /go/src/_/builds/pantomath-io
  - make dep

unit_tests:
  stage: test
  script:
    - make test

race_detector:
  stage: test
  script:
    - make race

memory_sanitizer:
  stage: test
  script:
    - make msan

code_coverage:
  stage: test
  script:
    - make coverage

code_coverage_report:
  stage: test
  script:
    - make coverhtml
  only:
  - master

lint_code:
  stage: test
  script:
    - make lint

build:
  stage: build
  script:
    - make
```

If you break down the file, here are some explanations on its content:

* The first thing is to choose what Docker image will be used to run the CI. Head to the [Docker Hub](https://hub.docker.com/) to choose the right image for your project.
* Then, you specify some folders of this image [to be cached](https://docs.gitlab.com/ee/ci/yaml/#cache). The goal here is to avoid downloading the same content several times. Once a job is completed, the listed paths will be archived, and next job will use the same archive.
* You define the different `stages` that will group your jobs. In our case, we have two [stages](https://docs.gitlab.com/ee/ci/yaml/#stages) (to be processed in that order): `test` and `build`. We could have other stages, such as `deploy`.
* The `before_script` [section](https://docs.gitlab.com/ee/ci/yaml/#before_script) defines the commands to run in the Docker container right before the job is actually done. In our context, the commands just copy or link the repository deployed in the `$GOPATH`, and install dependencies.
* Then come the actual [jobs](https://docs.gitlab.com/ee/ci/jobs/), using the `Makefile` targets. Note the special case for `code_coverage_report` where execution is restricted to the `master` branch (we don’t want to update the code coverage report from feature branches for instance).

As we commit/push the `.gitlab-ci.yml` file in the repository, the CI is [automatically triggered](https://gitlab.com/pantomath-io/demo-tools/pipelines/13481935). And the pipeline fails. Howcome?

The `lint_code` [job](https://gitlab.com/pantomath-io/demo-tools/-/jobs/38690212) fails because it can’t find the `golint` binary:

```bash
$ make lint
make: golint: Command not found
Makefile:11: recipe for target 'lint' failed
make: *** [lint] Error 127
```

So, [update](https://gitlab.com/pantomath-io/demo-toolscommit/17a0206eb626504e559f56773e2d81c7b5808dbe) your `Makefile` to install `golint` as part of the `dep` target.

The `memory_sanitizer` [job](https://gitlab.com/pantomath-io/demo-tools/-/jobs/38690209) fails because `gcc` complains:

```bash
$ make msan
# runtime/cgo
gcc: error: unrecognized argument to -fsanitize= option: 'memory'
Makefile:20: recipe for target 'msan' failed
make: *** [msan] Error 2
```

But remember we need to use Clang/LLVM `>=3.8.0` to enjoy the `-msan` option in `go test` command.

We have two options here:

* either we set up Clang in the job (using `before_script`);
* or we use a Docker image with Clang installed by default.

The first option is nice, but that implies to have this setup done **for every single job**. This is going to be so long, we should do it once and for all. So we prefer the second option, which is a good way to play with [GitLab Registry](https://docs.gitlab.com/ee/user/packages/container_registry/index.html).

*git tag:* [use-own-docker](https://gitlab.com/pantomath-io/demo-tools/tags/use-own-docker)

We need to create a [Dockerfile](https://gitlab.com/pantomath-io/demo-tools/blob/use-own-docker/Dockerfile) for the container (as usual: read the [official documentation](https://docs.docker.com/engine/reference/builder) for more options about it):

    # Base image:
    FROM golang:1.9
    MAINTAINER Julien Andrieux <julien@pantomath.io>

    # Install golint
    ENV GOPATH /go
    ENV PATH ${GOPATH}/bin:$PATH
    RUN go get -u github.com/golang/lint/golint

    # Add apt key for LLVM repository
    RUN wget -O -
     | apt-key add -

    # Add LLVM apt repository
    RUN echo "deb
     llvm-toolchain-stretch-5.0 main" | tee -a /etc/apt/sources.list

    # Install clang from LLVM repository
    RUN apt-get update && apt-get install -y --no-install-recommends \
        clang-5.0 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

    # Set Clang as default CC
    ENV set_clang /etc/profile.d/set-clang-cc.sh
    RUN echo "export CC=clang-5.0" | tee -a ${set_clang} && chmod a+x ${set_clang}

The container built out of this Dockerfile will be based on [golang:1.9](https://hub.docker.com/_/golang/) image (the one referenced in the `.gitlab-ci.yml` file).

While we’re at it, we install `golint` in the container, so we have it available. Then we follow [official way](http://apt.llvm.org/) of installing Clang 5.0 from LLVM repository.

Now we have the Dockerfile in place, we need to build the container image and make it available for GitLab:

```bash
$ docker login registry.gitlab.com
$ docker build -t registry.gitlab.com/pantomath-io/demo-tools .
$ docker push registry.gitlab.com/pantomath-io/demo-tools
```

The first command connects you to the GitLab Registry. Then you build the container image described in the Dockerfile. And finally, you push it to the GitLab Registry.

Take a look at the [Registry for your repository](https://gitlab.com/pantomath-io/demo-tools/container_registry), you’ll see your image, ready to be used. And to have the CI using your image, you just need to update the `.gitlab-ci.yml` file:

    image: golang:1.9

becomes

    image: registry.gitlab.com/pantomath-io/demo-tools:latest

One last detail: you need to tell the CI to use the proper compiler (i.e. the `CC` environment variable), so we add the variable initialization in the `.gitlab-ci.yml` file:

    export CC=clang-5.0

Once the modification are done, next commit will trigger the pipeline, which now works:

[gitlab.com/pantomath-io/demo-tools/pipelines/13497136](https://gitlab.com/pantomath-io/demo-tools/pipelines/13497136)

### Badges

*git tag:* [init-badges](https://gitlab.com/pantomath-io/demo-tools/tags/init-badges)

![](https://cdn-images-1.medium.com/max/1600/1*0pY_6oCiHZ_eLh0vfg5rDA.jpeg)

*<small>Photo by [Jakob Owens](https://unsplash.com/photos/ZBadHaTUkP0?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)</small>*

Now the tools are in place, every commit will launch a test suite, and you probably want to show it, and that’s legitimate :) The best way to do so is to use badges, and the best place for it is the `README` [file](https://gitlab.com/pantomath-io/demo-tools/blob/init-badges/README.md).

Edit it and add the four following badges:

* Build Status: the status of the last pipeline on the `master` branch:

```
[![Build Status](https://gitlab.com/pantomath-io/demo-tools/badges/master/build.svg)](https://gitlab.com/pantomath-io/demo-tools/commits/master)
```

* Coverage Report: the percentage of source code covered by tests

```
[![Coverage Report](https://gitlab.com/pantomath-io/demo-tools/badges/master/coverage.svg)](https://gitlab.com/pantomath-io/demo-tools/commits/master)
```

* Go Report Card:

```
[![Go Report Card](https://goreportcard.com/badge/gitlab.com/pantomath-io/demo-tools)](https://goreportcard.com/report/gitlab.com/pantomath-io/demo-tools)
```

* License:

```
[![License MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg)
```

The coverage report needs a special configuration. You need to tell GitLab how to get that information, considering that there is a job in the CI that *displays* it when it runs.<br> There is a [configuration](https://gitlab.com/help/user/project/pipelines/settings#test-coverage-parsing) to provide GitLab with a regexp, used in any job’ output. If the regexp matches, GitLab consider the match to be the code coverage result.

So head to `Settings > CI/CD` in your repository, scroll down to the `Test coverage parsing` setting in the `General pipelines settings` section, and use the following regexp:

    total:\s+\(statements\)\s+(\d+.\d+\%)

You’re all set! Head to the [overview of your repository](https://gitlab.com/pantomath-io/demo-tools/tree/init-badges), and look at your `README`:

### Conclusion

What’s next? Probably more tests in your CI. You can also look at the CD ([Continuous Deployment](https://docs.gitlab.com/ee/ci/environments/index.html)) to automate the deployment of your builds. The documentation can be done using [GoDoc](https://godoc.org/-/about). Note that you generate a coverage report with the `code_coverage_report`, but don’t use it in the CI. You can make the job copy the HTML file to a web server, using `scp` (see this [documentation](https://docs.gitlab.com/ee/ci/ssh_keys/) on how to use SSH keys).

Many thanks to [Charles Francoise](https://dev.to/loderunner) who co-wrote this paper and [gitlab.com/pantomath-io/demo-tools](https://gitlab.com/pantomath-io/demo-tools).

## About the Guest Author

Julien Andrieux is currently working on Pantomath. Pantomath is a modern, open source monitoring solution, built for performance, that bridges the gaps across all levels of your company. The wellbeing of your infrastructure is everyone’s business. [Keep up with the project](http://goo.gl/tcxtXq).

 *[Go tools & GitLab — how to do Continuous Integration like a boss](https://medium.com/pantomath/go-tools-gitlab-how-to-do-continuous-integration-like-a-boss-941a3a9ad0b6) was originally published on Medium.*

*Cover photo by [Todd Quackenbush](https://unsplash.com/photos/IClZBVw5W5A?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)*
{: .note}
