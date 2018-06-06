---
title: Live site culture and site reliability
description: Live-Site Culture (or a Production-First Mindset) is essential to running a service. Tom Moore discusses both how we handle service reliability and how we practice. Along the way, Tom Moore discusses how we use telemetry to monitor VSTS and gain continual insight into both the health and usage of the service.
ms.prod: devops
ms.technology: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: samgu
ms.date: 05/31/2018
---

# Live site culture and site reliability
> By: Tom Moore

## Live Site Culture

### Live Site First

Put live site experience first, don't just focus on features

### Feel the Pain

Ensure devs own areas and alerts. When they get a call in the middle of the night for a live site incident, they're going to be invested.

### Drive good data

Build up telemetry, alerts, "turn the lights on" in production. Having good data offline that you can query about the live-site is important.

### Root cause is key

Restarting everything may fix the problem, but if you don't dive in and find out the state of things when conflicts occur, you can't find the root cause and fix it from happening again

### Detect before customers

It's embarassing when you're running a service and you're not aware of an issue before a customer escalates it to you

### Cloud

### Learn once and share

Pull all of the learnings from issues. Reflect on things other than the technical aspects of issues. How quickly did you respond? What steps did you take to fix the problem? 
### Lock it down

### Drive down time-tos

### Be open and Learn

### Automate and survive

When you're being successful and you're growing, automation will save you a lot of time and headaches. Even small things like rotating secrets can get out of hand when you're scaling out.

### Config as code