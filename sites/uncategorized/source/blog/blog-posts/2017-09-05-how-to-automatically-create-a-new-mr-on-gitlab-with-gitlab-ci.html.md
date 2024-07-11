---
title: "How to automatically create a new MR on GitLab with GitLab CI"
author: Riccardo Padovani
author_twitter: rpadovani93
guest: true
categories: engineering
image_title: '/images/blogimages/whats-next-for-gitlab-ci.jpg'
twitter_image: '/images/tweets/automatic-new-mr-tweet.png'
description: "With this script, every time we push a commit, GitLab CI checks if the branch that commit belongs to already has an open MR and, if not, creates one."
tags: CI/CD, user stories, tutorial
---

At [fleetster](https://www.fleetster.net/), we have our own instance of [GitLab](https://gitlab.com/) and we rely a lot on [GitLab CI](/features/continuous-integration/). How could it be otherwise? We are a small team, with a lot of different projects (only in last month, we had more than **13,000 commits** over **25 different projects**, and we are only 10 people – with myself working part time). Automating as many development steps as possible (from build to QA to deploy) is helping us a lot, but sometimes we write some code and then forget about it. This is a disaster! We have some bug fix or some new feature ready, but it is forgotten in some branch somewhere.

<!-- more -->

This is why we have a policy to push as soon as possible to open a new MR, mark it as WIP, and assign to ourselves; in this way GitLab will remind us we have an MR.

You need to do three steps to achieve that:

* Push the code
* Click on the link that appears on your terminal
* Fill a form

But we are nerds. We are lazy. So one night, after a couple of beers, [Alberto Urbano](https://www.linkedin.com/in/alberto-urbano-047a4b19/) and I spent some hours to automate a task that requires 10 seconds.

Actually, the experience was quite fun, it was the first time we used GitLab APIs and we learned things we will apply to others scripts as well.

![Image via Riccardo's blog](/images/blogimages/automating-tasks-expectation-versus-reality.png){: .shadow}<br>
*Image by Randall Munroe, [xkcd.com](https://imgs.xkcd.com/comics/automation.png)*

### The script

With this script, every time we push a commit, GitLab CI checks if the branch that commit belongs to already has an open MR and, if not, it creates it. It then assigns the MR to you, and puts **WIP** in the title to mark it as a work in progress.

In this way you cannot forget about that branch, and when you’ve finished writing code on it, you just need to remove the WIP from the title and assign to the right person to review it.

In the end, this is the script we came out with (when you add to your project, remember to make it executable):

```
#!/usr/bin/env bash
# Extract the host where the server is running, and add the URL to the APIs
[[ $HOST =~ ^https?://[^/]+ ]] && HOST="${BASH_REMATCH[0]}/api/v4/projects/"

# Look which is the default branch
TARGET_BRANCH=`curl --silent "${HOST}${CI_PROJECT_ID}" --header "PRIVATE-TOKEN:${PRIVATE_TOKEN}" | python3 -c "import sys, json; print(json.load(sys.stdin)['default_branch'])"`;

# The description of our new MR, we want to remove the branch after the MR has
# been closed
BODY="{
    \"id\": ${CI_PROJECT_ID},
    \"source_branch\": \"${CI_COMMIT_REF_NAME}\",
    \"target_branch\": \"${TARGET_BRANCH}\",
    \"remove_source_branch\": true,
    \"title\": \"WIP: ${CI_COMMIT_REF_NAME}\",
    \"assignee_id\":\"${GITLAB_USER_ID}\"
}";

# Require a list of all the merge request and take a look if there is already
# one with the same source branch
LISTMR=`curl --silent "${HOST}${CI_PROJECT_ID}/merge_requests?state=opened" --header "PRIVATE-TOKEN:${PRIVATE_TOKEN}"`;
COUNTBRANCHES=`echo ${LISTMR} | grep -o "\"source_branch\":\"${CI_COMMIT_REF_NAME}\"" | wc -l`;

# No MR found, let's create a new one
if [ ${COUNTBRANCHES} -eq "0" ]; then
    curl -X POST "${HOST}${CI_PROJECT_ID}/merge_requests" \
        --header "PRIVATE-TOKEN:${PRIVATE_TOKEN}" \
        --header "Content-Type: application/json" \
        --data "${BODY}";

    echo "Opened a new merge request: WIP: ${CI_COMMIT_REF_NAME} and assigned to you";
    exit;
fi

echo "No new merge request opened";
```

### GitLab CI

The variables used in the script are passed to it by our `.gitlab_ci.yml` file:

```
stages:
    - openMr
    - otherStages

openMr:
    before_script: []   # We do not need any setup work, let's remove the global one (if any)
    stage: openMr
    only:
      - /^feature\/*/   # We have a very strict naming convention
    script:
        - HOST=${CI_PROJECT_URL} CI_PROJECT_ID=${CI_PROJECT_ID} CI_COMMIT_REF_NAME=${CI_COMMIT_REF_NAME} GITLAB_USER_ID=${GITLAB_USER_ID} PRIVATE_TOKEN=${PRIVATE_TOKEN} ./utils/autoMergeRequest.sh # The name of the script
```

All these environment variables are set by GitLab itself, but the PRIVATE-TOKEN. A master of the project has to create it in its own profile and add to the project settings.

To create the personal token you can go to `/profile/personal_access_tokens` on your GitLab instance, and then you add to your pipeline following this guide.

### Ways to improve

The script is far from perfect.

First of all, it has two API calls, one to take the list of MR and one to take the default branch, to use it as target. Of course you can hardcode the value (in the end it shouldn’t change often), but hardcoding is always bad.

Also, it uses python3 to extract the name of the target branch – this is just one of many possible solutions, just use what is available on your system. Apart from that, the script doesn’t have any external dependency.

The other thing is how you need to set up the secret token to call the APIs. Luckily, GitLab’s developers are working on a [new way](https://gitlab.com/gitlab-org/gitlab-ce/issues/12729) to manage secret tokens.

### Conclusion

This was a very small and very simple example about how much powerful Continuous Integration can be. It takes some time to set up everything, but in the long run it will save your team a lot of headache.

In fleetster we use it not only for running tests, but also for having automatic versioning of the software and automatic deploys to testing environments. We are working to automate other jobs as well (building apps and publish them on the Play Store and so on).

Speaking of which, **do you want to work in a young and dynamic office with me and a lot of other amazing people?** Take a look at the [open positions at fleetster](https://www.fleetster.net/fleetster-team.html)!

Kudos to the GitLab team (and other guys who help in their free time) for their awesome work!

If you have any question or feedback about this blog post, please drop me an email at riccardo@rpadovani.com :-)

Bye for now,
A. & R.

P.S: if you have found this article helpful and you’d like we write others, do you mind to help us reaching the Ballmer’s peak and buy us a [beer](https://rpadovani.com/donations)?

This post originally appeared on [*rpadovani.com*](https://rpadovani.com/open-mr-gitlab-ci).

## About the Guest Author

Riccardo is a university student and a part-time developer at [fleetster](http://www.fleetster.net/). When not busy with university or work, he likes to contribute to open-source projects.
