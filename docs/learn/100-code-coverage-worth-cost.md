# Is 100% code coverage worth the cost?
### By Sam Guckenheimer
#### About the author
[Facebook](https://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.visualstudio.com%2Flearn%2F100-code-coverage-worth-cost%2F&t=Is%20100%25%20code%20coverage%20worth%20the%20cost%3F "Facebook")[Twitter](https://twitter.com/share?text=Is%20100%25%20code%20coverage%20worth%20the%20cost%3F&url=https%3A%2F%2Fwww.visualstudio.com%2Flearn%2F100-code-coverage-worth-cost%2F "Twitter")[Linkedin](https://www.linkedin.com/shareArticle?mini=true&url=https://www.visualstudio.com/learn/100-code-coverage-worth-cost/&title=Is%20100%25%20code%20coverage%20worth%20the%20cost%3F&summary=Is%20100%25%20code%20coverage%20worth%20the%20cost%3F%0D%0AAuthor%3A%20Nachi%20Nagappan%0D%0ALast%20Update%3A%209%2F27%2F2016%0D%0A%0D%0AOften%20you%20have%20code%20that%20does%20not%20have%20100%25%20test%20coverage.%20In%20other%20words%2C%20tests%20don%27t%20exercise%20all%20code%20paths.%20%28The%20code%20and%20tests%20were%20developed%20independently%2C%20and%20t "Linkedin")[Email](mailto:?subject=Is%20100%25%20code%20coverage%20worth%20the%20cost%3F&body=https://www.visualstudio.com/learn/100-code-coverage-worth-cost/ "Email")
# Is 100% code coverage worth the cost?
### Author: Nachi Nagappan
Last Update: 9/27/2016
Often you have code that does not have 100% test coverage. In other
words, tests don’t exercise all code paths. (The code and tests were
developed independently, and the system has evolved over time.) How much
engineering effort is worth investing to increase the test coverage of
existing code? One of the first studies(\*) of the value of code
coverage looked at this question.
## Code coverage from testing and quality
In order to understand the investment value of test coverage, we need to
answer the three questions:
1.  What is defect detection effectiveness curve for X% coverage?
2.  What is the effort needed to obtain X% coverage?
3.  When is the incremental defect detection cost effective for a
    particular set of quality requirements?
### Coverage on commercial software projects
To address these issues we analyzed data from both Microsoft and Avaya
two large companies as part of a joint research project. The table below
summarizes the scale of the projects.
![Table of project sizes at Microsoft and
Avaya](https://www.visualstudio.com/wp-content/uploads/2017/08/100-percent-survey.png)
### Did higher coverage mean fewer bugs?
Yes, higher coverage was one of several potential explanations for fewer
bugs. We analyzed the data statistically and qualitatively to
investigate various research questions. While correlation does not imply
causation, post-release defects correlated to several variables
including code complexity, developer experience, the type of
functionality, and remote development teams. All these factors were
related to the level of coverage and quality, and code coverage has a
positive effect even after controlling other variables.
### But was forcing higher coverage worth the cost?
We also found that the test effort increases exponentially with test
coverage, but the reduction in field-reported bugs increased only
linearly with test coverage. This suggested that for most projects the
optimal levels of coverage are likely to be well short of 100%.
The main takeaways from this research study are:
  - Code coverage should not be used alone. It should be used in
    conjunction with other techniques like static analysis, fault
    injection, etc.
  - Code covered is not necessarily correct in its behavior.
  - It might not be worth the effort to achieve 100% coverage for
    pre-existing code.
### Revisiting this research
This work shows the value of empirical assessment. It is seven years old
and was the first study we know to look at to assess the value of test
coverage. There are two further hypotheses to test that are begged by
this study:
  - How much more cost-effective is test coverage created by test-driven
    development or other co-creation of tests and code?
  - How much more cost-effective is a DevOps process using telemetry to
    harden testing based on live site qualities of service?
## References
\* Audris Mockus, Nachiappan Nagappan, Trung T. Dinh-Trong: Test
coverage and post-verification defects: A multiple case study. ESEM
2009: 291-301
  [Sam
Guckenheimer](https://www.visualstudio.com/author/samgu/ "Posts by Sam Guckenheimer")
  
2017-08-08T16:22:56+00:00 
![Sam
Guckenheimer](https://www.visualstudio.com/wp-content/uploads/2017/10/Sam-Guckenheimer_avatar_1509383568-130x130.jpg)
### Sam Guckenheimer
Sam Guckenheimer works on Microsoft Visual Studio Cloud Services,
including VS Team Services and Team Foundation Server. He acts as the
chief customer advocate, responsible for strategy of the next releases
of these products, focusing on DevOps. He has written four books on
DevOps and Agile Software practices.
  - [DevOps at
    Microsoft](https://www.visualstudio.com/learn/devops-at-microsoft/)
  - [How We Work with Visual Studio Team
    Services (VSTS)](#)
      - [Moving to Cloud
        Cadence](https://www.visualstudio.com/learn/moving-cloud-cadence/)
      - [How We Use Git at
        Microsoft](https://www.visualstudio.com/learn/use-git-microsoft/)
      - [Evolving Test Practices at
        Microsoft](https://www.visualstudio.com/learn/evolving-test-practices-microsoft/)
  - [How We Architect Visual Studio Team
    Services (VSTS)](#)
      - [From Monolith to Cloud
        Service](https://www.visualstudio.com/learn/monolith-cloud-service/)
      - [Achieving No Downtime Through
        Versioned Service
        Updates](https://www.visualstudio.com/learn/achieving-no-downtime-versioned-service-updates/)
      - [Progressive Experimentation with
        Feature
        Flags](https://www.visualstudio.com/learn/progressive-experimentation-feature-flags/)
      - [Patterns for Resiliency in the
        Cloud](https://www.visualstudio.com/learn/patterns-resiliency-cloud/)
      - [Shift Left to Make Testing Fast and
        Reliable](https://www.visualstudio.com/learn/shift-left-make-testing-fast-reliable/)
      - [Eliminating Flaky
        Tests](https://www.visualstudio.com/learn/eliminating-flaky-tests/)
      - [Shift Right to Test in
        Production](https://www.visualstudio.com/learn/shift-right-test-production/)
  - [One Engineering System at
    Microsoft](#)
      - [Moving 65,000 Microsofties to DevOps
        on the Public
        Cloud](https://www.visualstudio.com/learn/moving-65000-microsofties-devops-public-cloud/)
      - [Universal Store: Journey to
        Continuous Delivery and
        DevOps](https://www.visualstudio.com/learn/universal-store-journey-continuous-delivery-devops/)
  - [Microsoft Research on DevOps
    Productivity](#)
      - [Boosting your code reviews with
        useful
        comments](https://www.visualstudio.com/learn/boosting-code-reviews-useful-comments/)
      - [Code reviews are not (primarily) for
        finding
        bugs](https://www.visualstudio.com/learn/code-reviews-not-primarily-finding-bugs/)
      - [Code ownership and software
        quality](https://www.visualstudio.com/learn/code-ownership-software-quality/)
      - [Getting the noise out of test
        runs](https://www.visualstudio.com/learn/getting-noise-test-runs/)
      - [Improving software security with
        stack traces from bug
        reports](https://www.visualstudio.com/learn/improving-software-security-stack-traces-bug-reports/)
      - [Is 100% code coverage worth the
        cost?](https://www.visualstudio.com/learn/100-code-coverage-worth-cost/)
      - [Software testing at scale to
        increase
        velocity](https://www.visualstudio.com/learn/software-testing-scale-increase-velocity/)
      - [Test while building to maximize test
        effectiveness and minimize
        cost](https://www.visualstudio.com/learn/test-building-maximize-test-effectiveness-minimize-cost/)
      - [Using a simple code churn metric to
        find software
        bugs](https://www.visualstudio.com/learn/using-simple-code-churn-metric-find-software-bugs/)
  - [** DevOps at Microsoft](/learn/devops-at-microsoft/)
  - [** Blog](https://blogs.msdn.microsoft.com/devops/)
  - [** Learn DevOps](/learn/what-is-devops/)
  - [![](/wp-content/uploads/2016/11/git-footer-icons-dark_2.png) Learn
    Git](/learn-git/)
  - [** Learn Agile](/agile/)
  - [** DevOps Self-Assessment](https://devopsassessment.net/)
[Visual Studio Team Services](/team-services/) provides the tools you
need to continuously deliver
value
#### What's new
  - [Surface
    Book 2](https://www.microsoft.com/en-us/surface/devices/surface-book-2/overview)
  - [Surface
    Pro](https://www.microsoft.com/en-us/surface/devices/surface-pro/overview)
  - [Xbox One X](https://www.xbox.com/en-us/xbox-one-x)
  - [Xbox One S](https://www.xbox.com/en-us/xbox-one-s?xr=shellnav)
  - [VR & mixed
    reality](https://www.microsoft.com/en-us/store/b/virtualreality)
  - [Windows 10
    apps](https://www.microsoft.com/en-us/windows/windows-10-apps)
  - [Office
apps](https://store.office.com/en-us/appshome.aspx?)
#### Store & Support
  - [Account profile](https://account.microsoft.com/)
  - [Download Center](https://www.microsoft.com/en-us/download)
  - [Sales &
    support](https://go.microsoft.com/fwlink/p/?LinkID=824761&clcid=0x409)
  - [Returns](https://go.microsoft.com/fwlink/p/?LinkID=824764&clcid=0x409)
  - [Order tracking](https://account.microsoft.com/orders)
  - [Store
    locations](https://www.microsoft.com/en-us/store/locations/find-a-store)
  - [Support](https://support.microsoft.com/en-us)
  - [Buy online, pick up in
    store](https://www.microsoft.com/en-us/store/b/buy-online-pick-up-in-store?icid=uhf_footer_bopuis)
#### Education
  - [Microsoft in education](https://www.microsoft.com/en-us/education)
  - [Office for
    students](https://www.microsoft.com/en-us/education/products/office/default.aspx)
  - [Office 365 for
    schools](https://products.office.com/en-us/academic/compare-office-365-education-plans)
  - [Deals for students &
    educators](https://www.microsoft.com/en-us/store/b/student)
  - [Microsoft Azure in
    education](https://azure.microsoft.com/en-us/community/education/)
#### Enterprise
  - [Microsoft Azure](https://azure.microsoft.com/)
  - [Enterprise](https://enterprise.microsoft.com/en-us/)
  - [Data platform](https://www.microsoft.com/en-us/sql-server/)
  - [Find a solutions
    provider](https://www.microsoft.com/en-us/solution-providers)
  - [Microsoft partner resources](https://partner.microsoft.com/en-us/)
  - [Microsoft
    AppSource](https://go.microsoft.com/fwlink/?LinkID=808093)
  - [Manufacturing &
    resources](https://enterprise.microsoft.com/en-us/industries/discrete-manufacturing/)
  - [Financial
services](https://enterprise.microsoft.com/en-us)
#### Developer
  - [Microsoft Visual Studio](https://www.visualstudio.com/)
  - [Windows Dev Center](https://developer.microsoft.com/en-us/windows)
  - [Developer Network](https://msdn.microsoft.com/en-us)
  - [TechNet](https://technet.microsoft.com/en-us)
  - [Microsoft Virtual Academy](https://mva.microsoft.com/)
  - [Microsoft developer
    program](https://developer.microsoft.com/en-us/store/register)
  - [Channel 9](https://channel9.msdn.com/)
  - [Office Dev
Center](https://developer.microsoft.com/en-us/office)
#### Company
  - [Careers](https://careers.microsoft.com/)
  - [About Microsoft](https://www.microsoft.com/en-us/about)
  - [Company news](https://news.microsoft.com/)
  - [Privacy at Microsoft](https://privacy.microsoft.com/en-us)
  - [Investors](https://www.microsoft.com/investor/default.aspx)
  - [Diversity and
    inclusion](https://www.microsoft.com/en-us/diversity/)
  - [Accessibility](https://www.microsoft.com/en-us/accessibility/home)
  - [Security](https://www.microsoft.com/en-us/security/default.aspx)
[English (United States)](#)
  - [Contact us](https://beta.visualstudio.com/support/)
  - [Privacy &
    cookies](https://www.microsoft.com/EN-US/privacystatement/OnlineServices/Default.aspx)
  - [Terms of use](https://azure.microsoft.com/en-us/support/legal/)
  - [Trademarks](https://www.microsoft.com/trademarks)
  - [About our ads](http://choice.microsoft.com/)
  - © Microsoft 2018
