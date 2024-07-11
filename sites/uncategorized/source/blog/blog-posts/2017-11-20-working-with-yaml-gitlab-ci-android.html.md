---
title: "Working with YAML in GitLab CI from the Android perspective"
author: Renato Stanic
author_gitlab: rstanic12
author_twitter: Undabot
categories: engineering
guest: true
image_title: '/images/blogimages/yaml-gitlab-ci-android.png'
twitter_image:
description: "Guest author Renato Stanic shares a sample YAML configuration for Android projects, which helps his team with faster, more iterative development."
tags: CI/CD, user stories
---

Using [continuous integration in our everyday workflow](/features/continuous-integration/) can help us a lot with faster and iterative development, and having CI do checks every time we change our codebase helps us with deal with fear of modifying code.

<!-- more -->


Deploying app builds manually takes time and leaves us idle while we could be developing new and exciting features instead. Here at Undabot we are using GitLab CI for continuous integration. GitLab CI uses a YAML file for job configuration. In this blog post we will go through a sample YAML configuration for Android projects and describe the main YAML building blocks with common Android CI jobs.

### YAML intro
The YAML file defines a set of jobs with constraints stating when they should be run. The jobs are defined as top-level elements with a name and always have to contain at least the `script` clause:


```
helloworld_job:
  script: "echo Hello World!"

assemble_job:
  script: "./gradlew assembleRelease"
```

YAML syntax allows for more complex job definitions than in the above example:

```
before_script:
  - bundle install

after_script:
  - rm secrets

stages:
  - build
  - test
  - deploy

helloworld_job:
  stage: build
  script:
    - echo Hello World
  only:
    - master
  tags:
    - android
```

`before_script` – commands that run before each jobs script  
`after_script` – commands that run after each jobs script  
`stages` – used to define build stages  
`only` – defines the names of branches and tags for which the job will run  
`tags` – used to select specific Runners from the list of all Runners that   are allowed to run this project.

## Initial setup for Android

First step is to create a YAML file called `gitlab-ci.yml` in root directory of your Android project and add the following code:

```
before_script:
  - export ANDROID_HOME="$HOME/Library/Android/sdk"
  - bundle install
stages:
  - build  
  - test
  - quality_assurance
  - deploy
```

In `before_script` we execute these two commands:  
`- export ANDROID_HOME="$HOME/Library/Android/sdk”`– sets Android home environment variable to be available for all other jobs and Gradle tasks  
`- bundle install` – we are using fastlane for task automation and Bundler to manage Ruby gems so we need to run bundle install to make sure everything is installed correctly.

In the `stages` section we define four build stages:  
`- build`– for build jobs  
`- test`– for test jobs that include unit and instrumentation tests  
`- quality_assurance`– for jobs that run all of our QA tools  
`- deploy`– for deployment jobs

## Build stage

This job (`build_job`) is used to create an APK artifact that can be used to test the app manually or to upload it to the Play Store.

```
build_job:
  stage: build
  script:
    - ./gradlew clean assembleRelease
  artifacts:
    paths:
      - app/build/outputs/
  ```

`build_job:`– name of the CI job  
`stage: build`– it gets executed in the build stage  
`./gradlew clean assembleRelease`– executes Gradle command to create a release APK  
`artifacts:`– job section that defines list of files and directories that are attached to a job after completion.  
`paths:`– output file paths  
`app/build/outputs`– directory path of our APK

## Unit tests

This job (`unit_tests`) runs our unit tests in a test stage. Every time they fail, a report artifact will be created. Each report artifact expires within four days of creation.

```
unit_tests:
  stage: test
  script:
    - ./gradlew test
  artifacts:
    name: "reports_${CI_PROJECT_NAME}_${CI_BUILD_REF_NAME}"
    when: on_failure
    expire_in: 4 days
    paths:
      - app/build/reports/tests/
  ```

`./gradlew test`– run Gradle command that triggers our unit tests artifacts:  
`name:`– defines artifact name by using environment variables  
`CI_PROJECT_NAME`– project name that is currently being built  
`CI_BUILD_REF_NAME`– branch or tag name for which project is built  
`when:`– defines when is it created (on_success, on_failure, always)  
`expire_in:`– defines when is it expired, after artifact has expired it gets deleted from CI

## Instrumentation tests

