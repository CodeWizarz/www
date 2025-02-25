---
title: "Cookbook-omnibus-gitlab 0.1.2 security release"
description: "Learn more about the cookbook-omnibus-gitlab 0.1.2 security release."
canonical_path: "/releases/2014/10/08/cookbook-omnibus-gitlab-0-1-2-security-release/"
date: 2014-10-08
permalink: /2014/10/07/cookbook-omnibus-gitlab-0-1-2-security-release/
categories: releases
author: Jacob Vosmaer
---

Today we released cookbook-omnibus-gitlab 0.1.2 to address an issue where
encrypted secrets were stored in plaintext on the Chef Server.

<!--more-->

_Update 2014-10-09:_ fix incorrect post date.

[Cookbook-omnibus-gitlab](https://gitlab.com/gitlab-org/cookbook-omnibus-gitlab)
is a Chef cookbook to install GitLab using Omnibus packages.

Cookbook-omnibus-gitlab allows you to keep secret Omnibus-gitLab settings
(passwords, keys) in an encrypted data bag. These secrets then get decrypted
during the Chef client run on your GitLab server. Due to a programming error,
the cookbook-omnibus-gitlab would then send the plaintext secrets back to the
Chef server to be stored in the node's database record. This defeats one of the
purposes of using encrypted data bags, namely to keep plaintext secrets off of
the Chef server.

In version 0.1.2 we make sure that the secrets stored in the encrypted data bag
do not get sent back to the server.

## Affected versions

Cookbook-omnibus-gitlab 0.1.1 and older.

## Fixed versions

Cookbook-omnibus-gitlab 0.1.2 and newer.

## Diagnosis and fixes

If you have been using cookbook-omnibus-gitlab with an encrypted data bag you
should upgrade to cookbook-omnibus-gitlab 0.1.2 or newer and inspect your
GitLab nodes to look for secrets:

```
knife node show gitlab.example.com --format json
```

If some of your cookbook-omnibus-gitlab secrets got uploaded to the Chef server
you can delete them from the node object using `knife node edit
gitlab.example.com` **after** you upgrade cookbook-omnibus-gitlab to 0.1.2 or
newer.

As an additional measure you may want to consider changing the affected
passwords and keys.
