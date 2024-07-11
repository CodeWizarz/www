---
title: "How we solved GitLab's CHANGELOG conflict crisis"
author: Robert Speicher
author_gitlab: rspeicher
author_twitter: rspeicher
categories: engineering
image_title: '/images/blogimages/solving-gitlab-changelog-crisis.jpg'
description: "How we eliminated changelog-related merge conflicts and automated a crucial part of our release process."
ee_cta: false
tags: inside GitLab, workflow
---

Since its [very first commit] more than six years ago, GitLab has had a changelog
detailing the noteworthy changes in each release. Shortly after [Enterprise
Edition (EE) was introduced], it [got a changelog of its own]. Whenever anyone
– whether it was a community contributor or a GitLab employee – contributed a
new feature or fix to the project, a changelog entry would be added to let users
know what improved.

As GitLab gained in popularity and started receiving more contributions, we'd
constantly see merge conflicts in the changelog when multiple merge requests
attempted to add an entry to the list. This quickly became a major source of
delays in development, as contributors would have to rebase their branch in order
to resolve the conflicts.

This post outlines how we completely eliminated changelog-related merge
conflicts, removed bottlenecks for contributions, and automated a crucial part
of our release process.

At the beginning, GitLab's `CHANGELOG` file would look something like this:

```text
v 8.0.0 (unreleased)
  - Prevent anchors from being hidden by header (Stan Hu)
  - Remove satellites
  - Better performance for web editor (switched from satellites to rugged)
  - Faster merge
  - ...
  - Ability to fetch merge requests from refs/merge-requests/:id

v 7.14.1
  - Improve abuse reports management from admin area
  - Ability to enable SSL verification for Webhooks

v 7.14.0
  - Fix bug where non-project members of the target project could set labels on new merge requests.
  - Upgrade gitlab_git to 7.2.14 to ignore CRLFs in .gitmodules (Stan Hu)
  - ...
  - Fix broken code import and display error messages if something went wrong with creating project (Stan Hu)
```

When a developer made a change in the upcoming release, `8.0.0` in this example,
they would add a changelog entry at the bottom:

```diff
diff --git a/CHANGELOG b/CHANGELOG
index de2066f..0fc2c18 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -5,6 +5,7 @@ v 8.0.0 (unreleased)
   - Faster merge
   - ...
   - Ability to fetch merge requests from refs/merge-requests/:id
+  - Made literally everything better. Evvvvverything!

 v 7.14.1
   - Improve abuse reports management from admin area
```

At the same time, another developer might have made a similar change in _their_
branch:

```diff
diff --git a/CHANGELOG b/CHANGELOG
index de2066f..5f81cfd 100644
--- a/CHANGELOG
+++ b/CHANGELOG
@@ -5,6 +5,7 @@ v 8.0.0 (unreleased)
   - Faster merge
   - ...
   - Ability to fetch merge requests from refs/merge-requests/:id
+  - Made a few things worse. Woops!

 v 7.14.1
   - Improve abuse reports management from admin area
```

Now when one branch was merged, it'd create a conflict in the other:

```diff
diff --cc CHANGELOG
index 5f81cfd,0fc2c18..0000000
--- a/CHANGELOG
+++ b/CHANGELOG
@@@ -5,7 -5,7 +5,11 @@@ v 8.0.0 (unreleased
    - Faster merge
    - ...
    - Ability to fetch merge requests from refs/merge-requests/:id
++<<<<<<< HEAD
 +  - Made a few things worse. Woops!
++=======
+   - Made literally everything better. Evvvvverything!
++>>>>>>> developer-1

  v 7.14.1
    - Improve abuse reports management from admin area
```

This resulted in a ton of wasted time as something would get merged, and then
every other open branch adding a changelog entry would need to be rebased. The
situation only got worse as the number of contributors to GitLab grew over time.

Our initial, [boring solution] to the problem was to begin adding empty
placeholder entries at the beginning of each monthly release cycle. The
changelog for the upcoming unreleased version might look like this:

```
v8.1.0 (unreleased)
  -
  -
  -
  -
  -
  -
  -
  - (and so on)
```

A developer would make their change and then choose a random spot in the list to
add a changelog entry. This worked for a while, until the placeholders began to
be filled out as we got closer to the release date. Eventually two (or more)
merge requests would attempt to add different entries at the same placeholder,
and one being merged created a conflict in the others.

The problem was lessened, but not solved.

Not only was this a huge waste of time for developers, it created an additional
headache for [release managers] when they cherry-picked a commit into a stable
branch for a patch release. If the commit included a changelog entry, which any
change intended for a patch release _should_ have, cherry-picking that commit
would bring in the contents of the changelog at the point of that commit, often
including dozens of unrelated changes. The release manager would have to
manually remove the unrelated entries, often doing this multiple times per
release. This was compounded when we had to release multiple patch versions at
once due to a security issue.

[very first commit]: https://gitlab.com/gitlab-org/gitlab-ce/commit/9ba1224867665844b117fa037e1465bb706b3685
[Enterprise Edition (EE) was introduced]: /releases/2013/07/22/announcing-gitlab-enterprise-edition/
[got a changelog of its own]: https://gitlab.com/gitlab-org/gitlab-ee/commit/e316324be5f71f02a01ae007ab1cf5cbe410c2e1
[boring solution]: /handbook/values/#efficiency
[release managers]: https://gitlab.com/gitlab-org/release/docs/blob/master/quickstart/release-manager.md

## Brainstorming solutions

Frustrations with the process finally reached a tipping point, and [an issue was
created] to discuss a solution. [Yorick] had the [original idea] that would
ultimately form the foundation of our solution. During a [trip around the
world], myself, [Douwe], and [Marin] were in Brooklyn, NY, and during a walk
around the city one beautiful summer evening we ended up [with a proposal] to
finally solve the problem.

