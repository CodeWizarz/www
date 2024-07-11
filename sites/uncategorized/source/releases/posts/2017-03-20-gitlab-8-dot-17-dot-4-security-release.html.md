---
layout: post
title: "GitLab 8.17.4, 8.16.8, and 8.15.8 released"
description: "Learn more about GitLab Release 8.17.4, 8.16.8, and 8.15.8 for GitLab Community Edition (CE) and Enterprise Edition (EE)"
canonical_path: "/releases/2017/03/20/gitlab-8-dot-17-dot-4-security-release/"
date: 2017-03-20 23:59
author: GitLab
author_twitter: gitlab
categories: releases
---

Today we are releasing versions 8.17.4, 8.16.8, and 8.15.8 for GitLab Community
Edition (CE) and Enterprise Edition (EE).

These versions contain several security fixes, including an important security
fix for a critical information disclosure vulnerability, protection against Server-Side
Request Forgery (SSRF) attacks, a fix for some links vulnerable to tabnabbing, a fix for
a flaw that could leak private email addresses in Atom feeds, and a fix for private
repository data leakage into ElasticSearch (EE-specific). We **strongly recommend**
that all affected GitLab installations be upgraded to one of these versions
**immediately**.

Please read on for more details.

<!-- more -->

## Information Disclosure in Issue and Merge Request Trackers

During an internal code review a critical vulnerability in the GitLab Issue and
Merge Request trackers was discovered. This vulnerability could allow a user
with access to assign ownership of an issue or merge request to another user
to disclose that user's private token, email token, email address, and
encrypted OTP secret. Reporter-level access to a GitLab project is required to
exploit this flaw.

This vulnerability is the result of a bug in the serialization of a user object
and was introduced in GitLab 8.7.0. Please see [the issue][29661] for more
details.

This issue has been assigned [CVE-2017-0882][CVE].

[29661]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29661
[CVE]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0882

### Versions affected

- 8.7.0 through 8.15.7
- 8.16.0 through 8.16.7
- 8.17.0 through 8.17.3

We **strongly recommend** that all installations running a version mentioned
above be upgraded as soon as possible.

### Post-Upgrade Steps

Due to the nature of this vulnerability it is possible that sensitive user tokens
have been cached by proxies or web browsers. We therefore recommend that
administrators reset private tokens and incoming email tokens for all users. A
rake task for performing token resets is included with this announcement.

Encrypted One-Time Password (OTP) secrets may also have been leaked by the
vulnerability. These secrets are encrypted, require the key for decrypting the
secret, and cannot be used on their own without a copy of the user password,
however we are still recommending that all users who utilize One-Time Passwords
[disable and then re-enable their 2FA][2fa] for all GitLab instances. This will
reset the OTP secret.

### Rake Task for Resetting User Tokens

After upgrading we recommended that all GitLab installations reset all user
private tokens and email tokens. To do so please save the following rake task
in the appropriate location.

For Omnibus: `/opt/gitlab/embedded/service/gitlab-rails/lib/tasks/reset_token.rake`

For Source: `<gitlab_installation_dir>/lib/tasks/reset_token.rake`

```ruby
# lib/tasks/reset_token.rake
require_relative '../../app/models/concerns/token_authenticatable.rb'

STDOUT.sync = true

namespace :tokens do
  desc "Reset all GitLab user auth tokens"
  task reset_all: :environment do
    reset_all_users_token(:reset_authentication_token!)
  end

  desc "Reset all GitLab email tokens"
  task reset_all_email: :environment do
    reset_all_users_token(:reset_incoming_email_token!)
  end

  def reset_all_users_token(token)
    TmpUser.find_in_batches do |batch|
      puts "Processing batch starting with user ID: #{batch.first.id}"

      batch.each(&token)
    end
  end
end

class TmpUser < ActiveRecord::Base
  include TokenAuthenticatable

  self.table_name = 'users'

  def reset_authentication_token!
    write_new_token(:authentication_token)
    save!(validate: false)
  end

  def reset_incoming_email_token!
    write_new_token(:incoming_email_token)
    save!(validate: false)
  end
end
```

Omnibus users would then run:

```
sudo gitlab-rake tokens:reset_all
sudo gitlab-rake tokens:reset_all_email
```

Source users would run:

```
sudo -u git -H bundle exec rake tokens:reset_all RAILS_ENV=production
sudo -u git -H bundle exec rake tokens:reset_all_email RAILS_ENV=production
```

The rake file can be deleted after this task finishes.

### Workarounds

If you're unable to upgrade right away, you can secure your GitLab installation
against this vulnerability using the workaround outlined below until you
have time to upgrade.

### Securing via patch

To temporarily patch just the critical vulnerability, change to the appropriate
directory and apply the attached diff.

Omnibus:

```
$ cd /opt/gitlab/embedded/service/gitlab-rails/
$ git apply <path_to_diff>
$ sudo gitlab-ctl restart unicorn
```

Source:

```
$ cd <gitlab_installation_dir/
$ git apply <path_to_diff>
```

Patch:

