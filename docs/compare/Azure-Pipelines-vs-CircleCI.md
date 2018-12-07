---
title: Azure Pipelines vs CircleCI
description: Comparison of Azure Pipelines and Azure DevOps with CircleCI
ms.prod: devops
ms.technology: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: davemcki
ms.date: 10/21/2018
---

# Azure Pipelines vs CircleCI

> By: Dave McKinstry

[Azure Pipelines](https://azure.com/pipelines/) is a powerful, open, and extensible platform for continuous
integration and delivery. Pipelines provides one free parallel job running on
macOS, Linux and/or Windows. And if your project is public, you get **unlimited**
build time with 10 parallel jobs! It is free and easy to [get
started](https://azure.com/pipelines/) – give it
a try to experience how Azure Pipelines can streamline your release process!

## DevOps is more than CI/CD
Azure Pipelines was designed as a part of a secure
enterprise-grade end-to-end DevOps solution. Azure Pipelines supports not only
Linux and macOS, but also Windows. Azure Pipelines provides security, approval
processes, release gates, and a rich marketplace. And through Azure DevOps
services, Pipelines supports full traceability across the entire DevOps
lifecycle.

Azure DevOps services is a family of integrated tools offering unified user
experience and management. Like Pipelines, nearly all Azure DevOps services are
free for small teams and open source projects and allow you to get started
without manually integrating, configuring, securing, patching and licensing
tools from multiple vendors and community. With lifecycle
reporting, Azure DevOps allows you to summarize and roll-up your data on
dashboards and gain a holistic view of your world. But you can still use Azure
Pipelines with GitHub, Jenkins and your other favorite DevOps tools.

## Compare CircleCI with Azure Pipelines

| Question                                                                 | Azure Pipelines     | CircleCI     | Notes                                                                 |
|--------------------------------------------------------------------------|:-------------------:|:------------:|-----------------------------------------------------------------------|
| *BUILD TRIGGERS*                                                         |                     |              |                                                                       |
| Builds can be triggered by commits to version control or manually queued | Y                   | Y            |                                                                       |
| Build chaining                                                           | Y                   | N            |                                                                       |
| *SUPPORTED LANGUAGES*                                                    |                     |              |                                                                       |
| Java                                                                     | Y                   | Y            |                                                                       |
| .NET                                                                     | Y                   | \*           | CircleCI does not support Windows and can only build.NET Core.        |
| JavaScript / Node.JS                                                     | Y                   | Y            |                                                                       |
| Python                                                                   | Y                   | Y            |                                                                       |
| Ruby                                                                     | Y                   | Y            |                                                                       |
| Other scripting platforms                                                | Y                   | Y            |                                                                       |
| *SUPPORTED PLATFORMS*                                                    |                     |              |                                                                       |
| Linux & macOS                                                            | Y                   | *            | macOS is only supported in CircleCI Cloud, not CircleCI Server.       |
| Windows                                                                  | Y                   | N            |                                                                       |
| Docker Containers (Linux & macOS)                                        | Y                   | Y            |                                                                       |
| Docker Containers (Windows)                                              | Y                   | N            |                                                                       |
| Microsoft Azure                                                          | Y                   | Y            |                                                                       |
| Amazon AWS                                                               | Y                   | Y            |                                                                       |
| Google GCP                                                               | Y                   | Y            |                                                                       |
| ARM processors                                                           | Y                   | Y            |                                                                       |
| x86/amd64 processors                                                     | Y                   | Y            |                                                                       |
| *ORCHESTRATION*                                                          |                     |              |                                                                       |
| Web-based visual editor for build and release orchestration              | Y                   | N            |                                                                       |
| YAML scripting support                                                   | \*                  | Y            | Pipelines supports YAML for build and deploy; full release support is coming soon. |
| PowerShell scripting support                                             | Y                   | N            |                                                                       |
| Posix-shell (e.g., Bash) scripting support                               | Y                   | Y            |                                                                       |
| *CODE QUALITY AND SECURITY*                                              |                     |              |                                                                       |
| Static code analysis in the pipeline                                     | Y                   | Y            | Both platforms support integrations such as SonarQube                 |
| Automated testing in the pipeline                                        | Y                   | *            | CircleCI doesn't support Windows-based test frameworks                |
| Quality reporting                                                        | Y                   | *            | CircleCI provides basic reporting without test analytics and code coverage|
| Security scanning in the pipeline                                        | *                   | *            | Both platforms leverage third-party plug-ins for security scanning
| Load testing in the pipeline                                             | Y                   | N            |                                                                       |

## Compare CircleCI with Azure DevOps

| Question                                                                           | Azure DevOps     | CircleCI     | Notes                                                                                                                      |
|------------------------------------------------------------------------------------|:----------------:|:------------:|----------------------------------------------------------------------------------------------------------------------------|
| *TRACEABILITY AND INTEGRATION*                                                     |                  |              |                                                                                                                            |
| Trace work through the entire lifecycle to deployed environments                   | Y                | N/A          |                                                                                                                            |
| Trace code changes and reviews to deployed environments                            | Y                | N/A          |                                                                                                                            |
| Trace runtime telemetry back into the work stream                                  | \*               | N/A          | Azure DevOps integrates with Azure Application Insights for on-premises of cloud-based apps to provide continuous learning.|
| Use as much or as little as you need                                               | Y                | N/A          |                                                                                                                            |
| *PLATFORM SUPPORT*                                                                 |                  |              |                                                                                                                            |
| Scalable to support enterprise demands (thousands of users)                        | Y                | N/A          |                                                                                                                            |
| Cloud-hosted, managed software-as-a-service option                                 | Y                | Y            |                                                                                                                            |
| On-premises installation option                                                    | Y                | Y            | Azure DevOps Server is the self-hosted version of Azure DevOps services.                                                   |
| Leverages enterprise identities using Azure Active Directory and related products  | Y                | \*           |                                                                                                                            |
| Marketplace provides easy extensibility through community and 3rd Party Extensions | Y                | N            |                                                                                                                            |
| Completely free for various user profiles, regardless of user count                | Y                | Y            |                                                                                                                            |
| Provides consolidated billing for users, marketplace extensions and other add-ons  | Y                | N/A          |                                                                                                                            |
| Can be billed through existing Azure enterprise agreements or credit cards         | Y                | N            |                                                                                                                            |
| *IDE INTEGRATION*                                                                  |                  |              | *All IDEs support Git repos; this section pertains to additional tool integration.*                                        |
| Visual Studio                                                                      | Y                | N            |                                                                                                                            |
| Visual Studio Code                                                                 | Y                | Y            |                                                                                                                            |
| Eclipse                                                                            | Y                | N            |                                                                                                                            |
| JetBrains IDE Family (IntelliJ IDEA, Android Studio, etc)                          | Y                | N            |                                                                                                                            |
| XCode                                                                              | \*               | N            | Apple doesn't allow IDE extensions; version control integration is supported with Git repos.                               |

## Compare for yourself

 As you can see above, Azure Pipelines provides compelling CI/CD capabilities. But perhaps you’d like to prove it yourself? As an open platform, Azure allows you to use not only our DevOps tools, but virtually all common tools, including CircleCI! Feel free to check out [CircleCI Enterprise on Azure](https://azuremarketplace.microsoft.com/marketplace/apps/circleci.circleci-enterprise) as you form your own opinion and decide which CI/CD tools are best for your environment.

## Get more, pay less

CircleCI provides one free parallel job and up to 1,500 monthly build minutes for Linux and macOS.  Azure Pipelines not only offers more free minutes, but it also supports Windows as well.  And when you start paying, the difference gets bigger.  Azure Pipelines is 10% cheaper for each paid parallel job hosted by Microsoft or CircleCI.  And if you choose to host it yourself, Azure Pipelines is $15/month for each parallel job; CircleCI **starts** at $700/month and requires an annual contract.  For more details, refer to the [Azure DevOps pricing page](https://azure.microsoft.com/pricing/details/devops/azure-pipelines/).

## Any language, any platform, **any cloud**

You probably have a specific deployment target today. Avoid having to repeat this exercise by making sure your choice meets your needs for today AND tomorrow. Over 75K Microsoft employees use Azure DevOps to develop .NET, Java, Node.JS and more, targeting Linux, Windows, macOS, containers, the cloud, IOS and Android. [Try Azure Pipelines](https://azure.microsoft.com/services/devops/pipelines/) now to see how it can support your DevOps needs - today AND tomorrow! 

## Unlimited build for Open Source projects

Microsoft supports the open source community and is offering unlimited build minutes for all public projects on Azure Repos, GitHub, or any publicly accessible Git repo.  Public projects receive 10 parallel jobs hosted on macOS, Linux and Windows.  You can add Azure Pipelines to GitHub projects from the [GitHub marketplace](https://github.com/marketplace/azure-pipelines) or to any public repository directly from Azure Pipelines. 

## Are you still reading

Doing your research is important, but one of the best ways for you to convince
yourself of the value of Azure DevOps is to try it! One parallel job with up
to 1,800 monthly minutes of Microsoft-hosted on macOS, Linux and Windows (or
unlimited with self-hosted) CI/CD are yours for FREE! [Try Azure Pipelines
now](https://azure.microsoft.com/services/devops/pipelines/)!
