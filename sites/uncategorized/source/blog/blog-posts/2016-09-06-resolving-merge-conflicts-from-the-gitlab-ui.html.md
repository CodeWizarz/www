---
title: "Resolving Merge Conflicts from the GitLab UI"
author: Sean McGivern
author_twitter: mcgivernsa
categories: company
image_title: '/images/blogimages/resolving-merge-conflicts-from-the-gitlab-ui/merge-conflicts.png'
twitter_image: '/images/tweets/resolving-merge-conflicts-from-the-gitlab-ui.png'
description: "Learn how GitLab's merge conflict resolution feature works and why we introduced it."
---

Merge conflicts can be very annoying for both merge request authors and
reviewers. As an author, I just want my merge request to be merged. But the
reviewer might not be in the same time zone as me and by the time they review
my changes, I have a merge conflict. I then need to fix it and pass the merge
request back to them, which is a lot of busy work for something that could be
fairly trivial to fix.

Similarly, as a reviewer, I want merge requests to be accepted when they're
ready. I don't want to spend my time checking out the author's branch, fixing
the conflicts, and pushing back; and I don't particularly like waiting around
for them to fix it. As an author or a reviewer, I just want to be able to have
the merge request accepted, and move on to the next thing. That's why understanding the methods of resolving conflicts is crucial. Fortunately, GitLab has a few ways of resolving conflicts from the GitLab UI.

In GitLab 8.11, we
[introduced the ability to resolve merge conflicts in the UI][release-post]. This
post describes the background for the feature, how it works, and what we're
planning to do next with it.

<!-- more -->

## What is a merge conflict?

A merge conflict is when a merge can't be performed cleanly between two versions
of the same file. An error message
may appear, indicating the conflict is too complex.

### Wait, what's a merge?

A merge is a way of combining two sets of changes made in different branches. In
GitLab, we handle this with [Merge Requests][mr], which are requests to merge
the changes we've made to a file (or a group of files), from a [feature
branch][fb] into another branch, for example, `master`.

When the merge request is merged, the changes from `new-feature` are added to
`master`. This happens by looking at all of the changes made in the `master` branch since
the `new-feature` branch was created, and all the changes made in `new-feature`,
and applying them to the files changed.

Most of the time, Git can do this automatically, but sometimes it can't. For
instance, if we changed a line of code in our `new-feature` branch, but that line was
also changed in `master`, Git doesn't know which line to accept. When this happens, someone needs to manually tell Git which line
to use, which creates a **merge conflict**.

**Note:** for this post, we will just concentrate on conflicts within a file. However,
renames and deletions can also cause conflicts, and we
[plan on supporting those][20665] in the future.
{: .note}

## Why are merge conflicts a problem?

They're really annoying!

When there's a conflict in a [version control](/topics/version-control/) system, a merge request can't be merged without manual
intervention.

If you can't resolve complex merge conflicts within GitLab, that means that any merge
request with a conflict needs to be checked out locally, resolved locally,
pushed back, and merged. That's a hassle and can't be done without having some
Git tools installed locally. At GitLab, we want
[everyone to be able to collaborate on all digital content][vision], and that
means not having to install special tools whenever possible.

### Types of conflict resolution

There are several methods of resolving conflicts:

1. Just pick one version, and use that. This is often the case with generated
   files. One example is the [`schema.rb`][schema-rb] file in a Rails app.
   Conflicts on the schema version line are common, but we (almost) always want
   the latest version.

2. Keep the lines of code from both versions. A great example of this is the
   [GitLab CE CHANGELOG file][changelog], which is a
   [frequent source of merge conflicts][changelog-crisis]. We're working on
   [tooling to help with this][automated-changelogs], but that's specific to
   GitLab rather than applicable to every project.

3. Write our own resolution. For instance, if we started with the sentence:

    > There are two versions of GitLab: CE and EE

    I might think that those acronyms should be spelled out:

    > There are two versions of GitLab: Community Edition (CE) and Enterprise Edition (EE)

    And you might think that the sentence needs some closing punctuation:

    > There are two versions of GitLab: CE and EE.

    Because conflicts are based on lines, there's no way to automatically pick
    both of those changes. We can do so manually, though:

    > There are two versions of GitLab: Community Edition (CE) and Enterprise Edition (EE).