```diff
diff --git a/app/controllers/projects/issues_controller.rb b/app/controllers/projects/issues_controller.rb
index 1151555..857d907 100644
--- a/app/controllers/projects/issues_controller.rb
+++ b/app/controllers/projects/issues_controller.rb
@@ -129,7 +129,7 @@ class Projects::IssuesController < Projects::ApplicationController
       end

       format.json do
-        render json: @issue.to_json(include: { milestone: {}, assignee: { methods: :avatar_url }, labels: { methods: :text_color } }, methods: [:task_status, :task_status_short])
+        render json: @issue.to_json(include: { milestone: {}, assignee: { only: [:name, :username], methods: [:avatar_url] }, labels: { methods: :text_color } }, methods: [:task_status, :task_status_short])
       end
     end

diff --git a/app/controllers/projects/merge_requests_controller.rb b/app/controllers/projects/merge_requests_controller.rb
index 82f9b6e..677a8a1 100644
--- a/app/controllers/projects/merge_requests_controller.rb
+++ b/app/controllers/projects/merge_requests_controller.rb
@@ -308,7 +308,7 @@ class Projects::MergeRequestsController < Projects::ApplicationController
       end

       format.json do
-        render json: @merge_request.to_json(include: { milestone: {}, assignee: { methods: :avatar_url }, labels: { methods: :text_color } }, methods: [:task_status, :task_status_short])
+        render json: @merge_request.to_json(include: { milestone: {}, assignee: { only: [:name, :username], methods: [:avatar_url] }, labels: { methods: :text_color } }, methods: [:task_status, :task_status_short])
       end
     end
   rescue ActiveRecord::StaleObjectError
```

### Verifying the workaround

1. Browse to a project
1. Open the project's issue tracker
1. Create an issue and assign ownership of the issue to another user
1. View the returned JSON and verify that no private information such as tokens are included

## Other fixes in 8.17.4, 8.16.8, and 8.15.8

### SSRF when importing a project from a Repo by URL

GitLab instances that have enabled project imports using "Repo by URL" were
vulnerable to Server-Side Request Forgery attacks. By specifying a project import
URL of `localhost` an attacker could target services that are bound to the local
interface of the server. These services often do not require authentication.
Depending on the service an attacker might be able craft an attack using the
project import request URL.

This update blocks all import attempts from `localhost` and all bound server
interfaces other than those assigned as GitLab web or SSH services (Typically
ports 22 and 443). This update also blocks all import attempts from TCP ports
below 1024 with the exception of ports 22, 80 and 443. [17286]

Thanks to [Strukt] via [HackerOne] for reporting this vulnerability.

[17286]: https://gitlab.com/gitlab-org/gitlab-ce/issues/17286
[Strukt]: https://hackerone.com/strukt

### Links in Environments tab vulnerable to tabnabbing

[edio] via [HackerOne] reported that user-configured Environment links include
`target=_blank` but do not also include `rel: noopener noreferrer`. Anyone
clicking on these links may therefore be subjected to tabnabbing attacks where
a link back to the requesting page is maintained and can be manipulated by the
target server.

This update also includes patches for several other locations that might be
vulnerable. [29081]

[29081]: https://gitlab.com/gitlab-org/gitlab-ce/issues/29081
[edio]: https://twitter.com/EdOverflow

### Accounts with email set to "Do not show on profile" have addresses exposed in public atom feed

Several GitLab users reported that even with "Do not show on profile" configured
for their email addresses those addresses were still being leaked in Atom feeds
if they commented on a public project. [28058]

[28058]: https://gitlab.com/gitlab-org/gitlab-ce/issues/28058

### Elasticsearch returns internal code, snippets, issues, wiki pages and MRs on public projects (EE only)

GitLab-EE Users have reported that when Elasticsearch was enabled for searching GitLab
instances data from internal or private projects may be leaked in searches. [1067]

All GitLab-EE instances with Elasticsearch enabled should run a rake task
post-installation to configure privilege levels for Elasticsearch data.

Note: *There [is a bug](https://gitlab.com/gitlab-org/gitlab-ee/issues/1958) in
the rake task deployed with this security release.* Users wishing to run this
task should wait for GitLab 9.1 or apply the patch included with [this merge
request](https://gitlab.com/gitlab-org/gitlab-ee/merge_requests/1473/diffs).

Omnibus users:
```
sudo gitlab-rake gitlab:elastic:add_feature_visibility_levels_to_project
```

Source users:
```
sudo -u git -H bundle exec rake gitlab:elastic:add_feature_visibility_levels_to_project RAILS_ENV=production
```

[1067]: https://gitlab.com/gitlab-org/gitlab-ee/issues/1067

## Upgrade barometer

These versions do not include any migrations and will not require downtime.

Please be aware that by default the Omnibus packages will stop, run migrations,
and start again, no matter how “big” or “small” the upgrade is. This behavior
can be changed by adding a [`/etc/gitlab/skip-auto-migrations`
file](http://doc.gitlab.com/omnibus/update/README.html).

## Updating

To update, check out our [update page](/update/).

## Enterprise Edition

Interested in GitLab Enterprise Edition? Check out the [features exclusive to
EE](/features/#enterprise).

Access to GitLab Enterprise Edition is included with a
[subscription](/pricing/). No time to upgrade GitLab
yourself? Subscribers receive upgrade and installation services.

[HackerOne]: https://hackerone.com/
[2fa]: https://docs.gitlab.com/ee/user/profile/account/two_factor_authentication.html
