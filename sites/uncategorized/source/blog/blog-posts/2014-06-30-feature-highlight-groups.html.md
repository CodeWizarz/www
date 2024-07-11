---
title: "GitLab Feature Highlight: Groups"
description: "GitLab groups allow you to group projects into directories and give users access to several projects at once."
canonical_path: "/blog/2014/06/30/feature-highlight-groups/"
date: 2014-06-30
categories: insights
author: Job van der Voort, Jacob Vosmaer
---

GitLab is a massive open source project with over 600 contributors, all working together to create an amazing platform to collaborate on code. Every month on the 22nd, a new version of GitLab is released, and every month new features are added.
To make you aware of the power of GitLab, we walk through some of its features in these blog posts.

![Barry effectively has 'Master' access to GitLab CI now](/images/feature_groups/override_access_level.png)

We start by looking at GitLab Groups. GitLab groups allow you to group projects into directories and give users access to several projects at once.


<!--more-->

When you create a new project in GitLab, the default namespace for the project is the personal namespace associated with your GitLab user.
Below we will see how to create groups, put projects in groups and manage who can access the projects in a group.

## How to create GitLab groups

You can create a group by going to the 'Groups' tab of the GitLab dashboard and clicking the 'New group' button.

![Click the 'New group' button in the 'Groups' tab](/images/feature_groups/new_group_button.png)

Next, enter the name (required) and the optional description and group avatar.

![Fill in the name for your new group](/images/feature_groups/new_group_form.png)

When your group has been created you are presented with the group dashboard feed, which will be empty.

![Group dashboard](/images/feature_groups/group_dashboard.png)

You can use the 'New project' button to add a project to the new group.

Note that there's also the option to [create subgroups and top-level groups](https://docs.gitlab.com/ee/user/group/manage.html#transfer-a-group).

After you create a group, here are a few other things you can do with it:

- Adjust user visibility level
- Share projects with groups
- Control project access
- Transfer projects
- Create personal projects

## How to transfer an existing project into a group

You can transfer an existing project into a group you own from the project settings page.
First scroll down to the 'Dangerous settings' and click 'Show them to me'.
Now you can pick any of the groups you manage as the new namespace for the group.

![Transfer a project to a new namespace](/images/feature_groups/transfer_project.png)

GitLab administrators can use the admin interface to move any project to any namespace if needed.

Update: For more info, check out tutorials in the docs on [moving a personal project to a group](https://docs.gitlab.com/ee/tutorials/move_personal_project_to_a_group.html) and [converting a personal namespace into a group](https://docs.gitlab.com/ee/tutorials/convert_personal_namespace_into_group.html).
{: .alert .alert-info .text-center}

## How to add users to a group

One of the benefits of putting multiple projects in one group is that you can give a user access to all projects in the group at the same time with one action.

Suppose we have a group with two projects.

![Group with two projects](/images/feature_groups/group_with_two_projects.png)

On the 'Group Members' page we can now add a new user Barry to the group.

![Add user Barry to the group](/images/feature_groups/add_member_to_group.png)

Now because Barry is a 'Developer' member of the 'Open Source' group, he automatically gets 'Developer' access to all projects in the 'Open Source' group.

![Barry has 'Developer' access to GitLab CI](/images/feature_groups/project_members_via_group.png)

If necessary, you can increase the permissions or access level of an individual user for a specific project, by adding them as a Member to the project.

![Barry effectively has 'Master' access to GitLab CI now](/images/feature_groups/override_access_level.png)

To see groups where users have a [direct or indirect membership](https://docs.gitlab.com/ee/user/group/manage.html), select "Your groups."

## How to manage group memberships via LDAP

In GitLab Enterprise Edition it is possible to manage GitLab group memberships using LDAP groups.
See [the documentation](https://docs.gitlab.com/ee/user/group/access_and_permissions.html#manage-group-memberships-via-ldap) for more information.

## How to allow only admins to create groups

By default, any GitLab user can create new groups.
This ability can be disabled for individual users from the admin panel.
It is also possible to configure GitLab so that new users default to not being able to create groups:

```
# For omnibus-gitlab, put the following in /etc/gitlab/gitlab.rb
gitlab_rails['gitlab_default_can_create_group'] = false

# For installations from source, uncomment the 'default_can_create_group'
# line in /home/git/gitlab/config/gitlab.yml
```

Update: Check out [the documentation](https://docs.gitlab.com/ee/user/group/) for more info on GitLab's latest features for [managing groups](https://docs.gitlab.com/ee/user/group/manage.html), [access control for groups](https://docs.gitlab.com/ee/user/group/access_and_permissions.html), [migrating groups](https://docs.gitlab.com/ee/user/group/import/), [restricting access by domain or email](https://docs.gitlab.com/ee/user/group/access_and_permissions.html#restrict-group-access-by-domain), [group file templates](https://docs.gitlab.com/ee/user/group/manage.html#group-file-templates), and more. 
{: .alert .alert-info .text-center}
