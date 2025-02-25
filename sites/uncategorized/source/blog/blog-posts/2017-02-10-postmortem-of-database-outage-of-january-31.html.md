---
title: "Postmortem of database outage of January 31"
author: GitLab
author_twitter: sytses
categories: company
image_title:
description: "Postmortem on the database outage of January 31 2017 with the lessons we learned."
---

On January 31st 2017, we experienced a major service outage for one of our products, the online service GitLab.com. The outage was caused by an accidental removal of data from our primary database server.

This incident caused the GitLab.com service to be unavailable for many hours. We also lost some production data that we were eventually unable to recover. Specifically, we lost modifications to database data such as projects, comments, user accounts, issues and snippets, that took place between 17:20 and 00:00 UTC on January 31. Our best estimate is that it affected roughly 5,000 projects, 5,000 comments and 700 new user accounts. Code repositories or wikis hosted on GitLab.com were unavailable during the outage, but were not affected by the data loss. [GitLab Enterprise](/enterprise/) customers, GitHost customers, and self-managed GitLab CE users were not affected by the outage, or the data loss.

Losing production data is unacceptable. To ensure this does not happen again we're working on multiple improvements to our operations & recovery procedures for GitLab.com. In this article we'll look at what went wrong, what we did to recover, and what we'll do to prevent this from happening in the future.

To the GitLab.com users whose data we lost and to the people affected by the outage: we're sorry. I apologize personally, as GitLab's CEO, and on behalf of everyone at GitLab.

## Database setup

GitLab.com currently uses a single primary and a single secondary in hot-standby
mode. The standby is only used for failover purposes. In this setup a single
database has to handle all the load, which is not ideal. The primary's hostname
is `db1.cluster.gitlab.com`, while the secondary's hostname is
`db2.cluster.gitlab.com`.

In the past we've had various other issues with this particular setup due to
`db1.cluster.gitlab.com` being a single point of failure. For example:

