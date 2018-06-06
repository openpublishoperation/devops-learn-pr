---
title: DevOps at Microsoft | Azure DevOps
description: This center will keep you current on how we continue to adopt DevOps at Microsoft. We’ve selected the best videos and articles from both public conferences and internal training sessions. For most of the videos, we also provide an accompanying article. We focus on practices that we use in Visual Studio Team Services (VSTS), which is the backbone of our One Engineering System (1ES), lessons learned from across Microsoft, and the best of our learning from Microsoft Research.
ms.prod: devops
ms.technology: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: samgu
ms.date: 11/09/2017
---

# DevOps at Microsoft
> By: Sam Guckenheimer

This center will keep you current on how we continue to adopt DevOps at Microsoft. We’ve selected the best videos and articles from both public conferences and internal training sessions. For most of the videos, we also provide an accompanying article. We focus on practices that we use in Visual Studio Team Services (VSTS), which is the backbone of our One Engineering System (1ES), lessons learned from across Microsoft, and the best of our learning from Microsoft Research. For product news on VSTS, take a look at our [DevOps blog](https://blogs.msdn.microsoft.com/devops/).

## How We Work with Visual Studio Team Services (VSTS)
For a great overview of lessons learned at Microsoft Developer Division, Lori Lamkin covers our seven-year [journey to cloud cadence](moving-cloud-cadence.md). She goes through the sequence of steps we took, and that you can take as you become proficient at DevOps.

<br>
> [!VIDEO https://www.youtube.com/embed/Lprj_4Wpi2s]

### Videos and articles

| Article | Description                                                                   |
|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| [Agile principles in practice](agile-principles-in-practice.md)                         | Aaron Bjork discusses how we incorporate Agile principles and what that looks like in practice. Everything about how we manage teams, roles, planning, sprints, and flow has brought improvement to the software we build and use daily that customers can depend on. |
| [Evolving test practices: combining development and test](evolving-test-practices-microsoft.md) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Microsoft’s decision to move to _a single engineering organization_, where development and testing are a unified part of the build process rather than separate roles, has helped every engineer have a greater impact on the quality of the software. Munil Shah shares his first hand experiences.   |
| [Git at scale: Release flow and branching strategy](release-flow.md)                    | Working in a single master and using the pull request flow have been a key ingredient to keeping debt out and deployments clean. Ed Thomson covers lightweight topic branching on Git combined with Release Flow as part of our move to safe deployment. He starts with the transition from a hierarchical version control to Git. |
| [Security in DevOps](security-in-devops.md)                   | Security is a key part of DevOps. Buck Hodges first walks through how we have done our security war games with red teams and blue teams. Buck goes on to cover our best practices for DevSecOps in running a SaaS business.           |
| [Live-Site Culture](live-site-culture-and-reliability.md)                    | Live-Site Culture (or a Production-First Mindset) is essential to running a service. Tom Moore discusses both how we handle service reliability and how we practice, You Build It, You Run It. You can’t control what you can’t measure. Along the way, Tom Moore how we use telemetry to monitor VSTS and gain continual insight into both the health and usage of the service.  |

## How We Architect Visual Studio Team Services (VSTS)
These talks cover the accompanying technology behind VSTS and its evolution. 

| Article    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;                             | Description                                                                                      |
|---------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| [The path from monolith to cloud service](monolith-cloud-service.md)                                                | Buck Hodges starts with the path from monolith to cloud service as we moved from a single delivery stream of TFS on-prem to dual streams including VSTS on Azure. He discusses how we maintain consistency between the on-prem product and the hosted multi-tenant service.      |
| [Achieving no downtime through versioned service updates](achieving-no-downtime-versioned-service-updates.md)       | Running the hosted service 24x7x365 globally requires that we can deploy updates intraday with no downtime. Buck describes the architecture and technical process for updating the service while live.                       |
| [Progression experimentation with feature flags](progressive-experimentation-feature-flags.md)                      | A key advantage of the cloud service is that it provides a continuous feedback loop with our users. Here Buck discusses how we use feature flags to progressively reveal new functionality and to experiment in production.                      |
| [Cloud patterns for resiliency and uptime](patterns-resiliency-cloud.md)                                            | By definition, a 24x7x365 service needs to be always available. Buck describes how we have used cloud patterns for resiliency, such as circuit breakers and throttling, to ensure the availability and performance of VSTS.                       |
| [Shift left to test fast and reliably](shift-left-make-testing-fast-reliable.md)                                    | Availability would be meaningless without suitable quality. Munil Shah covers how we shift left to test fast and reliably - he takes us through the evolution that has led to our ability to run 60,000 tests in the pull request flow before commit to master and continuous integration.                      |
| [Eliminating flaky tests to build trust](eliminating-flaky-tests.md)                                                | To get a reliable signal from high-volume test automation, we need to be able to trust the test results. Munil describes how we eliminate flaky tests so that red can mean red.                       |
| [Shift right to test in production](shift-right-test-production.md)                                                 | Testing only in pre-production environments helps you with the faults you’ve previously encountered, but not the ones you haven’t seen. Munil explains how there is no place like production and that means we need to test in production too.                      |
| Safe deployment practices                                   | When you deploy continuously, you need to control the blast radius and continually expand based on the health of the release. Ed Glas goes over the safe deployment practices that we use for progressive exposure.                       |


### Safe deployment practices with Ed Glas
When you deploy continuously, you need to control the blast radius and continually expand based on the health of the release. Ed Glas goes over the safe deployment practices that we use for progressive exposure.

> [!VIDEO https://www.youtube.com/embed/QP_u4ipP2SU]

## One Engineering System at Microsoft
One of our principles is to learn from our own usage. We try practices and tools to see what works, and then we productize. Of course, we open source a lot too. In this video, Martin Woodward covers our end-to-end practices as we moved to One Engineering System at Microsoft.

> [!VIDEO https://www.youtube.com/embed/W6dqrvb-Yyw]

For a demo of what it looks like in practice, my WinOps 2017 keynote demonstrates how we work with VSTS in real-time.

> [!VIDEO https://www.youtube.com/embed/NlI0bkgdG7E]

### Q&A - Moving 65,000 engineers to DevOps on the public cloud
Microsoft is a very large software company. As of September 2017, we have more than 75,000 engineers active on Visual Studio Team Services. For a great discussion of how the transformation has affected multiple divisions, we held an open-mic Q&A at Build 2017 with engineering leaders from across the company.

* [Q&A interview video and transcript](moving-65000-microsofties-devops-public-cloud.md)

In addition to this panel, you can read a great experience report on how the [Universal Store Team adopted Continuous Delivery](universal-store-journey-continuous-delivery-devops.md) over the course of 12 months. One stunning example is an 8000x improvement in build frequency!

Microsoft’s Bing has been in the forefront of innovation in user-facing features and performance that are only possible through experimentation in the software platform and the developer experience. For Bing, it’s all about idea velocity.

> [!VIDEO https://www.youtube.com/embed/SiPtRjiCe4U]

## Researching software practices
We like to be informed by data. Measuring how well practices work is key. We’re sharing our research and learning, so that you can be informed too.

|             |                           |
|-------------|---------------------------|
|![Image: Sam Guckenheimer, MSFT](../_img/samgu-avatar.jpg)|Sam Guckenheimer works on Microsoft Visual Studio Cloud Services, including VS Team Services and Team Foundation Server. He acts as the chief customer advocate, responsible for strategy of the next releases of these products, focusing on DevOps. He has written four books on DevOps and Agile Software practices.|
