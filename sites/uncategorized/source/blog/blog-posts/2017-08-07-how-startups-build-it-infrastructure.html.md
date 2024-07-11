---
title: "A way for startups to build a solid IT infrastructure"
window_title: "How to Build an IT Infrastructure for Startups"
author: plapadoo
author_twitter: plapadoo
guest: True
categories: open source
canonical_path: "/blog/2017/08/07/how-startups-build-it-infrastructure/"
image_title: '/images/blogimages/startups-it-infrastructure.jpg'
twitter_image: '/images/tweets/startups-it-infrastructure-tweet.png'
description: "Seven free software solutions to cover your most important use cases."
tags: open source, startups, user stories
---

 *plapadoo is a software startup from Hannover, Germany, providing tailored, high-quality software engineering to their clients. They fill us in on how they chose solutions for their IT infrastructure, including communication, backups, [CI/CD](/topics/ci-cd/) and more.*

<!-- more -->

We recently founded [our company](https://plapadoo.de/) and so one of the first things to do was to get our infrastructure up and running. As a software startup, our technical infrastructure is the heart of our company. It influences our productivity, has impact on our costs and offers a great chance to set us apart from the competition. Having a good infrastructure is also key to saving us money and increasing development speed.

When planning the setup of our infrastructure, we kept two things in mind: First, we wanted to have open source software running wherever possible, and second, we wanted to use strong encryption for both communication and data storage. Also, we prefer lightweight software with few dependencies. Below, you find a small list of important use cases and which software we use to cover them:

- [Chat](#chat) ([Matrix](https://matrix.org/)/[Riot](https://about.riot.im/) web app + Android app)
- [Email](#email) (self-hosted [Dovecot](https://www.dovecot.org/) + [Postfix](http://www.postfix.org/) + [Sieve](http://sieve.info/) + [SpamAssasin](http://spamassassin.apache.org/))
- [Calendar and Contacts](#calendar-and-contacts) ([Radicale](http://radicale.org/))
- [Voice Conferencing](#voice-conferencing) ([uMurmur](http://umurmur.net/)/[Mumble](https://wiki.mumble.info/))
- [Synchronization of files across multiple devices](#data-storage) ([Syncthing](https://syncthing.net/))
- [Git and Continuous Integration](#build-and-continuous-integration) ([GitLab](/stages-devops-lifecycle/) & [GitLab CI](/features/continuous-integration/))
- [Backup and Traceability](#backup-and-traceability) ([borgmatic](https://github.com/witten/borgmatic) & [etckeeper](http://etckeeper.branchable.com/))
Besides this, we have other services (like VPN or HTTP servers) running which are not that special and as such, are not covered on this article.

## Base setup

It all starts with choosing the platform to run your software on. We decided to use [Arch Linux](https://www.archlinux.org/) as the operating system for our server. Our main reasons for choosing Arch Linux were its active community, good documentation, highly up-to-date repositories with current versions of important software, good support for disk encryption, and finally, the fact that Arch Linux has a rolling update scheme instead of a release-based one. This last point is especially important to us, since we do not want to go through the pain of upgrading our operating system from one version to the next every other year  —  which usually causes lots of trouble. Furthermore, release-based distributions tend to have outdated software in their repositories. Instead, we prefer to keep our system always up to date and enjoy the latest version of any software any time.

Most of our software is installed using Arch Linux’ package manager. However, in some cases [Docker](https://docker.com/) is also a good idea to use for running software. This is especially the case when software introduces dependencies you don’t want on your host system or if you are in doubt about the security of a software. Since Docker provides a certain level of isolation, security breaches don’t have as bad consequences as they have when you are running the vulnerable software directly on your host system. However, it should be kept in mind that there is the risk of a so-called container breakout. This basically means that your host system can be subject to an attack even if the vulnerable software is running inside a Docker container. Other reasons for using Docker can be wanting to try something out without messing up your host system or maybe software is simply not available for your Linux distribution. Of course, there are many other advantages to containerization, but we won’t be covering those today.

## Communication

Communication, and using appropriate communication channels has been central to us since the very beginning. We wanted a means of communicating that was secure, fast, reliable, and easily accessible from any device. This applies to chat, email, contacts and calendar entries.

### Chat

For chatting, we needed a solution which supported the concept of a “room” or “channel,” so as to keep discussions clear and separated from each other. We found Matrix/Synapse and Riot to be a perfect solution. While we also tried alternatives, such as Rocket.Chat and Mattermost, we liked Riot/Matrix the most because of its native Android app, its active development, and an open API.

We are using the Matrix API to run custom chat bots. These bots have become quite an important factor in our company, since they massively increase transparency and information distribution among the team. For example, we have bots to inform us about new commits being pushed to our GitLab server, new calendar entries being created in our shared calendar, successful or failed builds and so on. We will cover these bots in detail in an upcoming article.

### Email

Since we want to have complete control over the data belonging to our core business, we use a private mail server. It is indeed challenging to set up securely, but we still decided to go with it because of how important secure and private communication is to us. We had to read a lot of documentation before we could set it up, most importantly to prevent a security hole in the system. Not doing that would possibly mean ending up on a spammer blacklist, since someone could be abusing our mail server, or an attacker gaining access to our mail. It is a lot of work, but we definitely recommend taking the time to understand every step of the process and avoid any mistakes. On the client side, we seek to encrypt our emails using PGP whenever possible.

### Calendar and contacts

In order to have a shared calendar as well as a shared address book, we are running Radicale, which is a lightweight CalDAV and CardDAV server. Although it is not easy to configure, it comes with support for Git and just quietly does its job in the background. We have never experienced any problems with this software so far and like it for its reliability. For Android and iOS, there are CalDAV and CardDAV adapters available to synchronize everything with your phone.

### Voice Conferencing

For voice conferencing, it was very important to us to have a trustworthy open source solution in place. Proprietary solutions always come at the risk of backdoors being shipped along with them. We decided to give Mumble a try. Mumble is an open source voice client that requires a central server to handle all the traffic. The official server implementation is called Murmur. When installing Murmur, we learned that it pulls in a giant bunch of dependencies.

Among those dependencies are things such as X11 which most people don’t want on their servers. The problem with such dependencies is that they introduce potential attack surfaces as well as costing time, money, and other resources to maintain and update them. So you normally want as few dependencies as possible. This alone would make it a bad fit for us, but we still decided to give it a try. One option would have been to run Murmur inside a Docker container where the mentioned dependencies wouldn’t bother us too much. While we were configuring Murmur, we had to choose a server password. As always, we generated a long, strong password with about 60 random characters (including special characters). As we started the server and tried to connect a client, we were completely shocked. Murmur let clients in without requiring a password.

We found out that Murmur seems to have a problem with long passwords and then just ignores them. So if you configure Murmur with the goal of strong security, you get no security at all. Needless to say that we immediately uninstalled Murmur and all of the crazy dependencies it introduced.
While looking for alternatives, we soon discovered uMurmur which is an alternative Mumble server implementation aiming at embedded systems. It comes with few dependencies and generally seems to be well implemented. We installed it, did not experience any issues with long passwords and have been using it ever since without any problem. The communication is encrypted using a TLS certificate.

## Data storage

![box files](/images/blogimages/startups-it-infrastructure-body.jpg){: .shadow}

Another important aspect within a company besides communication is the need to store and distribute documents among its different stakeholders.
When sharing data, most programmers will normally use Git. However, Git is not to best choice for sharing binary data such as documents, photos, videos, etc., because one usually doesn’t need to keep different versions of these files. A common approach is to use ownCloud/NextCloud for data sharing, but since we really don’t like PHP, we precluded these two applications.

Instead, we discovered Syncthing. Once you understand the concept of Syncthing, it is easy to set up, extremely easy to use and it just works out of the box. Syncthing can be described as a software which synchronizes data across several nodes. We have one Syncthing instance running on our server that acts as a kind of master node, although a master is not explicitly needed  —  Syncthing is completely decentralized. We also run Syncthing on our desktops and phones. Each Syncthing node has a unique ID, which has to be added using the web interface of the master node in order to share data with them. For the local node, the unique ID of the master node has to be added accordingly. Using this concept of a master node, we don’t have to wire all our devices to each other  —  it is enough to just wire each device to the master node.

After that, you can select which folders should be shared using Syncthing. Syncthing will then automatically upload any new data you put into these folders to the remote node. Data added by other users is downloaded to the clients on the fly, and deletions of files, changes, etc. are also applied locally. For Android, there is a native Syncthing app available which does exactly the same. By using Syncthing, all our devices always have the latest version of the data stored inside the Syncthing shares on the master node.

## Build and continuous integration

For Git and continuous integration, we use GitLab, which already comes with integrated CI features. Although GitLab is quite resource-hungry, it provides lots of very nice features such as an integrated issue tracker and the “snippets” area  —  where you can paste code snippets and share them. GitLab is well documented and has an open API. It features webhooks that you can use to trigger HTTP requests whenever commits are pushed, CI pipelines start, and so on. We use that to generate notifications in matrix rooms corresponding to the Git repositories. So, for example, if someone pushes a commit to project “foo,” we get a notification in a Matrix room “room about foo,” which is linked to this project.

>GitLab provides lots of very nice features such as an integrated issue tracker and the “snippets” area  —  where you can paste code snippets and share them

We are using the official GitLab Docker image, which already includes [Prometheus](https://prometheus.io/) for monitoring. We are accessing this Prometheus instance from our host system and plot its data in a dedicated [Grafana](https://grafana.com/) dashboard. This way, we can monitor our GitLab server internals with very little effort.

For building a project using GitLab CI, you need a so-called “gitlab-runner” that acts as a build agent. There are also official Docker images available for those runners, but we have created our own Docker base image, which has some basic tools we constantly need. We use our custom base image to build individual runners for each project on top of it. This way, we have runners tailored exactly to the needs of our projects. Since the Docker socket is mapped into our runners, we can even build and deploy Docker images from within them.

We like the fact that the build jobs are defined through a “.gitlab-ci.yml” file that is versioned with each project. This way, you can track changes to the build process and always have a running build  —  even if you checkout an old version of a project.

## Backup and traceability

Backing up your data is very important. Especially nowadays with the widespread use of SSDs, when fatal disk failure is likely to happen. Other reasons for data loss may be accidental deletion or attacks. We are using [BorgBackup](https://borgbackup.readthedocs.io/) together with borgmatic, which is a nice, simple, incremental, and highly automatable backup solution. You can easily specify files to exclude from the backup, and also select how many daily, weekly, monthly and yearly backups you want Borg to keep. By setting up a Cron job or systemd timer, you can fully automate the backup process. We create backups every night and store them on an NFS storage, which is only mounted when the backup process is running. This way, we avoid the backup to be deleted by an accidental `rm -rf /` or some other mishap. Borg encrypts the backups and supports compression to keep your backups safe and small. We like to keep track of any changes we make to the system, especially those to configuration files.

For Linux, there is a useful little tool called etckeeper, which turns your `/etc` directory into a Git repository. It also adds hooks to your package manager to automatically commit any configuration changes being performed during system updates. Using etckeeper, every configuration change corresponds to a Git commit, with an author, a timestamp and a message. This provides for much more transparency, especially when more than one person administrates a server. Also, the way Git works, accidental changes are detected and bad configurations can be easily reverted.

## Summary

We explained that we, at plapadoo, prefer lightweight (in terms of dependencies), focused software over bloated solutions and favor open source software. Our custom chat bot gives us a high level of transparency and awareness, and also improves our productivity, since we always know what’s going on, even if working remotely. Lastly, we explained which software solutions we have chosen for which use cases and why.

If you liked this article, please help us reach more readers by sharing it. If you have any questions, thoughts or recommendations on the topic, feel free to comment. Which software solutions did you choose for your startup?

_This post was originally published on [Medium](https://medium.com/plapadoo/a-way-for-startups-to-build-a-solid-it-infrastructure-a48b222fbff6/)._

[CERN reception, Meyrin, Switzerland](https://unsplash.com/@samuelzeller?photo=JuFcQxgCXwA) by [Samuel Zeller](https://unsplash.com/@samuelzeller) on Unsplash.
{: .note}
