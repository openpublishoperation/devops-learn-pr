---
title: Software testing at scale to increase velocity
description: "his article discusses how to decide what you need to test without spending more than necessary. Don't pay too much for software testing Software testing is like insurance. Creating tests is buying coverage against risks. Redundant tests, flaky tests or running tests unnecessarily is"
ms.prod: vs-devops-alm
ms.technology: vs-devops-articles
ms.topic: article
ms.manager: douge
ms.author: jacekcz
ms.date: 09/27/2016
---

# Software testing at scale to increase velocity
> By: Jacek Czerwonka

Last Update: 
**Team Services**
This article discusses how to decide what you need to test without
spending more than necessary.

## Don’t pay too much for software testing
Software testing is like insurance. Creating tests is buying coverage
against risks. Redundant tests, flaky tests or running tests
unnecessarily is paying too much in premiums for the coverage you get.
But it is hard to keep track of what you spend on a large software
project. Using historical data about executing tests, we can derive
expected cost and benefit of each test execution and make decisions for
whether the price is worth it. Even a simple cost model can be very
effective and save us money and time in testing.

## Software testing alleviates risks
We often say the purpose of software testing is to verify that software
meets a desired level of quality. Frequently, the term “software
testing” is associated with checking for functional correctness.
However, in any software system with an established user-base, it is
also important to verify system constraints such as reliability,
security, backward compatibility, accessibility, usability. Once a user
gets accustomed to a certain level of performance on these dimensions,
they expect the same or better performance as the software changes.

## Software testing at scale
At Microsoft, we deal with large software projects. They are large not
only because of the size of the code base or the number of end users,
but also because of the sizes of teams working on them. It is not
uncommon to have thousands of people work on a project and
simultaneously apply code changes. And sometimes they interfere with one
another in unexpected ways. In such environments, you still need to test
the functionality but you must also pay attention to verifying system
constraints. Constraints testing is a bit like having insurance. You pay
for it and most of the time you don’t really need it, but on occasion it
finds you a bug caused by an interaction of two seemingly independent
changes.

## Test maintenance
To release with confidence, it takes a lot of test cases and test code.
Maintaining tests and preventing test infrastructures from decay can
grow to be a significant effort. Test automation and accompanying test
infrastructure for any non-trivial software is complex. And then as the
software evolves, new tests are added, older tests might get
re-prioritized or deprecated. For products with some history, you may
find older tests not “owned” by anybody anymore. These tests can slow
down development speed, especially when they fail.

## Good and bad tests
Finally, at runtime, verification time also heavily depends on the
number of test failures. Many test failures require human effort to
inspect and to fix the underlying issue. Test failures happen because of
bugs in code (good tests) or because of their own reliability issues
(bad tests). Developing large complex software systems usually implies
large development teams developing many code changes in parallel that
need to be tested in parallel. In this case, it might not be easy to
find the root cause of failure, and investigation and resolution time
may be long.

## Agile testing cycles
Agile development promises shorter release cycles. Anything we can do to
increase the effectiveness and efficiency of test execution has
immediate effect on product development. The time spent on verification
is a lower bound on how fast we can ship software.

Agile process forces the verification process to be substantially
different; we just have less time for it. Still, shorter cycles
shouldn’t mean lower confidence in the system working as intended. To
achieve this, we might need to choose which tests to run instead of
always executing the full complement of tests. We need to think of
testing as a risk management tool: select the right tests for the right
changes and we need to ensure that the test we are executing are highly
effective and highly reliable. The basic assumption behind most test
optimization and test selection approaches is that for given scenarios,
not all tests are equally well-suited. Some tests might be more
effective than others.

![graphic shows false positive probability on the verical axis and code issue probability on the horizontal axis, and it indicates lower false positives and lower code issues is good](_img/optimizing-testing-probability-quads.png)

## Treat testing as development cost
Let’s discuss the basic tradeoffs to increase agility. Assume our tests
are already written, they just need to be scheduled for execution. To
decrease production costs and to improve development agility we need a
cost model that treats test executions as cost/benefit tradeoffs. There
are two opposing cost factors at play here:

### Cost of test execution
To execute a test, product teams have to pay: the infrastructure that
runs the test has to be acquired, consumes power, causes maintenance
costs, etc. This cost is largely deterministic (cost of execution) but
it also has a probabilistic component (cost of failure investigation).

### Cost of skipping a test
Not executing a test costs too. Skipping a test that would have found a
bug-which will remain undetected until we run the test again-can be
really expensive. Especially if the bug now affects your feature team or
teams who depend your code (or worst of all: the end user). This
calculation is largely probabilistic.

### Manage risk with history
To strike the right balance, we evaluate the costs of running and
skipping each test given the execution context and their history. Now
the decision on whether to execute a test becomes easier:

> If the expected cost of executing a test is higher than the expected
> cost of missing a bug, the test should be skipped.

### Test execution cost
Let’s talk about how this would work in practice.

#### **Calculating probability of false positives**
Given a planned test execution, we look at the execution history of a
test in the same execution context (version of software, operating
system etc.). We derive the number of bugs reported through the test and
the number of false test alarms it triggered. Using this information, we
can calculate two historic failure probabilities:

- PTP is the probability that the test in a given execution context
    detects a bug (true positive) and
- PFP is the probability that the test reports a false test alarm
    (false positive).

For example, consider a test that executed 100 times and it reported 4
false alarms and 7 actual bugs. In this case, PFP = 0.04 and PTP = 0.07.
Using these probabilities. If the estimated cost of not executing the
test (CostSKIP) is lower than the cost executing it (CostEXEC), we can
skip the test execution.

