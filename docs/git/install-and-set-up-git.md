---
title: Install and set up Git
description: "IGit isn't usually set up by default on your computer, so you need to install and configure it before you can start using it to manage your code. It's important to keep Git up to date, just like all the other software on your machine. "
ms.prod: devops
ms.technology: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: routlaw
ms.date: 04/04/2017
---

# Install and set up Git

> By: Robert Outlaw

Git isn’t usually set up by default on your computer, so you need to
install and configure it before you can start using it to manage your
code. It’s important to keep Git up to date, just like all the other
software on your machine. Updates protect you from security
vulnerabilities, fix bugs, and give you access to new features.

The recommended method of installing and maintaining Git is provided for
three major platforms below.

#### Windows

Download and install [Git for Windows](https://git-scm.com/download/win). Once installed, you’ll be
able to use Git from the command prompt or PowerShell. We recommend that
you stick with the defaults selected during the installation unless you
have a good reason to change them.

Git for Windows does not automatically update. Update Git for Windows by
downloading a new version of the installer, which will update Git for
Windows in place and keep all of your settings.

#### macOS

macOS 10.9 (Mavericks) or higher will install Git the first time you try
to run Git from the Terminal. This is an easy way to get Git on your
system, but you can’t control exactly how often you get updates or
security fixes for Git.

We recommend installing Git through [Homebrew](http://brew.sh/) and
using the Homebrew tools to keep Git up to date. Homebrew is a great way
to install and manage open source development tools on your Mac from the
command line.

Install [Homebrew](http://brew.sh/) and run the following to install an
up to date version of Git on your Mac:

`> brew install git`

To update your Git install, use Homebrew’s upgrade option:

`> brew upgrade git`

A graphical installer for Git on macOS is also available from the
[official Git website](https://git-scm.com/download/mac).

#### Linux

Use your Linux distribution’s package management system to install and
update Git. For example, on Ubuntu:

`> sudo apt-get install git`

#### Configure Git

Set up your name and email address before starting to work with Git on
your computer. Git attaches this information to your changes and lets
others identify which changes are yours.

Run the following commands from the command prompt after installing Git
to configure this information:

`> git config --global user.name "Jamal Hartnett"`

`> git config --global user.email "jamal@fabrikam.com"`

Visual Studio offers a great out of the box Git experience without any
additional tooling. Learn more in our [Visual Studio Git tutorial](/azure/devops/git/tutorial/gitworkflow).

![Learn Git](../_img/LearnGIT_32x.png) Get started with unlimited free private Git repos in [Azure Repos](https://azure.microsoft.com/en-us/services/devops/repos/).

|                                                                       |                                                                                                |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| ![Robert Outlaw](../_img/Robert-Outlaw_avatar_1479411198-130x130.jpg) | Robert is a content developer at Microsoft working on Azure DevOps and Team Foundation Server. |
