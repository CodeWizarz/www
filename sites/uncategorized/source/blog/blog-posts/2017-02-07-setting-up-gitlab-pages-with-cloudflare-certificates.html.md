---
title: "Setting up GitLab Pages with Cloudflare Certificates"
author: Marcia Ramos
author_twitter: XMDRamos
author_gitlab: marcia
categories: engineering
image_title: '/images/unsplash/lock.jpg'
description: "How to set up GitLab Pages with a Cloudflare SSL/TLS Certificate for your (sub)domain"
---

[Cloudflare SSL/TLS certificates][cert] are free to use.
If you want your [GitLab Pages] site to work with them,
it's as simple as could be. There's just a **trick**
you might not know about (yet)!

We assume you're familiar with SSL/TLS, DNS, GitLab Pages,
and Cloudflare.
{:.note}

<!-- more -->

----

## On this page
{:.no_toc}

- TOC
{:toc}

----

## Introduction

With [GitLab Pages], you can [deploy a static website][pages-setup-post]
with custom domains/subdomains and SSL/TLS support.

This tutorial responds to the issue
"[Support Cloudflare CA please!](https://gitlab.com/pages/pages.gitlab.io/issues/29)",
and other cases where GitLab users asked specifically how
to add a Cloudflare certificate to GitLab Pages. 😉 Anything else
is outside the scope of this post.

If you don't know how to set up your GitLab Pages site, or why you
should care about SSL/TLS:

- Take a look at the [GitLab Pages] overview
- Read the step-by-step tutorial [Hosting on GitLab.com with GitLab Pages][pages-setup-post]
- Read the series "**Static Site Generators** (SSGs)":
  - [SSGs Part 1: Static vs Dynamic Websites][ssg-1]
  - [SSGs Part 2: Modern Static Site Generators][ssg-2]
  - [SSGs Part 3: Build any SSG site with GitLab Pages][ssg-3]
- Read the [documentation on GitLab Pages][pages-docs]
- Read an [overview on the importance of HTTPS][post-startssl]

In case you don't know about it yet, we're bringing [GitLab Pages to GitLab Community Edition][pages-ce]! 🎉

## Step-by-step quick guide

To create this step-by-step guide, I'll use my subdomain
`https://cloudflare.marcia.ml` as an alias for the website
originally deployed to <https://gitlab-tests.gitlab.io/jekyll>.

The codebase is a simple [Jekyll] site built with its default
theme, available at <https://gitlab.com/gitlab-tests/jekyll>.

### STEP 1. DNS record

On Cloudflare, navigate to the tab **DNS** and create a new
DNS record ([`CNAME`][cname] or [`A`][a]) pointing your
subdomain (`CNAME`) or root domain (`A`)
[to your GitLab Pages site][pages-setup-domains].

The image below shows both `CNAME` and `A` records
(for the purposes of this demo), but of course, you will only
need one of them. For this example, I used the `CNAME` record pointing `gitlab-tests.gitlab.io` to my subdomain `cloudflare.marcia.ml`:

![set up Cloudflare DNS](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/cloudflare-dns-settings.jpg){:.shadow}

For projects on GitLab.com, the DNS `A` record should point your custom
domain to [GitLab Pages][pages-ip]' server IP address `35.185.44.232`.

**Note:** This GitLab Pages IP address for GitLab.com changed from `52.167.214.135` to `35.185.44.232` in August 2018.
{:.note}

If you'd already set this up, just jump to the second step.

### STEP 2. Generate your certificate

1. Navigate to the tab **Crypto**.
1. Generate your certificate:

    ![generate certificate](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/generate-certificate.png){:.shadow}

1. Choose the domain, subdomain, or wildcard to apply the cert to, then click **Next**:

    ![choose-domain](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/certificate-setup.png){:.shadow}

1. Your certificate and private key have been generated. Leave the tab and the modal window open:

    ![modal with certificate](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/modal-window.png){:.shadow}

### STEP 3. Add the custom (sub)domain and the certificate to your GitLab Pages project

From a new tab, go to GitLab, and navigate to your project's **Settings** > **Pages** > **+ New Domain**:

![configure GitLab Pages](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/configure-gitlab-pages.png){:.shadow}

Copy the PEM certificate and the private key from the tab you've
left open on Cloudflare, and paste it into their respective fields in GitLab:

![Add PEM certificate to Pages](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/add-certificate-to-pages.png){:.shadow}

### STEP 4. The trick

Cloudflare doesn't combine both PEM and root certificates in one,
so we need to copy the root certificate (aka "intermediate")
**[Cloudflare Origin CA — RSA Root][root]** from the code block
below, and **paste it below your certificate (PEM)** just added to GitLab:

Copy Cloudflare's Origin CA — RSA Root:

```
-----BEGIN CERTIFICATE-----
MIIEADCCAuigAwIBAgIID+rOSdTGfGcwDQYJKoZIhvcNAQELBQAwgYsxCzAJBgNV
BAYTAlVTMRkwFwYDVQQKExBDbG91ZEZsYXJlLCBJbmMuMTQwMgYDVQQLEytDbG91
ZEZsYXJlIE9yaWdpbiBTU0wgQ2VydGlmaWNhdGUgQXV0aG9yaXR5MRYwFAYDVQQH
Ew1TYW4gRnJhbmNpc2NvMRMwEQYDVQQIEwpDYWxpZm9ybmlhMB4XDTE5MDgyMzIx
MDgwMFoXDTI5MDgxNTE3MDAwMFowgYsxCzAJBgNVBAYTAlVTMRkwFwYDVQQKExBD
bG91ZEZsYXJlLCBJbmMuMTQwMgYDVQQLEytDbG91ZEZsYXJlIE9yaWdpbiBTU0wg
Q2VydGlmaWNhdGUgQXV0aG9yaXR5MRYwFAYDVQQHEw1TYW4gRnJhbmNpc2NvMRMw
EQYDVQQIEwpDYWxpZm9ybmlhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAwEiVZ/UoQpHmFsHvk5isBxRehukP8DG9JhFev3WZtG76WoTthvLJFRKFCHXm
V6Z5/66Z4S09mgsUuFwvJzMnE6Ej6yIsYNCb9r9QORa8BdhrkNn6kdTly3mdnykb
OomnwbUfLlExVgNdlP0XoRoeMwbQ4598foiHblO2B/LKuNfJzAMfS7oZe34b+vLB
yrP/1bgCSLdc1AxQc1AC0EsQQhgcyTJNgnG4va1c7ogPlwKyhbDyZ4e59N5lbYPJ
SmXI/cAe3jXj1FBLJZkwnoDKe0v13xeF+nF32smSH0qB7aJX2tBMW4TWtFPmzs5I
lwrFSySWAdwYdgxw180yKU0dvwIDAQABo2YwZDAOBgNVHQ8BAf8EBAMCAQYwEgYD
VR0TAQH/BAgwBgEB/wIBAjAdBgNVHQ4EFgQUJOhTV118NECHqeuU27rhFnj8KaQw
HwYDVR0jBBgwFoAUJOhTV118NECHqeuU27rhFnj8KaQwDQYJKoZIhvcNAQELBQAD
ggEBAHwOf9Ur1l0Ar5vFE6PNrZWrDfQIMyEfdgSKofCdTckbqXNTiXdgbHs+TWoQ
wAB0pfJDAHJDXOTCWRyTeXOseeOi5Btj5CnEuw3P0oXqdqevM1/+uWp0CM35zgZ8
VD4aITxity0djzE6Qnx3Syzz+ZkoBgTnNum7d9A66/V636x4vTeqbZFBr9erJzgz
hhurjcoacvRNhnjtDRM0dPeiCJ50CP3wEYuvUzDHUaowOsnLCjQIkWbR7Ni6KEIk
MOz2U0OBSif3FTkhCgZWQKOOLo1P42jHC3ssUZAtVNXrCk3fw9/E15k8NPkBazZ6
0iykLhH1trywrKRMVw67F44IE8Y=
-----END CERTIFICATE-----
```

Paste it below your PEM certificate (jump a line between the
last row of your cert `-----END CERTIFICATE-----` and the
first row of the intermediate cert `-----BEGIN CERTIFICATE-----`):

![Add intermediate certificate](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/add-intermediate-certificate.png){:.shadow}


### STEP 5. Apply the changes

1. Click **Create New Domain**.
1. Ta-da! 🎉

    ![Screen_Shot_2016-12-21_at_13.52.02](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/certificate-added.png){:.shadow}

It works fine with the encryption set to _"Full"_ or _"Full (strict)"_ on Cloudflare:

![Set Cloudflare SSL to full strict](/images/blogimages/setting-up-gitlab-pages-with-cloudflare-certificates/cloudflare-settings-ssl-strict.png){:.shadow}

## Wrap up

That's it, now your site runs on HTTPS with a custom domain
and a free Cloudflare certificate, valid up to 15 years!

Comments, questions, suggestions? Please comment below or tweet [@GitLab]! 😀

----

[Cover image] by [Rita Morais], licensed under [CC0 1.0][cc].
{:.note}

<!-- identifiers -->

[@GitLab]: https://twitter.com/gitlab
[a]: https://support.dnsimple.com/articles/a-record/
[cc]: https://unsplash.com/license
[cert]: https://www.cloudflare.com/ssl/
[cloudflare]: https://www.cloudflare.com
[cname]: https://en.wikipedia.org/wiki/CNAME_record
[Cover image]: https://unsplash.com/collections/427463/locks?photo=q6vBEPqsojc
[GitLab Pages]: https://pages.gitlab.io
[Jekyll]: https://jekyllrb.com/
[pages-ce]: /releases/2016/12/24/were-bringing-gitlab-pages-to-community-edition/
[pages-docs]: http://doc.gitlab.com/ee/pages/README.html#getting-started-with-gitlab-pages
[pages-ip]: https://docs.gitlab.com/ee/user/gitlab_com/#gitlab-pages
[pages-setup-domains]: /blog/2016/04/07/gitlab-pages-setup/#custom-domains
[pages-setup-post]: /blog/2016/04/07/gitlab-pages-setup/
[post-startssl]: /2016/06/24/secure-gitlab-pages-with-startssl/#https-a-quick-overview
[Rita Morais]: https://unsplash.com/@moraisr
[root]: https://support.cloudflare.com/hc/en-us/articles/218689638
[ssg-1]: /blog/2016/06/03/ssg-overview-gitlab-pages-part-1-dynamic-x-static/
[ssg-2]: /blog/2016/06/10/ssg-overview-gitlab-pages-part-2/
[ssg-3]: /blog/2016/06/17/ssg-overview-gitlab-pages-part-3-examples-ci/
[static site]: /blog/2016/06/03/ssg-overview-gitlab-pages-part-1-dynamic-x-static/