#### **Calculating costs of test execution**
To estimate the cost of executing a test, we estimate the amortized cost
of the infrastructure needed to execute the test (CostMACHINE). However,
if we decide to execute the test and it will report a false test alarm,
we need to pay extra money (CostINSPECT) for an engineer to investigate
the failure-this money will be wasted if there is no real bug in the
code. Thus, the cost formula of executing a test becomes:

``` ops-codesnippet
CostEXEC = CostMACHINE + (PFP * CostINSPECT)
```

#### **Calculating escaped bug costs in the pipeline**
Not executing a test might lead to undetected issues that escape to
later development stages. That implies that the bug will now spread to
affect more engineers (and eventually: customers). The cost of letting a
bug escape this way depends on three main variables: the expected number
of additionally affected people (Engineers), the expected time we need
to fix the escaped bug (TimeDelay), and the cost per engineer waiting
for the bug fix (CostENGINEER-WAITING). Putting it all together, we
compute the cost of not executing a test as:

``` ops-codesnippet
CostSKIP = PTP * CostENGINEER-WAITING * TimeDelay * #Engineers
```

TimeDelay is the average time needed to fix a bug found in the past in
similar a context.

#### **Using historical test costs**
Properties like this are easy to measure or estimate from history and
stable over time. We were able to automatically recover the necessary
per-test statistics from the “training period” of each release and then
apply them when recommending test skipping. To ensure we don’t
permanently disable any test, we still guarantee that we run each test
at least once in a given time window no matter the recommendation.

![graphic shows a period of time for training the system followed by increasing rate of reducing tests with moments of automatically re-enabling tests again](_img/optimizing-testing-historical-costs.png)

### Protecting end-users
Taken to extreme, with enough test skipping we run a risk of undetected
bugs making their way into the final product. We want to prevent this
scenario and ensure that all test cases get executed at least once
before a code change is integrated into the release and shipped to
customers. Therefore, we will only allow skipping tests for which it can
be certain that the test will be executed at a later stage verifying the
very same code change.

### Fit test execution to the branch structure and pipeline
The actual factors to ensure that tests will be executed at a later
stage depend on the individual development process. In cases where deep
branch structure is used for development, a test might be repeated on
another branch (closer to the trunk). In cases where branch trees are
shallow, we ensure that each test is executed before each release
window, e.g. once a day or once a week, depending on a release schedule.
Using these rules, we ensure the detection of all code defects but may
be delayed but it will still happen.

## Smarter testing saves money and time
Although, we prevent defects from slipping into the released products,
delaying bug detection can cause significantly higher development costs.
To answer the question whether we left a positive balance in the
process, we replayed test executions from past, real development periods
of three major Microsoft products: Windows, Office, and Dynamics
AX.

|                                | **Windows** |               | **Office** |             | **Dynamics** |               |
| ------------------------------ | ----------- | ------------- | ---------- | ----------- | ------------ | ------------- |
|                                | % Change    | Savings       | % Change   | Savings     | % Change     | Savings       |
| No. of test executions         | \-40.58%    | –             | \-34.9%    | –           | \-50.36% –   |               |
| Test time                      | \-40.31%    | $1,567,607.76 | \-40.1%    | $76,509.24  | \-47.45%     | $19,979.03    |
| Cost of test result inspection | \-33.04%    | $61,532.80    | \-21.1%    | $104,880.00 | \-32.53%     | $2,337,926.40 |
| Cost of escaped defects        | 0.20%       | $-11,970.56   | 8.7%       | $-75,326.40 | 13.40%       | $-310,159.42  |
| Total savings                  |             | $1,617,170.00 |            | $106,063.24 |              | $2,047,746.01 |

For all three products, we save money by executing fewer tests even at a
risk of delaying detection of all bugs. In some cases, we reduce the
number of test executions by up to 50%, which also translates into a
significant reduction of test execution time. Moreover, reducing the
number of executions and consequently the overall required test time has
positive effects on code velocity. Executing fewer tests implies that
code changes have to spend less time in verification and changes can be
integrated faster, freeing up engineering time that may have been spent
evaluating false positives. Reducing the time for testing and the number
of required test inspections is likely to increase developer
satisfaction. It should help to increase the confidence in test results
and decisions based on testing. Increasing the speed of the development
process will itself also impact the developer experience. The ability to
merge, integrate, and share code changes faster can reduce the number of
merge conflicts and is likely to support collaboration.

## Improving test effectiveness
Test execution history can be a strong predictor of future test
effectiveness. Test execution history is a straightforward byproduct of
testing and already available. We need some initial test execution data
to discover properties of tests before we can decide on their costs, so
there’s a training period involved. Also, since test skipping means some
tests will be executed much less frequently than others, we need to be
careful about weighing test data gathered over time. On balance though,
this method is cheap and relatively effective. Quite often it is a good
substitute for more sophisticated ways to select tests for execution.

## References
The details were originally published at ICSE 2015: [The Art of Testing
Less Without Sacrificing
Quality](http://research.microsoft.com/apps/pubs/default.aspx?id=238350).

|             |                           |
|-------------|---------------------------|
|![Jacek Czerwonka](_img/jacekcz_avatar_1502749714.png) |Jacek is a lead developer on the Tools for Software Engineers team focusing creating solutions for understanding software engineering organizations, and improving engineering processes at Microsoft. His team works on engineering data analytics platform CodeMine and code review experiences and tools. |