This job (`instrumentation_tests`) runs all of our instrumentation tests in a test stage by starting a windowless emulator without sound and animations followed by a [custom bash script](https://gist.github.com/anonymous/614aafb2d8710865c688684a8657a141) that waits for the emulator to start, after which the device is unlocked by sending key event 82. When the emulator is ready we run the Gradle command for instrumentation tests. Once all tests finished running, the emulator is killed with a [custom bash script](https://gist.github.com/anonymous/614aafb2d8710865c688684a8657a141).

```
instrumentation_tests:
  stage: test
  script:
    - emulator -avd testAVD -no-audio -no-window &
    - ./ci/android-wait-for-emulator.sh
    - adb devices
    - adb shell settings put global window_animation_scale 0 &
    - adb shell settings put global transition_animation_scale 0 &
    - adb shell settings put global animator_duration_scale 0 &
    - adb shell input keyevent 82 &
    - ./gradlew connectedAndroidTest
    - ./ci/stop-emulators.sh
  artifacts:
    name: "reports_${CI_PROJECT_NAME}_${CI_BUILD_REF_NAME}"
    when: on_failure
    expire_in: 4 days
    paths:
      - app/build/reports/androidTests/connected/
  ```

`- emulator — avd testAVD -no-audio -no-window &`  
`- ./ci/android-wait-for-emulator.sh`  
Starts the emulator and waits for it to boot.  
`- adb devices`  
Displays list of found devices in GitLab web terminal.  
`- adb shell settings put global window_animation_scale 0 &`  
`- adb shell settings put global transition_animation_scale 0 &`  
`- abd shell settings put global animator_duration_scale 0 &`  
Disables all animations and transitions.

## Static analysis

This job (`static_analysis`) runs all of static code analysis in QA stage. This is a tricky area especially if you are working on a project with a lot of legacy code. My suggestion would be to disable all of the rules and start fixing them one at the time. Tools used for static analysis are lint, checkstyle, pmd and findbugs.

```
static_analysis:
  stage: quality_assurance
  script:
    - ./gradlew lint
    - ./gradlew checkstyle
    - ./gradlew pmd
    - ./gradlew findbugs
  artifacts:
    name: "reports_${CI_PROJECT_NAME}_${CI_BUILD_REF_NAME}"
    when: on_failure
    expire_in: 4 days
    paths:
      - app/build/reports/
```

`- ./gradlew lint`  
`- ./gradlew checkstyle`  
`- ./gradlew pmd`  
`- ./gradlew findbugs`  
Gradle commands that trigger QA tools.  
`- app/build/reports` – path to our QA reports

## Deploy stage

The final job (`deploy_internal`) deploys the app to the QA team in deploy stage. You don’t want to deploy every time you commit something so this step is set as manual. Manual jobs are triggered via GitLab web interface by pressing the play button in your pipeline list. If you are using fastlane as your deployment tool, the last job will look like the following code:

```
deploy_internal:
  stage: deploy
  script:
    - bundle exec fastlane android deploy_lane
  when: manual
```

`- bundle exec fastlane android deploy_lane`– executes fastlane deploy lane that deploys app to the QA team  
`when: manual` – defines [when is a job executed](https://docs.gitlab.com/ee/ci/yaml/#when)

## There’s plenty more

Setting up Android continuous integration with GitLab CI is great and supports plenty of cool features a lot more than we showed. Hopefully this short introduction was helpful and is going to motivate you to discover more features on your own.

Complete `gitlab-ci.yml`:

```
before_script:
  - export ANDROID_HOME="$HOME/Library/Android/sdk"
  - bundle install

stages:
- build
- test
- quality_assurance
- deploy

build_job:
  stage: build
  script:
    - ./gradlew clean assembleRelease
  artifacts:
    paths:
    - app/build/outputs/

unit_tests:
  stage: test
  script:
    - ./gradlew test
  artifacts:
    name: "reports_${CI_PROJECT_NAME}_${CI_BUILD_REF_NAME}"
    when: on_failure
    expire_in: 4 days
    paths:
      - app/build/reports/tests/

instrumentation_tests:
  stage: test
  script:
    - emulator -avd testAVD -no-audio -no-window &
    - ./ci/android-wait-for-emulator.sh
    - adb devices
    - adb shell settings put global window_animation_scale 0 &
    - adb shell settings put global transition_animation_scale 0 &
    - adb shell settings put global animator_duration_scale 0 &
    - adb shell input keyevent 82 &
    - ./gradlew connectedAndroidTest
    - ./ci/stop-emulators.sh
  artifacts:
    name: "reports_${CI_PROJECT_NAME}_${CI_BUILD_REF_NAME}"
    when: on_failure
    expire_in: 4 days
    paths:
      - app/build/reports/androidTests/connected/

static_analysis:
  stage: quality_assurance
  script:
    - ./gradlew lint
    - ./gradlew checkstyle
    - ./gradlew pmd
    - ./gradlew findbugs
  artifacts:
    name: "reports_${CI_PROJECT_NAME}_${CI_BUILD_REF_NAME}"
    when: on_failure
    expire_in: 4 days
    paths:
      - app/build/reports/

deploy_internal:
  stage: deploy
  script:
    - bundle exec fastlane android deploy_lane
  when: manual
```



_[Working with YAML in GitLab CI from an Android perspective](https://blog.undabot.com/working-with-yaml-in-gitlab-ci-from-android-perspective-b8cf54b5b911) was originally published on Undabot's blog._