At present, the conflict resolution support in GitLab is only really useful for
resolving the first type of conflict. The [merge conflict resolution editor](https://gitlab.pavlovia.org/help/user/project/merge_requests/resolve_conflicts.md) allows for more complex [conflicts](https://docs.gitlab.com/ee/user/project/merge_requests/conflicts.html) to be resolved by manually modifying a file from the GitLab interface. 

## How do we resolve them?

When a merge request can have its conflicts resolved within GitLab, it will have
a link within the merge box to 'resolve these conflicts':

![The 'resolve these conflicts' link on a merge request](/images/blogimages/resolving-merge-conflicts-from-the-gitlab-ui/mr-widget.png){: .shadow}

Clicking that link will show a list of files with conflicts, with conflict sections
highlighted as 'our changes' (the changes in the merge request's source branch)
and 'their changes' (the changes in the merge request's target branch):

![Some example merge conflicts](/images/blogimages/resolving-merge-conflicts-from-the-gitlab-ui/merge-conflicts.png){: .shadow}

Here's an example of a more complex merge conflict in a `schema.rb` that I resolved on the GitLab CE
project:

![Resolving a merge conflict](/images/8_11/resolve_mc.gif){: .shadow}

### How does that work?

The current implementation, at a high level, works like this:

1. If a merge request has conflicts, GitLab gets a list of the
   [files with merge conflicts][rugged-conflicts].
2. For each file, it then
   [generates a merged file with conflict markers][rugged-merge-file].
3. GitLab parses those conflict markers out and presents them to the UI as
   sections: context, our side of the conflict, their side of the conflict,
   context, etc.
4. When the UI passes the section IDs back, we do the same thing. This time,
   GitLab only keeps the sections the user selected, along with all context
   sections.
5. GitLab joins the resolved lines together to create a resolved file, and
   [adds it to the Git index][rugged-add].
6. Finally, we write that index as a merge commit to the source branch.

If the source branch is `new-feature` and the target branch is `master`, then
this does basically the same thing as running:

```
git checkout new-feature
git merge master
```

### Why can't some conflicts be resolved in GitLab?

The implementation above produces a number of constraints (for the most
up-to-date list, please see the
[merge conflict resolution documentation][conflict-docs]):

1. If the file contains conflict markers that mean we can't parse the file contents
   unambiguously, we can't show the sections. We will, however, be able to allow
   [resolving those conflicts in an editor](#an-editor).
2. If the file is a binary file, we can't parse the file for conflict markers
   because they are only added to text files. Again, we plan to
   [allow resolving conflicts in binary files](#binary-files) in the future.
3. If the file [isn't in a UTF-8 compatible encoding][21247], we can't allow
   resolving it because we pass data back and forth as JSON.
4. If the file is too large (over 200 KB), we avoid parsing it.

Because all conflicts must be resolved at once, if any of the conflicts for a
merge request can't be resolved in the GitLab UI, then the conflicts must be
resolved manually.

## What's next?

There are plenty of places for improving our current implementation, and we'd
love to hear of ones we haven't thought of. Here are three obvious ones already
in our [issue tracker][ce-issues].

### An inline editor!

The most obvious improvement is to allow
[editing the conflict resolution][20344]. This is closer to the experience on
the command line, with the conflict markers present in the file. It will also
cover most of the problem cases listed above with the current approach.

### Binary files!

In addition to this, as binary files are typically not manually mergeable, we
could just [show both file versions][20664], and ask which one to use. This will work
best for images, but can support all binary files.

### Renames!

Incompatible renames are detected as conflicts by the `git` command line tool,
but not by the library we use at GitLab. We can [detect rename conflicts][20345]
ourselves, it's just more work.

**For the latest information on how to resolve merge conflicts in GitLab, check out our [documentation](https://docs.gitlab.com/ee/user/project/merge_requests/conflicts.html).**

[20344]: https://gitlab.com/gitlab-org/gitlab-ce/issues/20344
[20345]: https://gitlab.com/gitlab-org/gitlab-ce/issues/20345
[20664]: https://gitlab.com/gitlab-org/gitlab-ce/issues/20664
[20665]: https://gitlab.com/gitlab-org/gitlab-ce/issues/20665
[21247]: https://gitlab.com/gitlab-org/gitlab-ce/issues/21247
[automated-changelogs]: https://gitlab.com/gitlab-org/release-tools/merge_requests/29
[ce-issues]: https://gitlab.com/gitlab-org/gitlab-ce/issues
[changelog-crisis]: https://gitlab.com/gitlab-org/gitlab-ce/issues/17826
[changelog]: https://gitlab.com/gitlab-org/gitlab-ce/blob/master/CHANGELOG.md
[conflict-docs]: https://docs.gitlab.com/ee/user/project/merge_requests/resolve_conflicts.html
[release-post]: /releases/2016/08/22/gitlab-8-11-released/#merge-conflict-resolution
[rugged-add]: http://www.rubydoc.info/github/libgit2/rugged/Rugged/Index#add-instance_method
[rugged-conflicts]: http://www.rubydoc.info/github/libgit2/rugged/Rugged/Index#conflicts-instance_method
[rugged-merge-file]: http://www.rubydoc.info/github/libgit2/rugged/Rugged/Index#merge_file-instance_method
[schema-rb]: http://guides.rubyonrails.org/active_record_migrations.html#what-are-schema-files-for-questionmark
[vision]: /direction/#vision
[fb]: https://docs.gitlab.com/ee/gitlab-basics/feature_branch_workflow.html
[mr]: http://doc.gitlab.com/ce/user/project/merge_requests.html
