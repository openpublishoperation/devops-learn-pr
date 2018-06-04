---
title: Security in DevOps
description: Security is a key part of DevOps. Buck Hodges first walks through how we have done our security war games with red teams and blue teams. Buck goes on to cover our best practices for DevSecOps in running a SaaS business.
ms.prod: devops
ms.technology: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: samgu
ms.date: 05/31/2018
---

# Mindset shift to a DevSecOps culture
> By: Buck Hodges

Security is a key part of DevOps. Buck Hodges first walks through how we have done our security war games with red teams and blue teams. Buck goes on to cover our best practices for DevSecOps in running a SaaS business.

<br>

> [!VIDEO https://www.youtube.com/embed/7fW4wZbJtg0]

_"Fundamentally, if somebody wants to get in, they're getting in..accept that. What we tell clients is: number one, you're in the fight, whether you thought you were or not. Number two, you almost certainly are penetrated."_ - Michael Hayden, Former Director of NSA and CIA

## The Mindset Shift

The Mindset Shift to a DevSecOps culture included an important thinking about not only **preventing breaches**, but **assuming breaches** as well:

| Preventing breaches                      | Assuming breaches                              |
|------------------------------------------|------------------------------------------------|
| Threat models                            | War game exercises                             |
| Code reviews                             | Central security monitors                      |
| Security testing                         | Live site penetration tests                    |
| Security development lifecycle (SDL)     |                                                |

Both strategies are important, and the items in the **preventing breaches** mindset are great but we have found that they just aren't enough.

**Assuming breaches** helps answer some important questions in security (so they don't have to be answered in an emergency):

* How will I detect an attack?
* What am I going to do if there is an attack or penetration?
* How am I going to recover from the attack? (e.g. data leaking or tampering)



|             |                           |
|-------------|---------------------------|
|![Buck Hodges](https://secure.gravatar.com/avatar/baad17c3a2d3ea8fffc392f9dd209426?s=130&d=mm&r=g)|Buck Hodges is Director of Engineering for Visual Studio Team Services. He's been a member of the team since the beginning of TFS, starting as a developer on Team Foundation Version Control for the first version of TFS. He's helped lead the transition of the team to the cloud and DevOps. |