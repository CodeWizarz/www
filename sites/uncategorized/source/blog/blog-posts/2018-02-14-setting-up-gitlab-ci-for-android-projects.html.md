---
title: "Setting up GitLab CI/CD for Android projects"
author: Stojan Anastasov
author_twitter: s_anastasov
categories: engineering
image_title: '/images/blogimages/ci-for-android.jpg'
description: "Guest author Stojan Anastasov shares how he switched from Jenkins and Fabric to GitLab CI/CD."
guest: true
tags: CI/CD, user stories
---

Note: Below is an older post. Read our latest blog post on [setting up GitLab CI/CD for Android apps](/blog/2018/10/24/setting-up-gitlab-ci-for-android-projects/) for the most up-to-date instructions.
{: .alert .alert-info}

My first experience with continuous integration was using Bitbucket in combination with [Jenkins](https://jenkins.io/). I was pretty happy with my setup. Jenkins would run on every commit: making sure my code compiles, run Android Lint and run my unit tests. I also set up continuous deployment using [Fabric](https://get.fabric.io/). Now, at work, we use GitLab as a code repository. GitLab also offers [continuous integration](/features/continuous-integration/). When we decided to start using continuous integration at work we decided to give GitLab a chance.

<!-- more -->

<img src="/images/blogimages/cicd_pipeline_infograph.png" alt="CI/CD pipeline infograph" style="width: 700px;"/>{: .shadow}

 It was already integrated with GitLab and to use it we just needed to install a [runner](https://docs.gitlab.com/runner/).

[Using CI/CD](/topics/ci-cd/) with GitLab is simple, after you install a runner you need to add a `.gitlab-ci.yml` file at the root of the repository. GitLab even offers template `.gitlab-ci.yml` files for various languages and frameworks. The Android template is based on [this blog post](/blog/2018/10/24/setting-up-gitlab-ci-for-android-projects/). It is a great guide but unfortunately today it doesn’t work. Google introduced a few changes in the command line tools.

## Installing Android SDK

To install the Android SDK on a CI/CD we need to install the [command line tools](https://developer.android.com/studio/index.html#downloads) (scroll to the bottom to get just the command line tools). The command line tools include the [sdkmanager](https://developer.android.com/studio/command-line/sdkmanager.html) – a command line tool that allows you to view, install, update, and uninstall packages for the Android SDK. So instead of

```
- wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz
- tar --extract --gzip --file=android-sdk.tgz
```
we can use
```
- wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
- unzip -q android-sdk.zip -d android-sdk-linux
```

to download and install the Android SDK tools.

There is also an improvement in accepting licenses for the Android SDK. After you accept the licenses on your development machine the tools will generate a licenses folder in the Android SDK root directory. You can accept the licences for all Android SDK components by running ```sdkmanager --licenses``` on your development machine. You can transfer the licenses from your development machine to your CI/CD server. To accept the licenses on the CI/CD server you can use:

```
- mkdir android-sdk-linux/licenses
- printf "8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e" > android-sdk-linux/licenses/android-sdk-license
- printf "84831b9409646a918e30573bab4c9c91346d8abd" > android-sdk-linux/licenses/android-sdk-preview-license
```

This will create a folder licenses with two files inside. The values written in the files are from my local machine. Depending on which components you use there might be other files on your machine like license for Google TV or Google Glass. Once the licenses are accepted we can install packages:

```
- android-sdk-linux/tools/bin/sdkmanager --update > update.log
- android-sdk-linux/tools/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" "build-tools;${ANDROID_BUILD_TOOLS}" "extras;google;m2repository" "extras;android;m2repository" > installPlatform.log
```

A sample project based on the [Android Testing codelab](https://codelabs.developers.google.com/codelabs/android-testing/index.html#0) with the full `.gitlab-ci.yaml` file can be found [here](https://gitlab.com/stolea/android-gitlab-ci). The rest of the script for building and unit testing is the same as the original post. The latest x86 emulator requires hardware acceleration to run so I’ll skip the functional tests for now.

## About the guest author

Stojan Anastasov is a pragmatic developer with four years' experience in building native apps for Android. Now working at [Cosmic Development](http://www.cosmicdevelopment.com/), he previously worked on the Claxi app at Bransys. You can find him on [Stack Overflow](https://stackoverflow.com/) in the `android` and `rxjava` tags.

*[Setting up GitLab CI/CD for Android projects](https://dev.to/s_anastasov/setting-up-gitlab-ci-for-android-projects-a6o) was originally published on dev.to.*

Cover image by [Jamison McAndie](https://unsplash.com/photos/uf4oyaimWwg) on [Unsplash](https://unsplash.com/search/photos/pipeline)
{: .note}
