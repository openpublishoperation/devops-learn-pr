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

The Mindset Shift to a DevSecOps culture included an important thinking about not only **preventing breaches**, but **assuming breaches** as well.

### Security strategy components

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

## Shifting to a Cloud mindset

Security is all about layers. People assume that if their site is hosted behind their company's firewall, then they're safe from attacks. When shifting from an on-premises product to a cloud-based subscription-based proudct, there are some changes that need to be considered in terms of security.

| On premises                                   | Cloud                                          |
|-----------------------------------------------|------------------------------------------------|
| Server                                        | Services                                       |
| Domain                                        | Subscription                                   |
| Domain Admin                                  | Subscription Admin                             |
| Private IPs                                   | Public IPs                                     |
| RDP/SSH                                       | Management APIs                                |

To deal with these new problems and being open to the Internet and all its intricacies, we've developed what we call **Red vs. Blue**.

## Red vs. Blue

Red vs. Blue is an exercise where we have two teams - one team attempts to attack our service while the other attempts to thwart them.

* Red Team
    * Made up of external or internal members (we prefer a combination of both)
    * Models real-world attacks against your service
    * Identifies gaps in security story
    * Attempts to make demonstrable impact against your data or service
* Blue Team
    * Made of internal members of the product team
    * Attemps to detect and respond to attacks from Red Team

In Red vs. Blue, the goal is to not only detect security flaws, but enhance situational awareness and measure both readiness and impact of our team members.

### Evolution of Red vs. Blue

#### Before Red Vs. Blue

* Identify vulnerabilities through manual code reviews
* Engage external penetration testing companies
* Report out to the team, and add fixes to the backlog

#### 2015

* Paired a handful of security-minded engineers with a penetration tester (Red Team)
* A few ops-minded engineers that understand the systems and the logging available (Blue Team)
* Attacks were successful due to poorly protected secrets, SQL injection, and successful phishing campaigns

#### 2016

* Augment both teams with outside experts (AD security and IT security incident response experts)
* Comprehensive, centralized logging available for Blue Team to do post-breach forensics
* Attacks were based on cross-site scripting (XSS), deserialization, and engineering system vulnerabilities

#### 2017

* Red Team taking longer to reach objectives, forced to find and chain 5-6 different vulnerabilities together
* With Kalypso monitors, Blue Team is starting to catch Red Team in real time

Red Vs. Blue has made us aware of a lot of security flaws that may have gone unnoticed before.

| Number of repair items created from Red Vs. Blue  |                                               |
|---------------------------------------------------|-----------------------------------------------|
| 2015                                              | 63                                            |
| 2016                                              | 119                                           |
| 2017 (As of September)                            | 44                                            |
| Total                                             | 226                                           |

### Red Vs. Blue guidelines

We have established some guidelines to make Red Vs. Blue as productive and safe as possible.

#### Code of conduct

* Both the Blue Team and Red Team will do no harm to the live environment
* The Red Team will not compromise anything more than you need to achieve your objective
* Common sense rules apply to physical attacks (no printing badges, harassing people for passwords, etc.)
* Do not disclose the name of th eperson who was compromised in a social engineering attack

#### Rules of engagement

* Do not impact availability of any system
* Do not access external customer data
* Do not significantly weaken in-place security protections on any Services
* Do not intentionally perform descrutive actions against any resources
* Safeguard credentials, vulnerabilities, and other critical information obtained

### Example attack: Password in a text file or in code

This was a real case (two cases, actually) where users were storing their plain-text passwords in either text files on their systems or in code. 

What we learned from this is that we needed better _secret management_ across our teams. Now, we require that all secrets (passwords, keys, tokens, storage account keys, certificates, and credentials used in test) be stored in an Azure Key Vault (AKV). We also implement a hierarchy of AKVs to stop duplication.

### Example attack: Mimikatz to go from test credentials to compromising production

Mimikatz is a tool written by a French security researcher (external to Microsoft). Mimikatz extracts passwords, keys, pin codes, and tickets from the memory of `lsass.exe` (Local Security Authority Subsystem Service). The only thing that is required to run it is debug privilege or a SYSTEM account (aka, Local Administrator access). One of the worst things about this type of attack is that it can cycle to hit many machines within your system:

Open file share --> Plaintext test credentials --> Dev box with test account as local admin --> Mimikatz credential dump --> Dev's credentials --> Repeat

Also, Windows helps out the attacker quite a bit here by helping them figure out which machines they can get into. They can query SAM (Windows Security Access Manager) remotely via SAM-Remote (SAMR) protocol. This builds a list of machines and their local admin group memberships which can be used to build an attack graph from compromised account/machine to target. 

This drives home an important point: _"Defenders think in lists. Attackers think in graphs. As long as this is true, attackers win"_ - John Lambert (MSTIC). Attackers are trying to get to an end result, they don't care how they get there.

## Kalypso for security monitoring

Kalypso is a service that you can think of as a scheduler. It's running queries in Azure Log Analytics (every 5 minutes, for us) that you're expecting to come up with zero results every time. For example, if you were able to remotely exploit a bug in anything, and part of that exploit is running encoded Powershell so you can get a foot in the door, now you have a backdoor running. We've set that up in Kalypso, to detect an instance of powershell running and we get an alert. 

Kalypso isn't something that we ship yet, but is something that you can create your own. We are talking to the Application Insights team to make it a product and we hope that happens. 


## Lessons learned

### Red vs. Blue

* Red vs. Blue completely changes the culture around how attacks are monitored, caught, and handled
* The exercise keeps security closer to the top of the minds of developers and managers

### Phishing

* Phishing is **very** effective for attackers
* Limit production access and require Two Factor Authentication (2FA) challenge

### Engineering system

* Control of the engineering system leads to control of everything
* Strictly control build/RM agent, queue, pool, and definition access

### Defense in depth

* Make it harder for attackers. Slow them down. (For example, disabling SAMR enumeration)
* Every boundary they have to breach is another opportunity to catch them

### Don't ever cross trust realms

* Production environments should never trust anything in Test environments



|             |                           |
|-------------|---------------------------|
|![Buck Hodges](https://secure.gravatar.com/avatar/baad17c3a2d3ea8fffc392f9dd209426?s=130&d=mm&r=g)|Buck Hodges is Director of Engineering for Visual Studio Team Services. He's been a member of the team since the beginning of TFS, starting as a developer on Team Foundation Version Control for the first version of TFS. He's helped lead the transition of the team to the cloud and DevOps. |