Each changelog entry would be its own YAML file in a `CHANGELOG/unreleased`
folder. When a release manager went to cherry-pick a merge into a stable branch
in preparation for a release, they'd use a custom script that would perform the
cherry-pick and then move any changelog entry added by that action to a
version-specific subfolder, such as `CHANGELOG/8.9.4`. At the time of release,
any entries in the version's subfolder would be compiled into a single Markdown
changelog file, and then deleted.

With an idea of where we wanted to end up but no idea how to get there, I
started with a [spike].

[an issue was created]: https://gitlab.com/gitlab-org/gitlab-ce/issues/17826
[original idea]: https://gitlab.com/gitlab-org/gitlab-ce/issues/17826#note_12623521
[Yorick]: /company/team/#yorickpeterse
[Douwe]: /company/team/#DouweM
[Marin]: /company/team/#maxlazio
[trip around the world]: /2016/08/24/gitlab-in-action/
[spike]: https://gitlab.com/snippets/1713271

## A turning point

After a few days of working on the spike, I [had a realization] that we didn't
need the cherry-picking concept at all:

> Cherry picking a merge commit into a stable branch will add that merge's
> `CHANGELOG/unreleased/whatever-its-called.yml` file to the stable branch. Upon
> tagging a release with release-tools, we can consider _everything_ in that
> stable branch's "unreleased" folder as part of the tagged release. We collect
> those files, compile them to Markdown, remove them from the stable branch
> _and_ `master`, and that's our changelog for the release.

This was a major "aha" moment, as it greatly simplified the
workflow for release managers. They could continue their existing workflow, and
the release flow would transparently handle the rest. It also meant we could
handle everything in our [release-tools] project, which is responsible
for tagging a release and kicking off our packaging.

Even though we ended up not using a lot of the work that went into it, my
original spike was still valuable. It allowed us to see pain points early on,
refine the process, and find a better solution. It also gave me additional
experience interacting with Git repositories programmatically via [Rugged], and
that would go on to be especially useful as we implemented the final tooling.

[with a proposal]: https://gitlab.com/gitlab-org/gitlab-ce/issues/17826#note_12998363
[had a realization]: https://gitlab.com/gitlab-org/gitlab-ce/issues/17826#note_13527876
[release-tools]: https://gitlab.com/gitlab-org/release-tools/
[Rugged]: https://github.com/libgit2/rugged

## Building the building blocks

We knew there were several components that we'd need to build:

1. Something to read and represent the individual YAML data files
1. Something to compile individual entries into a Markdown list
1. Something to insert the compiled Markdown into the _correct spot_ in an
   existing list of releases
1. Something to remove the files that had been compiled, and then commit the
   updated `CHANGELOG.md` file to the repository

All of these components were created in a [single merge request] and refined
through several code review cycles. The commits listed there are all fairly
atomic and may be interesting to read through on their own. The code review that
happened in the merge request was incredibly valuable, and allowed us to really
simplify some code that was hard to wrap one's head around, even for me as the
original author!

## Automated testing

Of course, we wouldn't consider this solution complete until we had automated
tests guaranteeing the behavior and consistency of the automated compilation,
including reading from and writing to multiple branches across multiple
repositories.

I ended up using Rugged to create [fixture repositories] that would create a
repeatable testing environment, which we could then verify with [custom RSpec
matchers].

[single merge request]: https://gitlab.com/gitlab-org/release-tools/merge_requests/29
[fixture repositories]: https://gitlab.com/gitlab-org/release-tools/blob/6531d8d7b7acbdf6ab577db4381036bbc18e3bbc/spec/support/changelog_fixture.rb
[custom RSpec matchers]: https://gitlab.com/gitlab-org/release-tools/blob/6531d8d7b7acbdf6ab577db4381036bbc18e3bbc/spec/support/matchers/rugged_matchers.rb

## Hooking into the release process

At this point we were fairly confident the changelog compilation worked, so it
was time to [hook it into our existing release process].

While testing this integration on a real release, we uncovered a pretty
hilarious (but dangerous) oversight. I'll let the commit that fixed it speak for
itself:

> [Protect against deleting everything when there are no changelog entries](https://gitlab.com/gitlab-org/release-tools/merge_requests/47/diffs?commit_id=5b3fe48a7697bda856b6bed1fedc4c210439849b)
>
> On a stable branch with no changelog entry files, the resulting empty
> array was passed to `Rugged::Index#remove_all` which, when given an
> empty array, removes **everything**. This was not ideal.

[hook it into our existing release process]: https://gitlab.com/gitlab-org/release-tools/merge_requests/47

## Developer tooling

The final pieces of the puzzle were creating a tool to help developers create
valid changelog entries easily, and adding documentation. Both were handled in
[this merge request](https://gitlab.com/gitlab-org/gitlab-ce/merge_requests/7098).

This tool allows developers to run `bin/changelog`, passing it the title of
their change, to generate a valid changelog entry file. Additional options are
[in the documentation](https://docs.gitlab.com/ee/development/changelog.html).

## Future plans

This changelog process has worked beautifully for us since it was introduced,
and we know it might be just as useful to other projects. We're [investigating a
way to make it more generic] so that it can remove a tedious chore for more
developers.

I worked on this project as part of our Edge team, now known as the [Quality
team]. If you're interested in this kind of internal tooling or other
automation, we're hiring! Check out our [open positions](/jobs/).

[investigating a way to make it more generic]: https://gitlab.com/gitlab-org/release-tools/issues/209
[Quality team]: https://about.gitlab.com/handbook/engineering/quality/

Photo by [Patrick Tomasso](https://unsplash.com/photos/1S-PanVaJmU?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/abstract?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
{: .note}
