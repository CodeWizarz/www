---
title: "Continuous integration: From Jenkins to GitLab using Docker"
author: Abdulkader Benchi
author_twitter: kader_benchi
guest: True
categories: open source
image_title: '/images/blogimages/continuous-integration-from-jenkins-to-gitlab-using-docker.jpg'
description: "We're migrating all of our working tools to open source ones, and moving to GitLab has made all the difference."
tags: open source, CI
---

 Here at [Linagora](https://linagora.com/), we are migrating all our working tools to open source ones. Yes, we are an open source company with open source lovers.

<!-- more -->

Among these different tools were the [Atlassian](https://www.atlassian.com/) development tools. We decided to switch to GitLab and it started making all the difference. Indeed, GitLab includes Git repository management, issue tracking, code review, an IDE, activity streams, wikis, and more. It's worth mentioning that GitLab has built-in [Continuous Integration (CI) and Continuous Deployment (CD)](/topics/ci-cd/) to test, build, and deploy our code. We can easily monitor the progress of our tests and build pipelines. What we love about the CI provided by GitLab is the fact that it supports Docker. Indeed, GitLab allows us to use custom [Docker](https://www.docker.com/) images, spin up services as part of testing, build new Docker images, even run on [Kubernetes](https://kubernetes.io/).

If you are a Docker lover and you want to see how to transform [Jenkins](https://jenkins.io/) CI to GitLab CI using Docker, then you are in the right place.

### Jenkins job

Let’s have a look at our Jenkins Job.

```
MONGOPORT=23500
BASEDIR=`pwd`

# Update tools
(cd repo && composer update)

# Run code style checker
./repo/vendor/bin/phpcs -p --standard=repo/vendor/sabre/dav/tests/phpcs/ruleset.xml --report-checkstyle=checkstyle.xml repo/lib/

# Cleanup
rm -rf mongodb
rm -f mongo.pid
rm -f mongo.log
mkdir -p mongodb


# Start temporary mongo server
mongod --dbpath mongodb \
       --port $MONGOPORT \
       --pidfilepath $BASEDIR/mongo.pid \
       --logpath mongo.log \
        --fork

sleep 2

# Configure
cat <<EOF > repo/config.json
{
  "webserver": {
    "baseUri": "/",
    "allowOrigin": "*"
  },
  "database": {
    "esn": {
      "connectionString" : "mongodb://localhost:$MONGOPORT/",
      "db": "esn",
      "connectionOptions": {
        "w": 1,
        "fsync": true,
        "connectTimeoutMS": 10000
      }
    },
    "sabre": {
      "connectionString" : "mongodb://localhost:$MONGOPORT/",
      "db": "sabredav",
      "connectionOptions": {
        "w": 1,
        "fsync": true,
        "connectTimeoutMS": 10000
      }
    }
  },
  "esn": {
    "apiRoot": "http://localhost:8080/api"
  }
}
EOF

# Run unit tests
(cd repo/tests && ../vendor/bin/phpunit \
    --coverage-clover=$BASEDIR/clover.xml \
    --log-junit=$BASEDIR/junit.xml \
    .)

# Clean up
kill `cat mongo.pid`
```

I know, it is horrible to read this configuration, but you know we have to configure everything from A to Z in Jenkins. I can confirm that this job is one of the simplest jobs we have, because it depends on only one external service, “MongoDB.” We passed almost half of this job configuring this external service, starting it, cleaning it and killing it. Whereas, our main job is only about 10 lines. Furthermore, we suppose that on the Jenkins machine, we already have installed PHP, all PHP plugins and composer. So if we change the machine we have to reconfigure the new machine before starting using it. Docker… help please.

![Docker help us](/images/blogimages/sos-docker.jpg){: .shadow}<br>

### GitLab job

Before starting, it's worth mentioning that good documentation about this part is presented [here](https://docs.gitlab.com/ee/ci/docker/using_docker_images.html). If you got it right, all GitLab’s CI configuration is to be done in a file called .gitlab-ci.yml. I will start presenting the final result before discussing the details:

```
image: linagora/php-deps-composer:5.6.30

services:
  - mongo:3.2

stages:
  - build
  - deploy_dev

build:
  stage: build
  script:
    - composer up
    - cp config.tests.json config.json
    - ./vendor/bin/phpcs -p --standard=vendor/sabre/dav/tests/phpcs/ruleset.xml --report-checkstyle=checkstyle.xml lib/
    - cd tests
    - ../vendor/bin/phpunit --coverage-clover=${CI_PROJECT_DIR}/clover.xml --log-junit=${CI_PROJECT_DIR}/junit.xml .

deploy_dev:
  stage: deploy_dev
  only:
    - master
  script:
    - cd /srv/sabre.dev
    - git fetch --all
    - git checkout ${CI_COMMIT_SHA}
    - composer up
```

### Migration procedure

We start defining the image of which of GitLab’s Docker executors will run to perform the CI tasks. This is done by using the image keyword (line 1). This is a custom image we build to provide all the dependencies we need for our CI tasks. Here is the corresponding Dockerfile:

```
FROM php:5.6.30

MAINTAINER Linagora Folks <lgs-openpaas-dev@linagora.com>

RUN apt-get update \
    apt-get -y install unzip git php5-curl php5-dev php-amqplib \
    docker-php-ext-install bcmath \
    pecl install mongo \
    docker-php-ext-enable mongo \
    curl https://getcomposer.org/installer | php \
    mv composer.phar /usr/local/bin/composer.phar \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
```

As I mentioned before, our CI requires an external MongoDB service. But this time, Docker is here to do the magic. It helps us with configuring, starting and killing the service correctly. All what we have to do is to declare mongo as a service (line 4), et voilà!

Now we have set up our environment, we can leverage script tag to test our code (lines 13–17) and deploy it (lines 24–27). It is worth noting that config.test.json contains all the configuration we have had in Jenkins (Lines 28–56 from Jenkins configuration).

#### Running the GitLab job locally

We can easily test our GitLab builds locally using [GitLab Runner](https://gitlab.com/gitlab-org/gitlab-runner/blob/master/docs/commands/README.md). Here is the procedure:

* Install it locally, either using a package repository or directly from here. If you do not want to install the GitLab Runner locally, you can always leverage Docker to do so. Have a look [here](https://gitlab.com/gitlab-org/gitlab-runner/issues/312).
* Run the build: gitlab-runner exec docker {my-job}. Whereas, my-job is the name of the job defined in .gitlab-ci.yml. In our case, it is called build.

#### Wrap up

As you can see, our CI job becomes easier to read thanks to GitLab and Docker. Along the same lines, we do not need to configure our machine to run tests anymore. Docker has got our back. In my opinion, the most important advantage of using Docker to run tests is to guarantee that our tests are always being run in the same conditions each time. These tests are totally isolated (and also independent) from the machine on which they run.

This post originally appeared on _[Medium](https://medium.com/linagora-engineering/docker-my-precious-6efbce900dcb)_.

### About the Guest Author

Abdulkader Benchi is the Javascript team leader at [Linagora](https://linagora.com/careers).
