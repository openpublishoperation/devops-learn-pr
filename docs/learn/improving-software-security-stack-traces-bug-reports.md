# Improving software security with stack traces from bug reports
### By Kim Herzig

# Improving software security with stack traces from bug reports
### Author: Kim Herzig
Last Update: 9/27/2016
As digital services connect sensitive data about nearly all aspects of
our daily lives, software security may never have been as important as
it is today. Breaking even simple systems may have significant
consequences for individuals, companies, or even diplomatic relations
between countries. Software security exploits continue to escalate in
severity and sophistication. (For example, see the semiannual [Microsoft
Security Intelligence
Report](https://www.microsoft.com/security/sir/default.aspx).) Even one
security issue can have catastrophic consequences for both software
users and software development
teams.
## Prioritizing the security assessment for the most likely areas of vulnerability
Therefore, security assessment and testing efforts are a necessity for
software projects and a part of the daily development routine. But they
are time-consuming and expensive to apply. In many cases, security
reviews require human supervision and judgment, especially with
increasing complexity of software systems and their exposure to
untrusted user input. Finding vulnerabilities can be a search for a
needle in the haystack. This research examines how to use data from
existing bug reports to narrow the search.
## Any code change is a risk
During the development of a software program, any code change can
potentially inject security vulnerabilities or expose legacy code
containing previously dormant security vulnerabilities. Development
teams use a number of different techniques to verify if their code
contains security vulnerabilities, such as design reviews, input
fuzzing, static code verifiers, and code reviews. The Microsoft security
team developed the Security Development Lifecycle (SDL) \[1\] to help
its developers build more secure software through the systematic use of
these techniques. Which code parts are most vulnerable?
For large software products, indiscriminately using reviews to catch
security defects can be impractical. Dowd et al. \[2\] suggest that good
security reviewers can cover between 100 and 1000 lines per hour. That
implies that a complete security review for the 70+ million lines of
code in the Windows code base could take between 35 and 350
person-years. In such a case, you have to prioritize vulnerability
detection and removal techniques to the most suspicious areas of the
product. How is my code exposed to untrusted input?
Many vulnerabilities are caused by untrusted user input handled by code
that makes incomplete or wrong assumptions about the data it handles. It
is easy to identify code that is directly processing user inputs.
However, code fragments that handle data that depends on user input or
that is indirectly exposed to such untrusted data, can be more difficult
to find.
## Start with identifying the attack surfaces
Attack surfaces \[3,4\] are formal descriptions of entry points to a
system that might be vulnerable. These descriptions usually describe
methods, channels, untrusted data, and a direct and indirect entry and
exit point that identifies code areas handling untrusted data. Security
professionals can focus their first efforts on code on the attack
surface because it contains vulnerabilities that are reachable, and
therefore exploitable, by malicious users. Code not on the attack
surface may contain latent vulnerabilities, but these are much harder to
reach by malicious users. With this prioritization, the security
professional could find vulnerabilities more efficiently.
## Difficulty of finding the attack surface
Still, it is not easy to identify an attack surface. In most cases,
defining attack surfaces or single attack vectors requires human effort,
which is expensive and takes time. A further difficulty is that the
software product is constantly evolving as code changes are applied.
These changes lead to an always incomplete picture of the attack surface
and a constant need to refine it. It would desirable to have data help
identify likely attack surface and make the effort easier.
## Using bug reports and stack traces to approximate attack surfaces
The good news is that data often is available. Many bug reports
collected from various internal or external verification efforts contain
stack traces that portray an important picture of the state of a
software system at the time of failure. Code that appears in the stack
traces was executing when a user (or a tester) was performing an action,
is therefore by definition reachable by a user. Each stack trace from a
user-initiated crash has three attributes:
1.  it represents a user activity that puts the system in an undesirable
    condition;
2.  it includes both direct and indirect entry points; and
3.  it provides a control and data flow sub-graph of the potentially
    vulnerable code path.
Combining the information of single stack traces into a combined data
set yields an attack surface approximation (Figure 1).
![Figure 1: Parsing stack traces into a dependency graph and extracting
attack surface
information](_img/parsing-stack-traces.png)
> Figure 1. Parsing stack traces into a dependency graph and extracting
> attack surface information
## How many vulnerabilities do stack traces reveal?
Creating this approximation can be fully automated and takes only
minutes, even for large software systems, such as Microsoft Windows. The
resulting attack surface approximation is neither complete nor entirely
reliable, but it is very helpful. In a study on the Microsoft Windows,
we found that our attack surface approximation narrows down the size of
the haystack by more than 50% while still containing 95% of all
vulnerabilities. The same holds true for Mozilla’s Firefox \[5\].
## Opportunities
Attack surface approximations as discussed in this article offer many
opportunities beyond the simple task of narrowing down the search space
of vulnerabilities.
## Comparing stack trace sets
Comparing attack surface approximations derived from different data
sets, e.g. verification crashes versus crashed reported by actual
customers, can help us to identify usage scenarios that should be
verified more thoroughly. Going one step further, we can use the
incomplete but vulnerable control and data flow sub-graph represented by
the corresponding stack trace(s) to suggest verification scenarios and
test cases for a particular component.
### Understanding vulnerability patterns
In addition to understanding which parts of the code handle untrusted
data, it is important to identify attack patterns. Stack traces help
there too. Stack traces in bug reports identify not only system internal
code artifacts, but also external components that caused a crash.
Knowing who submitted malicious data and how it was entered can be very
important to identify attack patterns or potentially malicious software
components interacting with the system under review.
### Modernizing legacy code & discovering changes to attack surface area
Being able to generate attack surface approximations easily and fast
also allows us to compute them at regular intervals and to compare
differences between these attack surface approximations. **Detecting new
code artifacts on an attack surface should raise concerns and trigger
security reviews**, especially when the newly exposed code is identified
as legacy code. This may contain latent vulnerabilities whose fixes were
previously deprioritized.
## References
\[1\] Howard, M. and Lipner, S. The Security Development Lifecycle.
Microsoft Press, 2006.
\[2\] Christopher Theisen. “Automated attack surface approximation,” in
Proceedings of the 2015 10th Joint Meeting on Foundations of Software
Engineering (ESEC/FSE 2015).
\[3\] M. Howard, J. Pincus and J. M. Wing, “Measuring Relative Attack
Surfaces,” in Computer Security in the 21st Century, Springer US, 2005.
\[4\] P. Manadhata and J. Wing, “An Attack Surface Metric,” Software
Engineering, IEEE Transactions on, vol. 37, no. 3
\[5\] Automated Attack Surface Approximation, Chris Theissen,
  [Kim
Herzig](https://www.visualstudio.com/author/kimh/ "Posts by Kim Herzig")
  
2017-08-14T16:57:50+00:00 
![Kim
Herzig](_img/kimh_avatar_1502754815-130x130.jpg)
### Kim Herzig
Kim leads the analytical team on the Tools for Software Engineers team.
The focuses lies on helping development teams to speed up their
development process(es) while maintaining or increasing product quality
and reliability.