* [A database outage on November 28th, 2016 due to project_authorizations having too much bloat](https://gitlab.com/gitlab-com/infrastructure/issues/791)
* [CI distributed heavy polling and exclusive row locking for seconds takes GitLab.com down](https://gitlab.com/gitlab-com/infrastructure/issues/514)
* [Scary DB spikes](https://gitlab.com/gitlab-com/infrastructure/issues/364)

## Timeline

On January 31st an engineer started setting up multiple PostgreSQL servers in
our staging environment. The plan was to try out
[pgpool-II](http://www.pgpool.net/mediawiki/index.php/Main_Page) to see if it
would reduce the load on our database by load balancing queries between the
available hosts. Here is the issue for that plan:
[infrastructure#259](https://gitlab.com/gitlab-com/infrastructure/issues/259).

**± 17:20 UTC:** prior to starting this work, our engineer took an LVM snapshot
of the production database and loaded this into the staging environment. This was
necessary to ensure the staging database was up to date, allowing for more
accurate load testing. This procedure normally happens automatically once every
24 hours (at 01:00 UTC), but they wanted a more up to date copy of the
database.

**± 19:00 UTC:** GitLab.com starts experiencing an increase in database load due
to what we suspect was spam. In the week leading up to this event GitLab.com had
been experiencing similar problems, but not this severe. One of the problems
this load caused was that many users were not able to post comments on issues
and merge requests. Getting the load under control took several hours.

We would later find out that part of the load was caused by a background job
trying to remove a GitLab employee and their associated data. This was the
result of their account being flagged for abuse and accidentally scheduled for removal. More information regarding this particular problem can be found in the
issue ["Removal of users by spam should not hard
delete"](https://gitlab.com/gitlab-org/gitlab-ce/issues/27581).

**± 23:00 UTC:** Due to the increased load, our PostgreSQL secondary's
replication process started to lag behind. The replication failed as WAL
segments needed by the secondary were already removed from the primary. As
GitLab.com was not using WAL archiving, the secondary had to be re-synchronised
manually. This involves removing the
existing data directory on the secondary, and running
[pg_basebackup](https://www.postgresql.org/docs/9.6/static/app-pgbasebackup.html)
to copy over the database from the primary to the secondary.

One of the engineers went to the secondary and wiped the data directory, then
ran `pg_basebackup`. Unfortunately `pg_basebackup` would hang, producing no
meaningful output, despite the `--verbose` option being set. After a few tries
`pg_basebackup` mentioned that it could not connect due to the master not having
enough available replication connections (as controlled by the `max_wal_senders`
option).

To resolve this our engineers decided to temporarily increase
`max_wal_senders` from the default value of `3` to `32`. When applying the
settings, PostgreSQL refused to restart, claiming too many semaphores were being
created. This can happen when, for example, `max_connections` is set too high. In
our case this was set to `8000`. Such a value is way too high, yet it had been
applied almost a year ago and was working fine until that point. To resolve this
the setting's value was reduced to `2000`, resulting in PostgreSQL restarting
without issues.

Unfortunately this did not resolve the problem of `pg_basebackup` not starting
replication immediately. One of the engineers decided to run it with `strace` to
see what it was blocking on. `strace` showed that `pg_basebackup` was hanging in
a `poll` call, but that did not provide any other meaningful information that might
have explained why.

**± 23:30 UTC:** one of the engineers thinks that perhaps `pg_basebackup`
created some files in the PostgreSQL data directory of the secondary during the
previous attempts to run it. While normally `pg_basebackup` prints an error when
this is the case, the engineer in question wasn't too sure what was going on. It
would later be revealed by another engineer (who wasn't around at the time) that
this is normal behaviour: `pg_basebackup` will wait for the primary to start
sending over replication data and it will sit and wait silently until that time.
Unfortunately this was not clearly documented in our [engineering
runbooks](https://gitlab.com/gitlab-com/runbooks) nor in the official
`pg_basebackup` document.

Trying to restore the replication process, an engineer proceeds to wipe the
PostgreSQL database directory, errantly thinking they were doing so on the
secondary. Unfortunately this process was executed on the primary instead. The
engineer terminated the process a second or two after noticing their mistake,
but at this point around 300 GB of data had already been removed.

Hoping they could restore the database the engineers involved went to look for
the database backups, and asked for help on Slack. Unfortunately the process of
both finding and using backups failed completely.

## Broken recovery procedures

This brings us to the recovery procedures. Normally in an event like this, one
should be able to restore a database in relatively little time using a recent
backup, though some form of data loss can not always be prevented. For
GitLab.com we have the following procedures in place:

1. Every 24 hours a backup is generated using `pg_dump`, this backup is uploaded
   to Amazon S3. Old backups are automatically removed after some time.
1. Every 24 hours we generate an LVM snapshot of the disk storing the production
   database data. This snapshot is then loaded into the staging environment,
   allowing us to more safely test changes without impacting our production
   environment. Direct access to the staging database is restricted, similar to
   our production database.
1. For various servers (e.g. the NFS servers storing Git data) we use Azure disk
   snapshots. These snapshots are taken once per 24 hours.
1. Replication between PostgreSQL hosts, primarily used for failover purposes
   and not for disaster recovery.

At this point the replication process was broken and data had already been wiped
from both the primary and secondary, meaning we could not restore from either
host.

### Database backups using pg_dump

When we went to look for the `pg_dump` backups we found out they were not there.
The S3 bucket was empty, and there was no recent backup to be found anywhere.
Upon closer inspection we found out that the backup procedure was using
`pg_dump` 9.2, while our database is running PostgreSQL 9.6 (for Postgres, 9.x
releases are considered major). A difference in major versions results in
`pg_dump` producing an error, terminating the backup procedure.

The difference is the result of how our Omnibus package works. We currently
support both PostgreSQL 9.2 and 9.6, allowing users to upgrade (either manually
or using commands provided by the package). To determine the correct version to
use the Omnibus package looks at the PostgreSQL version of the database cluster
(as determined by `$PGDIR/PG_VERSION`, with `$PGDIR` being the path to the data
directory). When PostgreSQL 9.6 is detected Omnibus ensures all binaries use
PostgreSQL 9.6, otherwise it defaults to PostgreSQL 9.2.

The `pg_dump` procedure was executed on a regular application server, not the
database server. As a result there is no PostgreSQL data directory present on
these servers, thus Omnibus defaults to PostgreSQL 9.2. This in turn resulted in
`pg_dump` terminating with an error.

While notifications are enabled for any cronjobs that error, these notifications
are sent by email. For GitLab.com we use [DMARC](https://dmarc.org/).
Unfortunately DMARC was not enabled for the cronjob emails, resulting in them
being rejected by the receiver. This means we were never aware of the backups
failing, until it was too late.

### Azure disk snapshots

Azure disk snapshots are used to generate a snapshot of an entire disk. These
snapshots don't make it easy to restore individual chunks of data (e.g. a lost
user account), though it's possible. The primary purpose is to restore entire
disks in case of disk failure.

In Azure a snapshot belongs to a storage account, and a storage account in turn
is linked to one or more hosts. Each storage account has a limit of roughly 30
TB. When restoring a snapshot using a host in the same storage account, the
procedure usually completes very quickly. However, when using a host in a
different storage account the procedure can take hours if not days to complete.
For example, in one such case it took over a week to restore a snapshot. As a
result we try not to rely on this system too much.

While enabled for the NFS servers, these snapshots were not enabled for any of
the database servers as we assumed that our other backup procedures were
sufficient enough.

### LVM snapshots

The LVM snapshots are primarily used to easily copy data from our production
environment to our staging environment. While this process was working as
intended, the produced snapshots are not really meant to be used for disaster
recovery. At the time of the outage we had two snapshots available:

1. A snapshot created for our staging environment every 24 hours, almost 24
   hours before the outage happened.
1. A snapshot created manually by one of the engineers roughly 6 hours before
   the outage.

When we generate a snapshot the following steps are taken:

1. Generate a snapshot of production.
1. Copy the snapshot to staging.
1. Create a new disk using this snapshot.
1. Remove all webhooks from the resulting database, to prevent them from being
   triggered by accident.

## Recovering GitLab.com

To recover GitLab.com we decided to use the LVM snapshot created 6 hours before
the outage, as it was our only option to reduce data loss as much as possible
(the alternative was to lose almost 24 hours of data). This process would
involve the following steps:

1. Copy the existing staging database to production, which would not contain any
   webhooks.
1. In parallel, copy the snapshot used to set up the database as this snapshot
   might still contain the webhooks (we weren't entirely sure).
1. Set up a production database using the snapshot from step 1.
1. Set up a separate database using the snapshot from step 2.
1. Restore webhooks using the database set up in the previous step.
1. Increment all database sequences by 100,000 so one can't re-use IDs that
   might have been used before the outage.
1. Gradually re-enable GitLab.com.

For our staging environment we were using Azure classic, without Premium Storage.
This is primarily done to save costs as premium storage is quite expensive. As a
result the disks are very slow, resulting in them being the main bottleneck in
the restoration process. Because LVM snapshots are stored on the hosts they are
taken for we had two options to restore data:

1. Copy over the LVM snapshot
1. Copy over the PostgreSQL data directory

In both cases the amount of data to copy would be roughly the same. Since
copying over and restoring the data directory would be easier we decided to go
with this solution.

Copying the data from the staging to the production host took around 18 hours. These disks are network disks and are throttled to a really low number (around 60Mbps), there is no way to move from cheap storage to premium, so this was the performance we would get out of it. There was no network or processor bottleneck, the bottleneck was in the drives.
Once copied we were able to restore the database (including webhooks) to the
state it was at January 31st, 17:20 UTC.

On February 1st at 17:00 UTC we managed to restore the GitLab.com database
without webhooks. Restoring webhooks was done by creating a separate staging
database using the LVM snapshot, but without triggering the removal of webhooks.
This allowed us to generate a SQL dump of the table and import this into the
restored GitLab.com database.

Around 18:00 UTC we finished the final restoration procedures such as restoring
the webhooks and confirming everything was operating as expected.

## Publication of the outage

In the spirit of transparency we kept track of progress and notes in a
[publicly visible Google document](https://docs.google.com/document/d/1GCK53YDcBWQveod9kfzW-VCxIABGiryG7_z_6jHdVik/pub).
We also streamed the recovery procedure on YouTube, with a peak viewer count of
around 5000 (resulting in the stream being the #2 live stream on YouTube for
several hours). The stream was used to give our users live updates about the
recovery procedure. Finally we used Twitter (<https://twitter.com/gitlabstatus>)
to inform those that might not be watching the stream.

The document in question was initially private to GitLab employees and contained
name of the engineer who accidentally removed the data. While the name was added
by the engineer themselves (and they had no problem with this being public), we
will redact names in future cases as other engineers may not be comfortable with
their name being published.

## Data loss impact

Database data such as projects, issues, snippets, etc. created between January
31st 17:20 UTC and 23:30 UTC has been lost. Git repositories and Wikis were not
removed as they are stored separately.

It's hard to estimate how much data has been lost exactly, but we estimate we
have lost at least 5000 projects, 5000 comments, and roughly 700 users. This
only affected users of GitLab.com, self-managed instances or GitHost instances
were not affected.

## Impact on GitLab itself

Since GitLab uses GitLab.com to develop GitLab the outage meant that for some it
was harder to get work done. Most developers could continue working using their
local Git repositories, but creating issues and such had to be delayed. To
publish the blog post ["GitLab.com Database
Incident"](/blog/2017/02/01/gitlab-dot-com-database-incident/)
we used a private GitLab instance we normally use for private/sensitive
workflows (e.g. security releases). This allowed us to build and deploy a new
version of the website while GitLab.com was unavailable.

We also have a public monitoring website located at
<https://dashboards.gitlab.com/>. Unfortunately the current setup for this website
was not able to handle the load produced by users using this service during the
outage. Fortunately our internal monitoring systems (which dashboards.gitlab.com is
based on) were not affected.

## Root cause analysis

To analyse the root cause of these problems we'll use a technique called ["The 5
Whys"](https://en.wikipedia.org/wiki/5_Whys). We'll break up the incident into 2
main problems: GitLab.com being down, and it taking a long time to restore
GitLab.com.

**Problem 1:** GitLab.com was down for about 18 hours.

1. **Why was GitLab.com down?** - The database directory of the primary database
   was removed by accident, instead of removing the database directory of the
   secondary.
1. **Why was the database directory removed?** - Database replication stopped,
   requiring the secondary to be reset/rebuilt. This in turn requires that the
   PostgreSQL data directory is empty. Restoring this required manual work as
   this was not automated, nor was it documented properly.
1. **Why did replication stop?** - A spike in database load caused the database
   replication process to stop. This was due to the primary removing WAL
   segments before the secondary could replicate them.
1. **Why did the database load increase?** - This was caused by two events
   happening at the same time: an increase in spam, and a process trying to
   remove a GitLab employee and their associated data.
1. **Why was a GitLab employee scheduled for removal?** - The employee was
   reported for abuse by a troll. The current system used for responding to
   abuse reports makes it too easy to overlook the details of those reported. As
   a result the employee was accidentally scheduled for removal.

**Problem 2:** restoring GitLab.com took over 18 hours.

1. **Why did restoring GitLab.com take so long?** - GitLab.com had to be
   restored using a copy of the staging database. This was hosted on slower
   Azure VMs in a different region.
1. **Why was the staging database needed for restoring GitLab.com?** - Azure
   disk snapshots were not enabled for the database servers, and the periodic
   database backups using `pg_dump` were not working.
1. **Why could we not fail over to the secondary database host?** - The
   secondary database's data was wiped as part of restoring database
   replication. As such it could not be used for disaster recovery.
1. **Why could we not use the standard backup procedure?** - The standard backup
   procedure uses `pg_dump` to perform a logical backup of the database. This
   procedure failed silently because it was using PostgreSQL 9.2, while
   GitLab.com runs on PostgreSQL 9.6.
1. **Why did the backup procedure fail silently?** - Notifications were
   sent upon failure, but because of the Emails being rejected there was no
   indication of failure. The sender was an automated process with no other
   means to report any errors.
1. **Why were the Emails rejected?** - Emails were rejected by the receiving
   mail server due to the Emails not being signed using DMARC.
1. **Why were Azure disk snapshots not enabled?** - We assumed our other backup
   procedures were sufficient. Furthermore, restoring these snapshots can take
   days.
1. **Why was the backup procedure not tested on a regular basis?** - Because
   there was no ownership, as a result nobody was responsible for testing this
   procedure.

## Improving recovery procedures

We are currently working on fixing and improving our various recovery
procedures. Work is split across the following issues:

1. [Overview of status of all issues listed in this blog post (#1684)](https://gitlab.com/gitlab-com/infrastructure/issues/1684)
1. [Update PS1 across all hosts to more clearly differentiate between hosts and environments (#1094)](https://gitlab.com/gitlab-com/infrastructure/issues/1094)
1. [Prometheus monitoring for backups (#1095)](https://gitlab.com/gitlab-com/infrastructure/issues/1095)
1. [Set PostgreSQL's max_connections to a sane value (#1096)](https://gitlab.com/gitlab-com/infrastructure/issues/1096)
1. [Investigate Point in time recovery & continuous archiving for PostgreSQL (#1097)](https://gitlab.com/gitlab-com/infrastructure/issues/1097)
1. [Hourly LVM snapshots of the production databases (#1098)](https://gitlab.com/gitlab-com/infrastructure/issues/1098)
1. [Azure disk snapshots of production databases (#1099)](https://gitlab.com/gitlab-com/infrastructure/issues/1099)
1. [Move staging to the ARM environment (#1100)](https://gitlab.com/gitlab-com/infrastructure/issues/1100)
1. [Recover production replica(s) (#1101)](https://gitlab.com/gitlab-com/infrastructure/issues/1101)
1. [Automated testing of recovering PostgreSQL database backups (#1102)](https://gitlab.com/gitlab-com/infrastructure/issues/1102)
1. [Improve PostgreSQL replication documentation/runbooks (#1103)](https://gitlab.com/gitlab-com/infrastructure/issues/1103)
1. [Investigate pgbarman for creating PostgreSQL backups (#1105)](https://gitlab.com/gitlab-com/infrastructure/issues/1105)
1. [Investigate using WAL-E as a means of Database Backup and Realtime Replication (#494)](https://gitlab.com/gitlab-com/infrastructure/issues/494)
1. [Build Streaming Database Restore](https://gitlab.com/gitlab-com/infrastructure/issues/1152)
1. [Assign an owner for data durability](https://gitlab.com/gitlab-com/infrastructure/issues/1163)

We are also working on setting up multiple secondaries and balancing the load
amongst these hosts. More information on this can be found at:

* [Bundle pgpool-II 3.6.1 (!1251)](https://gitlab.com/gitlab-org/omnibus-gitlab/merge_requests/1251)
* [Connection pooling/load balancing for PostgreSQL (#259)](https://gitlab.com/gitlab-com/infrastructure/issues/259)

Our main focus is to improve disaster recovery, and making it more obvious as to
what host you're using; instead of preventing production engineers from running
certain commands. For example, one could alias `rm` to something safer but in
doing so would only protect themselves against accidentally running `rm -rf
/important-data`, not against disk corruption or any of the many other ways you
can lose data.

An ideal environment is one in which you _can_ make mistakes but easily and
quickly recover from them with minimal to no impact. This in turn requires you
to be able to perform these procedures on a regular basis, and make it easy to
test and roll back any changes. For example, we are in the process of setting up
procedures that allow developers to test their database migrations. More
information on this can be found in the issue
["Tool for executing and reverting Rails migrations on staging"](https://gitlab.com/gitlab-com/infrastructure/issues/811).

We're also looking into ways to build better recovery procedures for the entire
GitLab.com infrastructure, and not just the database; and to ensure there is
ownership of these procedures. The issue for this is
["Disaster recovery for everything that is not the database"](https://gitlab.com/gitlab-com/infrastructure/issues/1161).

Monitoring wise we also started working on a public backup monitoring dashboard,
which can be found at <https://dashboards.gitlab.com/dashboard/db/postgresql-backups>.
Currently this dashboard only contains data of our `pg_dump` backup procedure,
but we aim to add more data over time.

One might notice that at the moment our `pg_dump` backups are 3 days old.  We
perform these backups on a secondary as `pg_dump` can put quite a bit of
pressure on a database. Since we are in the process of rebuilding our
secondaries the `pg_dump` backup procedure is suspended for the time being. Fear
not however, as LVM snapshots are now taken every hour instead of once per 24
hours. Enabling Azure disk snapshots is something we're still looking into.

Finally, we're looking into improving our abuse reporting and response system.
More information regarding this can be found in the issue
["Removal of users by spam should not hard delete"](https://gitlab.com/gitlab-org/gitlab-ce/issues/27581).

If you think there are additional measures we can take to prevent incidents like this please let us know in the comments.

## Troubleshooting FAQ

### Some of my merge requests are shown as being open, but their commits have already been merged into the default branch. How can I resolve this?

Pushing to the default branch will automatically update the merge request so
that it's aware of there not being any differences between the source and target
branch. At this point you can safely close the merge request.

### My merge request has not yet been merged, and I am not seeing my changes. How can I resolve this?

There are 3 options to resolve this:

1. Close the MR and create a new one
1. Push new changes to the merge request's source branch
1. Rebase/amend, and force push to the merge request's source branch

### My GitLab Pages website was not updated. How can I solve this?

Go to your project, then "Pipelines", "New Pipeline", use "master" as the
branch, then create the pipeline. This will create and start a new pipeline
using your master branch, which should result in your website being updated.

### My Pipelines were not executed

Most likely they were, but the database is not aware of this. To solve this,
create a new pipeline using the right branch and run it.

### Some commits are not showing up

Pushing new commits should automatically solve this. Alternatively you can try
force pushing to the target branch.

### I created a project after 17:20 UTC and it shows up, but my issues are gone.  What happened?

Project details are stored in the database. This meant that this data was lost
for projects created after 17:20. We ran a procedure to restore these
projects based on their Git repositories that were still stored in our NFS
cluster. This procedure however was only able to restore projects in their most
basic form, without associated data such as issues and merge requests.
