# From Monolith to Cloud Service
### By Buck Hodges

One of the questions I always get from customers is, “Hey, should I go
refactor my software into a cloud service before I move to the cloud or
should I go ahead and move?” We did the latter, we went ahead and moved,
and I’m going to talk about what that looks like.
One of the things that I think we’ve learned along the way is, if we had
decided to try to “turn it into a cloud service” without actually doing
it and living it, we would have made a bunch of decisions that wouldn’t
have been the right decisions in the end. We made different and better
decisions, because we took the approach that we
did.
It was 2010 when we started this journey. Our target was the October PDC
in 2010 when Brian Harry got up on stage to demo what was then a
prototype of a service of TFS running on Azure. To set some context,
2010’s also when we had just started to adopt Scrum.
## Single tenant
We had TFS. It’s an on-prem product. It’s a product we’d ship every two
or three years. We had some good stuff there. The 2010 release in part
set us up for being able to move to the cloud. It was the first release
where you could have load balanced application tiers. It was also the
first release that had the notion of a collection and that became an
account in VSTS.
TFS was still an on-prem product. We had no experience with Azure
whatsoever. Of course, Azure was still fairly new in 2010. All of our
data was in SQL: file content, metadata, code. SQL’s the answer for our
storage on-prem. It couldn’t be that way in the cloud but that’s where
we started.
We only had the notion of Active Directory identity. You’d use NTLM or
Kerberos to log in. There was no notion of a Microsoft Account (MSA) or
Azure Active Directory (AAD), and of course, no notion of an account,
not even close. When we started, we had a single tenant system. What did
that mean? It meant that a project collection database is an account in
the cloud.
In the beginning, in the cloud every collection was its own database
too. Every time somebody would sign up in VSTS, the service would create
a new database. At one point we had 11,000 databases in Azure North
Central. We had a lot of DBs and we were going to go broke if we kept it
that way, but that’s where we started. Also, upgrades were offline. We
had to take service down. So we’d schedule maintenance windows, which of
course is a big problem with a global service.
## No telemetry
We were pushing for this proof of concept which we did in October of
2010 at PDC. Our next big milestone was the Build conference in
September 2011. Compared to what we have now, we had no telemetry. We
had kind of started, and we thought we knew, “Hey, we should trace this,
trace that.” But we were naïve and didn’t have nearly the telemetry we
needed. In fact, the whole reason I signed up on Twitter was so I could
keep track of what was going on with the product, because I figured if
it broke, somebody would complain on Twitter. That was telemetry back
then.
## No deployment cadence
We had no deployment cadence. Our deployments were months apart and
really random. Meaning, there wasn’t real thought into, “Hey, over the
next year, when are we going to deploy? How does this work?” We had no
clue.
## No live site culture, no on-call
We had no live site culture. I mean this is a team that was recruited
around the culture of a box product. I give you the product, you run it,
not me. Of course, nobody who joined our team ever thought, “Oh, I could
be on call 24/7.” Yeah, that’s a big change.
## Architecture for a service
Let’s flip now to architecture. In the beginning there was only TFS and
there was only one instance, and it was only in Azure North Central
(Chicago). It was the single global instance, and we had everything
there: Version control, work item tracking, build, test, identity, and
account. Of course, things like release management and code search
didn’t exist then but everything that we had was in one place.
![Becoming a service: One
instance](_img/becoming-a-service.png)
We put the application tiers in virtual machines and we use what is now
known as Azure PaaS 1.0 web roles for the application tiers and worker
roles for the job agents. It means when we build the product, we
literally put together the packages that you need to deploy for PaaS,
and that’s what we deploy.
The content’s really interesting. On-prem, we shoved everything into
SQL. ln the cloud a) it wasn’t possible because the maximum size limit
of SQL DBs was much smaller than it is now and b) SQL was too expensive.
Per byte, SQL Azure is much more expensive than Azure blob storage. So
we had to split out the content that’s in file attachments, including
Git repos and TFVC, Azure Storage.
With TFS we had the notion of a framework. That allowed us to start to
change how things worked on-prem compared to in the cloud while keep a
single code base for both.
So, we’d put all the metadata in SQL, and we’d put all the file content
in blob storage but it was still a single tenant system. As I mentioned,
every account had a new database. We hadn’t yet pulled out the notion of
identity and account. It was literally a true monolith in a single
instance. Totally global, every deployment was instantly live for
everybody. If anything went wrong, it went wrong for everybody. Not an
ideal place to be, but we got it started and this allowed us to start
learning.
## Becoming Multi-Tenant
Multitenancy was one of the first things we had to solve. Otherwise the
service would be too expensive to run. This required that we needed to
have many accounts per database. In early 2012, we introduced a
partition ID column in every table that has customer data to identify
which customer owns that data. And this is important because now we pack
approximately 40,000 accounts per database today versus at the beginning
when it was a single
tenant.
![Becoming
Multi-Tenant](_img/becoming-multi-tenant.png)
SQL table with PartitionID
How do we protect against leaking data from one account to another? We
take advantage of the fact that we have both on-prem TFS and VSTS in the
cloud, since the same code runs on prem. When we began TFS, SQL is where
the data is, so we put a ton of logic into stored procedures. As a
result to really test the product, you’ve got to test its SQL. Since
we’re doing so much logic there and included now the multi tenancy,
you can imagine how many lines of SQL we had to go inspect to go find
all the places we needed to add the partition ID clause. SQL Enterprise
has this notion of file groups and we can assign file groups to the
data.
The solution is that we assigned partition ID zero to a file group
that’s always offline during testing. That means if you run a query
that doesn’t specify the partition ID as part of the WHERE clause, the
query is always going to fail because the file group is offline. Having
this approach to test it was incredibly valuable, and it kept us from
some really bad experiences trying to untangle customer data.
## Becoming Multi-Instance
We fixed the multi-tenancy problem, but we still had one single global
instance. That was bad for two reasons:
1.  Every deployment was global.
2.  Every new service added to the TFS monolith.
I didn’t want to grow that monolith. I want to be able to build services
outside of that monolith. That meant we had to split out what we call
“shared platform services (SPS),” which include account, identity,
licensing, profile, and other common services that every functional
service in VSTS needs to access. We split this out in the spring of
2013. While the system was alive, we were literally ripping essentially
the heart out of TFS, pulling it out into a separate service.
We did it on a Saturday, March 23rd, 2013. We all got together that
Saturday morning. We took the system down and set up SPS for real,
turned it all back on and then fixed the issues that came out as a
result. It was a big change. As I mentioned at the start, we started
with TFS, and we were evolving our architecture in the cloud on the fly
and we’re kind of doing heart surgery in the middle of a marathon.
## Making Deployments Progressive
The next thing we needed was another instance, so that we could deploy
progressively, not globally. This is when we created TFS SU0. It’s our
canary scale unit. Our whole team lives in SU0 and uses an account
called mseng. Every deployment we do starts with SU0. We get every
change that goes out. If we screw something up, we want to feel that
pain. We want to fix it before it gets to you.
![Becoming a Service: Multiple
Instances](_img/becoming-a-service_multiple.png)
I’d love to say we catch every bug that way. Clearly we don’t, but it’s
so valuable. It’s saved us many times and it’s a fantastic practice also
have a luxury. We are developers, so the fact that we can use our own
product is really nice. To give you some sense of scale, 430 people
checked into our repo over the last 30 days. That’s just one repo. A
number of other internal accounts use SU0, but our whole principle here
is that it’s only internal accounts. If we do something bad, it only
affects us, and not our external customers.
From there we started adding more scale units. For example, SU7 is
Australia. We now have 17 instances of VSTS. In September, we added
Canada. We group scale units into deployment rings, and a related
article discusses our [safe deployment practices across
rings](https://youtu.be/QP_u4ipP2SU). Using rings has been critical to
changing how we roll out not only code changes but also config changes.
We all know a bad config change can take you down too. Most recently we
added a second instance of SPS. That allows us to deploy changes for SPS
non-globally.
## Separating Microservices
We have now 31 services and they all revolve mostly around SPS. A few,
such as code search, also have dependencies on TFS, because it indexes
code. All these services build out on the SPS foundation. New services
do not contribute to building a giant monolith.
![Today:
Microservices](_img/today-microservices.png)
## Configuration in Azure
A typical scale unit might have an Application Tier with four Dv2
instances of a PaaS web role. An application tier is responsible for all
the communication with the client. So when you fire up Visual Studio,
when you fire up a browser and you connect to VSTS, you’re connecting to
an application tier. The AT has the REST and SOAP endpoints and serves
up the web UI. That’s the public face of the service.
Job agents might use three instances of Dv2 VMs. The job agents run
background jobs. (Of course, that functionality exists in TFS on-prem,
but the JAs are not deployed as separate machines.) JAs could be
processing commits, could be doing cleanup, etc., but they’re background
jobs.
![Scale Unit - Typical
Sizes](_img/scale-unit-typical-sizes.png)
Our largest scale unit is SU1 with 1.3 million accounts, using 11 D4
ATs, 32 partition DBs with about 40,000 accounts per DB, and about 120
terabytes in blob storage. These days we don’t let the scale units get
quite so big. We tend to cut them off at around 800,000 accounts.
## Scale of VSTS in Azure
We have 31 services in VSTS today. This table gives you a feel for the
scale of the service.
|                                               |
| --------------------------------------------- |
| 31 services                                   |
| 15 regions                                    |
| 192 scale units (TFS has 17)                  |
| 7,000 PaaS CPU Cores (TFS 1,110)              |
| 659 SQL Azure DBs (426 Standard, 233 Premium) |
| 63 TB of DBs                                  |
| 1.3M accounts in largest SU                   |
This scale keeps us focused on the cost of running the service. With
every account you get five free users. We run a service that’s mostly
free, and therefore cost matters a lot.
Today the job agents are on virtual machines, and we’re going to move to
containers. We could use a different Azure technology, but we have the
constraint that we ship TFS on-prem product and VSTS in the cloud. We
try to keep the code base the same. If we were to run very differently
in the cloud, it would be harder for us to test the on-prem product and
know that we have the right quality. This is becoming a bigger and
bigger challenge as most of Microsoft is now using VSTS rather than TFS.
If we were simply cloud only, we would take advantage of Azure functions
and other cloud-native technology.
## Consistency between Cloud and On-prem
VSTS and TFS share 90% of the same code base. This is possible because
the server framework abstracts away some of the differences. The server
framework allows us to write a bunch of different services and have them
all work the same way. For example, authentication and identity are
completely different in the Cloud. Microsoft account (MSA) and AAD with
Org ID don’t exist on prem. There are plug ins for the identity system.
TFS uses one plugin, and the cloud uses a different one. When it comes
to shipping TFS, we have to focus most on testing those differences –
things that are unique to TFS.
I mentioned that we split out storage between SQL and blob storage in
the Cloud, whereas all storage goes into SQL on-prem. By having a common
server framework with plug ins, you can write a service like search, for
example, and you don’t have to think about how to store your data. You
specify what kind of data is, whether metadata, file data or whatever,
and then the underlying server framework takes care of the details. We
call it VSSF (Visual Studio Shared Services Framework). Without it,
every service would need its own way of storing data, managing secrets,
understanding identity, handling upgrades, capturing traces, staging
deployment or implementing telemetry.
## Telemetry
Telemetry in particular was a big mindset shift. We were an on-prem
team. In that world, we sell you the software, you go run it. We don’t
get to go grab telemetry from your server. It was also different terms
of the debugging. So often, somebody would call up with a problem, we’d
want to go create a repro. “Hey, there’s a problem, can we go reproduce
it locally?” Well, when you run a cloud service, if your customers are
suffering, nobody wants to wait for you to get a repro live in some
debugging environment, just so you can step through breakpoints and
figure it out.
You really have to change to think, *Can I debug the service from the
output of the telemetry that the service produces?* It became a mantra
to trace everything. That’s both good and bad. At some point you can
drown in your telemetry. With every method, for example, when you make a
call, when you fire up the web browser or Visual Studio, you’re making
calls to REST and SOAP endpoints. We want to trace all those.
### Caches
We want to also look at cache behavior. You probably all know what a
cache is, but I have a different definition of a cache. *A cache is a
live site incident generator.* We stood up the service for real on April
23, 2011. In the last six and a half years, if you look back across all
the live site incidents we’ve had, the single biggest thing in common is
caches. We’ve hit all manner of bugs: inconsistency, strange behaviors,
you name it. Every time somebody says, “Hey, I’ve got a perf problem,
I’m going go add a cache.” I respond, “Great, you’ll have two
problems.”
Having this cache behavior in telemetry is incredibly key. There’s a
cache class in the VSSF. We said, “Let’s build a foundational cache
component that has the core telemetry in it about eviction rates, about
hit success rates, etc., so that you can at least get some basic
information about every cache that we put in the system.” Caching is so
subtle and seductive. You think, “I’m going to go solve a problem by
adding a cache, and it’ll be way faster. The cache fails, you turn it
off, and you’ve got a different performance problem now because the
system doesn’t actually work anymore without the cache. Caches are
really dangerous. You need them, you can’t live without them, but they
are dangerous.
### What to Trace
Of course, you want to trace errors, but you also want include the
inputs. This notion of trace everything was a big switch for us. And you
need to be able to control the traces because some traces are expensive.
We have four different levels that can be turned on individually.
1.  Error (on by default)
2.  Warning
3.  Info
4.  Verbose
In order to control tracing, we use *tracepoints*. They’re literally
just numbers, such as in this example.
`requestContext.Trace(10003085, TraceLevel.Info, c_area, c_layer,
$"Found entry for descriptor {descriptor} in the security subject
service, with id {spId}.");`
The numbers don’t have meaning. If you’re having a live site incident,
you can turn this tracepoint on. You take that number and turn that
particular trace point on with increasing verbosity. As you dig into the
problem, you can decide how much data do you need in order to solve this
problem.
Common tracing has been hugely valuable. Sometimes we conditionalize
tracing, so we don’t do the extra work if the tracing is not turned on.
Again this is a big shift in mindset for a team that’s used to on-prem
software.
### Working with SQL
I mentioned we have a ton of logic in SQL. We have something on the
order of over 1,400 stored procedures. It’s a lot of SQL. As a result,
you need some way to explain to people how should you write SQL, how
should you write SQL that works on-prem and in the cloud. So here are
some of the key principles in our SQL guidelines.
|                                                                   |
| ----------------------------------------------------------------- |
| **SQL Guidelines**                                                |
| Design for cloud-first, on-prem second                            |
| Optimize for high performance, multi-tenancy, and online upgrades |
| Database only accessed from trusted AT / JA                       |
| All access through SQLResourceComponent and Stored Procedures     |
| Transaction managed in SQL code (not in mid-tier)                 |
| Security is enforced on the middle tier                           |
| Schemas used for separate subsystems                              |
| PartitionID column used to partition tenants                      |
The first one is particularly interesting. The cloud and the on-prem
product have different characteristics. There’s no notion of an account
on-prem. When you do an upgrade in the cloud, you’re upgrading 40,000
tenants in a single database. That means 40,000 collections in a single
database. You need to have your upgrade scale.
So much of it comes back to consistency. Every time somebody has to look
at a live site incident, they don’t have to figure out, “Oh, wow, this
team does SQL completely differently than we do, what does that mean?”
It’s not a good time to learn that in an emergency.
## REST APIs
When TFS began, we were using SOAP APIs. SOAP was cool in 2003, but it’s
2017, and SOAP is very uncool. We started the shift a few years back
over to REST. One of the things we said was that SOAP APIs were
effectively an internal implementation detail, you’re not meant to use
them, go use our .NET object model. Now the world’s shifted, and people
want to call these APIs from Macs and Linux. The best way to do that of
course is with REST APIs.
The REST APIs unlike SOAP, are very much a part of our public face. We
build a platform, and you need to be able to call the REST APIs to be
able to write extensions that do any number of things. Other services
call into VSTS. If you go look at our SOAP APIs, you can tell looking at
them that each one was done by a different team. In fact, I helped
create the problem as a developer on TFVC.
With REST, I put in place a review process for REST APIs because the
only way you get consistent APIs is that you force that consistency.
Left to their own devices, every developer has a “better way” and the
problem is while it might be better, if you as a developer have to
relearn a REST API every time you go crack it open, it’s super
frustrating.
This has been a key part to try to give you a set of APIs that look like
they’re from a single team and not from a bunch of teams operating in
silos. Now you can certainly find places where we’ve not succeeded in
achieving our goal, but overall it’s been vastly better. We based these
REST standards on the [Microsoft REST
API](https://github.com/Microsoft/api-guidelines/blob/vNext/Guidelines.md)
standards. We documented this REST review process on our Wiki.
These APIs can be reviewed through email, and if they’re simple and if
there’s no big discussion, great, respond in email and you’re done. If
you are trying to do something totally different or you’re struggling
with resources and verbs and how to map things to your area, then have a
meeting to go through it. This process has been really valuable for us
to generate an API, and to create an API that’s much more usable and
more consistent.
  [Buck
Hodges](https://www.visualstudio.com/author/buckh/ "Posts by Buck Hodges")
  
2017-11-09T14:45:41+00:00
![](https://secure.gravatar.com/avatar/baad17c3a2d3ea8fffc392f9dd209426?s=130&d=mm&r=g)
### Buck Hodges
Buck Hodges is Director of Engineering for Visual Studio Team Services.
He's been a member of the team since the beginning of TFS, starting as a
developer on Team Foundation Version Control for the first version of
TFS. He's helped lead the transition of the team to the cloud and
DevOps.