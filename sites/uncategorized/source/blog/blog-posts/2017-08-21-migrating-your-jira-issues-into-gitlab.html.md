---
title: "Migrating your JIRA issues to GitLab"
author: Abdulkader Benchi
author_twitter: kader_benchi
guest: True
categories: engineering
image_title: '/images/blogimages/continuous-integration-from-jenkins-to-gitlab-using-docker.jpg'
description: "We're migrating all of our working tools to open-source ones, and moving to GitLab has made all the difference."
tags: integrations, workflow
---

 Here at [Linagora](https://linagora.com/), we believe in open source. If you have read my [last article](/blog/2017/07/27/docker-my-precious/), you should know that we have recently migrated from [Atlassian](https://www.atlassian.com/) to [GitLab](https://gitlab.com/).

<!-- more -->

_Editor's note: We don't currently have a native way to migrate JIRA issues into GitLab issues, although we are [working on one](https://gitlab.com/gitlab-org/gitlab-ee/issues/2780)! In the meantime, we are very appreciative of community efforts to provide workarounds like this one._

Migrating our repositories from [Bitbucket](https://bitbucket.org/) to GitLab was so easy thanks to Git. However, migrating our issues (aka tickets) from [JIRA](https://www.atlassian.com/software/jira) to GitLab was not so obvious. In fact, there are several alternative solutions to integrate JIRA as a plugin inside GitLab so as to continue using JIRA along with GitLab. However, our main goal was to completely leverage GitLab as our only open-source development tool.

If you want to know how to migrate your JIRA issues into GitLab, then you are on the right article. Once you read it, you will discover that it is really so easy to do the migration from JIRA to GitLab. Yes, as you can see, winter is coming to GitLab rivals, because everything is possible with GitLab.

### Migrating JIRA issues into GitLab Issues

Our migration process will leverage the [REST APIs](http://www.restapitutorial.com/) provided by both [JIRA REST API](https://developer.atlassian.com/jiradev/jira-apis/jira-rest-apis) and GitLab Issues [REST API](https://docs.gitlab.com/ee/api/issues.html).

#### API calls:

To perform REST API cals, you can use your own preferred library. For me, I will use [axios](https://github.com/mzabriskie/axios), which is my preferred promise based HTTP client for the browser and node.js. You can simply install it locally by doing:

```
npm install axios

```

#### JIRA side:

Before requesting the endpoints provided by JIRA, we need to gather the following information:

```
// the base url to your JIRA
const JIRA_URL = 'https://your-jira-url.com/';

// the JIRA project ID (short)
const JIRA_PROJECT = 'PRO';

// JIRA username and password used to login
const JIRA_ACCOUNT = {
  username,
  password
};

```

Now, we need to call two endpoints call during the migration process. The first endpoint is to get all **JIRA issues**:

```
axios.request({
  method: 'get',
  url: `${JIRA_URL}/rest/api/2/search?jql=project=${JIRA_PROJECT}+order+by+id+asc&startAt=${offset}&maxResults=${limit}`,
  auth: {
    username: JIRA_ACCOUNT.username,
    password: JIRA_ACCOUNT.password
  }
})
```

The second endpoint is to get the **attachments** and the **comments** related to a given issue:

```
axios.request({
  method: 'get',
  /*
  * JIRA_ISSUE = the JIRA issue that we get from the previous call
  */
  url: `${JIRA_URL}/rest/api/2/issue/${JIRA_ISSUE.id}/?fields=attachment,comment`,
  auth: {
    username: JIRA_ACCOUNT.username,
    password: JIRA_ACCOUNT.password
  }
})
```

#### GitLab side:

As for JIRA, we need to gather some information before starting sending REST requests:

```
// the base url to your GitLab
const GITLAB_URL = 'http://your-gitlab-url.com/';

// the project in gitlab that you are importing issues to
const GITLAB_PROJECT = 'namespaced/project/name';

// GitLab username and password used to login
const GITLAB_ACCOUNT = {
  username,
  password
};

/* this token will be used whenever the API is invoked and
* the jira's author of (the comment / attachment / issue) is not a gitlab user.
* So, this identity will be used instead.
* GITLAB_TOKEN is visible in your account: https://ci.linagora.com/profile/account
*/
const GITLAB_TOKEN = 'get-this-token-from-your-profile';
```

Each JIRA issue has several fields which represent JIRA users, e.g., *assignee* and *reporter*. Once migrating to GitLab we should try to link these users to GitLab users (if they already exist on GitLab). However, if the user is not a GitLab user, then we have to leverage the **GITLAB_TOKEN** (line 18 in the last gist). That is, if the user does not exist on GitLab, then the identity of the user who is doing the migration will be used instead.

To search all GitLab users we need to send the following REST call:

```
axios.request({
  method: 'get',
  // 10000 users, should be enough to get them all
  url: `${GITLAB_URL}/api/v4/users?active=true&search=&per_page=10000`,
  headers: {
    'PRIVATE-TOKEN': GITLAB_TOKEN
  }
})
```

And now, we can find the corresponding GitLab user for each JIRA user by doing:

```
function jiraToGitlabUser(JIRAUser) {
    // GitLabUsers = the list of GitLab users we get from the last call
    return JIRAUser ? _.find(GitLabUsers, { email: JIRAUser.emailAddress }) : null
  }
```

It is worth noting that JIRA and GitLab issues are different in nature, so you need to migrate one type of issue to another. After searching all [JIRA issues](https://medium.com/linagora-engineering/gitlab-rivals-winter-is-here-584eacf1fe9a) and [JIRA attachments](https://medium.com/linagora-engineering/gitlab-rivals-winter-is-here-584eacf1fe9a) and comments, we can now transfer them into GitLab issues by doing the following mapping:

```
{
    title: JIRAIssue.fields.summary,
    description: JIRAIssue.fields.description,
    labels: [JIRAIssue.fields.issuetype.name],
    created_at: JIRAIssue.fields.created,
    updated_at: JIRAIssue.fields.updated,
    done: issue.fields.status.statusCategory.name === 'Done' ? true : false,
    assignee: jiraToGitlabUser(JIRAIssue.fields.assignee ),
    reporter: jiraToGitlabUser(JIRAIssue.fields.reporter),
    comments: JIRAComments.map(JIRAComment => ({
      author: jiraToGitlabUser(JIRAComment.author),
      comment: JIRAComment.body,
      created_at: JIRAComment.created
    })),
    attachments: JIRAAttachments.map(JIRAAttachment => ({
      author: jiraToGitlabUser(JIRAAttachment.author),
      filename: JIRAAttachment.filename,
      content: JIRAAttachment.content,
      created_at: JIRAAttachment.created
    }))
};
```

Now our GitLab issue is created, all what we need to do is to post it:

```
axios.request({
  method: 'post',
  url: `${GITLAB_URL}/api/v4/projects/${encodeURIComponent(GITLAB_PROJECT)}/issues`,
  // the GitLab issue that we have just created
  data: GITLAB_ISSUE
  headers: {
    'PRIVATE-TOKEN': GITLAB_TOKEN
  }
})
```

As you can see, migrating your JIRA tickets to GitLab is all about some REST API calls. As a developer, I think that you do such REST API calls every day. So we really do not need to stuck with JIRA nor to add it as a plugin to GitLab.

If you think that this article helps you discover something interesting that you feel you want to do every day, so please do not hesitate and join us. We are looking for new talents. For more information, you can have a look at our [Job site](https://job.linagora.com/en/).


This post originally appeared on _[Medium](https://medium.com/linagora-engineering/gitlab-rivals-winter-is-here-584eacf1fe9a)_.

### About the Guest Author

Abdulkader Benchi is the Javascript team leader at [Linagora](https://linagora.com/careers).
