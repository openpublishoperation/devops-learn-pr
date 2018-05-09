---
title: Code reviews are not (primarily) for finding bugs
description: Peer code reviews are a standard practice in software engineering. Open source workflows especially are designed to enforce a successful peer review before the merge of a change into the main codebase. Who reviews code and accepts or blocks the change from becoming a part of the codebase is crucially important.
ms.prod: devops
ms.technology: devops-learn
ms.topic: conceptual
ms.manager: douge
ms.author: jacekcz
ms.date: 09/27/2016
---

# Code reviews are not (primarily) for finding bugs
> By: Jacek Czerwonka

Peer code reviews are a standard practice in software engineering. Open
source workflows especially are designed to enforce a successful peer
review before the merge of a change into the main codebase. Who reviews
code and accepts or blocks the change from becoming a part of the
codebase is crucially important.

## Multiple perspectives improve the code review
The process of code reviewing in software engineering is similar to a
plan review in civil engineering or a paper review in academia. In all
these, there is the assumption that the quality of output increases by
applying differing viewpoints to the subject being reviewed and allowing
the author to consider and apply the feedback before finalizing the
work.

## What engineers expect from code reviews
As software engineers, we often claim the primary goal of code reviewing
is to find bugs. But code quality is only one of several benefits. In
addition, we want reviewing to help us ensure our code’s long-term
maintainability. We treat the reviewing process as a knowledge sharing
tool and an avenue to broadcast ongoing progress \[1\]. On the surface,
these are different purposes, but the common thread is that code reviews
allow a group of people to communicate over a shared view of an evolving
artifact.

![FIGURE 1. DEVELOPER'S MOTIVATIONS FOR PERFORMING CODE REVIEWS. SOURCE:\[1\]](../_img/code-reviews-ranked-reasons.png)

## Code reviews have a cost
Because of their many uses and benefits, code reviews are a standard
part of the modern software engineering workflow. However, they come
with non-trivial costs.

### Cost of delay
Since code reviews require heavy involvement of people, code reviewing
is often the lengthiest part of code integration. The median **time from
a review being requested to receiving all necessary sign-offs is about
24 hours**, with many lasting days, sometimes weeks \[5\].

### Effort involved
On teams where code reviewing is a standard practice, the **total time
spent by each developer on code reviewing activities is on average
between 2 and 6 hours per week** \[2,3\].

Keeping in mind the significant costs of code reviewing, it is worth
asking: do we currently use code reviews in the most efficient way? In
what situations do code reviews provide more value than others? What is
the value of consistently applying code reviews to all code changes?

### We studied the effectiveness of code reviews
Having many goals for code reviews does not make it easy to understand
when code reviews are most beneficial. The time spent waiting for the
comments makes it important to assess how to get the most value in the
overall engineering workflow. Therefore, we undertook a study to
understand in detail the costs and benefits of the code review process.
We used an abundance of data coming from the engineering systems across
a diverse set of projects. \[4\]

## Code reviews rarely find functional bugs
Contrary to the often stated primary goal of code reviews, they often do
not find functionality issues. **Only about 15% of comments provided by
reviewers indicate a possible bug in the code**. Bugs that should block
a code commit likely are found less frequently. In contrast, at least
50% of all comments provided by reviewers give **feedback related to the
long-term code maintainability**.

## How to make code reviews more effective
The modern code review process is expensive. Not only does it cost a
significant effort in terms of time spent, but also it forces the
reviewer to switch context away from their current work.

### Reviewers who know the context give more useful advice
The usefulness of code review comments, as judged by the author of a
code change, correlates with reviewers’ experience. **Without prior
exposure to the part of code base being reviewed, on average only 33% of
any reviewer’s comments are deemed useful** by the author of a change.
However, reviewers typically learn very fast. When reviewing the same
part of code base for the third time, the usefulness ratio increases to
about 67% of their comments. By the fourth time, it is equivalent to the
project’s long-term average \[5\].

![FIGURE 2. CODE REVIEW COMMENT CATEGORIES, THEIR FREQUENCY AND USEFULNESS. SOURCE: \[6\]](../_img/code-reviews-categories.png)

### Review code in small batches
**Code review usefulness negatively correlates with the size of a code
review**. That is, the more files there are in a single review, the
lower the overall rate of useful feedback. The decrease however was
**noticeable only for reviews with 20 or more changed files**. In
addition, the absolute number of useful comments per review peaked at 6
per batch for reviews of around 50 files. For larger review batches The
number of comments actually decreased.

### Review with short turnaround
A long time in review causes process stalls and affects anyone who might
be waiting to take a dependency on the new code. In addition, the longer
the review time, the harder it is for the author to switch back to the
change and incorporate the feedback of the reviewers without potentially
introducing new defects.

### Create an alternative to waiting for feedback
For example, requiring two sign-offs for all code changes will make
costs exceed the benefits of code reviewing in some of the cases.
Moreover, since code reviews find commit blocking defects relatively
infrequently, it might be prudent to change the practices to better fit
that finding. One of Microsoft’s large teams recently instituted a
policy in which a developer is allowed to proceed with a commit after
the very first code review sign-off. If there are more comments coming
after that, another commit can be made to finalize the change.

## References
This article is based upon a chapter from the upcoming book
“Perspectives on Data Science for Software Engineering”, which will be
published later in 2016 by Elsevier.

\[1\] Alberto Bacchelli and Christian Bird. 2013. Expectations,
outcomes, and challenges of modern code review. In Proceedings of the
2013 International Conference on Software Engineering (ICSE ’13). IEEE
Press, Piscataway, NJ, USA, 712-721.
\[2\] Internal Microsoft study.
\[3\] Amiangshu Bosu and Jeffrey Carver. 2013. Impact of Peer Code
Review on Peer Impression Formation: A Survey. Proceedings of the 7th
ACM/IEEE International Symposium on Empirical Software Engineering and
Measurement (ESEM), 2013. Baltimore, MD, USA, 133-142.
\[4\] Jacek Czerwonka, Nachiappan Nagappan, Wolfram Schulte, and Brendan
Murphy. 2013. CODEMINE: Building a Software Development Data Analytics
Platform at Microsoft. IEEE Software 30, 4 (July 2013), 64-71.
\[5\] Peter C. Rigby and Christian Bird. 2013. Convergent contemporary
software peer review practices. In Proceedings of the 2013 9th Joint
Meeting on Foundations of Software Engineering (ESEC/FSE 2013). ACM, New
York, NY, USA, 202-212.
\[6\] Amiangshu Bosu, Michaela Greiler, and Christian Bird,
Characteristics of Useful Code Reviews: An Empirical Study at Microsoft.
In Proceedings of the International Conference on Mining Software
Repositories (MSR 2015).

|             |                           |
|-------------|---------------------------|
|![Jacek Czerwonka](../_img/jacekcz_avatar_1502749714.png)|Jacek is a lead developer on the Tools for Software Engineers team focusing creating solutions for understanding software engineering organizations, and improving engineering processes at Microsoft. His team works on engineering data analytics platform CodeMine and code review experiences and tools. |