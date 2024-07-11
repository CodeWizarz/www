---
title: "How to use GitLab CI and MacStadium to build your macOS or iOS projects"
author: Achilleas Pipinellis
author_twitter: _axil
author_gitlab: axil
categories: engineering
image_title: '/images/blogimages/how-to-use-macstadium-and-gitlab-ci-to-build-your-macos-or-ios-projects/macstadium-datacenter.jpg'
description: "Learn how to use GitLab CI on MacStadium's mini servers to build your macOS or iOS projects."
twitter_image: '/images/tweets/macstadium-datacenter.png'
---

In this article, we will see how to get started with
[MacStadium](https://www.macstadium.com "MacStadium website"),
a provider that offers dedicated Mac hardware which you can use with
[GitLab CI](/features/continuous-integration/ "GitLab CI/CD feature page")
and build your macOS or iOS application.

<!-- more -->

[Continuous Integration and Delivery with GitLab](/blog/2016/08/05/continuous-integration-delivery-and-deployment-with-gitlab/ "Blog on CI/CD with GitLab")
is easier if you are developing your application on Linux. All you need to do is
find a provider, spin up a VM, install [GitLab Runner](https://docs.gitlab.com/runner "GitLab Runner docs")
on it and configure your project's [`.gitlab-ci.yml` file](https://docs.gitlab.com/ee/ci/yaml/ ".gitlab-ci.yml reference guide").
On macOS on the other hand, things may not be that easy. Finding a provider that
offers a Mac machine that will be online 24/7 can be hard. MacStadium is here to
help achieve that goal and offers a discount to all GitLab users. Let's see how
to make this happen.

---

### On this page
{:.no_toc}

- TOC
{:toc}

---

## Choosing a Mac mini plan

The first step is to choose a plan. MacStadium offers many options, so you can
pick whatever fits your needs. A [Mac mini](https://www.macstadium.com/mac-mini/#products)
is perfect to test things out and is a good first choice. It should be enough
to get you started, but depending on your needs you may have to upgrade to a
more beefy machine.

Depending on your location and project needs, you have to:

1. Choose the datacenter
1. Choose the Mac mini
1. Choose the macOS version
1. Click **Start Trial** (24 hours) on the Mac mini of your choice to get going
   in a few steps

At first you'll be asked to [create a MacStadium account](http://help.macstadium.com/accounts-and-billing/how-to-create-an-account.html "How to create an account on MacStadium")
Fill in your information and when in the **Secure Checkout** page, be sure to
check the _I want to use a coupon code_ option and use `GITLAB10` for 10% off.

<i class="fas fa-info-circle" aria-hidden="true" style="color: rgb(49, 112, 143);"></i>
At the time of this writing, the staged machines come with macOS 10.12.2. As
new releases com from Apple, MacStadium tests them thoroughly and then update
their staged machines. Of course, as a customer you can run the OS update on
your own machine anytime.
{: .alert .alert-info}

## Connecting to the Mac mini

When you sign up, you'll receive an email with two important pieces of
information:

1. **The static IP address of your Mac.**
   This will allow you to find your Mac mini from anywhere in the world, and
   you can also point domain names to this IP address so it's easier to remember.

1. **The username and password to access the machine.**
   The user is standard for all installs, but the password is randomly
   generated. Upon the first login, you can and are encouraged to change it.

After you have this information, there are two ways of connecting to your Mac mini:
[VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing "VNC article on Wikipedia")
and [SSH](https://en.wikipedia.org/wiki/Secure_Shell "SSH article on Wikipedia").

### Connecting with VNC

If connecting from a Mac, [Apple's Screen Sharing](https://support.apple.com/kb/PH25554 "macOS Sierra: Set up and use screen sharing")
is ideal. It's installed on every Mac and can you can connect on your MacStadium
Mac mini easily with the username and password that was sent to you via email.

If you don't have a favorite VNC client already, there are a number of options
to choose from:

- [TigerVNC](http://tigervnc.org/ "TigerVNC website") (Multi-platform)
- [Vinagre](https://wiki.gnome.org/Apps/Vinagre "Vinagre website") (GNU/Linux)
- [Remmina](https://remmina.org/ "Remmina website") (GNU/Linux)
- [RealVNC](https://www.realvnc.com/ "RealVNC website") (Multi-platform)

When you connect with VNC, you can use the same password that is set up for the
user on the Mac mini.

<i class="fas fa-info-circle" aria-hidden="true" style="color: rgb(49, 112, 143);"></i>
macOS has that as a separate setting, but MacStadium's provision scripts
enable VNC connections by default.
{: .alert .alert-info}

### Connecting with SSH

You can SSH into your machine using the username and password. For example, if
the username is `administrator` and the IP address of your machine `1.2.3.4`:

```bash
ssh administrator@1.2.3.4
```

Enter the password when asked (you won't be able to see it), hit Enter and
you're in!

## Setting up the development environment

The following steps are to be performed to the remote Mac machine. We need to
install [Xcode](https://developer.apple.com/xcode/ "Xcode on Apple's website")
and the command line tools that contain the SDKs and UNIX development applications
like the LLVM compiler, etc.

<i class="fas fa-info-circle" aria-hidden="true" style="color: rgb(49, 112, 143);"></i>
Apart from the needed toolset, the screensaver needs to be disabled otherwise
the machine will be put to sleep, thus disrupting the workflow of CI.
Thankfully, all the machines hosted on MacStadium are set to never sleep by
default. It's just done in **System Preferences > Energy Saver**.
{: .alert .alert-info}

### Installing Xcode

There are two ways to install Xcode. You can either download it from Apple's
developer portal or use the App Store where you might be asked to fill in your
credit card information. To avoid that, manually download Xcode:

1. Connect via VNC to the remote Mac machine
1. Open a browser and go to <https://developer.apple.com/download/more>
1. Login with your existing AppleID or create one
1. Select the Xcode version you wish to install

   ![Download latest stable Xcode](/images/blogimages/how-to-use-macstadium-and-gitlab-ci-to-build-your-macos-or-ios-projects/download-xcode-without-cc-info.png){: .shadow}

   This should download the Xcode package in your Downloads folder and
   decompress it automatically. After a couple of minutes it should finish.

1. Open a terminal and move `Xcode.app` to `/Applications` so that it can be
   found by Launchpad:

   ```
   mv ~/Downloads/Xcode.app /Applications
   ```

1. Go to your Applications, and double click on Xcode in order to install it.
   The verification will begin, that should take a minute.
1. Answer "Open" when you are asked if you are sure you want to open it.
1. Select "Agree" in the License Agreement and provide your administrator
   password.
1. The installation process should begin and after a while you will have Xcode
   installed and ready to be used.

In the next step we will install the command line developer tools.

### Installing the command line tools

The command line tools are a subsection of Xcode, so if you installed Xcode,
you may skip this part.

1. Open the Terminal app or run this command via SSH:

    ```bash
    xcode-select --install
    ```

1. Accept the License Agreement and the installation will begin

---

Now that all development tools are installed, it's time to install GitLab
Runner.

## Installing and configuring the GitLab Runner

GitLab Runner is responsible for running your jobs in macOS and then it
reports the results back to GitLab.

To install it, [follow the instructions in the Runner's documentation](https://docs.gitlab.com/runner/install/osx.html#installation "Documentation on installing GitLab Runner on macOS").
Make sure to also carefully read the [current limitations](https://docs.gitlab.com/runner/install/osx.html#limitations-on-macos "Limitations of macOS Runner").

## Testing a project with CI

The final piece of this puzzle is to set up a project in GitLab (your own
[CE/EE instance ](/stages-devops-lifecycle/) or even [GitLab.com](/pricing/) ) and hook it up
with Mac mini. We will not expand on that, but you can follow this nice blog post
by Angelo Stavrow on [Setting up GitLab CI for iOS projects](/blog/2016/03/10/setting-up-gitlab-ci-for-ios-projects/ "Blog on setting up CI for iOS projects").
It includes comprehensive steps to get you started.

## Conclusion

Having a dedicated Mac machine for your development can save you precious time
when you follow the Continuous Integration workflow with your team. In this
tutorial, you've seen how to quickly get a remote Mac mini up and running
for your needs. Be sure to add the promo code `GITLAB10` on checkout for 10% off!

Happy building!

---

<i class="fas fa-info-circle" aria-hidden="true" style="color: rgb(60,118,61);"></i>
Get 10% off of all MacStadium plans by using <strong>GITLAB10</strong> at checkout.
The coupon can only be applied when signing up hardware, but if you are an
existing customer who is using Gitlab and makes a change in hardware, you can
always apply it again or request the discount in a ticket.
{: .alert .alert-success}

----

Cover image [provided by MacStadium](https://gitlab.com/gitlab-com/www-gitlab-com/merge_requests/3324#note_29314223).
{: .note}
